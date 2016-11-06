Container Details
----
This Docker container implements a database service based on MariaDB, with the following features:

 * Centos 7 base image.
 * MariaDB 10.1

Exposed ports and volumes
----
The image exposes ports 3306 just over TCP port. Also, exports one volume: `/var/lib/mysql`, which contains database directories.

Setup and Configuration
----

1) Clone the repository on your Docker host:

```bash
  git clone https://github.com/RoozbehShafiee/docker_mariadb_el7.git
```

2) Build MariaDB image:

```bash
  docker build -t mariadb docker_mariadb_el7/
```

3) Run a container based on built image:

```bash
  docker run -d --name mariadb -p 3306:3306 mariadb
```

4) To get your credentials to login to MariaDB console:

```bash
  docker logs mariadb
```

5) Make sure your database service works perfectly with access to console:

```bash
  docker exec -it mariadb mysql -uroozbeh
```

Notice: You should login to database with password which available on container logs (`docker logs mariadb`) from remote hosts and other containers.
