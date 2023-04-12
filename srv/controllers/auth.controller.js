class AuthController{

    signIn(req, res, next){
        try{
            throw new Error('test Error');
            res.send('signIn works');
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