#/bin/sh

. ./helpers.sh

if [ "$1" == "-h" ]; then
    cat <<EOF 2>&1 
Usage: $0 [-hf]

Options
    -f 	Do not prompt for confirmation
    -h	Show this message
EOF
    exit 128
fi

if [ "$1" != "-f" ]; then
    echo -n "Removing all binaries, rpc and configuration. Continue? [y/N] "
    read go_opt
    case $go_opt in
        y*|Y*)  ;;
        *)  exit 1 ;;
    esac
fi

for binary in $(list_bins); do
    info "Removing from $target_bin_directory: $(basename $binary)"
    rm "$target_bin_directory/$(basename $binary)"
done
    
info "Removing from /etc/qubes-rpc: qubes.BorgmaticSync"
rm /etc/qubes-rpc/qubes.BorgmaticSync

info "Removing $config_directory"
rm -r "$config_directory"
