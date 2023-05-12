const { GenericModel } = require('./generic-model');

class HeadquartersModel extends GenericModel {

    constructor(){
        super('sedecitamedica','idsedecitamedica');
    }
}

module.exports = { HeadquartersModel };