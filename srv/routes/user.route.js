var express = require('express');
const { UserController } = require('../controllers/user.controller');
var router = express.Router();
const userController = new UserController();

router.get('/', userController.getAll);
router.get('/:id', userController.getOne);
router.post('/', userController.create);
router.put('/:id', userController.update);
router.delete('/:id', userController.deleteOne);

module.exports = router;
