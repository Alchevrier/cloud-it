# Design document for [CLOUDIT-2] As a user, I want to be able to assign a user to have access to my workspace for a limited amount of time

This document aims to specify the need to be expressed once the ticket is marked as DONE. 

## The need

As a user, I want to be able to assign a user to have access to my workspace for a limited amount of time 
This means:
- We will introduce the concept of guest which is: an ADMIN or a READ_ONLY for which the expires_at column is not null

## Database Design

### Workspace Access
--> Update and add column
- expires_at: timestamp (NOT NULL if role is GUEST else is NULL)
