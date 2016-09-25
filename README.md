# docker-tunnel

Simple docker images to create an SSH tunnel between clients and a docker server.

## Usage

On your server you are running a Postgres docker instance:

    $ docker run --name some-postgres -e POSTGRES_PASSWORD=mysecretpassword -d postgres

See https://hub.docker.com/\_/postgres/ for examples

You want to enable access to this Postgres instance from clients which have ssh access to this server.
Just start a tunnel image configured with the private keys of the authorized clients in the authorized_keys file:

    $ docker run -d --link some-postgres -p 8443:8443 tunnel

Now you can create a tunnel from a client of which you added the id_rsa.pub contents to the authorized_keys file of the tunnel image on the server: 

    ssh -p 8443 root@your-docker-host.com -L 5432:some-postgres:5432 -N

Obviously your-docker-host.com must be connected to the internet and the firewall should allow access to port 8443.

