
const pool = require('./db')
const util = require('../util/sort-query')
const queryCreator = require('../util/query-creator')

const Catalog = function(plates){
}

Catalog.pages = (query)=>{
    return new Promise((resolve, reject) =>{
        pool.query(`${queryCreator.pageQuery(util(query))}`, 
        async function(err,res){
            if(err){
                reject(err)
            }
            else
                resolve(JSON.parse(JSON.stringify(res.rows)))              
        })
    });
}

Catalog.category = (query) =>{
    return new Promise((resolve, reject) =>{
        pool.query(`${queryCreator.categoryQuery()}`, 
        async function(err,res){
            if (err) 
                reject(err)
            else
                resolve(JSON.parse(JSON.stringify(res.rows)))                
        })
    });
}


//expand herey

module.exports = Catalog