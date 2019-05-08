# DocTools
## Description
Docker image with Pandoc and LaTeX.

Pandoc is the *swiss-army knife* of document conversion. It is able to convert from one markup format into another, including eBook formats, Office documents, wiki, MarkDown, LaTeX, PDF and many others.

This image, built on top of a slim Debian image, contains Pandoc, a LaTeX distribution, Python and a Read the Docs Sphinx Theme useful for HTML outputs.

## Prerequisites
You must have a working Docker installation and basic knowledge of DocTools usage.

## Building
You can use a pre-built Docker image from the following repository:

[https://hub.docker.com/r/ppizzo/doctools](https://hub.docker.com/r/ppizzo/doctools)

or build it by yourself with the following command:

```bash
$ docker build -t ppizzo/doctools .
```

The image is quite big because it contains a complete doctools and LaTeX installation: if you want to reduce the image size you can modify the `Dockerfile` by removing the stuff you don't need.

## Usage
The image working directory is `/doc`, therefore you could mount the directory containing your input files in the `/doc` directory inside the container and run your `doctools` command with the required parameters.

For example, to convert this `README.md` in `.docx` format, you could issue the following command on a GNU/Linux machine:
```bash
$ docker run -ti -u "$(id -u):$(id -g)" \
             -v $(pwd):/doc \
             ppizzo/doctools \
             pandoc README.md -o readme.docx
```
Pandoc will recognise the input and output formats based on files extensions, but if your files have other extensions and/or you want to force a specific format, please read DocTools documentation for available command line options.

It's important to map your `UID:GID` inside the container, otherwise output files will be created as `root:root`.

## References
* [Pandoc](https://pandoc.org/)
* [Read the Docs Sphinx Theme](https://sphinx-rtd-theme.readthedocs.io/)
* [Docker](https://www.docker.com/)
