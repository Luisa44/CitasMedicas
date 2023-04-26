const { GenericService } = require('./generic-service');
const { MedicalAppointmentModel } = require('../models/medical-appointment.model');

class MedicalAppointmentService extends GenericService {
	constructor() {
		super(new MedicalAppointmentModel());
	}
}

module.exports = { MedicalAppointmentService };
