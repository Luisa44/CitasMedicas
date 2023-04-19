var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
const passport = require("passport");
const {handleError} = require('./middlewares/error-handler.middleware');
const applyPassportStrategy = require('./middlewares/auth.middleware');

var initializeRoutes = require('./routes/index');
const bodyParser = require('body-parser');

var app = express();
app.use(passport.initialize());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
applyPassportStrategy(passport);
//passport.user(new LocalStrategy)
// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', initializeRoutes(passport));

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404)); 
});

// error handler
/*app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});*/

app.use(handleError);

module.exports = app;
