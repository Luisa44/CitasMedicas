const { GenericService } = require('./generic-service');
const { PatientModel } = require('../models/patient.models');

class PatientService extends GenericService {
	constructor() {
		super(new PatientModel());
	}
}

module.exports = { PatientService };
