const { GenericModel } = require('./generic-model');

class MedicalAppointmentDetailModel extends GenericModel {

    constructor(){
        super('detallecitamedica','iddetallecitamedica');
    }
}

module.exports = { MedicalAppointmentDetailModel };