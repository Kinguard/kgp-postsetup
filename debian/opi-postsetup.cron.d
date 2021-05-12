#
# Run firstboot scripts only at reboot
#

SHELL=/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

@reboot root /usr/share/opi-postsetup/kgp-postsetup
