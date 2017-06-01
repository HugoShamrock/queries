select name, value
from v$parameter
where name like 'memory_%'
or name like 'sga_%'
or name like 'pga_%'
or name like '%_cache_size'
or name like '%_pool_size'
or name = 'work_size_policy'
order by 1
