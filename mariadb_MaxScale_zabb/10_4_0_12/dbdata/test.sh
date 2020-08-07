now=$(date +"%m-%d-%y")
ddd=$(date +"%u")
mysql --user=root --password=***** -e 'select now() as begin' > "/var/lib/mysql/rezerv_log_$now"
mysql --user=root --password=***** -e 'stop slave \G' >> "/var/lib/mysql/rezerv_log_$now"
mysql --user=root --password=*****-e 'flush tables \G' >> "/var/lib/mysql/rezerv_log_$now"
mysql --user=root --password=***** -e 'show slave status \G' >> "/var/lib/mysql/rezerv_log_$now"
mysqldump --user=root --password=*****  --all-databases | gzip > "/var/lib/mysql/dump.gz"
mysql --user=root --password=***** -e 'start slave \G' >> "/var/lib/mysql/rezerv_log_$now"
