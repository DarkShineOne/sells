const Pool = require('pg').Pool
const dbConfig = require("../config/db.config")

const pool = new Pool({
    host: "196.168.0.106",
    user: "darkshine",
    database: "testdb",
    password:  "19p6vv",
    port: 5432
})

module.exports = pool