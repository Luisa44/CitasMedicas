const nodemailer = require('nodemailer');
const envConf = require('../../config/conf-env');

class Email {
	#emailConf;
    #transporter;

	constructor(to, subject, text, html, attachments) {
		this.#emailConf = {
			to: to,
			from: envConf.email.user,
			subject: subject,
			text: text,
			html: html,
			attachments: attachments,
		};
        console.log(this.#emailConf);
        this.#transporter = nodemailer.createTransport({
			host: 'smtp.gmail.com',
			port: 587,
			auth: {
				user: envConf.email.user,
				pass: envConf.email.password
			}
		});
	}

	sendEmail() {
		return this.#transporter.sendMail(this.#emailConf);
	}
}

module.exports = { Email };