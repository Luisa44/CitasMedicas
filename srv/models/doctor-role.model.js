const { GenericModel } = require('./generic-model');

class DoctorRoleModel extends GenericModel {

    constructor(){
        super('medicoadminrol','idmedicoadminrol');
    }
}

module.exports = { DoctorRoleModel };