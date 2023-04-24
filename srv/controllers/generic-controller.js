class GenericController {
	constructor(service) {
		this.service = service;
	}

	async getAll(req, res, next) {
		let { fields } = req.query;
		try {
			let result = await this.service.getAll({ fields });
			res.send(result);
		} catch (err) {
			next(err);
		}
	}

	async getOne(req, res, next) {
		let { id } = req.params;
		let { fields } = req.query;
		try {
			let result = await this.service.getOne(id, { fields });
			res.send(result);
		} catch (err) {
			next(err);
		}
	}

	async deleteOne(req, res, next) {
		let { id } = req.params;
		try {
			await this.service.deleteOne(id);
			res.json({
				statusCode: 200,
				message: `The record with id "${id}" was deleted`,
			});
		} catch (err) {
			next(err);
		}
	}

	async create(req, res, next) {
		try {
			let result = await this.service.create(req.body);
			res.status(201).send(result);
		} catch (err) {
			next(err);
		}
	}

	async update(req, res, next) {
		let { id } = req.params;
		try {
			await this.service.update(id, req.body);
			res.json({
				statusCode: 200,
				message: `The record with id "${id}" was updated`,
			});
		} catch (err) {
			next(err);
		}
	}
}

module.exports = { GenericController };
