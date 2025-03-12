set windows-shell := ["pwsh", "-NoLogo", "-Command"]

default:
  just --list

docs:
  helm-docs --template-files=./_templates.gotmpl --template-files=./_chart-readme.md.gotmpl
