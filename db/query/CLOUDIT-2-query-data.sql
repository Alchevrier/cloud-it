-- Query for guest users in a given workspace
select * from workspace_access 
where workspace_id = 2 
and expires_at is not null; 

-- Querying all items which a user has access to based on guest roles and not expired
select * from item i where i.workspace_id in (
  select wa.workspace_id from workspace_user wu 
  left join workspace_access wa on wu.workspace_user_id = wa.workspace_user_id 
  where wa.role in ('ADMIN', 'READ_ONLY') and expires_at >= current_date
);