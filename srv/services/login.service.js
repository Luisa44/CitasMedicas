const { GenericService } = require('./generic-service');
const { LoginModel } = require('../models/login.model');
const Boom = require('@hapi/boom');

class LoginService extends GenericService {
	constructor() {
		super(new LoginModel());
	}

	async getByEmail(email, options) {
		let login = await this.model.findByEmail(email, options);
		
		if(!login.length){
			throw Boom.notFound(`The user "${email}" doesn't exist`);
		}

		return login[0];
	}
}

module.exports = { LoginService };
