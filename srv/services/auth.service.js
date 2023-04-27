const { LoginService } = require('./login.service');
const encrypt = require('../utils/encrypt');
const generator = require('generate-password');
const { EmailBuilder } = require('../utils/email/email-builder');
const Boom = require('@hapi/boom');
const jwt = require('jsonwebtoken');
const { JWT_SECRET } = require('../utils/consts');

class AuthService {
    constructor(){
        this.loginService = new LoginService();
    }
	
    async recoverPassword(email){
        //let login = await this.loginService.getByUsername(email);
        let newPassword = generator.generate({numbers: true});
        let newPassHash = await encrypt.hashPassword(newPassword);
        let emailSender = new EmailBuilder().setTo(email).setSubject('Password Recovery').setText(`You temporal password is: ${newPassword}`).build();
        await emailSender.sendEmail();
        //this.loginService.update(login.idlogin, {recuperar: true, contrasena: newPassHash})
    }

    async signIn(credentials){
        const { email, password } = credentials;
        let login;

        try{
            //login = await this.loginService.getByUsername(email);
            await encrypt.compare(password, "$2b$10$EemFVfljeQOfGhAM0J103uExI1ULIpvCw2KPWuo1prs/uqgIts1zq");
        }catch(err){
            throw Boom.forbidden();
        }
        
        let payload = {email: email, idUser: 5, role: 'doctor', activo: false};
        return jwt.sign(payload, JWT_SECRET, {expiresIn: '59min'});
    }

    async signUp(login){
        login.password = await encrypt.hashPassword(login.password);
        //this.loginService.create(login);
    }

    async changePassword(idUser, newPassword){
        this.loginService.update(idUser, { contrasna: newPassword});
    }
}

module.exports = { AuthService };
