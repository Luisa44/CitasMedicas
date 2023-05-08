const Joi = require('joi');

const create = Joi.object({
    headquarter: Joi.number().integer().required(),
    date: Joi.date().required(),
    description: Joi.string().required()
});

module.exports = {
    create
};
