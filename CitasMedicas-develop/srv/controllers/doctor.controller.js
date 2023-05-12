const { GenericController } = require('./generic-controller');
const { DoctorService } = require('../services/doctor.service');

class DoctorController extends GenericController {
    constructor(){
        super(new DoctorService())
    }
}

module.exports = { DoctorController };