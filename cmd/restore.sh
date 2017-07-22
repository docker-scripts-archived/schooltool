cmd_restore_help() {
    cat <<_EOF
    restore <backup-file.tgz>
        Restore data from the given backup file.

_EOF
}

cmd_restore() {
    local file=$1
    test -f "$file" || fail "Usage: $COMMAND <backup-file.tgz>"

    local dir=${file%%.tgz}
    [[ $file != $dir ]] || fail "Usage: $COMMAND <backup-file.tgz>"

    tar xfz $file

    ds exec service schooltool stop
    ds exec repozo -R -v -r /host/$dir/data -o /var/lib/schooltool/Data.fs
    ds exec rm -rf /var/lib/schooltool/blobs
    docker cp $dir/blobs $CONTAINER:/var/lib/schooltool/
    ds exec chown schooltool:schooltool -R /var/lib/schooltool/blobs
    ds exec service schooltool start
}
