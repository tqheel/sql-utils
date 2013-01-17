\
insert into app_item(app_item_id, control_id, app_page_id, description, default_label)
   select SEQ_APP_ITEM.nextval, a, b, c, d from
  (
    select'LabelNameSuffix' as a, 183 as b, 'Name Suffix' as c, 'Name Suffix' as d from dual
    union all
    select 'LabelFax', 184, 'Fax Number', 'Fax Number' from dual
  )
  ;
