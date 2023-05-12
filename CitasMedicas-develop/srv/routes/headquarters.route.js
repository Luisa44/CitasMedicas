var express = require('express');
const { HeadquartersController } = require('../controllers/headquarters.controller');
var router = express.Router();
const headquartersController = new HeadquartersController();

router.get('/', headquartersController.getAll.bind(headquartersController));
router.get('/:id', headquartersController.getOne.bind(headquartersController));
router.post('/', headquartersController.create.bind(headquartersController));
router.put('/:id', headquartersController.update.bind(headquartersController));
router.delete('/:id', headquartersController.deleteOne.bind(headquartersController));

module.exports = router;
