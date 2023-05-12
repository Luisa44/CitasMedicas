const { GenericController } = require('./generic-controller');
const { MedicalAppointmentDetailService } = require('../services/medical-appointment-detail.service');

class MedicalAppointmentDetailController extends GenericController {
    constructor(){
        super(new MedicalAppointmentDetailService());
    }
}

module.exports = { MedicalAppointmentDetailController };