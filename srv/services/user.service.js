const { EmailBuilder } = require('../utils/email/email-builder');
const { DoctorRoleService } = require('./doctor-role.service');
const { DoctorService } = require('./doctor.service');
const { LoginService } = require('./login.service');
const encrypt = require('../utils/encrypt');
const generator = require('generate-password');

class UserService {
	#docRoleService;
	#docService;
	#loginService;

	constructor() {
		this.#docRoleService = new DoctorRoleService();
		this.#docService = new DoctorService();
		this.#loginService = new LoginService();
	}

	async create(data) {
		const doctorRoleId = 2;
		const adminRoleId = 1;
		let loginCreated;
		let doctorCreated;

		try {
            const tempPass = generator.generate({numbers: true});
            console.log('password', tempPass);
            const hashPass = await encrypt.hashPassword(tempPass);

			loginCreated = await this.#loginService.create({
				user_name: data.name,
				contrasena: hashPass,
				email: data.email,
				activo: false,
			});

			doctorCreated = await this.#docService.create({
				nombremedicoadmin: data.name,
                apellidomedicoadmin: data.surname,
				identificacion: data.identification,
				direccionmedicoadmin: data.address,
				celularumedicoadmin: data.phone,
				login_id: loginCreated.idlogin,
			});

			let result = await this.#docRoleService.create({
				estado: true,
				idmedicoadmin: doctorCreated.idmedicoadmin,
				idRol: data.role === 'Doctor' ? doctorRoleId : adminRoleId,
				idespecialidad: data.speciality,
			});

            let emailSender = new EmailBuilder()
			.setTo(data.email)
			.setSubject('New user created')
			.setText(`To sign in in the "Citas Medicas" application you must use the following credentials: 
                user: ${data.email}
                password:${tempPass}`)
			.build();
    		await emailSender.sendEmail();

            return result;

		} catch (err) {
            console.log(err);
			if (loginCreated) {
				await this.#loginService.deleteOne(loginCreated.idlogin);
			}

			if (doctorCreated) {
				await this.#docService.deleteOne(doctorCreated.idmedicoadmin);
			}

			throw err;
		}
	}
}

module.exports = { UserService };
