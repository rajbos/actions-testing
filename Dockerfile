FROM ubuntu:18.04

LABEL "com.github.actions.name"="Do something"
LABEL "com.github.actions.description"="Do something else."
LABEL "com.github.actions.icon"="code"
LABEL "com.github.actions.color"="red"

#LABEL "repository"="https://github.com/dend/blog"
#LABEL "homepage"="https://den.dev"
#LABEL "maintainer"="Den <dend@outlook.com>"

RUN apt-get update \
    && apt-get install wget -y \
    && wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && apt-get update \
    && apt-get install -y powershell

ADD entrypoint.ps1 /entrypoint.ps1
ENTRYPOINT ["pwsh", "/entrypoint.ps1"]