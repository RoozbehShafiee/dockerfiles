Container Details
----
This Docker container implements a bind service as a DNS server, with the following features:

 * Centos 7 base image.
 * bind9

 Exposed ports and volumes
 ----
 The image exposes ports 53, udp and tcp both. The container doesn't export volumes by default.

 Setup and Configuration
 ----

 1) Create your zone files in `conf_files` directory based on provided template (vhost.tld.zone)

 2) Clone the repository on your Docker host:

 ```bash
   git clone https://github.com/RoozbehShafiee/docker_bind_el7.git
 ```

 2) Build bind image:

 ```bash
   docker build -t bind docker_bind_el7/
 ```

 3) Run a container based on built image:

 ```bash
   docker run -idt --name bind -p 53:53/udp -p 53:53 bind
 ```

 4) Make sure your service works perfectly with `dig` and `nslookup` tools.
