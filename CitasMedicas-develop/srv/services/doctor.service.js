const { GenericService } = require('./generic-service');
const { DoctorModel } = require('../models/doctor.model');

class DoctorService extends GenericService {
	constructor() {
		super(new DoctorModel());
	}

	async getRoleByLoginId(loginId){
		let result = await this.model.findRoleByLoginId(loginId);

		if(!result.length){
            throw Boom.notFound(`Doctor not found`);
        }

        return result[0];
	}
}

module.exports = { DoctorService };
