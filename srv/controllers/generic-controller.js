class GenericController {
    constructor() {

    }

    getAll(req, res, next) {
        res.send('getAll works');
    }

    getOne(req, res, next) {
        res.send('getOne works');
    }

    deleteOne(req, res, next) {
        res.send('deleteOne works');
    }  

    create(req, res, next) {
        res.send('create works');
    }

    update(req, res, next) {
        res.send('update works');
    }

}

module.exports = { GenericController };