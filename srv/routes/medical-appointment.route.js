var express = require('express');
const { MedicalAppointmentController } = require('../controllers/medical-appointment.controller');
var router = express.Router();
const medAppController = new MedicalAppointmentController();

router.get('/', medAppController.getAll);
router.get('/:id', medAppController.getOne);
router.post('/', medAppController.create);
router.put('/:id', medAppController.update);
router.delete('/:id', medAppController.deleteOne);

module.exports = router;
