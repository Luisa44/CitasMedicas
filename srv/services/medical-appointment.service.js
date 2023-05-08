const { MedicalAppointmentDetailService } = require('./medical-appointment-detail.service');
const { MedicalAppointmentModel } = require('../models/medical-appointment.model');
const { MedicalProcedureService } = require('./medical-procedure.service');
const { DoctorRoleService } = require('./doctor-role.service');
const { GenericService } = require('./generic-service');

class MedicalAppointmentService extends GenericService {
	#docRoleService;
	#medProcedureService;
	#medAppDetailService;

	constructor() {
		super(new MedicalAppointmentModel());
		this.#docRoleService = new DoctorRoleService();
		this.#medProcedureService = new MedicalProcedureService();
		this.#medAppDetailService = new MedicalAppointmentDetailService();
	}

	async create(data, userId) {
		let medProCreated;
		let medAppCreated;

		try {
			const medAppFreeId = 2;

			let userRole = await this.#docRoleService.getOneByUserId(userId);
			medProCreated = await this.#medProcedureService.create({});

			medAppCreated = await this.model.save({
				fecha: new Date().toISOString(),
				idmedicoadminrol: userRole.idmedicoadminrol,
				idsedecitamedica: data.headquarter,
				idprocedimientoprocedimientocitamendica: medProCreated.idprocedimientocitamedica,
			});

			await this.#medAppDetailService.create({
				citamedica_id: medAppCreated,
				fecha: data.date,
				descripcion: data.description,
				estado_id: medAppFreeId,
			});

			return this.getOne(medAppCreated);
		} catch (err) {
			if (medAppCreated) {
				await this.model.deleteById(medAppCreated);
			}

			if (medProCreated) {
				await this.#medProcedureService.deleteOne(medProCreated.idprocedimientocitamedica);
			}

			throw err;
		}
	}

	async getAll(userId) {
		let result = await this.model.findAll(userId);
		return result.map(item => {
			console.log(item);
			return {
				id: item.idcitamedica,
				description: item.descripcion,
				state: item.estado,
				date: item.fecha,
				speciality: {
					id: item.idespecialidad,
					description: item.speciality
				},
				headquarter: {
					id: item.headquarter_id,
					description: item.headquarter,
					address: item.headquarter_address
				},
				patient: {
					name: item.patient,
					phone: item.patient_phone
				},
				doctor: {
					name: item.doctor_name,
					surname: item.doctor_surname,
					phone: item.phone
				}
			}
		});
	}

	async deleteOne(id) {
		let medAppointment = await this.getOne(id);
        await this.#medProcedureService.deleteOne(medAppointment.idprocedimientoprocedimientocitamendica);
		await this.#medAppDetailService.deleteOneByMedicalAppointmentId(id);
		return this.model.deleteById(id);
	}
}

module.exports = { MedicalAppointmentService };
