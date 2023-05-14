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
};
