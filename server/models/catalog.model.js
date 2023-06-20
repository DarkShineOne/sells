
const pool = require('./db')

//upgrade for all params
const Catalog = function(plates){
    this.id = plates.id
    this.name = plates.name
    this.price = plates.price
}

Catalog.load = ()=>{

    return new Promise((resolve, reject) =>{
        pool.query(`select * from Item`, 
        async function(err,res){
            if (err) reject(err);
            console.log(res)
            resolve(JSON.parse(JSON.stringify(res.rows)))                
        })
    });
}

//expand here

module.exports = Catalog