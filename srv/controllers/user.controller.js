const { GenericController } = require('./generic-controller');
const { UserService } = require('../services/user.service');

class UserController extends GenericController {

    constructor(){
        super(new UserService())
    }

    async create(req, res, next){
        try {
			let result = await this.service.create(req.body);
			res.status(201).send(result);
		} catch (err) {
			next(err);
		}
    }

}

module.exports = { UserController };