const { GenericService } = require('./generic-service');
const { RoleModel } = require('../models/role.model');

class RoleService extends GenericService {
	constructor() {
		super(new RoleModel());
	}
}

module.exports = { RoleService };
