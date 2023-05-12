const { GenericController } = require('./generic-controller');
const { DoctorRoleService } = require('../services/doctor-role.service');

class DoctorRoleController extends GenericController {
    constructor(){
        super(new DoctorRoleService());
    }
}

module.exports = { DoctorRoleController };