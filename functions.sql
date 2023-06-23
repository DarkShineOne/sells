CREATE FUNCTION SortMaxPriority() RETURNS setof ItemInSale AS $$
	select * from ItemInSale order by priority;
$$ LANGUAGE SQL;


CREATE OR REPLACE FUNCTION SortCategory(Cat varchar) RETURNS TABLE (
	ItemId int,
	SaleId int,
	Priority int,
	Discount int,
	DiscType int,
	Price int) 
	AS $$
	select ItemId, SaleId, Priority, Discount, DiscType, ItemInSale.Price
	from ItemInSale 
	join Item on (Item.id = ItemInSale.ItemId)
	join Category on (Category.id = Item.CategoryId)
	where category.name =Cat;
	$$ LANGUAGE SQL;


CREATE OR REPLACE FUNCTION SortDate() RETURNS TABLE(
	ItemId int,
	SaleId int,
	Priority int,
	Discount int,
	DiscType int,
	Price int) 
	AS $$
	select ItemId, SaleId, Priority, Discount, DiscType, ItemInSale.Price 
	from ItemInSale
	join Sale on (Sale.id = ItemInSale.SaleId)
	where DATE_PART('day', EndTime - current_date) < 5;
	$$ LANGUAGE SQL;


CREATE OR REPLACE FUNCTION SortDiff() RETURNS TABLE(
	ItemId int,
	SaleId int,
	Priority int,
	Discount int,
	DiscType int,
	Price int,
	SaleValue int) 
	AS $$
	select ItemId, SaleId, Priority, Discount, DiscType, ItemInSale.Price, (Item.price - ItemInSale.price) as SaleValue
	from ItemInSale
	join Item on (Item.Id = ItemInSale.ItemId)
	group by ItemInSale.ItemId, ItemInSale.SaleId, Priority, Discount, DiscType, ItemInSale.Price, Item.price
	order by Max(Item.price - ItemInSale.price) desc;
$$ LANGUAGE SQL;


CREATE OR REPLACE FUNCTION SortCharacteristic(Nam VARCHAR) RETURNS TABLE(
	ItemId int,
	SaleId int,
	Priority int,
	Discount int,
	DiscType int,
	Price int)
	AS $$
	select ItemInSale.ItemId, SaleId, Priority, Discount, DiscType, ItemInSale.Price 
	from ItemInSale
	join Item on (Item.Id = ItemInSale.ItemId)
	join ItemToCharacteristic on (ItemToCharacteristic.ItemId = Item.Id)
	join Characteristic on (ItemToCharacteristic.CharacteristicId = Characteristic.id)
	where ItemToCharacteristic.Value = Nam;
	$$ LANGUAGE SQL;

CREATE FUNCTION AllItems() RETURNS table(
id int,
Name varchar(255) ,
Price float,
ItemCount int,
logourl varchar(255),
itemlink varchar(255),
CategoryId int,
Priority int,
DiscPrice float,
Characteristic text) 
AS $$
select item.*, iteminsale.priority, iteminsale.price, string_agg(ItemToCharacteristic.value,', ')
from item join ItemToCharacteristic on (ItemToCharacteristic.itemid = item.id) 
join iteminsale on (iteminsale.itemid = item.id) group by item.id, iteminsale.priority, iteminsale.price order by iteminsale.priority desc, string_agg(ItemToCharacteristic.value,', ');;
$$ LANGUAGE sql;

-- Получить все предметы
drop function getCatalogPage;
create function getCatalogPage(page int) returns table (
	Name varchar(255),
	Price float,
	Rating text,
	Characteristic text,
	logourl varchar(255),
	itemlink varchar(255))
AS $$
	select item.name, item.price, item.rating, string_agg(ItemToCharacteristic.value,', '), item.logourl, item.itemlink from item 
	join ItemToCharacteristic on (ItemToCharacteristic.itemid = item.id) group by item.id limit 18 offset 18*(page-1);
$$ LANGUAGE SQL;
-- select * from getCatalogPage(1);

-- Получить все категории
create function getCategories() returns setof Category AS $$
	select * from category;
$$ LANGUAGE SQL;
-- select * from getCategories();

-- Получить все товары по категории
drop function getItemsFromCategory;
create function getItemsFromCategory(category int[], page int) returns table(
	Name varchar(255),
	Price float,
	Rating text,
	Characteristic text,
	logourl varchar(255),
	itemlink varchar(255),
	category int)
AS $$
	select item.name, item.price, item.rating, string_agg(ItemToCharacteristic.value,', '), item.logourl, item.itemlink,item.categoryid from item 
	join ItemToCharacteristic on (ItemToCharacteristic.itemid = item.id) where item.categoryid = any(ARRAY[category]) group by item.id limit 18 offset 18*(page-1);
$$ LANGUAGE SQL;
-- select * from getItemsFromCategory(ARRAY[1,2,3],2);

-- Получить все предметы с определенными характеристиками
create function getItemsWithParameters(category int, parameters varchar(255)[], page int) returns table(
	Name varchar(255),
	Price float,
	Rating text,
	Characteristic text,
	logourl varchar(255),
	itemlink varchar(255))
AS $$
	select item.name, item.price, item.rating, string_agg(ItemToCharacteristic.value,', '), item.logourl, item.itemlink from item
	join ItemToCharacteristic on (ItemToCharacteristic.itemid = item.id)
	join Characteristic on (Characteristic.id = ItemToCharacteristic.characteristicid)
	where item.categoryid = category group by item.id having string_agg(ItemToCharacteristic.value,', ') like all (ARRAY[parameters]) limit 18 offset 18*(page-1);
$$ LANGUAGE SQL;
-- select * from getItemsWithParameters(1, ARRAY['%2200 Вт%', '%пластик%', '%металл%'], 1);



-- select item.name, item.price, item.rating, string_agg(ItemToCharacteristic.value,', '), item.logourl, item.itemlink from item
--	join ItemToCharacteristic on (ItemToCharacteristic.itemid = item.id)
--	join Characteristic on (Characteristic.id = ItemToCharacteristic.characteristicid)
--	where item.categoryid = category group by item.name, item.price, item.rating,item.logourl, item.itemlink order by sortvalue limit 18 offset 18*(page-1);
