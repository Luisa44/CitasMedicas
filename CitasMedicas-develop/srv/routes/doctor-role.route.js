var express = require('express');
const { DoctorRoleController } = require('../controllers/doctor-rol.controller');
var router = express.Router();
const docRoleController = new DoctorRoleController();

router.get('/', docRoleController.getAll.bind(docRoleController));
router.get('/:id', docRoleController.getOne.bind(docRoleController));
router.post('/', docRoleController.create.bind(docRoleController));
router.put('/:id', docRoleController.update.bind(docRoleController));
router.delete('/:id', docRoleController.deleteOne.bind(docRoleController));

module.exports = router;
