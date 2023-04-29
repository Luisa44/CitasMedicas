var express = require('express');
const { MedicalAppointmentStatusController } = require('../controllers/medical-appointment-status.controller');
var router = express.Router();
const medAppStatusController = new MedicalAppointmentStatusController();

router.get('/', medAppStatusController.getAll.bind(medAppStatusController));
router.get('/:id', medAppStatusController.getOne.bind(medAppStatusController));
router.post('/', medAppStatusController.create.bind(medAppStatusController));
router.put('/:id', medAppStatusController.update.bind(medAppStatusController));
router.delete('/:id', medAppStatusController.deleteOne.bind(medAppStatusController));

module.exports = router;
