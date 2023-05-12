const { GenericController } = require('./generic-controller');
const { MedicalAppointmentStatusService } = require('../services/medical-appointment-status.service');

class MedicalAppointmentStatusController extends GenericController {
    constructor(){
        super(new MedicalAppointmentStatusService());
    }
}

module.exports = { MedicalAppointmentStatusController };