var express = require('express');
const passport = require('passport');
const authSchema = require('../schemas/auth.schema');
const { AuthController } = require('../controllers/auth.controller');
const { validateSchema } = require('../middlewares/data-validation.middleware');

var router = express.Router();
const authController = new AuthController();

router.post('/sign-in', validateSchema(authSchema.signIn), authController.signIn);
router.post('/sign-up', validateSchema(authSchema.signUp), authController.signUp); 
router.post('/password-recovery', authController.passwordRecovery);
router.put('/enable-user', authController.enableUser);

module.exports = router;
