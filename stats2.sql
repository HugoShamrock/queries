select owner, table_name, index_name, last_analyzed
from dba_indexes
where last_analyzed < sysdate-10 or last_analyzed is null
order by last_analyzed nulls last, owner, table_name, index_name
