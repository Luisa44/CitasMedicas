const jwt = require('jsonwebtoken');
const { JWT_SECRET } = require('../utils/consts')

class AuthController{

    signIn(req, res, next){
        try{
            const { email, password } = req.body;
            let payload = {userid: 5};
            const token = jwt.sign(payload, JWT_SECRET, {expiresIn: '59min'});
            res.json({token});
        }catch(err){
            next(err);
        }
    }

    signUp(req, res, next){
        res.send('signUp works');
    }

    passwordRecovery(req, res, next){
        res.send('passwordRecovery works');
    }

    enableUser(req, res, next){
        res.send('enableUser works');
    }
}

module.exports = {AuthController};