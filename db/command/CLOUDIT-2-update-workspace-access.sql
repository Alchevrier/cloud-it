update workspace_access
set expires_at = current_date
where workspace_id = 2 and workspace_user_id = 1 and role = 'READ_ONLY';

update workspace_access
set expires_at = current_date - 10
where workspace_id = 1 and workspace_user_id = 2 and role = 'ADMIN';
