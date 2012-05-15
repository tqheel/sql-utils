
--Thanks to StackOverflow.com user Joe Stefanelli for providing this code
--Post can be found at http://stackoverflow.com/questions/4305691/need-to-list-all-triggers-in-sql-server-database-with-table-name-and-tables-sch
--This works for SQL Server 2000
--Other variations for different SQL Server versions available there as well
SELECT trigger_name = o.name, trigger_owner = 'x',table_schema = s.name, table_name = OBJECT_NAME(o.parent_obj),
  isupdate = OBJECTPROPERTY(o.id, 'ExecIsUpdateTrigger'), isdelete = OBJECTPROPERTY(o.id, 'ExecIsDeleteTrigger'),
  isinsert = OBJECTPROPERTY(o.id, 'ExecIsInsertTrigger'), isafter = OBJECTPROPERTY(o.id, 'ExecIsAfterTrigger'),
  isinsteadof = OBJECTPROPERTY(o.id, 'ExecIsInsteadOfTrigger'),
  [disabled] = OBJECTPROPERTY(o.id, 'ExecIsTriggerDisabled') 
FROM sysobjects o 
INNER JOIN sysobjects o2 ON o.parent_obj = o2.id
INNER JOIN sysusers s ON o2.uid = s.uid
WHERE o.type = 'TR'