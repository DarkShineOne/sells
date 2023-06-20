const express = require('express');
const mysql = require('mysql2')
const Pool = require('pg').Pool

const router = express.Router()
// get posts


const connection = mysql.createConnection({
    host: "localhost",
    user: "root",
    database: "mydb",
    password: "19p6vv",
    port: 3306
});

const pool = new Pool({
    host: 'localhost',
    user: 'darkshine',
    database: 'testdb',
    password: '19p6vv',
    port: 5432
})


function getQueryAsync(){
    return new Promise((resolve, reject) =>{
        pool.query(`select * from Item`, 
        async function(err,res){
            if (err) reject(err);
            resolve(JSON.parse(JSON.stringify(res.rows)))                
        })
    });
}

router.get('/', async (req, res) =>{
    const posts = await getQueryAsync()
    console.log(posts)
    res.send(posts)
})

// router.post('/', async (req, res) =>{
//     const posts = await getQueryAsync(connection, user_choice_category)
//     console.log(posts)
//     res.send(posts)
// })

module.exports = router;