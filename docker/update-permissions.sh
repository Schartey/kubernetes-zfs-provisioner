#!/bin/bash

set -eo pipefail

chmod_bin=${ZFS_CHOWN_BIN:-sudo -H chmod}
chown_bin=${ZFS_CHOWN_BIN:-sudo -H chown}
chgrp_bin=${ZFS_CHOWN_BIN:-sudo -H chgrp}

zfs_mountpoint="${1}"
zfs_owner="${2:-0}"
zfs_group="${3:-0}"
zfs_perm="${4:-0770}"

# Do not try to manually modify these Env vars, they will be updated by the provisioner just before invoking the script.
zfs_host="${ZFS_HOST}"

ssh "${zfs_host}" "${chmod_bin} ${zfs_perm} ${zfs_mountpoint}"
ssh "${zfs_host}" "${chown_bin} ${zfs_owner} ${zfs_mountpoint}"
ssh "${zfs_host}" "${chgrp_bin} ${zfs_group} ${zfs_mountpoint}"
