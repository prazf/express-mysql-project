const db = require('./db');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');


module.exports = {
    /*
        function to register an employee
    */
    registerEmployee: (req,res) =>{
       
        if(!req.body.employeeName || !req.body.departmentID || !req.body.emailid || !req.body.password)   
            return res.json({status: "error", message: "data missing"}); 

        const { employeeName,departmentID,emailid,password } = req.body; 
         
        let hash = bcrypt.hashSync(password, 10);
        db.query('insert into employee values(?,?,?,?,?)',[,employeeName,departmentID,emailid,hash] ,(err, rows, fields) => {
            if (!err)
                res.json({status: "success", message: "employee registered"});
            else
                res.json({status: "error", message: err});
        })        

    },
    verifyToken: (req,res,next)=>{

        const bearerHeader = req.headers['authorization'];        
        if(typeof bearerHeader != 'undefined'){
    
            const bearer = bearerHeader.split(' ');
            const bearerToken = bearer[1];
            
            req.token = bearerToken;
            next();
    
        }else{
            res.sendStatus(403);
        }
    },
    /*
        Authenticate employee based on email id and password
    */
    authenticateEmployee: (req,res) =>{
        if(!req.body.emailid || !req.body.password)   
            return res.json({status: "error", message: "data missing"}); 

        const {emailid,password}= req.body;
        db.query('SELECT * FROM employee where email_id=?',emailid,(err, rows, fields) => {
            if (!err){

                if(bcrypt.compareSync(password, rows[0].password)) {

                    jwt.sign({user:rows[0]},'secretKey',(err,token)=>{
                        res.json({
                            token
                        })
                    });
                }else{
                    res.json({status:"error", message: "Invalid email/password!!!"});
                }
            }
               
            else
                res.json({status: "error", message: err});
        }) 
        

    },
    /*
        Get all employees by department , protect route with JWT Token
    */
    getEmployeeByDepartment: (req,verifyToken, res) => {
        jwt.verify(req.token,'secretKey',(err,authData)=>{
            if(err){
                res.json({status: "error", message: err});               
            }else{
                
                db.query('SELECT e.id,e.name as ename,d.name as departmentname FROM employee e inner join department d where e.dept_id=d.id group by d.id' ,(err, rows, fields) => {
                    if (!err)
                        res.send(rows);
                    else
                        console.log(err);
                    })
            }
        })        
    },
    /*
        Date wise employee all punch times
    */
    getPunchTimeDateWise:(req,res)=>{
        if(!req.params.enteredDate || !req.params.enteredDate)   
            return res.json({status: "error", message: "data missing"}); 

        db.query('SELECT pt.employee_id,e.name,pt.punch_time from punch_time as pt left join employee as e on pt.employee_id=e.id where DATE(pt.punch_time)= ?' ,req.params.enteredDate,(err, rows, fields) => {
            if (!err)
                res.send(rows);
            else
                res.json({status: "error", message: err});
            })
    },
    /*
        Date wise employee in and out time
    */
    getInTimeandOutTimeofEachEmpployee:(req,res)=>{

        if(!req.params.enteredDate || !req.params.enteredDate)   
            return res.json({status: "error", message: "data missing"}); 

        db.query('SELECT pt.employee_id,e.name,min(pt.punch_time) as intime,max(pt.punch_time) as outtime from punch_time as pt left join employee as e on pt.employee_id=e.id where DATE(pt.punch_time)= ? group by pt.employee_id' ,req.params.enteredDate,(err, rows, fields) => {
            if (!err)
                res.send(rows);
            else
                res.json({status: "error", message: err});
            })

    }
};