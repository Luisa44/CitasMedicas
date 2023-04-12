const Boom = require('@hapi/boom');

function validateSchema(modelSchema){
    return async function(req, res, next){
        //return next(throw new Error)
        let value;
        try{
            value = await modelSchema.validateAsync(req.body);
            console.log('value', value);
            next();
        }catch(err){
            next(Boom.badRequest(err.details[0].message));
        }
    }
}

module.exports = {
    validateSchema
}