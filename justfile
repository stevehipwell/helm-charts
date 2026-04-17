set windows-shell := ["pwsh", "-NoLogo", "-Command"]

default:
    just --list

mdfmt:
    rumdl fmt --fix

mdlint:
    rumdl check .

yamlfmt:
    yamlfmt -continue_on_error .

docs:
    helm-docs --template-files=./_templates.gotmpl --template-files=./_chart-readme.md.gotmpl
