const { GenericController } = require('./generic-controller');
const { MedicalAppointmentService } = require('../services/medical-appointment.service');

class MedicalAppointmentController extends GenericController {
    constructor(){
        super(new MedicalAppointmentService());
    }

    async create(req, res, next) {
		try {
			let result = await this.service.create(req.body, req.user.id);
			res.status(201).send(result);
		} catch (err) {
			next(err);
		}
	}

    async getAll(req, res, next) {
		try {
			let result = await this.service.getAll(req.user.id);
			res.send(result);
		} catch (err) {
			next(err);
		}
	}
}

module.exports = { MedicalAppointmentController };