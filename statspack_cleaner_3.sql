--set serveroutput on;
declare
    sql_command varchar2(2000);
begin
    select 'begin statspack.purge(i_begin_snap => '||nvl(min(snap_id),0)||', i_end_snap => '||nvl(max(snap_id),0)||'); end;'
    into sql_command
    from
    (
      select snap_id
      from stats$snapshot
      --where snap_time < to_date('01.01.2015', 'dd.mm.yyyy')
      where snap_time < add_months(sysdate,-13)
      order by snap_id
    )
    where rownum < 500;
    dbms_output.put_line(sql_command);
    execute immediate sql_command;
end;
