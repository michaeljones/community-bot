
# Community Bot

## Ideas

- Support dictator. The original project owner should be able to automatically pass or veto any
  action requested of the bot.

- It should be easy to enable the bot for only particular tasks. Those tasks should be recorded
  somewhere. Might make sense to keep them in the project code but not likely as they are metadata
  not a part of the project.

- Need a way of identifying useful people who should be awarded voting rights so that the community
  can expand and evolve. A certain amount of activity which is supported by the current community

The bot must be able to:

- Be asked to fork a repository and carry out that fork. This is potentially best done by raising an
  issue on a repository owned by the bot which is used only for this purpose. Some kind of 'talk to
  me' repository.

- Merge branches with no conflicts.

- Run tasks on a machine

- Respond to tickets

- Identify and track github users.

- Add collaborators to projects.

Additionally:

- Actions that cannot by performed by a bot on the API can be added to a queue and performed by
  trusted users and admins.

- User should have per-project trust levels & maybe a global trust level or maybe per language or
  per field trust levels.

- Network of trust - users can recommend or declare trust in eachother. Declarations do not generate
  trust unless the recommender is trusted. You shouldn't be able to create fake acconts in order to
  achieve a trusted status.

- Have a 'piller of the community' status for trusted known developers. eg. Kenneth Reitz in Python
  or Yehuda Katz in Ruby or similar roles. Voted for by the community.

- User can create pull requests. All users can vote on pull requests with defferent outcomes:
  - merge
  - reject
  - refactor

- Nominate maintainers & collaborators.

- Nominate dictators - dictatorship is revoked after a period of inactivity.

- Vote to close issues

- Vote on wiki contributions or disable the wiki?

- Automatically generate a linked project itmeline or history on a separate 'community-bot.com' site
  under the approach github address.

- Vote on tagging commits. Vote on doing releases via packaging tools.

- Most obvious issue is how to build the initial community of trusted people for a new project. Long
  term we should have a good web of trust but initially it will be hard.

- Ask original maintainers to get involved and suggest trust levels for certain people.

- Have admins step in and seed the community.

- Automatically generate a list of users & their participation levels for admins to choose from.

- Syntax for:
  - voting
  - tagging
  - releasing

- Rely on github for logins & user management.

- Record informatin aobut people who aren't registered yet so we know how to teat them when they do.

## Services

Ideally the bot should be able to interact with any service that is needed in the management of the
project. It should be possible to request and then vote on different actions by the bot.

- Github
- PyPI
