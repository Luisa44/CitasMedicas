const { GenericService } = require('./generic-service');
const { LoginModel } = require('../models/login.model');
const Boom = require('@hapi/boom');

class LoginService extends GenericService {
	constructor() {
		super(new LoginModel());
	}

	getByUsername(username, options) {
		let login = this.model.getByUser(username, options);
		if(!login.length){
			throw Boom.notFound(`The user "${username}" doesn't exist`);
		}

		return login[0];
	}
}

module.exports = { LoginService };
