const { AuthService } = require('../services/auth.service');

class AuthController{

    constructor(){
        this.authService = new AuthService();
    }

    async signIn(req, res, next){
        try{
            let token = await this.authService.signIn(req.body);
            res.json({token});
        }catch(err){
            next(err);
        }
    }

    async signUp(req, res, next){
        try{
            await this.authService.signUp(req.body);
            res.send();
        }catch(err){
            next(err);
        }
    }

    async passwordRecovery(req, res, next){
        try{
            await this.authService.recoverPassword(req.body.email);

            res.send();
        }catch(err){
            next(err);
        }
    }

    async changePassword(req, res, next){
        try{
            await this.authService.changePassword(req.user.id, req.body.password);
            res.json({
                statsuCode: 200,
                message: 'The new password was set' 
            });
        }catch(err){
            next(err);
        }
    }
}

module.exports = {AuthController};