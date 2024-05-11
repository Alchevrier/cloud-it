-- Querying all items which a user has access to based on userId and role
select * from item i where i.workspace_id in (
  select wa.workspace_id from workspace_user wu 
  left join workspace_access wa on wu.workspace_user_id = wa.workspace_user_id 
  where wu.workspace_user_id = 1 and wa.role = 'ROOT'
);

-- Querying all events which a user has access to based on userId and role
select * from event e where e.workspace_id in (
  select wa.workspace_id from workspace_user wu 
  left join workspace_access wa on wu.workspace_user_id = wa.workspace_user_id 
  where wu.workspace_user_id = 1 and wa.role = 'ROOT'
);

-- Querying all item event relating to the item with name 'My First Item' which a user has access to based on userId and role
select * from event e 
where data->>'type' = 'item' and data->>'name' = 'My First Item' 
and e.workspace_id in (
  select wa.workspace_id from workspace_user wu 
  left join workspace_access wa on wu.workspace_user_id = wa.workspace_user_id 
  where wu.workspace_user_id = 1 and wa.role = 'ROOT'
);