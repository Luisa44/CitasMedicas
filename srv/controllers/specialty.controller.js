const { GenericController } = require('./generic-controller');
const { SpecialityService } = require('../services/speciality.service');

class SpecialtyController extends GenericController {

    constructor(){
        super(new SpecialityService())
    }

}

module.exports = { SpecialtyController };