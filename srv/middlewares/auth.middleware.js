//https://dev.to/calvinqc/a-step-by-step-guide-to-setting-up-a-node-js-api-with-passport-jwt-5fa5#:~:text=A%20Step-by-Step%20Guide%20to%20Setting%20Up%20a%20Node.js,user%20to%20login%20before%20using%20the%20API.%20
const { JWT_SECRET } = require('../utils/consts');
const { Strategy, ExtractJwt } = require('passport-jwt');

const params = {
    secretOrKey: JWT_SECRET,
    jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
};

module.exports = function (passport) {
    passport.use(
        new Strategy(params, (payload, done) => {
            if (payload.expire <= Date.now()) {
                done(new Error('TokenExpired'), null);
            } else {
                done(null, { id: payload.idUser, role: payload.role, email: payload.email });
            }
        })
    );
};
