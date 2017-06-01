--[2s]describes all materialized view logs in the database
select log_owner, master, log_table, last_purge_date
from dba_mview_logs
where last_purge_date < sysdate - 1
or last_purge_date is null
order by last_purge_date
