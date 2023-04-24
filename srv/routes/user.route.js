var express = require('express');
const { UserController } = require('../controllers/user.controller');
var router = express.Router();
const userController = new UserController();

router.get('/', userController.getAll.bind(userController));
router.get('/:id', userController.getOne.bind(userController));
router.post('/', userController.create.bind(userController));
router.put('/:id', userController.update.bind(userController));
router.delete('/:id', userController.deleteOne.bind(userController));

module.exports = router;
