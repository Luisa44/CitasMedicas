const Joi = require('joi');

const signIn = Joi.object({
    email: Joi.string().email().required(),
    password: Joi.string().min(6)
})

module.exports = {
    signIn
};