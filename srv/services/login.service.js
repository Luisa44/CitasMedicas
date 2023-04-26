const { GenericService } = require('./generic-service');
const { LoginModel } = require('../models/login.model');

class LoginService extends GenericService {
	constructor() {
		super(new LoginModel());
	}
}

module.exports = { LoginService };
