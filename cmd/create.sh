cmd_create_help() {
    cat <<_EOF
    create
        Create the wsproxy container '$CONTAINER'.

_EOF
}

rename_function cmd_create orig_cmd_create
cmd_create() {
    orig_cmd_create \
        -v $(pwd)/plugins:/etc/schooltool/standard/plugins \
        -v $(pwd)/custom-css:/etc/schooltool/standard/custom-css

    mkdir -p plugins custom-css
    touch custom-css/custom.css
}
