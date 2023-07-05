exports.pageQuery= (params)=>{
    return `select * from (select item.id, item.name, item.price, item.rating, item.discount, item.disctype, item.pricewithdiscount, 
    array_agg(replace(ItemToCharacteristic.value, '\\\\', '\\')) as ar,
    item.logourl, item.itemlink, item.itemcount
    from item
    join ItemToCharacteristic on (ItemToCharacteristic.itemid = item.id)
    join Characteristic on (Characteristic.id = ItemToCharacteristic.characteristicid)
    where item.categoryid ${params.categoryParam} ${params.priceParam} ${params.ratingParam} group by item.name, item.price, item.id,
    item.rating,item.logourl, item.itemlink order by ${params.sortParam[0]} ${params.sortParam[1]}) as s ${params.subcategoryParam}
    limit 18 offset 18*(${params.pageParam - 1});`
}

exports.pageCountQuery= (params)=>{
    return `select count(*) from (select item.id, item.name, item.price, item.rating, item.discount, item.disctype, item.pricewithdiscount, 
        array_agg(replace(ItemToCharacteristic.value, '\\\\', '\\')) as ar,
        item.logourl, item.itemlink, item.itemcount
        from item
        join ItemToCharacteristic on (ItemToCharacteristic.itemid = item.id)
        join Characteristic on (Characteristic.id = ItemToCharacteristic.characteristicid)
        where item.categoryid ${params.categoryParam} ${params.priceParam} ${params.ratingParam} group by item.name, item.price, item.id,
        item.rating,item.logourl, item.itemlink order by ${params.sortParam[0]} ${params.sortParam[1]})
        as s ${params.subcategoryParam};`
}

exports.categoryQuery= (params)=>{
    return `select c.id, c.name, count(c.id) from category c
    join item i on (i.categoryid = c.id)
    where LOWER(c.name) like LOWER('%${params.findParam}%')
    group by c.id order by c.id`
}

exports.subcategoryQuery = (params)=>{
    return `select id, name, regexp_split_to_array(replace(replace(string_agg(distinct value, ', '), '\\\\', '\\'), 'NULL', 'нет'), ', ') as val from
    characteristic join itemtocharacteristic on (characteristic.id = itemtocharacteristic.characteristicid)
    where categoryid = ${params.subcategoryParam} group by id, name`
}
