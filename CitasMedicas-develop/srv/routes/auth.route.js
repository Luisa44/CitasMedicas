var express = require('express');
const passport = require('passport');
const authSchema = require('../schemas/auth.schema');
const { AuthController } = require('../controllers/auth.controller');
const { validateSchema } = require('../middlewares/data-validation.middleware');

var router = express.Router();
const authController = new AuthController();

module.exports = (passport) => {
    router.post('/sign-in', validateSchema(authSchema.signIn), authController.signIn.bind(authController));
    router.post('/sign-up', validateSchema(authSchema.signUp), authController.signUp.bind(authController)); 
    router.post('/password-recovery', validateSchema(authSchema.passwordRecovery), authController.passwordRecovery.bind(authController));
    router.use(passport.authenticate('jwt', { session: false }));
    router.post('/change-password', validateSchema(authSchema.changePassword), authController.changePassword.bind(authController));
    return router;
}
