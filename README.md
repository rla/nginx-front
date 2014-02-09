# nginx-front

My first steps with [Docker](https://www.docker.io/).

This project contains Dockerfile for my front-end Nginx.

## Configuration

Some options are enabled in the main configuration file `nginx.conf`. The
following options are configured:

 * critical errors are logged into `/www/error.log`

Virtualhost specific configuration files are kept in `/www/sites/*.conf`.
`www` is mounted as an host volume when running the image (see below).

### Reload configuration

It is possible to send SIGHUP to the Nginx master process on the docker host
machine. The PID on the host can be obtained with the following
command:

    docker top frontend | grep master | awk '{ print $2 }'

This assumes that the docker is named `frontend`.

It is also possible to put the pid file onto the external volume
but the file contains PID in the docker namespace. For the toplevel
process it would be 1.

There is also the [docker kill](http://docs.docker.io/en/latest/commandline/cli/#kill)
command but it does not support signals other than SIGKILL. However, there are some
pull requests on the docker tracker on GitHub that enable this. Hopefully
it gets merged soon.

## Running

Example command:

    docker run -name frontend -d -v /www:/www -p 80:80 raivo/nginx-front
