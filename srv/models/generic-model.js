const { singleQuery, transactionQuery } = require('../config/db');

class GenericModel {
	constructor(entity = 'test', primaryKey = 'id') {
		this.entity = entity;
		this.primaryKey = primaryKey;
	}

	async findAll(options = null) {
		let fields = '*';

		if (options) {
			fields = options.fields || '*';
		}

		return singleQuery(`SELECT ${fields} FROM ${this.entity}`);
	}

	findById(id, options = null) {
		let fields = '*';

		if (options) {
			fields = options.fields || '*';
		}

		return singleQuery(`SELECT ${fields} FROM ${this.entity} WHERE ${this.primaryKey}=${id}`);
	}

	async deleteById(id) {
		await transactionQuery(`DELETE FROM ${this.entity} WHERE ${this.primaryKey} = ${id}`);
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

		let result = await transactionQuery(`INSERT INTO ${this.entity} (${columns}) VALUES(${values});`);
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
		await transactionQuery(`UPDATE ${this.entity} SET ${values} WHERE ${this.primaryKey}=${id}`);
	}
}

module.exports = { GenericModel };
