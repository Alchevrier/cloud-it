create table workspace (
  workspace_id serial,
  name varchar(255) not null,
  created_by varchar(255) not null,
  created_date timestamp not null,
  last_updated_by varchar(255) not null,
  last_updated_date timestamp not null,
  primary key (workspace_id)
);

create table workspace_user (
  workspace_user_id serial,
  first_name varchar(255) not null,
  last_name varchar(255) not null,
  created_by varchar(255) not null,
  created_date timestamp not null,
  last_updated_by varchar(255) not null,
  last_updated_date timestamp not null,
  primary key (workspace_user_id)
);

create type workspace_role as ENUM ('ROOT', 'ADMIN', 'READ_ONLY');

create table workspace_access (
  workspace_access_id serial,
  workspace_id integer not null,
  workspace_user_id integer not null,
  role workspace_role not null,
  created_by varchar(255) not null,
  created_date timestamp not null,
  last_updated_by varchar(255) not null,
  last_updated_date timestamp not null,
  primary key (workspace_access_id),
  constraint FK_workspace_access_workspace_id foreign key(workspace_id) references workspace(workspace_id),
  constraint FK_workspace_access_workspace_user_id foreign key(workspace_user_id) references workspace_user(workspace_user_id)
);

create table item (
  item_id serial,
  workspace_id integer not null,
  name varchar(255) not null,
  description varchar(255) not null,
  created_by varchar(255) not null,
  created_date timestamp not null,
  last_updated_by varchar(255) not null,
  last_updated_date timestamp not null,
  primary key (item_id),
  constraint FK_item_workspace_id foreign key(workspace_id) references workspace(workspace_id)
);

create table event (
  event_id serial,
  workspace_id integer not null,
  revision_id uuid not null,
  data jsonb not null,
  created_by varchar(255) not null,
  created_date timestamp not null,
  last_updated_by varchar(255) not null,
  last_updated_date timestamp not null,
  primary key (event_id),
  constraint FK_item_workspace_id foreign key(workspace_id) references workspace(workspace_id)
);

create unique index UX_workspace_access_workspace_id_workspace_user_id on workspace_access(workspace_id, workspace_user_id);