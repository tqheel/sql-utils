SELECT owner, table_name
  FROM dba_constraints
 WHERE constraint_name = 'FK_HIGHEST_SEQUENCE';