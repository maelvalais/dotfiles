# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.154.0/containers/ubuntu/.devcontainer/base.Dockerfile

ARG VARIANT="focal"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

USER vscode
COPY --chown=vscode . dotfiles/

ENV NONINTERACTIVE=yes
RUN cd dotfiles && ./installdotfiles.sh --only-brew
