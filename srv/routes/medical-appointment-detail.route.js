var express = require('express');
const { MedicalAppointmentDetailController } = require('../controllers/medical-appointment-detail.controller');
var router = express.Router();
const medAppDetailController = new MedicalAppointmentDetailController();

router.get('/', medAppDetailController.getAll.bind(medAppDetailController));
router.get('/:id', medAppDetailController.getOne.bind(medAppDetailController));
router.post('/', medAppDetailController.create.bind(medAppDetailController));
router.put('/:id', medAppDetailController.update.bind(medAppDetailController));
router.delete('/:id', medAppDetailController.deleteOne.bind(medAppDetailController));

module.exports = router;
