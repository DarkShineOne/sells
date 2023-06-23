const { json } = require("body-parser");
const { query } = require("express");
const { queuePostFlushCb } = require("vue");

module.exports = (query) => {
    let jsonObject = {
     pageParam: typeof query.page !== "undefined" ? query.page : 1,
     categoryParam: typeof query.category !== "undefined" ? howCategory(query.category) : "is not null",
     sortParam: howSort(query.sort),
     //manufacturerParam: query.manufacturer,
     priceParam: query.price,
     //actionParam: query.action
    }

    return jsonObject
}

function howSort(type){
    var res = []
    //rewrite to switch case
    res = type == 1 ? ["price", "desc"]: type == 2 ? ["price", "asc"]: type == 3 ? ["rating", "desc"]: ["id", "asc"]

    return res
}

function howCategory(categories){
    const categoryPart = `= any (ARRAY[${(categories)}])`
    return categoryPart
}