const { GenericService } = require('./generic-service');
const { PatientModel } = require('../models/patient.models');

class PatientService extends GenericService {
	constructor() {
		super(new PatientModel());
	}

	async getByLoginId(loginId){
		let result = await this.model.findByLoginId(loginId);

		if(!result.length){
            throw Boom.notFound(`Patient not found`);
        }

        return result[0];
	}
}

module.exports = { PatientService };
