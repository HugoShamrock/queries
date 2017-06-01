select
--CASE backup_type WHEN 'L' THEN 'archived redo logs' WHEN 'D' THEN 'datafile full' WHEN 'I' THEN 'incremental' END,
--count(1),
sum(original_input_bytes)/1024/1024/1024/1024,
sum(output_bytes)/1024/1024/1024/1024
--select *
from v$backup_set_details
--group by backup_type
--order by 4 desc
