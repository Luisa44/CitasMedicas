var express = require('express');
const { SpecialtyController } = require('../controllers/specialty.controller');
var router = express.Router();
const specialtyController = new SpecialtyController();

router.get('/', specialtyController.getAll);
router.get('/:id', specialtyController.getOne);
router.post('/', specialtyController.create);
router.put('/:id', specialtyController.update);
router.delete('/:id', specialtyController.deleteOne);

module.exports = router;
