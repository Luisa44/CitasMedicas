const { GenericService } = require('./generic-service');
const { HeadquartersModel } = require('../models/headquarters.model');

class HeadquartersService extends GenericService {
	constructor() {
		super(new HeadquartersModel());
	}
}

module.exports = { HeadquartersService };
