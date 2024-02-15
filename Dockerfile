FROM debian:testing-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y install make git curl texlive-latex-recommended texlive-latex-extra texlive-fonts-recommended texlive-fonts-extra latexmk pandoc python3-sphinx python3-sphinx-rtd-theme python3-recommonmark python3-docutils imagemagick librsvg2-bin && apt-get clean && rm -rf /var/lib/apt/lists/* /usr/share/doc/* /usr/share/man/* /usr/share/info/*

# To have a writable cache directory if the user is not root
ENV HOME=/var/tmp

WORKDIR /doc
