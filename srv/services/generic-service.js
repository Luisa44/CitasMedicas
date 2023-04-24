const Boom = require('@hapi/boom')

class GenericService {
	constructor(model) {
		this.model = model;
	}

	getAll(options) {
		return this.model.findAll(options);
	}

	async getOne(id, options) {
		let result = await this.model.findById(id, options);

        if(!result.length){
            throw Boom.notFound(`The record with id "${id}" not found`);
        }

        return result[0];
	}

	async deleteOne(id) {
        await this.getOne(id);
		return this.model.deleteById(id);
	}

	async create(data) {
		let createdId = await this.model.save(data);
        let result = await this.getOne(createdId);
        return result[0];
	}

	async update(id, data) {
        await this.getOne(id);
		return this.model.update(id, data);
	}
}

module.exports = { GenericService };
