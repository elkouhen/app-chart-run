#!/bin/sh -x

mkdir ~/.gnupg
chmod 600 ~/.gnupg

echo use-agent >> ~/.gnupg/gpg.conf
echo pinentry-mode loopback >> ~/.gnupg/gpg.conf
echo no-tty >> ~/.gnupg/gpg.conf
echo allow-loopback-pinentry >> ~/.gnupg/gpg-agent.conf

gpgconf --reload gpg-agent

gpg -v --batch --import secret.asc
gpg --version
gpg --list-keys

helm init --client-only
helm plugin install https://github.com/futuresimple/helm-secrets
helm repo add softeamouest-opus-charts https://softeamouest-opus.github.io/charts

sops --version
