var express = require('express');
const { LoginController } = require('../controllers/login.controller');
var router = express.Router();
const loginController = new LoginController();

router.get('/', loginController.getAll.bind(loginController));
router.get('/:id', loginController.getOne.bind(loginController));
router.post('/', loginController.create.bind(loginController));
router.put('/:id', loginController.update.bind(loginController));
router.delete('/:id', loginController.deleteOne.bind(loginController));

module.exports = router;
