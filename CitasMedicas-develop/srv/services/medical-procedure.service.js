const { GenericService } = require('./generic-service');
const { MedicalProcedureModel } = require('../models/medical-procedure.model');

class MedicalProcedureService extends GenericService {
	constructor() {
		super(new MedicalProcedureModel());
	}
}

module.exports = { MedicalProcedureService };
