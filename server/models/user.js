const mongoose = require("mongoose");


const userSchema = mongoose.Schema({
    name : {
        required : true,
        type : String,
        trime : true,
    },
    email :{
        required : true,
        type : String,
        trim : true,
        validate :{
            validator: (value) => {
                const re =  /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                return value.match(re);
            },
            messaage : "please enter a valid email",
        }
    },
    password : {
        requird : true,
        type : String,
       

    },
    address : {
        type : String,
        default: "",
    },
    type : {
        type : String,
        default : "user",

    }
});

const User = mongoose.model('User',   userSchema);
module.exports = User;