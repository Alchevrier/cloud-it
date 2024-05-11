# CloudIt: Put it in the cloud! 

Welcome to the CloudIt repository. This is an inventory storage system which allows to:
- Create an item
- Share it in the PUBLIC with an expirity date or not
- Share it to another WORKSPACE with an expirity date or not
- Share it to another USER with an expirity date or not
- Have access to all events which occured to the item

The implementation is done via POSTGRESQL. 

## Directories explained

- /design: contains the design documents for a given feature
- /db/tables: contains definition for each feature of the tables
- /db/command: contains insertion/update scripts
- /db/query: contains query scripts to fetch data 

## Different phases

- Phase One: Defining basic features: item creation, user creation, access to workspace and access to single item
-- SQL implementation only for now
- Phase Two: Implementing the back-end in an unsecure way 
-- Spring-Boot - Java 22 - OpenAPI
- Phase Three: Implement the front-end in an unsecure way 
-- Front-end framework to be defined: dropdown to a user and login as the selected user
- Phase Four: Securing the app
-- Introduce JWT and secure back-end and front-end via Okta-like 