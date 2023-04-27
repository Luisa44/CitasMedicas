const { Email } = require('./email');

class EmailBuilder {
	#to = '';
	#subject = '';
	#text = '';
	#html = '';
	#attachments = [];

	setTo(to) {
		this.#to = to;
		return this;
	}

	setSubject(subject) {
		this.#subject = subject;
		return this;
	}

	setText(text) {
		this.#text = text;
		return this;
	}

	setHtml(html) {
		this.#html = html;
		return this;
	}

	addAttachment(attachment) {
		this.#attachments.push(attachment);
		return this;
	}

	build() {
		let email = new Email(this.#to, this.#subject, this.#text, this.#html, this.#attachments);
		return email;
	}
}

module.exports = { EmailBuilder };