var express = require('express');
const { HeadquartersController } = require('../controllers/headquarters.controller');
var router = express.Router();
const headquartersController = new HeadquartersController();

router.get('/', headquartersController.getAll);
router.get('/:id', headquartersController.getOne);
router.post('/', headquartersController.create);
router.put('/:id', headquartersController.update);
router.delete('/:id', headquartersController.deleteOne);

module.exports = router;
