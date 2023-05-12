var express = require('express');
const { PatientController } = require('../controllers/patient.controller');
var router = express.Router();
const patientController = new PatientController();

router.get('/', patientController.getAll.bind(patientController));
router.get('/:id', patientController.getOne.bind(patientController));
router.post('/', patientController.create.bind(patientController));
router.put('/:id', patientController.update.bind(patientController));
router.delete('/:id', patientController.deleteOne.bind(patientController));

module.exports = router;
