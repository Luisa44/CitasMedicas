const { LoginService } = require('./login.service');
const { PatientService } = require('./patient.service');
const { DoctorService } = require('./doctor.service');
const encrypt = require('../utils/encrypt');
const generator = require('generate-password');
const { EmailBuilder } = require('../utils/email/email-builder');
const Boom = require('@hapi/boom');
const jwt = require('jsonwebtoken');
const { JWT_SECRET } = require('../utils/consts');

class AuthService {
	constructor() {
		this.loginService = new LoginService();
		this.patientService = new PatientService();
		this.doctorService = new DoctorService();
	}

	async recoverPassword(email) {
		let login = await this.loginService.getByEmail(email);
		let newPassword = generator.generate({ numbers: true });
		let newPassHashed = await encrypt.hashPassword(newPassword);
		let emailSender = new EmailBuilder()
			.setTo(email)
			.setSubject('Password Recovery')
			.setText(`You temporal password is: ${newPassword}`)
			.build();
		await emailSender.sendEmail();
		await this.loginService.update(login.idlogin, {activo: false, contrasena: newPassHashed})
	}

	async signIn(credentials) {
		const { email, contrasena } = credentials;
		let login;
		let role;
		let userName;

		try {
			login = await this.loginService.getByEmail(email);
			await encrypt.compare(contrasena, login.contrasena);
			userName = login.user_name;
			try {
				await this.patientService.getByLoginId(login.idlogin);
				role = 'patient';
			} catch (err) {
				let userRole = await this.doctorService.getRoleByLoginId(login.idlogin);
				if(userRole.rol === 'Administrador'){
					role = 'administrator';
				}else{
					role = 'doctor';
				}
			}
		} catch (err) {
			console.log(err);
			throw Boom.forbidden();
		}

		let payload = { email: login.email, idUser: login.idlogin, role, activo: login.activo === 1, user_name: userName };
		return jwt.sign(payload, JWT_SECRET, { expiresIn: '59min' });
	}

	async signUp(login) {
		login.contrasena = await encrypt.hashPassword(login.contrasena);
		login.activo = true;
		login.recuperar_contrasena = false;
		let loginCreated;

		try {
			try {
				await this.loginService.getByEmail(login.email);
				throw Boom.badRequest(`The user with email "${login.email}" alredy exists`);
			} catch (err) {
				if (Boom.isBoom(err)) {
					if (err.output.statusCode === 400) {
						throw err;
					}
				}
			}

			loginCreated = await this.loginService.create(login);
			this.patientService.create({ login_id: loginCreated.idlogin });
		} catch (err) {
			if (loginCreated) {
				await this.loginService.deleteOne(loginCreated.idlogin);
			}
			throw err;
		}
	}

	async changePassword(idUser, newPassword) {
		let newPassHashed = await encrypt.hashPassword(newPassword);
		await this.loginService.update(idUser, { contrasena: newPassHashed, activo: true });
	}
}

module.exports = { AuthService };
