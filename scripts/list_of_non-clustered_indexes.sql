select * from sys.sysindexes
where indid = 0 or indid > 1 
order by rows desc
