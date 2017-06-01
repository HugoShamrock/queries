--[1s]describes all materialized views using materialized view logs in the database
select *
from dba_base_table_mviews
where mview_last_refresh_time < sysdate - 1
or mview_last_refresh_time is null
order by mview_last_refresh_time
