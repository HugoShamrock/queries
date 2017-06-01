select log_id, log_date, owner, job_name, status, run_duration
from
(
    select *
    from dba_scheduler_job_run_details
    where job_name = 'JOB_STATSPACK_SNAP'
    order by log_date desc
)
where rownum < 5
