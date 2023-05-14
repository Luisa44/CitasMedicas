const dbClient = require('../config/db');

class GenericModel {
	constructor(entity, primaryKey = 'id') {
		this.entity = entity;
		this.primaryKey = primaryKey;
		this.dbClient = dbClient;
	}

	async findAll(options = null) {
		let fields = '*';

		if (options) {
			fields = options.fields || '*';
		}

		return this.dbClient.singleQuery(`SELECT ${fields} FROM citasmedicas.${this.entity}`);
	}

	findById(id, options = null) {
		let fields = '*';

		if (options) {
			fields = options.fields || '*';
		}

		return this.dbClient.singleQuery(`SELECT ${fields} FROM citasmedicas.${this.entity} WHERE ${this.primaryKey}=${id}`);
	}

	async deleteById(id) {
		await this.dbClient.singleQuery(`DELETE FROM citasmedicas.${this.entity} WHERE ${this.primaryKey} = ${id}`);
	}

	async save(data) {
		let values = [];
		let columns = [];

		for (let [key, value] of Object.entries(data)) {
			columns.push(key);
			if (typeof value == 'number' || typeof value == 'boolean') {
				values.push(`${value}`);
			} else {
				values.push(`'${value}'`);
			}
		}

		values = values.join(',');
		columns = columns.join(',');

		let result = await this.dbClient.singleQuery(`INSERT INTO citasmedicas.${this.entity} (${columns}) VALUES(${values});`);
		return result.insertId;
	}

	async update(id, data) {
		let values = [];

		for (let [key, value] of Object.entries(data)) {
			if (typeof value == 'number' || typeof value == 'boolean') {
				values.push(`${key} = ${value}`);
			} else {
				values.push(`${key} = '${value}'`);
			}
		}

		values = values.join(',');
		await this.dbClient.singleQuery(`UPDATE citasmedicas.${this.entity} SET ${values} WHERE ${this.primaryKey}=${id}`);
	}
}

module.exports = { GenericModel };
