select ind.id, tbl.name as TableName, ind.indid,ind.name as IndexName, ind.rowcnt  from sys.sysindexes ind
join sys.tables tbl on tbl.object_id=ind.id
order by ind.rowcnt desc, ind.indid