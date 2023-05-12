const { GenericService } = require('./generic-service');
const { DoctorRoleModel } = require('../models/doctor-role.model');

class DoctorRoleService extends GenericService {
	constructor() {
		super(new DoctorRoleModel());
	}
}

module.exports = { DoctorRoleService };
