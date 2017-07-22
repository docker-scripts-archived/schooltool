cmd_config_help() {
    cat <<_EOF
    config
        Configure the guest system inside the container.

_EOF
}

cmd_config() {
    cmd_start
    sleep 3

    # run config scripts
    local config="
        set_prompt
        mount_tmp_on_ram
        ssmtp

        schooltool
        apache2
    "
    for cfg in $config; do
        ds runcfg $cfg
    done

    cmd_restart
}
