const { GenericModel } = require('./generic-model');

class SpecialityModel extends GenericModel {

    constructor(){
        super('especialidad','idespecialidad');
    }
}

module.exports = { SpecialityModel };