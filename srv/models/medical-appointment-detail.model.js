const { GenericModel } = require('./generic-model');

class MedicalAppointmentDetailModel extends GenericModel {

    constructor(){
        super('detallecitamedica','iddetallecitamedica');
    }

    async deleteByMedicalAppointmentId(id) {
		await this.dbClient.transactionQuery(`DELETE FROM citasmedicas.${this.entity} WHERE citamedica_id = ${id}`);
	}
}

module.exports = { MedicalAppointmentDetailModel };