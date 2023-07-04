const Catalog = require("../models/catalog.model")
const NodeCache = require("node-cache")
const myCache = new NodeCache({stdTTL: 600})

//don't like this all
exports.pages = async(req, res) =>{
    if (JSON.stringify(req.query) === '{"page":"1"}'){ //this is suck
        let post = myCache.get('mainPage')
        if (typeof post == "undefined"){
            //console.log("no cache")
            post = await Catalog.pages(req.query).catch((err) =>{
                console.log(err)
            })
            myCache.set("mainPage", post)
        }
        res.send(post)
    }
    else{
        //console.log("else")
        post = await Catalog.pages(req.query).catch((err) =>{
            console.log(err)
        })
        res.send(post)
    }
}

exports.category = async(req, res) =>{
    post = await Catalog.category(req.query).catch((err) =>{
        console.log(err)
    })
    res.send(post)
}

exports.subcategory = async(req, res) =>{
    post = await Catalog.subcategory(req.query).catch((err) =>{
        console.log(err)
    })
    res.send(post)
}