--sourced from http://stackoverflow.com/questions/3751932/how-to-find-tables-having-foreign-key-to-a-table-in-oracle
select d.table_name,

       d.constraint_name "Primary Constraint Name",

       b.constraint_name "Referenced Constraint Name"

from user_constraints d,

     (select c.constraint_name,

             c.r_constraint_name,

             c.table_name

      from user_constraints c 

      where table_name='EMPLOYEES' --your table name instead of EMPLOYEES

      and constraint_type='R') b

where d.constraint_name=b.r_constraint_name