const express =require("express");
const User = require("../models/user");
const bcryptjs = require("bcryptjs");
const jwt = require("jsonwebtoken");
// singup
const authRouter = express.Router();

authRouter.post("/api/signup", async (req,res) =>{
    try{
        const{name, email, password} = req.body;

    const existingUser = await User.findOne({email});
    if(existingUser){
        return res.status(400).json({
            msg : "User with  same emailady exists!"
        });
    }

    const hashPassword =  await bcryptjs.hash(password, 8);

    let user = new User({
        email,
        password : hashPassword,
        name,
    });
    user = await user.save();
    res.json(user);
        
    }catch (e) {
        res.status(500).json({ error: e.message});
    }
    

   

});

 // signin
 authRouter.post("/api/signin", async(req,res) =>{
    try{
     const{email,password} = req.body;
     const user = await User.findOne({email});
     if(!user){
        return res.status(400).json({msg:"user with this email is does not exist!"});
     }
    //  test123
    // gibberish
     const isMatch= await bcryptjs.compare(password, user.password);
     if(!isMatch){
        return res.status(400).json({msg:"password is incorrect."});
     }

     const token = jwt.sign({id : user._id}, "passwordKey");
     res.json({token, ...user._doc})

    }catch(e){
        res.status(500).json({error:e.message});

    }

})

module.exports =authRouter;