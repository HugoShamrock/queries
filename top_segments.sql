select tablespace_name, owner, segment_name, bytes/1073741824 gb
from dba_segments
where bytes/1073741824 > 2
order by 4 desc
