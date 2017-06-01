select nvl(min(snap_id),0) snap_id
from stats$snapshot
--where snap_time < to_date('01.01.2015', 'dd.mm.yyyy')
where snap_time < add_months(sysdate,-13)
union all
select nvl(max(snap_id),0) snap_id
from stats$snapshot
--where snap_time < to_date('01.01.2015', 'dd.mm.yyyy')
where snap_time < add_months(sysdate,-13)
order by snap_id
