const Catalog = require("../models/catalog.model")

exports.load = async (req, res) =>{
    const post = await Catalog.load().catch((err) =>{
        console.log(err)
    })
    res.send(post)
}
