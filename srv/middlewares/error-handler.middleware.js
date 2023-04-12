let Boom  = require('@hapi/boom');

function handleError(err, req, res, next){
    console.log('hello error handler')
    if(Boom.isBoom(err)){
        //res.statusCode(err.)
        console.log(err);
        let {output} = err;
        res.statusCode(output.statusCode).json(output.payload);
    }else{
        let error = Boom.internal();
        console.log(error);
    }
    next();
}

module.exports = {
    handleError
}