#! /bin/bash

set -e

# cinnamon, debian-junior, gnome, kde, lxde, lxqt, mate, standard, xfce
DESKENV="xfce"

# Get the name of the file containing the package list.
PKGLST=$(wget -qO- https://cdimage.debian.org/cdimage/release/current-live/amd64/iso-hybrid/SHA256SUMS | grep "amd64-${DESKENV}.iso.packages" -m1 | awk '{print $2}')

# Get the package names from the first column.
wget -qO- "https://cdimage.debian.org/cdimage/release/current-live/amd64/iso-hybrid/${PKGLST}" | awk '{print $1}' | tee config/package-lists/official.list.chroot > /dev/null
