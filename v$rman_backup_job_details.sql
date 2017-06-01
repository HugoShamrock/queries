select
--input_type,
--count(1),
sum(input_bytes)/1024/1024/1024/1024,
sum(output_bytes)/1024/1024/1024/1024
--select *
from v$rman_backup_job_details
--group by input_type
--order by 4 desc
