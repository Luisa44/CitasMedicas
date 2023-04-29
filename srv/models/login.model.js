const { GenericModel } = require('./generic-model');

class LoginModel extends GenericModel {

	constructor(){
		super('login', 'idlogin');
	}

	findByEmail(email, options = null) {
		let fields = '*';

		if (options) {
			fields = options.fields || '*';
		}
		
		return this.dbClient.singleQuery(`SELECT ${fields} FROM citasmedicas.login WHERE email = '${email}'`);
	}
}

module.exports = { LoginModel };
