// imports from packages
const express = require("express");
const mongoose = require('mongoose');
// import files from other files
const authRouter = require('./routes/auth');

// init

const PORT = 3000;
const app = express();
const DB =
   "mongodb+srv://gokul:TomGokul6379216315@cluster0.2mbtukr.mongodb.net/?retryWrites=true&w=majority"
// middleware

app.use(authRouter);

// connections

mongoose
.connect(DB)
.then(() => {
    console.log("Connection successfully");
})
.catch((e) => {
console.log(e);
    });

app.listen(PORT, "0.0.0.0", () => {
    console.log(`connected  at port ${PORT}`);

});