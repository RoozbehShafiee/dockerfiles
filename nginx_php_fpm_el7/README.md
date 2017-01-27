Container Details
----
This Docker container implements a database service based on MariaDB, with the following features:

 * Centos 7 base image.
 * NGINX

Exposed ports and volumes
----
The image exposes ports 80 just over TCP port.

Setup and Configuration
----

1) Clone the repository on your Docker host:

```bash
  git clone https://github.com/RoozbehShafiee/docker_nginx_el7.git
```

2) Create your virtual hosts based on existing template in `conf_files/conf.d` directory.

3) Build NGINX image:

```bash
  docker build -t nginx docker_nginx_el7/
```

4) Run a container based on built image:

```bash
  docker run -idt --name nginx --volumes-from vsftpd --link mariadb -p 80:80 nginx
```

Notice: In this step this nginx container uses volume from vsftpd service which accessible via `github.com/RoozbehShafiee/docker_vsftpd_el7` and linked to mariadb from `github.com/RoozbehShafiee/docker_mariadb_el7`


5) Make sure your web server works with:

```bash
  http://YOUR-IP/info.php
```
