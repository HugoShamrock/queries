--[1]displays the names of the dependent detail or container tables of all the materialized views in the current schema
select *
from all_refresh_dependencies
where oldest_refresh_date < sysdate - 1
or oldest_refresh_date is null
order by oldest_refresh_date
