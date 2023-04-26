const { GenericController } = require('./generic-controller');
const { MedicalProcedureService } = require('../services/medical-procedure.service');

class MedicalProcedureController extends GenericController {
    constructor(){
        super(new MedicalProcedureService())
    }
}

module.exports = { MedicalProcedureController };