schooltool
==========

Docker scripts that install and run SchoolTool in a container.

## Install

  - First install `ds` and `wsproxy`:
     + https://github.com/docker-scripts/ds#installation
     + https://github.com/docker-scripts/wsproxy#installation

  - Then get the schooltool scripts from github: `ds pull schooltool`

  - Create a directory for the schooltool container: `ds init schooltool @school1`

  - Fix the settings:
    ```
    cd /var/ds/school1
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

  - Tell `wsproxy` to manage the domain of this container: `ds wsproxy add`

  - Tell `wsproxy` to get a free letsencrypt.org SSL certificate for this domain (if it is a real one):
    ```
    ds wsproxy ssl-cert --test
    ds wsproxy ssl-cert
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
