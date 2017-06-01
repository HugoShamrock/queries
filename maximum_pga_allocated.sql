select value/1024/1024 as mb from v$pgastat where name='maximum PGA allocated'
