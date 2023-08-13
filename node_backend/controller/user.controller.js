const UserService = require("../services/user.services")

exports.register = async(req,res,next)=>{
    try {
        const {email,password}=req.body;
        const successRes = await UserService.registerUser(email,password);
        res.json({status:true,success:"User Registered Successfully"})
    } catch (error) {
        throw error
    }
}

exports.login = async(req,res,next)=>{
    try {
        const {email,password}=req.body;
        console.log("----------",password);
        const user =await UserService.checkUser(email);
        console.log("--------user----",user);
        if(!user){
            throw new Error('User Does not exist')
        }

        const isMatch =  await user.comparePassword(password);
        if(isMatch === false){
            throw new Error('User Password Invalid')
        }

        let tokenData = {_id:user._id,email:user.email};

        const token = await UserService.generateToken(tokenData,"secretKey","1h")

        res.status(200).json({status:true,token:token})

    } catch (error) {
        throw error
    }
}


