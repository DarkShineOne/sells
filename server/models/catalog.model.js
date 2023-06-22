
const pool = require('./db')

//upgrade for all params
const Catalog = function(plates){
    this.id = plates.id
    this.name = plates.name
    this.price = plates.price
}

// Catalog.load = ()=>{

//     return new Promise((resolve, reject) =>{
//         pool.query(`select * from Item limit 18;`, 
//         async function(err,res){
//             if (err) reject(err);
//             //console.log(res)
//             resolve(JSON.parse(JSON.stringify(res.rows)))                
//         })
//     });
// }

Catalog.pages = (query)=>{
    return new Promise((resolve, reject) =>{
        console.log(query.pages)
        if (query.pages == undefined)
        var q = `select * from Item limit 18;`
        else
        var q = `select * from Item limit 18 offset ${(query.pages-1)*18};`

        pool.query(`${q}`, 
        async function(err,res){
            if (err) reject(err);
            //console.log(res)
            resolve(JSON.parse(JSON.stringify(res.rows)))                
        })
    });
}
//expand herey

module.exports = Catalog