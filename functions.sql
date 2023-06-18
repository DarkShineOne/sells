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
