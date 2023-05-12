const { GenericController } = require('./generic-controller');
const { RoleService } = require('../services/role.service');

class RoleController extends GenericController {

    constructor(){
        super(new RoleService())
    }

}

module.exports = { RoleController };