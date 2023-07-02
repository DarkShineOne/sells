const Pool = require('pg').Pool
const dbConfig = require("../config/db.config")

const pool = new Pool({
    host: dbConfig.HOST,
    user: dbConfig.USER,
    database: dbConfig.DB,
    password:  dbConfig.PASSWORD,
    port: dbConfig.PORT
})

module.exports = pool