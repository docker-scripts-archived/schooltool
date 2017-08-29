cmd_create_help() {
    cat <<_EOF
    create
        Create the wsproxy container '$CONTAINER'.

_EOF
}

rename_function cmd_create orig_cmd_create
cmd_create() {
    mkdir -p plugins custom-css
    touch custom-css/custom.css

    orig_cmd_create \
        --mount type=bind,src=$(pwd)/plugins,dst=/etc/schooltool/standard/plugins \
        --mount type=bind,src=$(pwd)/custom-css,dst=/etc/schooltool/standard/custom-css
}
