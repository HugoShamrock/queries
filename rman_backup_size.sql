-- https://community.oracle.com/thread/1097939?tstart=0

SELECT
  ctime "Date" ,
  DECODE(backup_type, 'L', 'Archive Log', 'D', 'Full', 'Incremental')
  backup_type ,
  bsize "Size GB"
FROM
  (
    SELECT
      TRUNC(bp.completion_time) ctime ,
      backup_type ,
      ROUND(SUM(bp.bytes/1024/1024/1024),2) bsize
    FROM
      v$backup_set bs,
      v$backup_piece bp
    WHERE
      bs.set_stamp   = bp.set_stamp
    AND bs.set_count = bp.set_count
    AND bp.status    = 'A'
    GROUP BY
      TRUNC(bp.completion_time),
      backup_type
  )
ORDER BY
  1,
  2
