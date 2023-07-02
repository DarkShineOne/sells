const Catalog = require("../models/catalog.model")
const NodeCache = require("node-cache")
const myCache = new NodeCache({ stdTTL: 600 })

/*
exports.pages = async(req, res) =>{
    const post = await Catalog.pages(req.query).catch((err) =>{
        console.log(err.code)
    })
    res.send(post)
}

exports.category = async(req, res) =>{
    const post = await Catalog.category(req.query).catch((err) =>{
        console.log(err.code)
    })
    res.send(post)
} 
*/

exports.pages = async (req, res) => {
    if (JSON.stringify(req.query) === '{"page":"1"}') { //this is suck
        let post = myCache.get('mainPage')
        if (typeof post == "undefined") {
            //console.log("no cache")
            post = await Catalog.pages(req.query).catch((err) => {
                console.log(err.code)
            })
            myCache.set("mainPage", post)
        }
        res.send(post)
    }
    else {
        //console.log("else")
        post = await Catalog.pages(req.query).catch((err) => {
            console.log(err.code)
        })
        res.send(post)
    }
}

exports.category = async (req, res) => {
    let post = myCache.get('categoryData')
    if (typeof post == "undefined") {
        console.log("no cache")
        post = await Catalog.category(req.query).catch((err) => {
            console.log(err.code)
        })
        myCache.set("categoryData", post)
    }
    //Дима, прости, с твоим кэшированием поиск по категориям у меня неработал и я добавил этот кусок  \/
    post = await Catalog.category(req.query).catch((err) => {
        console.log(err.code)
    })
    //                                                                                                /\
    res.send(post)
}