const { GenericModel } = require('./generic-model');

class MedicalAppointmentStatusModel extends GenericModel {

    constructor(){
        super('estadodetallecitamedica','idestadodetallecitamedica');
    }
}

module.exports = { MedicalAppointmentStatusModel };