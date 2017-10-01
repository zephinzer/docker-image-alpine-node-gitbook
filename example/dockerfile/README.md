# Using `docker build`

Start this example by running `./start` in this folder.

## Build image
We use a `Dockerfile` to specify parameters for our image.

## Image naming
This example uses the `-t` flag in `docker build` to specify an image name. This let's us spin up a container from this image later more easily.

## Container naming
This example uses the `--name` flag in `docker run` to specify the container name as compared to the `container_name` property in `docker-compose` and `docker-compose-with-build` examples.

## Port expose
The Gitbook service runs on port 4000. We use the `PORT` specification in the `Dockerfile` to expose the port for use.

The mapping of host to container ports is done in the `docker run` command via the `-p` flag. See `./start` file for more information.

## Files copied
As compared to `docker-compose` alone, this method of setting up copies files from this directory into the container. This makes your container immutable and changes you make locally will not be propogated to the container. In development, use `docker-compose` alone with volumes so that live reload can happen.
