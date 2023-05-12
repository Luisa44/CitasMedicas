var express = require('express');
const { MedicalAppointmentController } = require('../controllers/medical-appointment.controller');
var router = express.Router();
const medAppController = new MedicalAppointmentController();

router.get('/', medAppController.getAll.bind(medAppController));
router.get('/:id', medAppController.getOne.bind(medAppController));
router.post('/', medAppController.create.bind(medAppController));
router.put('/:id', medAppController.update.bind(medAppController));
router.delete('/:id', medAppController.deleteOne.bind(medAppController));

module.exports = router;
