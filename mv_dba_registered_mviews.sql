--[2s]describes all registered materialized views (registered at a master site or a master materialized view site) in the database
select owner, name, mview_site, can_use_log
from dba_registered_mviews
where can_use_log = 'NO'
order by mview_site, owner, name
