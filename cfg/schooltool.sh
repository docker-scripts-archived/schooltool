#!/bin/bash -x

### get the settings
source /host/settings.sh

### set the password of the manager
service schooltool start
python -m schooltool.app.main -c /etc/schooltool/standard/schooltool.conf --restore-manager "$PASSWORD"

### allow access to schooltool from network
sed -i /etc/schooltool/standard/paste.ini \
    -e '/^host/c host = 0.0.0.0'

### set language(s)
if [[ -n $LANG ]]; then
  sed -i /etc/schooltool/standard/schooltool.conf \
      -e '/^lang /d'
  echo "lang $LANG" >> /etc/schooltool/standard/schooltool.conf
fi

service schooltool restart

### make a daily backup of the DB
cat <<_EOF > /etc/cron.daily/schooltool-repozo
#!/bin/sh
repozo -B -v -r /host/data-backup -f /var/lib/schooltool/Data.fs >/dev/null
_EOF
mkdir -p /host/data-backup
chmod +x /etc/cron.daily/schooltool-repozo

# ### pack the database monthly
# cat <<_EOF > /etc/cron.monthly/zeopack
# #!/bin/sh
# zeopack localhost:7081
# _EOF
# chmod +x /etc/cron.monthly/zeopack
