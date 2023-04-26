const { GenericController } = require('./generic-controller');
const { MedicalAppointmentService } = require('../services/medical-appointment.service');

class MedicalAppointmentController extends GenericController {
    constructor(){
        super(new MedicalAppointmentService());
    }
}

module.exports = { MedicalAppointmentController };