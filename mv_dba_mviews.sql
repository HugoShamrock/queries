--[2t]describes all materialized views in the database
select owner, mview_name, refresh_method, fast_refreshable, last_refresh_type, last_refresh_date, compile_state
from dba_mviews
where refresh_method not in ('FAST','FORCE')
or last_refresh_type not in ('FAST','FORCE')
or last_refresh_date < sysdate - 1
or last_refresh_date is null
or compile_state != 'VALID'
order by last_refresh_date desc
