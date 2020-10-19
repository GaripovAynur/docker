thread_cache_size

Задаёт количество потоков, которое будет храниться в кэше. Т.е. — после 
тключения клиента от сервера — поток будет перемещён в кеш, и при подключении 
нового клиента будет использван из кэша, а не создан новый.



mysql> show global status where variable_name like 'Threads%';
+-------------------+-------+
| Variable_name     | Value |
+-------------------+-------+
| Threads_cached    | 0     |
| Threads_connected | 2     |
| Threads_created   | 1017  |
| Threads_running   | 1     |
+-------------------+-------+
4 rows in set (0.00 sec)
Threads_running — активные потоки в данный момент, Threads_created — количество потоков, созданных с момента старта сервера.

Что бы определить оптимальное значение для thread_cache_size — необходимо выяснить количество активных потоков 
(Threads_connected), вписать значение в thread_cache_size и перезапустить сервер (или использовать set global).

Потом — ещё раз проверить значение Threads_created — если оно продолжает расти — снова увеличить thread_cache_size. 
И так до тех пор, пока значения Threads_created и Threads_cached не будут примерно равны (Threads_created может быть 
немного больше):

Ещё один из вариантов, с чего начать — посмотреть значение Max_used_connections, которое отобразит максимальное количество
 клиентов с момента старта сервера:


mysql> show status like 'max_used_connections';
+----------------------+-------+
| Variable_name        | Value |
+----------------------+-------+
| Max_used_connections | 2    |
+----------------------+-------+
1 row in set (0.00 sec)
И становить значение thread_cache_size немного больше Max_used_connections.
thread_cache_size = 4



MariaDB [(none)]> show global  status like 'tabl%';
+-----------------------------------+----------+
| Variable_name                     | Value    |
+-----------------------------------+----------+
| Table_locks_immediate             | 5338617  |
| Table_locks_waited                | 32       |
| Table_open_cache_active_instances | 1        |
| Table_open_cache_hits             | 33443512 |
| Table_open_cache_misses           | 11986    |
| Table_open_cache_overflows        | 4917     |
+-----------------------------------+----------+
Table_open_cache_overflows - если больше 0 , можно увеличить table_open_cache = 800


ariaDB [(none)]> show global  status like 'qcach%';
+-------------------------+---------+
| Variable_name           | Value   |
+-------------------------+---------+
| Qcache_free_blocks      | 1       |
| Qcache_free_memory      | 1031304 |
| Qcache_hits             | 0       |
| Qcache_inserts          | 0       |
| Qcache_lowmem_prunes    | 0       |
| Qcache_not_cached       | 0       |
| Qcache_queries_in_cache | 0       |
| Qcache_total_blocks     | 1       |
+-------------------------+---------+
необходимо сравнить Qcache_hits и Qcache_inserts, если на один insert  10-15 hits, значит 
нужно оставить включенным (также должно быть Qcache_lowmem_prunes = 0 ):
query_cache_limit               = 1M   
query_cache_size                = 256M


