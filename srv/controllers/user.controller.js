const { GenericController } = require('./generic-controller');
const { UserService } = require('../services/user.service');

class UserController extends GenericController {

    constructor(){
        super(new UserService())
    }

}

module.exports = { UserController };