select segment_type, sum(bytes)/1024/1024/1024 bytes_gb
from dba_segments
group by segment_type
order by sum(bytes) desc
