select ts_name
, total_mb
, used_mb
, free_mb
, free_pct
from
(
	select t.ts_name
	, t.total_mb
	, nvl(u.used_mb, 0) used_mb
	, t.total_mb-nvl(u.used_mb, 0) free_mb
	, floor(((t.total_mb-nvl(u.used_mb, 0))/t.total_mb)*100) free_pct
	from
	(
		select tablespace_name ts_name
		, sum(maxbytes)/1024/1024 total_mb
		from sys.dba_data_files
		group by tablespace_name
	) t
	,
	(
		select tablespace_name ts_name
		, ceil(sum(bytes)/1024/1024/100)*100 used_mb
		from sys.dba_segments
		group by tablespace_name
	) u
	where t.ts_name = u.ts_name(+)
)
where free_pct < 25 or free_mb < 1000
order by 5, 4
