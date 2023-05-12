const bcrypt = require('bcrypt');
const { SALT_ROUNDS_ENCRYPT } = require('./consts');

module.exports = {
	hashPassword: async (password) => {
		return bcrypt.hash(password, SALT_ROUNDS_ENCRYPT);
	},

	compare: async (password, hashPassword) => {
		let isEqual = await bcrypt.compare(password, hashPassword);
		
        if(!isEqual) {
            throw new Error('The passwords are not equals');
        }
	},
};
