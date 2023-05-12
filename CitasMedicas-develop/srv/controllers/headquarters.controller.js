const { GenericController } = require('./generic-controller');
const { HeadquartersService } = require('../services/headquarters.service');

class HeadquartersController extends GenericController {

    constructor(){
        super(new HeadquartersService())
    }

}

module.exports = { HeadquartersController };