const { GenericService } = require('./generic-service');
const { MedicalAppointmentStatusModel } = require('../models/medical-appointment-status.model');

class MedicalAppointmentStatusService extends GenericService {
	constructor() {
		super(new MedicalAppointmentStatusModel());
	}
}

module.exports = { MedicalAppointmentStatusService };
