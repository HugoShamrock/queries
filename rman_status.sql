select max(mbytes)-min(mbytes) mbytes, max(time)-min(time) time
, round(((max(mbytes)-min(mbytes))/(max(time)-min(time)))*01) mbytes01
, round(((max(mbytes)-min(mbytes))/(max(time)-min(time)))*30) mbytes30
from
(
    select round(mbytes_processed) mbytes, trunc(start_time) time
    from v$rman_status
    where object_type = 'DB INCR'
    and start_time between
    to_date('26.07.2015 12', 'dd.mm.yyyy hh24')
    and
    to_date('27.07.2015 12', 'dd.mm.yyyy hh24')
    union all
    select round(mbytes_processed) mbytes, trunc(start_time) time
    from v$rman_status
    where object_type = 'DB INCR'
    and start_time between
    to_date('14.06.2015 12', 'dd.mm.yyyy hh24')
    and
    to_date('15.06.2015 12', 'dd.mm.yyyy hh24')
)
