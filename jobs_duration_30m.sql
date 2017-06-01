select j.enabled, d.log_date, d.owner, d.job_name, d.status, d.run_duration
from dba_scheduler_job_run_details d
left join dba_scheduler_jobs j on j.job_name = d.job_name
where 1=1
and d.log_date > sysdate - 8
and d.run_duration > interval '30' minute
order by d.log_date desc, d.run_duration desc
