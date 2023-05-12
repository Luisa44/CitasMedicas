const { GenericModel } = require('./generic-model');

class RoleModel extends GenericModel {

    constructor(){
        super('rol','idrol');
    }
}

module.exports = { RoleModel };