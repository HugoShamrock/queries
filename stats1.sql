select owner, table_name, last_analyzed
from dba_tables
where last_analyzed < sysdate-10 or last_analyzed is null
order by last_analyzed nulls last, owner, table_name
