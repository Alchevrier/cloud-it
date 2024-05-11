create type item_access_type as ENUM ('PUBLIC', 'WORKSPACE', 'USER');

create table item_access (
  item_access_id serial,
  item_id integer,
  workspace_id integer,
  workspace_user_id integer,
  access_type item_access_type not null,
  expires_at date,
  created_by varchar(255) not null,
  created_date timestamp not null,
  last_updated_by varchar(255) not null,
  last_updated_date timestamp not null,
  primary key (item_access_id),
  constraint FK_item_access_item_id foreign key(item_id) references item(item_id),
  constraint FK_item_access_workspace_id foreign key(workspace_id) references workspace(workspace_id),
  constraint FK_item_access_workspace_user_id foreign key(workspace_user_id) references workspace_user(workspace_user_id)
);

create unique index UX_item_access_item_id_workspace_id_workspace_user_id_access_type on item_access(item_id, workspace_id, workspace_user_id, access_type);