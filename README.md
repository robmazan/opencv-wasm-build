# OpenCV.js build with Docker

## Background

I wanted to build OpenCV.js, but setting up the build environment properly was not
that straightforward as it seemed at the first sight, so made this setup to have
a reproducible, appropriate build env.

## Usage

```sh
# Download all dependencies:
$ docker-compose build

# Run the build:
$ docker-compose up
```

The build result will be available in the `./build` folder.
