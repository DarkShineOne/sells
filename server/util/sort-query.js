module.exports = (query) => {
    let jsonObject = {
     pageParam: typeof query.page !== "undefined" ? query.page : 1,
     categoryParam: typeof query.category !== "undefined" ? howCategory(query.category) : "is not null",
     sortParam: howSort(query.sort),
     //manufacturerParam: query.manufacturer,
     priceParam: typeof query.price !== "undefined" ? howPrice((query.price).split(",")) : "",
     //actionParam: query.action
    }

    return jsonObject
}

function howSort(type){
    //mb rewrite to dict?
    switch(type){
        case "1":
            return ["price", "desc"]
        case "2": 
            return ["price", "asc"]
        case "3": 
            return ["rating", "desc"]
        default:
            return ["id", "asc"]
    }
}

function howCategory(categories){
    const categoryPart = `= any (ARRAY[${(categories)}])`
    return categoryPart
}

function howPrice(prices){
     if(prices[0] > prices[1]){
        return howPrice([prices[1],prices[0]])
     }
    return `and item.price between ${prices[0]} and ${prices[1]}`
}