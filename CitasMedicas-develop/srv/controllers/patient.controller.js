const { GenericController } = require('./generic-controller');
const { PatientService } = require('../services/patient.service');

class PatientController extends GenericController {

    constructor(){
        super(new PatientService())
    }

}

module.exports = { PatientController };