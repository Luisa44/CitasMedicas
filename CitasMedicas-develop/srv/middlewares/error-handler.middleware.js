let Boom = require('@hapi/boom');

function handleError(err, req, res, next) {
    if (!Boom.isBoom(err)) {
        console.error(err);
        err = Boom.internal();
    }

    res.status(err.output.statusCode).json(err.output.payload);
    next();
}

module.exports = {
    handleError,
};
