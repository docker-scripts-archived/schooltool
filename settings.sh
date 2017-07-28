APP=schooltool

### docker image and container
IMAGE=schooltool
CONTAINER=school1-example-org
#PORTS="7080:7080 80:80 443:443"    ## ports to be forwarded when running stand-alone
PORTS=""    ## no ports to be forwarded when running behind wsproxy

### domain of the site
DOMAIN="school1.example.org"

### password of the default manager
PASSWORD=schooltool

### language(s) of the interface
#LANG=sq,en,fr,de,it

### Gmail account for server notifications, etc.
GMAIL_ADDRESS=
GMAIL_PASSWD=
