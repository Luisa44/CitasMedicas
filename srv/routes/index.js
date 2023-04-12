var express = require('express');
var router = express.Router();
const userRouter = require('../routes/user.route');
const authRouter = require('../routes/auth.route');
const API = '/api/v1'
/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.use(`${API}/users`, userRouter);
router.use(`${API}/auth`, authRouter);

module.exports = router;
