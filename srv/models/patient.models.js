const { GenericModel } = require('./generic-model');

class PatientModel extends GenericModel {

    constructor(){
        super('paciente','idpaciente');
    }

    findByLoginId(loginId, options = null){
        let fields = '*';

		if (options) {
			fields = options.fields || '*';
		}

		return this.dbClient.singleQuery(`SELECT ${fields} FROM citasmedicas.paciente WHERE login_id=${loginId}`);
    }
}

module.exports = { PatientModel };