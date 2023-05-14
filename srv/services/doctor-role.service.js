const { GenericService } = require('./generic-service');
const { DoctorRoleModel } = require('../models/doctor-role.model');

class DoctorRoleService extends GenericService {
	constructor() {
		super(new DoctorRoleModel());
	}

	async getOneByUserId(userId){
		let [result] = await this.model.findByLoginId(userId);
		return result;
	}

	async deleteOneByUser(userId){
		return this.model.deleteByDoctorAdminId(userId);
	}
}

module.exports = { DoctorRoleService };
