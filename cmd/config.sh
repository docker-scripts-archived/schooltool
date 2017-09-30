cmd_config_help() {
    cat <<_EOF
    config
        Configure the guest system inside the container.

_EOF
}

cmd_config() {
    ds inject set_prompt.sh
    ds inject ssmtp.sh

    ds inject schooltool.sh
    ds inject apache2.sh
}
