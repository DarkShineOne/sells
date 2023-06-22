module.exports = app => {
    const catalog = require("../../controllers/catalog.controller")
    const router = require("express").Router();

   // router.get("/", catalog.pag)
    router.get("/", catalog.pages)
    app.use('/api/posts', router)
}