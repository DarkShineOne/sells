const express = require('express');
const mysql = require('mysql2')

const router = express.Router()
// get posts


const connection = mysql.createConnection({
    host: "192.168.0.106",
    user: "dspc",
    database: "mydb",
    password: "19p6vv",
    port: 3306
});
connection.connect(function(err){console.log(err?.message)});


const user_choice_category  = ["\'Смартфоны\'", "\'Видеокарты\'"]
const user_choice_manufacturer = ["\'\'"];
const query_category = "("+ user_choice_category.join(", ") + ")"
const query_manufacturer = "(" + user_choice_manufacturer.join(", ") + ")"

function getQueryAsync(msc){
    return new Promise((resolve, reject) =>{
        msc.query(`select idgoods, name, manufacturer from goods where tags = "Смартфоны";`,
        async function(err, res, fields){
            if (err) reject (err);
            resolve(JSON.parse(JSON.stringify(res)))
        });
    });
}

router.get('/', async (req, res) =>{
    const posts = await getQueryAsync(connection, user_choice_category)
    console.log(posts)
    res.send(posts)
})

// router.post('/', async (req, res) =>{
//     const posts = await getQueryAsync(connection, user_choice_category)
//     console.log(posts)
//     res.send(posts)
// })

module.exports = router;