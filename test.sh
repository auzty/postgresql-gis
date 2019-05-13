#!/bin/bash

VARKU=`echo -n "hehehe" | md5sum | awk '{print $1}'`

echo \"${VARKU}\"lolololo

# set the pgbouncer config
#sed -i -e "s/user=.* /user=test /g"  pgbouncer.ini
#sed -i -e "s/password=.*$/password=pwd/g"  /opt/pgbouncer/pgbouncer.ini
#sed -i -e "s/admin_users.*$/admin_users = ffeef/" /opt/pgbouncer/pgbouncer.ini

# create pgbouncer userlist
#MYMD5=`echo -n ${POSTGRES_USER}${POSTGRES_PASSWORD} | md5sum | awk '{print $1}'`

#echo "ikimunu hasile md5 === $MYMD5"

#echo "\"${POSTGRES_USER}\" \"md5${MYMD5}\""
