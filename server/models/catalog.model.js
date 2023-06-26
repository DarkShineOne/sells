
const pool = require('./db')
const util = require('../util/sort-query')
//upgrade for all params
const Catalog = function(plates){
    this.id = plates.id
    this.name = plates.name
    this.price = plates.price
}

Catalog.pages = (query)=>{
    return new Promise((resolve, reject) =>{

        const params = util(query)
        console.log(params)
        q = `select * from Item order by ${params.sortParam[0]} ${params.sortParam[1]} limit 18 offset (${params.pageParam - 1}* 18)`

        qq = `select item.id, item.name, item.price, item.rating, string_agg(ItemToCharacteristic.value,', '), item.logourl, item.itemlink, item.itemcount from item
        join ItemToCharacteristic on (ItemToCharacteristic.itemid = item.id)
        join Characteristic on (Characteristic.id = ItemToCharacteristic.characteristicid)
        where item.categoryid ${params.categoryParam} group by item.name, item.price, item.id,
        item.rating,item.logourl, item.itemlink order by ${params.sortParam[0]} ${params.sortParam[1]} limit 18 offset 18*(${params.pageParam - 1});`
        pool.query(`${qq}`, 
        async function(err,res){
            if (err) reject(err);
            //console.log(res)
            resolve(JSON.parse(JSON.stringify(res.rows)))                
        })
    });
}

Catalog.category = (query) =>{
    return new Promise((resolve, reject) =>{
        var q = `select * from category;`
        pool.query(`${q}`, 
        async function(err,res){
            if (err) reject(err);
            resolve(JSON.parse(JSON.stringify(res.rows)))                
        })
    });
}


//expand herey

module.exports = Catalog