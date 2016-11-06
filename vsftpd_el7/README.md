Container Details
----
This Docker container implements a vsftpd server, with the following features:

 * Centos 7 base image.
 * vsftpd 3.0
 * Virtual users
 * Passive mode
 * Logging to a file or STDOUT.


 Exposed ports and volumes
 ----

 The image exposes ports `20` and `21`, along with the range `21100 - 21110`  for passive mode. Also, exports volume: `/data`, which contains users home directories.

 When sharing a homes directory between the host and the container (`/data`) the owner user id and group id should be 14 and 80 respectively. This correspond ftp user and ftp group on the container, but may match something else on the host.


 Setup and Configuration
 ----

 1) Build vsftpd image on your docker host:

 ```bash
   docker build -t vsftpd github.com/RoozbehShafiee/docker_vsftpd_el7
 ```

 2) Create a container with admin user account:

 ```bash
   docker run -d --name vsftpd -p 21:21 vsftpd
 ```

 3) To get admin password which generated randomly, take a look at logs:

 ```bash
   docker logs vsftpd
 ```

 4) To create user accounts before build and run the container, just define them in `conf_files/virtual_users.txt`

 5) Don't forget create users directory in `/data` after running container with right permissions. This step should be configured manually after step 4.
