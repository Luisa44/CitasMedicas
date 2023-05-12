const { GenericModel } = require('./generic-model');

class DoctorModel extends GenericModel {
	constructor() {
		super('medicoadmin', 'idmedicoadmin');
	}

	async findRoleByLoginId(loginId) {
		return this.dbClient.singleQuery(`SELECT rol.* FROM citasmedicas.login as l
			INNER JOIN citasmedicas.medicoadmin as ma ON ma.login_id = l.idlogin
			INNER JOIN citasmedicas.medicoadminrol as mar ON mar.idmedicoadmin = ma.idmedicoadmin
			INNER JOIN citasmedicas.rol as rol ON rol.idrol = mar.idRol
			WHERE l.idlogin = ${loginId}`);
	}
}

module.exports = { DoctorModel };
