const Pool = require('pg').Pool
const dbConfig = require("../config/db.config")

const pool = new Pool({
    host: "localhost",
    user: "darkshine",
    database: "testdb",
    password:  "19p6vv",
    port: 5432
})

module.exports = pool