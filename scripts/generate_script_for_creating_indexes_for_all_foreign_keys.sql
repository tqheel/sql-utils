-- Executing this script will generate a create-script for inserting indexes
-- over all tables in the database.
-- 
Select
'IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N''[dbo].['
+ tab.[name]
+ ']'') AND name = N''IX_'
+ cols.[name]
+ ''') '
+ 'CREATE NONCLUSTERED INDEX [IX_'
+ cols.[name]
+ '] ON [dbo].['
+ tab.[name]
+ ']( ['
+ cols.[name]
+ '] ASC ) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]'
From sys.foreign_keys keys
Inner Join sys.foreign_key_columns keyCols
 On keys.object_id = keyCols.constraint_object_id
Inner Join sys.columns cols
 On keyCols.parent_object_id = cols.object_id
 And keyCols.parent_column_id = cols.column_id
Inner Join sys.tables tab
 On keyCols.parent_object_id = tab.object_id
Order by tab.[name], cols.[name]