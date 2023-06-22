const Catalog = require("../models/catalog.model")

// exports.load = async (req, res) =>{
//     const post = await Catalog.load().catch((err) =>{
//         console.log(err)
//     })
//     res.send(post)
// }

exports.pages = async(req, res) =>{
    const post = await Catalog.pages(req.query).catch((err) =>{
        console.log(err)
    })
    res.send(post)
}
