var express = require('express');
const { DoctorController } = require('../controllers/doctor.controller');
var router = express.Router();
const doctorController = new DoctorController();

router.get('/', doctorController.getAll.bind(doctorController));
router.get('/:id', doctorController.getOne.bind(doctorController));
router.post('/', doctorController.create.bind(doctorController));
router.put('/:id', doctorController.update.bind(doctorController));
router.delete('/:id', doctorController.deleteOne.bind(doctorController));

module.exports = router;
