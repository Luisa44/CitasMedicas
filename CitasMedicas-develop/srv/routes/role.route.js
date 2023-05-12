var express = require('express');
const { RoleController } = require('../controllers/role.controller');
var router = express.Router();
const roleController = new RoleController();

router.get('/', roleController.getAll.bind(roleController));
router.get('/:id', roleController.getOne.bind(roleController));
router.post('/', roleController.create.bind(roleController));
router.put('/:id', roleController.update.bind(roleController));
router.delete('/:id', roleController.deleteOne.bind(roleController));

module.exports = router;
