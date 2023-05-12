const mysql = require('mysql');
const envConf = require('./conf-env');
let params = {
	connectionLimit: 10,
	host: envConf.mysql.host,
	user: envConf.mysql.user,
	password: envConf.mysql.password,
	database: envConf.mysql.database,
}

const pool = mysql.createPool(params);

module.exports = {
	singleQuery: (query) => {
		return new Promise((resolve, reject) => {
			pool.query(query, function (error, results, fields) {
				if (error) {
                    console.error(error);
					return reject(error);
				}
				resolve(results);
			});
		});
	},

	transactionQuery: (query) => {
		return new Promise((resolve, reject) => {
			pool.getConnection((err, connection) => {
				if (err) {
					return reject(err);
				}

				connection.beginTransaction((error) => {
					if (error) {
						return reject(err);
					}

					connection.query(query, function (errQuery, result, fields) {
						if (errQuery) {
							console.error(errQuery);
							connection.rollback();
							return reject(new Error(`Error on query: ${query}`));
						}

						connection.commit((errCommit) => {
							if (errCommit) {
								connection.rollback();
								return reject(new Error(`Error on query: ${query}`));
							}
						});

                        resolve(result);
					});
				});
			});
		});
	},
};
