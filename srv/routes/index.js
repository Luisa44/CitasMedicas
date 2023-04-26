var express = require('express');
var router = express.Router();
const docRoleRouter = require('../routes/doctor-role.route');
const doctorRouter = require('../routes/doctor.route');
const headquartersRouter = require('../routes/headquarters.route');
const medAppDetailRouter = require('../routes/medical-appointment-detail.route');
const medAppStatusRouter = require('../routes/medical-appointment-status.route');
const medAppRouter = require('../routes/medical-appointment.route');
const medProcedureRouter = require('../routes/medical-procedure.route');
const pacientRouter = require('../routes/patient.route');
const roleRouter = require('../routes/role.route');
const specRouter = require('../routes/speciality.route');
const loginRouter = require('../routes/login.route');
const authRouter = require('../routes/auth.route');
const API = '/api/v1'
/* GET home page. */

module.exports = (passport)=> {
  router.get('/', function(req, res, next) {
    res.render('index', { title: 'Express' });
  });
  router.use(`${API}/auth`, authRouter);
  router.use(passport.authenticate('jwt', {session: false}));
  router.use(`${API}/login`, loginRouter);
  router.use(`${API}/doctor`, doctorRouter);
  router.use(`${API}/patients`, pacientRouter);
  router.use(`${API}/doctor-roles`, docRoleRouter);
  router.use(`${API}/roles`, roleRouter);
  router.use(`${API}/specialities`, specRouter);
  router.use(`${API}/headquarters`, headquartersRouter);
  router.use(`${API}/medical-appointment-status`, medAppStatusRouter);
  router.use(`${API}/medical-appointment-details`, medAppDetailRouter);
  router.use(`${API}/medical-appointments`, medAppRouter);
  router.use(`${API}/medical-procedures`, medProcedureRouter);

  return router;
}
