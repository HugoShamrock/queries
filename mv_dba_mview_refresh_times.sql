--[2t]describes refresh times of all materialized views in the database
select *
from dba_mview_refresh_times
where last_refresh < sysdate - 1
or last_refresh is null
order by last_refresh
