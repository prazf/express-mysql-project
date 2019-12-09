const express = require('express');
const app = express();
const router = require('./routes');
app.use(express.json());
app.use(router);
const port = 5000;

// configure middleware
app.set('port', process.env.port || port); // set express to use this port
// set the app to listen on the port
app.listen(port, () => {
    console.log(`Server running on port: ${port}`);
});

module.exports =app;
