#/bin/sh
set -e

. ./helpers.sh

for binary in $(list_bins); do
    info "Copying to $target_bin_directory: $binary"
    cp "$binary" "$target_bin_directory"
    chmod 755 "$target_bin_directory/$(basename $binary)"
done
    
info "Copying to /etc/qubes-rpc: qubes.BorgmaticSync"
cp qubes.BorgmaticSync /etc/qubes-rpc/
chmod 755 /etc/qubes-rpc/qubes.BorgmaticSync

info "Copying to $config_directory: config_qubes-borgmatic"
mkdir -pm 700 "$config_basedir"
cp -r config_qubes-borgmatic "$config_directory"
