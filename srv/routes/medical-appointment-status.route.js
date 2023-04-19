var express = require('express');
const { MedicalAppointmentStatusController } = require('../controllers/medical-appointment-status.controller');
var router = express.Router();
const medAppStatusController = new MedicalAppointmentStatusController();

router.get('/', medAppStatusController.getAll);
router.get('/:id', medAppStatusController.getOne);
router.post('/', medAppStatusController.create);
router.put('/:id', medAppStatusController.update);
router.delete('/:id', medAppStatusController.deleteOne);

module.exports = router;
