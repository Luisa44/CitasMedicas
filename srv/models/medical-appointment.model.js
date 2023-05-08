const { GenericModel } = require('./generic-model');

class MedicalAppointmentModel extends GenericModel {

    constructor(){
        super('citamedica','idcitamedica');
    }

    async findAll(idLogin) {

		return this.dbClient.singleQuery(`SELECT e.idespecialidad, e.descripcion as speciality, 
            scm.descripcionsedecitamedica as headquarter, scm.direccionsedecitamedica as headquarter_address, 
            scm.idsedecitamedica as headquarter_id, dcm.fecha, dcm.descripcion, 
            edcm.descripcionestadodetallecitamedica as estado, p.nombrepaciente as patient, 
            p.celularpaciente as patient_phone, ma.nombremedicoadmin as doctor_name, 
            ma.apellidomedicoadmin as doctor_surname, ma.celularumedicoadmin as phone, cm.idcitamedica
            FROM citasmedicas.citamedica as cm
            INNER JOIN citasmedicas.medicoadminrol as mar on cm.idmedicoadminrol = mar.idmedicoadminrol
            INNER JOIN citasmedicas.especialidad as e on mar.idespecialidad = e.idespecialidad
            INNER JOIN citasmedicas.sedecitamedica as scm on scm.idsedecitamedica = cm.idsedecitamedica
            INNER JOIN citasmedicas.detallecitamedica as dcm on dcm.citamedica_id = cm.idcitamedica
            INNER JOIN citasmedicas.estadodetallecitamedica as edcm on edcm.idestadodetallecitamedica = dcm.estado_id
            LEFT JOIN citasmedicas.paciente as p on p.idpaciente = cm.idpaciente
            INNER JOIN citasmedicas.medicoadmin as ma on ma.idmedicoadmin = mar.idmedicoadmin
            LEFT JOIN citasmedicas.login as l on l.idlogin = ma.login_id or l.idlogin = p.login_id
            WHERE l.idlogin = ${idLogin}`);
	}
}

module.exports = { MedicalAppointmentModel };