const { GenericController } = require('./generic-controller');
const { LoginService } = require('../services/login.service');

class LoginController extends GenericController {

    constructor(){
        super(new LoginService())
    }

}

module.exports = { LoginController };