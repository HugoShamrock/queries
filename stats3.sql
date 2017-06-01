select owner, count(1)
from
(
    select owner
    from dba_tables
    where last_analyzed < sysdate-10 or last_analyzed is null
    union all
    select owner
    from dba_indexes
    where last_analyzed < sysdate-10 or last_analyzed is null
)
group by owner
order by count(1) desc
