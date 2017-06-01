select to_char(begin_interval_time, 'yy-mm-dd hh24') snap_time
, dhso.owner, dhso.object_name, sum(db_block_changes_delta) block_changed
from dba_hist_seg_stat dhss, dba_hist_seg_stat_obj dhso, dba_hist_snapshot dhs
where dhs.snap_id = dhss.snap_id
and dhs.instance_number = dhss.instance_number
and dhss.obj# = dhso.obj#
and dhss.dataobj# = dhso.dataobj#
and begin_interval_time between sysdate-5 and sysdate
group by to_char(begin_interval_time, 'yy-mm-dd hh24'), dhso.owner, dhso.object_name
having sum(db_block_changes_delta) > 1000000
order by sum(db_block_changes_delta) desc
