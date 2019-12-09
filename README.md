# express-mysql-project
Nazara Tech assignment

use below command to clone project into your directory

git clone https://github.com/prazf/express-mysql-project.git

database used is Mysql
you can import employee.sql into your phpmyadmin /workbench to setup tables

project structure

db.js
this file contains mysql database related configuration and connection

app.js 
this file contains code necessary to make port lister to sever on 5000

routes.js
this file contains all the routes required for the project

employeeService.js
this file contains all the functions required for getting/updating data into db
this file basically interacts with mysql db


Testing Via Postman


1.localhost:5000/api/registerEmployee

method - post
Request JSON

{
	"employeeName" :"riyansh",
	"departmentID": 1,
	"emailid": "riyansh@gmail.com",
	"password": "riyansh@123"
}

2. localhost:5000/api/authenticate

method post
request json

{
	"emailid":"sumedh@gmail.com",
	"password":"Sumedh@123"
}


3. localhost:5000/api/getDateWiseTime/2019-12-08
(in time and ou time of each employee)

method get

response json 

[
    {
        "employee_id": 1,
        "name": "pradnya shirodkar",
        "intime": "2019-12-08T02:30:00.000Z",
        "outtime": "2019-12-08T17:37:26.000Z"
    },
    {
        "employee_id": 2,
        "name": "manasi chavan",
        "intime": "2019-12-07T21:30:00.000Z",
        "outtime": "2019-12-07T21:30:00.000Z"
    }
]


4. localhost:5000/api/getAllTimes/2019-12-08

(get all punching times for all employees)

method get
Response JSON

[
    {
        "employee_id": 1,
        "name": "pradnya shirodkar",
        "punch_time": "2019-12-08T02:30:00.000Z"
    },
    {
        "employee_id": 2,
        "name": "manasi chavan",
        "punch_time": "2019-12-07T21:30:00.000Z"
    },
    {
        "employee_id": 1,
        "name": "pradnya shirodkar",
        "punch_time": "2019-12-08T17:37:01.000Z"
    },
    {
        "employee_id": 1,
        "name": "pradnya shirodkar",
        "punch_time": "2019-12-08T17:37:26.000Z"
    }
]


