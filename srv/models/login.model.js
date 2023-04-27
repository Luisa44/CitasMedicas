const { GenericModel } = require('./generic-model');

class LoginModel extends GenericModel {
	findByUser(user) {
		let fields = '*';

		if (options) {
			fields = options.fields || '*';
		}

		return this.dbClient.singleQuery(`SELECT ${fields} FROM login WHERE usuario = '${user}'`);
	}
}

module.exports = { LoginModel };
