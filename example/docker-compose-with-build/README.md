# Using `docker-compose` with build

Start this example by running `./start` in this folder.

## Build image
This uses the `build: .` property in your Docker service, calling a `docker build` on the `Dockerfile` first, which copies all your files into the container.

## Container naming
This example uses a `container_name` property which allows us to identify which container it is by running `docker ps`.

> Note that if you wish to deploy this via Swarm, the `container_name` property needs to be removed so that Swarm can assign it's own names as it scales.

## Port expose
The Gitbook service runs on port 4000. We use the `ports` property in the Docker service to map it to our `localhost:80`.

## Files copied
As compared to `docker-compose` alone, this method of setting up copies files from this directory into the container. This makes your container immutable and changes you make locally will not be propogated to the container. In development, use `docker-compose` alone with volumes so that live reload can happen.
