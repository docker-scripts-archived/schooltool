cmd_config_help() {
    cat <<_EOF
    config
        Configure the guest system inside the container.

_EOF
}

cmd_config() {
    ds runcfg set_prompt
    ds runcfg ssmtp

    ds runcfg schooltool
    ds runcfg apache2
}
