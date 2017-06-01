select 'touch '
|| (select value from v$parameter where name = 'db_name')
|| '.'
|| lower(username)
|| '.sql;'
from dba_users
where account_status = 'OPEN'
and initial_rsrc_consumer_group = 'DEFAULT_CONSUMER_GROUP'
order by username
