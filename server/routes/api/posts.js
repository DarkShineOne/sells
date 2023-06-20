module.exports = app => {
    const catalog = require("../../controllers/catalog.controller")
    const router = require("express").Router();

    router.get("/", catalog.load)
    app.use('/api/posts', router)
}