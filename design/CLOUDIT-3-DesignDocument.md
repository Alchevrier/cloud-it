# Design document for [CLOUDIT-3] As a user I want to make a particular item PUBLIC without exposing a whole workspace

This document aims to specify the need to be expressed once the ticket is marked as DONE. 

## The need

[CLOUDIT-3] As a user I want to make a particular item PUBLIC without exposing a whole workspace
This means:
- We will create a new table which is item_access
- It will define the concept of temporal and forever accessible
- It will define the concept of sharing for: another workspace or a given user or for the public

## Database Design

All tables will have the following auditing columns:
- created_by: varchar(255)
- created_date: timestamp
- last_updated_by: varchar(255)
- last_updated_date: timestamp

### Item Access
- id: bigint (PK)
- item_id: bigint (FK item table)
- workspace_id: bigint (FK workspace table)
- workspace_user_id: bignt (FK workspace_user table) 
- access_type: varchar(55) (enum - WORKSPACE, USER, PUBLIC)
- expires_at: date
Unique index: item_id - access_workspace_id - access_workspace_user_id - access_type
