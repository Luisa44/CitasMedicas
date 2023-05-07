const Joi = require('joi');

const create = Joi.object({
    name: Joi.string().required(),
    surname: Joi.string().required(),
    email: Joi.string().email().required(),
    address: Joi.string().required(),
    identification: Joi.string().required(),
    phone: Joi.string().max(12).required(),
    role: Joi.string().required(),
    speciality: Joi.string().empty(null)
});

module.exports = {
    create
};
