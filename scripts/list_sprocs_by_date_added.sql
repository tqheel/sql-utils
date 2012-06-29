SELECT obj.Name as SPName,

obj.create_date as SPCreationDate

FROM sys.sql_modules modu

INNER JOIN sys.objects obj

ON modu.object_id = obj.object_id

WHERE obj.type = 'P' and obj.create_date < '2011-10-13 12:23:59.490'

order by SPCreationDate desc


