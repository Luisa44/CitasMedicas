var express = require('express');
const { MedicalProcedureController } = require('../controllers/medical-procedure.controller');
var router = express.Router();
const medProController = new MedicalProcedureController();

router.get('/', medProController.getAll.bind(medProController));
router.get('/:id', medProController.getOne.bind(medProController));
router.post('/', medProController.create.bind(medProController));
router.put('/:id', medProController.update.bind(medProController));
router.delete('/:id', medProController.deleteOne.bind(medProController));

module.exports = router;
