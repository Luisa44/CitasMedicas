    const { GenericModel } = require('./generic-model');

class MedicalProcedureModel extends GenericModel {

    constructor(){
        super('procedimientocitamedica','idprocedimientocitamedica');
    }
}

module.exports = { MedicalProcedureModel };