const Joi = require('joi');

const signIn = Joi.object({
    email: Joi.string().email().required(),
    contrasena: Joi.string().min(6).required(),
});

const signUp = Joi.object({
    user_name: Joi.string().required(),
    email: Joi.string().email().required(),
    contrasena: Joi.string().min(6).required(),
});

const passwordRecovery = Joi.object({
    email: Joi.string().email().required(),
});

const changePassword = Joi.object({
    password: Joi.string().min(6).required()
})

module.exports = {
    signIn,
    signUp,
    passwordRecovery,
    changePassword
};
