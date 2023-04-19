var express = require('express');
var router = express.Router();
const userRouter = require('../routes/user.route');
const authRouter = require('../routes/auth.route');
const API = '/api/v1'
/* GET home page. */

module.exports = (passport)=> {
  router.get('/', function(req, res, next) {
    res.render('index', { title: 'Express' });
  });
  router.use(`${API}/auth`, authRouter);
  router.use(passport.authenticate('jwt', {session: false}));
  router.use(`${API}/users`, userRouter);
  router.use(`${API}/headquarters`, userRouter);
  router.use(`${API}/medical-appointment-status`, userRouter);
  router.use(`${API}/medical-appointments`, userRouter);
  router.use(`${API}/medical-procedures`, userRouter);

  return router;
}
