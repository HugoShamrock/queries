select name, display_value, value, issys_modifiable
from v$parameter
where
(
    name like 'memory_%'
    or name like 'sga_%'
    or name like 'pga_%'
    --or name = 'workarea_size_policy'
) and value != '0'
order by value desc, name
