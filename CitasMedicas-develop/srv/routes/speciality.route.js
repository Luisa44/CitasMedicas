var express = require('express');
const { SpecialtyController } = require('../controllers/specialty.controller');
var router = express.Router();
const specialtyController = new SpecialtyController();

router.get('/', specialtyController.getAll.bind(specialtyController));
router.get('/:id', specialtyController.getOne.bind(specialtyController));
router.post('/', specialtyController.create.bind(specialtyController));
router.put('/:id', specialtyController.update.bind(specialtyController));
router.delete('/:id', specialtyController.deleteOne.bind(specialtyController));

module.exports = router;
