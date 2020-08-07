FROM mariadb
RUN apt update && apt install -y zabbix-agent
COPY zabbix.conf.d  /etc/zabbix/zabbix_agentd.conf
COPY userparameter_mysql.conf /etc/zabbix/zabbix_agentd.conf.d/
COPY .my.cnf /var/lib/zabbix/
#CMD service zabbix-agent start
