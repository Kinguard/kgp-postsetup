#! /bin/bash

PWLEN=20

adm_pass=`echo "get dbconfig-common/mysql/admin-pass" | debconf-communicate | cut -d' ' -f2`

ocpass=`pwgen -ns1 $PWLEN`
rcpass=`pwgen -ns1 $PWLEN`

OC="
owncloud owncloud/dbconfig-install boolean true
owncloud owncloud/dbconfig-reinstall boolean true
owncloud owncloud/mysql/app-pass password $ocpass
owncloud owncloud/mysql/admin-pass password $adm_pass
"

RC="
roundcubemail roundcubemail/dbconfig-reinstall boolean true
roundcubemail roundcubemail/dbconfig-install boolean true
roundcubemail roundcubemail/mysql/app-pass password $rcpass
roundcubemail roundcubemail/mysql/admin-pass password $adm_pass
"

export DEBIAN_FRONTEND=noninteractive

echo "$OC" | debconf-set-selections && dpkg-reconfigure owncloud
echo "$RC" | debconf-set-selections && dpkg-reconfigure roundcubemail

exit 0
