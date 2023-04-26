const { GenericService } = require('./generic-service');
const { SpecialityModel } = require('../models/speciality.model');

class SpecialityService extends GenericService {
	constructor() {
		super(new SpecialityModel());
	}
}

module.exports = { SpecialityService };
