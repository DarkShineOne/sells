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

