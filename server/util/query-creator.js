exports.pageQuery= (params)=>{
    return `select item.id, item.name, item.price, item.rating, string_agg(ItemToCharacteristic.value,', '),
    item.logourl, item.itemlink, item.itemcount
    from item
    join ItemToCharacteristic on (ItemToCharacteristic.itemid = item.id)
    join Characteristic on (Characteristic.id = ItemToCharacteristic.characteristicid)
    where item.categoryid ${params.categoryParam} ${params.priceParam} group by item.name, item.price, item.id,
    item.rating,item.logourl, item.itemlink order by ${params.sortParam[0]} ${params.sortParam[1]}
    limit 18 offset 18*(${params.pageParam - 1});`
}

exports.categoryQuery = ()=>{
    return `select * from category`
}