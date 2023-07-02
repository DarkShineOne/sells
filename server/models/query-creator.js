exports.pageQuery= (params)=>{
    return `select item.id, item.name, item.price, item.rating, item.discount, item.disctype, item.pricewithdiscount, string_agg(ItemToCharacteristic.value,', '),
    item.logourl, item.itemlink, item.itemcount
    from item
    join ItemToCharacteristic on (ItemToCharacteristic.itemid = item.id)
    join Characteristic on (Characteristic.id = ItemToCharacteristic.characteristicid)
    where item.categoryid ${params.categoryParam} ${params.priceParam} ${params.ratingParam} group by item.name, item.price, item.id,
    item.rating,item.logourl, item.itemlink order by ${params.sortParam[0]} ${params.sortParam[1]}
    limit 18 offset 18*(${params.pageParam - 1});`
}

exports.pageCountQuery= (params)=>{
    return `select count(*) from (select item.id, item.name, item.price, item.rating, item.discount, item.disctype, item.pricewithdiscount, string_agg(ItemToCharacteristic.value,', '),
    item.logourl, item.itemlink, item.itemcount
    from item
    join ItemToCharacteristic on (ItemToCharacteristic.itemid = item.id)
    join Characteristic on (Characteristic.id = ItemToCharacteristic.characteristicid)
    where item.categoryid ${params.categoryParam} ${params.priceParam} 
    group by item.name, item.price, item.id,
    item.rating,item.logourl, item.itemlink order by ${params.sortParam[0]} ${params.sortParam[1]}) as s;`
}

exports.categoryQuery= (params)=>{
    return `select c.id, c.name, count(c.id) from category c
    join item i on (i.categoryid = c.id)
    where LOWER(c.name) like LOWER('%${params.findParam}%')
    group by c.id order by c.id`
}