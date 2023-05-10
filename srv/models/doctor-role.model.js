const { GenericModel } = require('./generic-model');

class DoctorRoleModel extends GenericModel {

    constructor(){
        super('medicoadminrol','idmedicoadminrol');
    }

    findByLoginId(loginId){
        return this.dbClient.singleQuery(`SELECT mar.* FROM citasmedicas.login as l
        INNER JOIN citasmedicas.medicoadmin as ma ON ma.login_id = l.idlogin
        INNER JOIN citasmedicas.medicoadminrol as mar ON mar.idmedicoadmin = ma.idmedicoadmin
        WHERE l.idlogin = ${loginId}`);
    }

    async deleteByDoctorAdminId(docAdminId){
		return this.dbClient.singleQuery(`DELETE FROM citasmedicas.medicoadminrol WHERE idmedicoadmin = ${docAdminId}`);
	}
}

module.exports = { DoctorRoleModel };