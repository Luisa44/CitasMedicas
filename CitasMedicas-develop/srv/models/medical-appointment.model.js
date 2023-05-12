const { GenericModel } = require('./generic-model');

class MedicalAppointmentModel extends GenericModel {

    constructor(){
        super('citamedica','idcitamedica');
    }
}

module.exports = { MedicalAppointmentModel };