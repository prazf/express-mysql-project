const express = require('express');
const router = express.Router();
const emmployeeService=require('./employeeService');


// routes for the app

router.get('/api/getEmployeeByDepartment', emmployeeService.getEmployeeByDepartment);

router.post('/api/registerEmployee', emmployeeService.registerEmployee);

router.post('/api/authenticate',emmployeeService.authenticateEmployee);

router.get('/api/getDateWiseTime/:enteredDate',emmployeeService.getInTimeandOutTimeofEachEmpployee);

router.get('/api/getallTimes/:enteredDate',emmployeeService.getPunchTimeDateWise);

module.exports = router;