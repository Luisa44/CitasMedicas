var express = require('express');
const { MedicalProcedureController } = require('../controllers/medical-procedure.controller');
var router = express.Router();
const medProController = new MedicalProcedureController();

router.get('/', medProController.getAll);
router.get('/:id', medProController.getOne);
router.post('/', medProController.create);
router.put('/:id', medProController.update);
router.delete('/:id', medProController.deleteOne);

module.exports = router;
