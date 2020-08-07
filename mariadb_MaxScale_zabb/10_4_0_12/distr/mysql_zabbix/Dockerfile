FROM mariadb
RUN apt update && apt install -y zabbix-agent
COPY zabbix.conf.d /etc/zabbix/zabbix_agentd.conf
COPY repl_mon.sh /etc/zabbix/zabbix_agentd.d/repl_mon.sh
COPY mysql_slave_status /etc/zabbix/zabbix_agentd.d/mysql_slave_status
COPY userparameter_mysql.conf /etc/zabbix/zabbix_agentd.conf.d/
COPY .my.cnf /var/lib/zabbix/
COPY mountFTP /distr/mountFTP
COPY zabb_backup_day.sh /etc/zabbix/zabbix_agentd.d/zabb_backup_day.sh
COPY zabb_backup_nigh.sh /etc/zabbix/zabbix_agentd.d/zabb_backup_nigh.sh

#CMD service zabbix-agent start
