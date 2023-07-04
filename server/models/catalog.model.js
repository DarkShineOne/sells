
const pool = require('./db')
const util = require('../util/sort-query')
const queryCreator = require('./query-creator')

const Catalog = function(plates){
}

Catalog.pages = (query)=>{
    return new Promise((resolve, reject) =>{
        pool.query(`${queryCreator.pageQuery(util.itemObject(query))}`, 
        async function(err,res){
            if(err){
                reject(err)
            }
            else{
                //possible error
                countPages = await pool.query(`${queryCreator.pageCountQuery(util.itemObject(query))}`)
                resolve(
                    JSON.parse(JSON.stringify(countPages.rows)).concat(JSON.parse(JSON.stringify(res.rows)))
                )
            }            
        })
    });
}

Catalog.category = (query) =>{
    return new Promise((resolve, reject) =>{
        pool.query(`${queryCreator.categoryQuery(util.categoryObject(query))}`, 
        async function(err,res){
            if (err) 
                reject(err)
            else
                resolve(JSON.parse(JSON.stringify(res.rows)))                
        })
    });
}

Catalog.subcategory = (query) =>{
    return new Promise((resolve, reject) =>{
        pool.query(`${queryCreator.subcategoryQuery(util.subcategoryObject(query))}`, 
        async function(err,res){
            if (err) 
                reject(err)
            else{
                resolve(JSON.parse(JSON.stringify(res.rows)))    
            }            
        })
    });
}
//expand here

module.exports = Catalog