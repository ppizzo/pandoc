FROM debian:buster-slim

MAINTAINER Pietro Pizzo <pietro.pizzo@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y install make texlive-latex-recommended texlive-latex-extra texlive-fonts-recommended texlive-fonts-extra latexmk
RUN apt-get -y install pandoc python3-sphinx python3-sphinx-rtd-theme python3-recommonmark
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /usr/share/doc* /usr/share/man/* /usr/share/info/*

WORKDIR /doc
