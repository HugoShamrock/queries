select name, value
from v$parameter
where name = 'control_file_record_keep_time'
or name = 'db_recovery_file_dest'
or name = 'db_recovery_file_dest_size'
or name = 'log_archive_dest'
order by 1
