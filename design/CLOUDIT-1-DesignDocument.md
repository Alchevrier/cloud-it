# Design document for [CLOUDIT-1] As a user of a given workspace I want to be able to access all items assigned to my workspace

This document aims to specify the need to be expressed once the ticket is marked as DONE. 
We will introduce concepts and Gherkin scenarios which needs to be implemented as specified. 
For now, only the database part is going to be implemented. 

## The need

As a user of a given workspace I want to be able to access all items assigned to my workspace. 
This means:
- A user can be assigned to one or multiple workspaces
- A user can only see items of a currently selected workspace
- A user can be assigned as a guest to another workspace
- A user cannot have access to a workspace if its guess access has been revoked
- A workspace is a gathering of one to multiple users 
- A workspace must have a root user which cannot be passed on to another user
- A guest user to a workspace has only READ rights to the workspace
- A user can be a READ only user or an ADMIN user
- An admin or root user can create an item
- As an admin or root user I can see all historical events which happened to the item

## Database Design

All tables will have the following auditing columns:
- created_by: varchar(255)
- created_date: timestamp
- last_updated_by: varchar(255)
- last_updated_date: timestamp

Unless mentionned as NULL a column will always be NOT NULL. 

### Workspace 
- id: bigint (PK)
- name: varchar(255)

### Workspace User
- id: bigint (PK)
- first_name: varchar(255)
- last_name: varchar(255)

### Workspace Access
- id: bigint (PK)
- workspace_id: bigint (FK workspace table)
- user_id: bigint (FK user table)
- role: varchar(55) (enum - ADMIN, ROOT, READ, GUEST)
- expires_at: timestamp (NOT NULL if role is GUEST else is NULL)
Unique index: workspace_id - user_id

### Item
- id: bigint (PK)
- name: varchar(255)
- description: varchar (255)
- workspace_id: bigint (FK workspace table)

### Event
- id: bigint (PK)
- revision_id: uuid
- workspace_id: bigint (FK workspace table)
- data: json 

## Event Definition

### Item Creation
{
  type: "item-creation",
  name: "given-name",
  description: "given-description"
}

