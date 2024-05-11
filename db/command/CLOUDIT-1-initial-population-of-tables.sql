insert into workspace(name, created_by, created_date, last_updated_by, last_updated_date) 
values('CloudIt Workspace', 'achevrier@cloudit.com', current_timestamp, 'achevrier@cloudit.com', current_timestamp),
('Dev Workspace', 'achevrier@cloudit.com', current_timestamp, 'achevrier@cloudit.com', current_timestamp);

insert into workspace_user(first_name, last_name, created_by, created_date, last_updated_by, last_updated_date) 
values('Alex', 'Chevrier', 'achevrier@cloudit.com', current_timestamp, 'achevrier@cloudit.com', current_timestamp),
('Dev', 'McLane', 'achevrier@cloudit.com', current_timestamp, 'achevrier@cloudit.com', current_timestamp);

insert into workspace_access(workspace_id, workspace_user_id, role, created_by, created_date, last_updated_by, last_updated_date) 
values(1, 1, 'ROOT', 'achevrier@cloudit.com', current_timestamp, 'achevrier@cloudit.com', current_timestamp),
(2, 2, 'ROOT', 'achevrier@cloudit.com', current_timestamp, 'achevrier@cloudit.com', current_timestamp),
(2, 1, 'READ_ONLY', 'achevrier@cloudit.com', current_timestamp, 'achevrier@cloudit.com', current_timestamp),
(1, 2, 'ADMIN', 'achevrier@cloudit.com', current_timestamp, 'achevrier@cloudit.com', current_timestamp);

insert into event(workspace_id, revision_id, data, created_by, created_date, last_updated_by, last_updated_date) 
values(1, gen_random_uuid(), '{ "type": "item", "name": "My First Item", "description": "So proud of creating my first item" }', 'achevrier@cloudit.com', current_timestamp, 'achevrier@cloudit.com', current_timestamp), 
(1, gen_random_uuid(), '{ "type": "item", "name": "My Second Item", "description": "Getting the ball rolling in the CloudIt Workspace" }', 'achevrier@cloudit.com', current_timestamp, 'achevrier@cloudit.com', current_timestamp), 
(2, gen_random_uuid(), '{ "type": "item", "name": "My First Item", "description": "Who knew I could use the same name elsewhere" }', 'achevrier@cloudit.com', current_timestamp, 'achevrier@cloudit.com', current_timestamp), 
(1, gen_random_uuid(), '{ "type": "item", "name": "My Second Item", "description": "Getting the ball rolling in the Dev Workspace" }', 'achevrier@cloudit.com', current_timestamp, 'achevrier@cloudit.com', current_timestamp);

insert into item(workspace_id, name, description, created_by, created_date, last_updated_by, last_updated_date) 
values(1, 'My First Item', 'So proud of creating my first item', 'achevrier@cloudit.com', current_timestamp, 'achevrier@cloudit.com', current_timestamp),
(1, 'My Second Item', 'Getting the ball rolling in the CloudIt Workspace', 'achevrier@cloudit.com', current_timestamp, 'achevrier@cloudit.com', current_timestamp),
(2, 'My First Item', 'Who knew I could use the same name elsewhere', 'achevrier@cloudit.com', current_timestamp, 'achevrier@cloudit.com', current_timestamp),
(2, 'My Second Item', 'Getting the ball rolling in the Dev Workspace', 'achevrier@cloudit.com', current_timestamp, 'achevrier@cloudit.com', current_timestamp);