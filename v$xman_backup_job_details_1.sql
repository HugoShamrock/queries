select * from
(
    select command_id
    , status
    , input_type
    , round(input_bytes/1024/1024/1024) as input_gb
    , round(output_bytes/1024/1024/1024) as output_gb
    --, round(input_bytes/1024/1024) as input_mb
    --, round(output_bytes/1024/1024) as output_mb
    , round(compression_ratio,1) as compression_ratio
    , round(input_bytes_per_sec/1024/1024) as input_mb_per_sec
    , round(output_bytes_per_sec/1024/1024) as output_mb_per_sec
    , round(elapsed_seconds/60) as elapsed_minutes
    --, start_time
    --, end_time
    from v$rman_backup_job_details
    where input_type = 'DB INCR'
    --where input_type = 'ARCHIVELOG'
    order by command_id desc
)
where rownum <= 10
