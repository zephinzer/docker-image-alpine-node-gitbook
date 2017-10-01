# Using `docker-compose` alone

Start this example by running `./start` in this folder.

## Pull image
This uses an `image: zephinzer/alpine-node-gitbook:latest` property in your Docker service.

## Container naming
This example uses a `container_name` property which allows us to identify which container it is by running `docker ps`.

> Note that if you wish to deploy this via Swarm, the `container_name` property needs to be removed so that Swarm can assign it's own names as it scales.

## Port expose
The Gitbook service runs on port 4000. We use the `ports` property in the Docker service to map it to our `localhost:80`.

## Attach files via volumes
This instance of Gitbook loads your filesystem as a volume into the Docker container's `/app` path. This allows you to make live reloads to the Gitbook you're working on, but also causes an extra `_book` directory to appear in your filesystem which is a result of `gitbook serve`.

> Note that there may be issues with using this `_book` folder in Linux based systems because of user permissions
