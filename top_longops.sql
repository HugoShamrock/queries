--http://docs.oracle.com/cd/E11882_01/server.112/e40402/dynviews_3022.htm
select opname, target, totalwork, units, last_update_time, elapsed_seconds, username, sql_hash_value, sql_id
from v$session_longops
where opname not like 'RMAN%'
and totalwork > 150000
order by last_update_time desc, totalwork desc
