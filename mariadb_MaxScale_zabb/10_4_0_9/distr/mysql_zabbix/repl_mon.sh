#!/bin/bash
PATH=/etc:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin

myuser='\\\\\\\'
mypass='///////'

Slave_IO=`mysql -u${myuser} -p${mypass} --vertical -e "SHOW SLAVE STATUS" | grep "Slave_IO_Running:" | cut -d":" -f2 | tr -d " " 2>&1`
Slave_SQL=`mysql -u${myuser} -p${mypass} --vertical -e "SHOW SLAVE STATUS" | grep "Slave_SQL_Running:" | cut -d":" -f2 | tr -d " " 2>&1`

if [ "$Slave_IO" != "Yes" ]
then
    echo "0"
    exit 0
fi

if [ "$Slave_SQL" != "Yes" ]
then
    echo "0"
    exit 0
fi

echo "1"
exit 0
