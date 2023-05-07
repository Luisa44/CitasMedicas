const { GenericModel } = require('./generic-model');

class DoctorModel extends GenericModel {
	constructor() {
		super('medicoadmin', 'idmedicoadmin');
	}

	async findAll(options = null) {

		return this.dbClient.singleQuery(
			`SELECT doc.nombremedicoadmin as name, doc.identificacion as identification, 
				doc.direccionmedicoadmin as address, doc.celularumedicoadmin as phone, 
				doc.apellidomedicoadmin as surname, rol.rol as role, l.email, dcRol.idespecialidad as speciality
				FROM citasmedicas.${this.entity} as doc 
				INNER JOIN citasmedicas.login as l on doc.login_id = l.idlogin
				INNER JOIN citasmedicas.medicoadminrol as dcRol on doc.idmedicoadmin = dcRol.idmedicoadmin
				INNER JOIN citasmedicas.rol as rol on rol.idrol = dcRol.idRol`
			);
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
