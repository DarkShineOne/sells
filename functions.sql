CREATE OR REPLACE FUNCTION ItemPriceWithDiscount_func()
  RETURNS trigger
  AS
$$
declare
BEGIN
IF (new.DiscType = 1)
	THEN
		BEGIN
			New.Price = (select item.price from item where item.id = new.itemid)/100*(100-new.Discount);
		END;
	ELSE
		BEGIN
			New.Price = (select item.price from item where item.id = new.itemid)-new.Discount;
		END;
	END IF;
return NEW;
END;
$$
LANGUAGE 'plpgsql';

create trigger ItemPriceWithDiscount
	BEFORE INSERT ON ItemInSale
	FOR EACH ROW EXECUTE FUNCTION ItemPriceWithDiscount_func();


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
