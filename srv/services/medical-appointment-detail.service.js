const { GenericService } = require('./generic-service');
const { MedicalAppointmentDetailModel } = require('../models/medical-appointment-detail.model');

class MedicalAppointmentDetailService extends GenericService {
	constructor() {
		super(new MedicalAppointmentDetailModel());
	}

	async deleteOneByMedicalAppointmentId(id) {
		await this.model.deleteByMedicalAppointmentId(id);
	}
}

module.exports = { MedicalAppointmentDetailService };
