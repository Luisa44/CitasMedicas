const { GenericService } = require('./generic-service');
const { DoctorModel } = require('../models/doctor.model');
const { LoginService } = require('../services/login.service');
const { DoctorRoleService } = require('../services/doctor-role.service');

class DoctorService extends GenericService {
	#loginService;
	#doctorRoleService;

	constructor() {
		super(new DoctorModel());
		this.#loginService = new LoginService();
		this.#doctorRoleService = new DoctorRoleService();

	}

	async getRoleByLoginId(loginId){
		let result = await this.model.findRoleByLoginId(loginId);

		if(!result.length){
            throw Boom.notFound(`Doctor not found`);
        }

        return result[0];
	}

	async deleteOne(id) {
		let user = await this.getOne(id);
		await this.#doctorRoleService.deleteOneByUser(user.idmedicoadmin);
		await this.model.deleteById(id);
		await this.#loginService.deleteOne(user.login_id);
	}
}

module.exports = { DoctorService };
