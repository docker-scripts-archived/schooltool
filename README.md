schooltool
==========

Docker scripts that install and run SchoolTool in a container.

## Install

  - First install `ds` and `wsproxy`:
     + https://github.com/docker-scripts/ds#installation
     + https://github.com/docker-scripts/wsproxy#installation

  - Then get the schooltool scripts from github:
    ```
    git clone https://github.com/docker-scripts/schooltool /usr/local/src/schooltool
    ```

  - Create a working directory for the schooltool container:
    ```
    mkdir -p /var/containers/school1
    cd /var/containers/school1/
    ```

  - Initialize and fix the settings:
    ```
    ds init /usr/local/src/schooltool
    vim settings.sh
    ds info
    ```

  - Build image, create the container and configure it:
    ```
    ds build
    ds create
    ds config
    ```


## Access the website

  - Tell `wsproxy` that the domain `school1.example.org` is served by the container `school1-example-org`:
    ```
    cd /var/container/wsproxy/
    ds domains-add school1-example-org school1.example.org
    ```

 - If the domain is a real one, get a free SSL certificate from letsencrypt.org:
    ```
    ds get-ssl-cert user@example.org school1.example.org --test
    ds get-ssl-cert user@example.org school1.example.org
    ```

 - If the domain is not a real one, add to `/etc/hosts` the line
    `127.0.0.1 school1.example.org` and then try
    https://school1.example.org in browser.


## Other commands

```
ds shell
ds stop
ds start
ds snapshot
ds backup
ds restore

ds help
```
