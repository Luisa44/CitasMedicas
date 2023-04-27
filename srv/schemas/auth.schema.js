const Joi = require('joi');

const signIn = Joi.object({
    email: Joi.string().email().required(),
    password: Joi.string().min(6).required(),
});

const signUp = Joi.object({
    name: Joi.string().required(),
    email: Joi.string().email().required(),
    password: Joi.string().min(6).required(),
});

const passwordRecovery = Joi.object({
    email: Joi.string().email().required(),
});

module.exports = {
    signIn,
    signUp,
    passwordRecovery
};
