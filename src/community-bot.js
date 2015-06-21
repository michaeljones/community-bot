'use strict';

var Q = require('q')
// var request = Q.denodeify(require('request'))
var GithubApi = require('github');
var r = require('ramda');

var config = require('../etc/config');

var github = new GithubApi({
    version: "3.0.0",
    // debug: true,
    protocol: "https",
    host: "api.github.com", // should be api.github.com for GitHub
    timeout: 5000,
    headers: {
        "user-agent": "homeless-beta" // GitHub is happy with a unique user agent
    }
});


github.authenticate({
    type: 'oauth',
    token: config.apiToken,
});


var findCommands = r.compose(
        r.map(r.compose(r.trim, r.drop(3))),
        r.filter(r.compose(r.equals('hb>'), r.take(3)))
        )

var dispatchCommand = (command) => {
    var split = r.split(' ', command);
    var name = split[0];
    var args = split.slice(1);

    if (name !== 'clone') {
        throw Error('Unrecognised command:', name);
    }

    var repoRef = r.split('/', args[0]);
    var repoUser = repoRef[0];
    var repoName = repoRef[1];

    var fork = Q.denodeify(github.repos.fork);

    console.log('forking', repoUser, '/', repoName);

    fork({ user: repoUser, repo: repoName })
        .then(console.log)
        .catch(console.log);
}

function main() {

    var issues = Q.denodeify(github.issues.repoIssues);

    var processIssue = r.compose(r.map(dispatchCommand), findCommands, r.split('\r\n'), r.prop('body'));

    issues({user: 'homeless-beta', repo: 'contact'})
        .then(r.map(processIssue))
        .catch(console.log)

}

main();
