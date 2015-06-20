'use strict';

var Q = require('q')
// var request = Q.denodeify(require('request'))
var GithubApi = require('github');

var config = require('../etc/config');

var github = new GithubApi({
    version: "3.0.0",
    debug: true,
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

var issues = Q.denodeify(github.issues.repoIssues);

issues({user: 'homeless-beta', repo: 'contact'}).then(console.log)

