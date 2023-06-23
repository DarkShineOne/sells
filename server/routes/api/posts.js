module.exports = app => {
    const catalog = require("../../controllers/catalog.controller")
    const router = require("express").Router();

    router.get("/item/", catalog.pages)
    router.get("/category/", catalog.category)
    app.use('/api/', router)
}