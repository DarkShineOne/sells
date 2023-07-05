const { query } = require("express")

exports.itemObject = (query) => {
    let jsonObject = {
     pageParam: typeof query.page !== "undefined" ? query.page : 1,
     categoryParam: typeof query.category !== "undefined" ? category_handling(query.category) : "is not null",
     sortParam: sort_handling(query.sort),
     //manufacturerParam: query.manufacturer,
     priceParam: typeof query.price !== "undefined" ? price_handling((query.price).split(",")) : "",
     //actionParam: query.action
     ratingParam: typeof query.rating !== "undefined" ? "and item.rating >= 4.0" : "",
     subcategoryParam: typeof query.scat !== "undefined" ? subcategory_handling(query.scat) : "" 
    }

    return jsonObject
}

exports.categoryObject = (query) =>{
    let jsonObject = {
        findParam: typeof query.find !== "undefined" ? query.find : "", // руина без функции
    }
    return jsonObject
}

exports.subcategoryObject = (query) =>{
    let jsonObject = {
        subcategoryParam: typeof query.scat !== "undefined" ? query.scat : ""
    }
    return jsonObject
}

function sort_handling(type){
    //mb rewrite to dict?
    switch(type){
        case "1":
            return ["pricewithdiscount", "desc"]
        case "2": 
            return ["pricewithdiscount", "asc"]
        case "3": 
            return ["rating", "desc"]
        case "4":
            return ["(pricewithdiscount/price)", "asc"]
        default:
            return ["id", "asc"]
    }
}

function category_handling(categories){
    const categoryPart = `= any (ARRAY[${(categories)}])`
    return categoryPart
}

function price_handling(prices){

    if(typeof prices[1] == 'undefined')
        return price_handling([0,prices[0]])

     if(prices[0] > prices[1])
        return price_handling([prices[1],prices[0]])

    return `and item.pricewithdiscount between ${prices[0]} and ${prices[1]}`
}

function subcategory_handling(scats){
    return `where (${"ARRAY"+scats} && ar) = true`
}