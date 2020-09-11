# Swivl Symfony Test API App

### Requirements
  - PHP >=7.4
  - MySQL >= 5.7

### Installation

Run commands:
```sh
$ cd {project-dir}
$ composer install
```
where {project-dir} - directory where is project located.

Create `.env.local`, configure db connection and run commands:
```sh
$ bin/console doctrine:database:create
$ bin/console doctrine:migrations:migrate
$ bin/console doctrine:fixtures:load
```
To run web app You can use symfony cli command:
```symfony serve -d```

You can use [Postman collection](https://www.getpostman.com/collections/c29f61b619921e64e082) to access requests list.

### Request API Examples

 - Classroom list
   
   Request [GET]
    ```
    GET {host}/api/classroom
    ```
    Response body [200]
    ```
   [
       {
           "id": 4,
           "name": "room 0",
           "enabled": true,
           "createdAt": "2020-09-11T12:10:31+00:00",
           "updatedAt": "2020-09-11T13:15:40+00:00"
       },
       {
           "id": 5,
           "name": "room 1",
           "enabled": true,
           "createdAt": "2020-09-11T12:10:31+00:00",
           "updatedAt": "2020-09-11T12:10:31+00:00"
       },
       {
           "id": 14,
           "name": "room 10",
           "enabled": true,
           "createdAt": "2020-09-11T12:10:31+00:00",
           "updatedAt": "2020-09-11T12:10:31+00:00"
       }
   ]
    ```
 - Get classroom by id
   
   Request [GET]
    ```
    GET {host}/api/classroom/{id}
    ```
    Response body [200]
    ```
    {
        "id": 4,
        "name": "room 0",
        "enabled": false,
        "createdAt": "2020-09-11T12:10:31+00:00",
        "updatedAt": "2020-09-11T12:10:31+00:00"
    }
    ```
 - Create classroom
   
   Request [POST]
    ```
    POST {host}/api/classroom/new
    ```
    Request body [JSON]
    ```
    {
        "name": "some name",
        "enabled": true
    }
    ``` 
    Response body [200]
    ```
    {
        "id": 24,
        "name": "some name",
        "enabled": true,
        "createdAt": "2020-09-11T13:09:37+00:00",
        "updatedAt": "2020-09-11T13:09:37+00:00"
    }
    ```
 - Update classroom
   
   Request [PUT]
    ```
    PATCH {host}/api/classroom/{id}/edit
    ```
    Request body [JSON]
    ```
    {
      "name": "another name"
    }
    ``` 
    Response body [200]
    ```
    {
        "id": 24,
        "name": "another name",
        "enabled": false,
        "createdAt": "2020-09-11T13:09:37+00:00",
        "updatedAt": "2020-09-11T13:27:21+00:00"
    }
    ```    
 - Update classroom enabled status
   
   Request [PATCH]
    ```
    PATCH {host}/api/classroom/{id}/change-status
    ```
    Request body [JSON]
    ```
    {
        "id": 4,
        "name": "room 0",
        "enabled": false,
        "createdAt": "2020-09-11T12:10:31+00:00",
        "updatedAt": "2020-09-11T13:31:58+00:00"
    }
    ``` 
    Response body [200]
    ```
    {
        "id": 4,
        "name": "room 0",
        "enabled": true,
        "createdAt": "2020-09-11T12:10:31+00:00",
        "updatedAt": "2020-09-11T13:15:40+00:00"
    }
    ``` 
 - Delete classroom
   
   Request [DELETE]
    ```
    DELETE {base-url}/api/classroom/{id}
    ```
   Response body [200]
   ```
   []
   ```
