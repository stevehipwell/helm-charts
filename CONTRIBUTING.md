# Contributing Guidelines

Please follow the guidelines here to interact with this project; if in doubt please start by opening an [issue](#issues).

## Issues

Issues are the default method of interacting with this project, please open an issue if you'd like to report a bug, request a feature or ask a question. I'd like to have issue templates, but this is currently blocked due to a lack of time.

## Pull Requests

A pull request should only be opened once an issue has been opened and triaged by a maintainer as something wanted. I appreciate the contribution but it's generally more expensive to review a PR than to write the code myself.

### PR Checklist

The following steps need to be completed before submitting a PR for review.

- Make sure any change to _values.yaml_ has an updated [helm-docs](https://github.com/norwoodj/helm-docs) comment
- Run `helm-docs --template-files=./_templates.gotmpl --template-files=./_chart-readme.md.gotmpl` (you can use the VS Code `helm-docs` task)
- Add an entry (or multiple entries) to the _CHANGELOG.md_ file in the chart directory
- Make sure the PR closes the issue
