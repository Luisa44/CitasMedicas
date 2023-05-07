const router = require('express').Router();
const { UserController } = require('../controllers/user.controller');
const { create } = require('../schemas/user.schema');
const { validateSchema } = require('../middlewares/data-validation.middleware');
const userController = new UserController();

router.post('/', validateSchema(create), userController.create.bind(userController));

module.exports = router;
