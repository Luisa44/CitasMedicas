const { GenericService } = require('./generic-service');
const { UserModel } = require('../models/user.model');

class UserService extends GenericService {
	constructor() {
		super(new UserModel());
	}
}

module.exports = { UserService };
