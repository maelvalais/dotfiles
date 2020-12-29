# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.154.0/containers/ubuntu/.devcontainer/base.Dockerfile

ARG VARIANT="focal"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

RUN cat /etc/passwd

RUN groupadd temp
RUN useradd --gid temp -m temp
USER temp

COPY --chown=temp . dotfiles/

ENV NONINTERACTIVE=yes
RUN cd dotfiles && ./installdotfiles.sh -f --brew
