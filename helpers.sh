#/bin/sh

target_bin_directory="${BIN_DIRECTORY:-/usr/bin}"
config_basedir=/etc/skel/.config
config_directory=$config_basedir/qubes-borgmatic

info() {
    echo "INFO - $@"
}

list_bins() {
    find ./bin -type f
}
