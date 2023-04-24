require('dotenv').config()

module.exports = {
    mysql: {
        host: process.env.MYSQL_HOST,
        password: process.env.MYSQL_PASSWORD,
        user: process.env.MYSQL_USER,
        database: process.env.MYSQL_DB,
    }
}