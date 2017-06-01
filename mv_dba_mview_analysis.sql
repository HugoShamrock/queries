--[2t]describes all materialized views in the database that potentially support query rewrite and that provide additional information for analysis by applications
select owner, mview_name, last_refresh_date, refresh_method
from dba_mview_analysis
where refresh_method not in ('FAST','FORCE')
or last_refresh_date < sysdate - 1
or last_refresh_date is null
order by last_refresh_date
