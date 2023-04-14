const Boom = require('@hapi/boom');

function validateSchema(modelSchema){
    return async function(req, res, next){
        try{
            await modelSchema.validateAsync(req.body);
            next();
        }catch(err){
            next(Boom.badRequest(err.details[0].message));
        }
    }
}

module.exports = {
    validateSchema
}