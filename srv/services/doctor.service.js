const { GenericService } = require('./generic-service');
const { DoctorModel } = require('../models/doctor.model');

class DoctorService extends GenericService {
	constructor() {
		super(new DoctorModel());
	}
}

module.exports = { DoctorService };
