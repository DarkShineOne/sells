create table Sale(
	Id SERIAL primary key,
	Name VARCHAR(255),
	Description VARCHAR(255),
	StartTime TIMESTAMP,
	EndTime TIMESTAMP,
	logourl VARCHAR(255),
	SaleLink VARCHAR(255)
);

create table ExpiredSale(
	ID SERIAL primary key,
	Name VARCHAR(255),
	Description VARCHAR(255),
	StartTime TIMESTAMP,
	EndTime TIMESTAMP,
	logourl VARCHAR(255),
	SaleLink varchar(255)
);

create table Category(
	Id SERIAL primary key,
	Name VARCHAR(255)
);

create table DiscountType(
	Id SERIAL Primary key,
	Name VARCHAR(255)
);

create table Item(
	Id SERIAL primary key,
	Name VARCHAR(255),
	Price FLOAT,
	Rating NUMERIC(2, 1),
	ItemCount INT,
	logourl VARCHAR(255),
	ItemLink VARCHAR(255),
	CategoryId int NOT NULL,
	Priority int,
	DiscType int,
	Discount int,
	PriceWithDiscount int,
	CONSTRAINT fk_Category
		FOREIGN KEY(CategoryId)
			REFERENCES Category(Id),
	CONSTRAINT fk_DiscountType
		FOREIGN KEY(DiscType)
			REFERENCES DiscountType(id)
);


create table Characteristic(
	Id Serial primary key,
	Name VARCHAR(255),
	CategoryId int,
	CONSTRAINT fk_Category
		FOREIGN KEY (CategoryId)
			REFERENCES Category(Id)
);

create table ItemToCharacteristic(
	ItemId int,
	CharacteristicId int,
	Value VARCHAR(255),
	CONSTRAINT fk_Item
		FOREIGN KEY(ItemId)
			REFERENCES Item(ID),
	CONSTRAINT fk_Characteristic
		FOREIGN KEY(CharacteristicID)
			REFERENCES Characteristic(Id)
);

create table customer_account(
	UserID int,
	Username varchar(255),
	Firstname varchar(255),
	Secondname varchar(255),
	Email varchar(255),
	Phone varchar(255),
	Customer_Password varchar(255)
);

-- Высчет цены товара со скидкой
/**CREATE OR REPLACE FUNCTION ItemPriceWithDiscount_func()
  RETURNS trigger
  AS
$$
declare
BEGIN
IF (new.DiscType = 1)
	THEN
		BEGIN
			New.PriceWithDiscount = (select item.price from item where item.id = new.id)/100*(100-new.Discount);
		END;
	ELSE
		BEGIN
			New.PriceWithDiscount = (select item.price from item where item.id = new.id)-new.Discount;
		END;
	END IF;
return NEW;
END;
$$
LANGUAGE 'plpgsql';

create trigger ItemPriceWithDiscount
	BEFORE INSERT ON Item
	FOR EACH ROW EXECUTE FUNCTION ItemPriceWithDiscount_func();**/


insert into category(Name) values (UNNEST(ARRAY[
'Электрочайники',
'Блендеры погружные',
'Вытяжки',
'Холодильники',
'Стиральные машины',
'Плиты электрические',
'Блендеры стационарные',
'Плиты комбинированные',
'Кофеварки капельные',
'Миксеры',
'Напольные пылесосы',
'Весы кухонные',
'Фильтры для вытяжек',
'Конвекторы',
'Датчики для умного дома',
'Электрические инфракрасные обогреватели',
'Умные выключатели и кнопки',
'Климатические комплексы',
'Умные розетки',
'Варочные панели электрические'
]));

insert into Characteristic(Name, CategoryId) values (UNNEST(ARRAY[
	'Объем', 'Мощность', 'Тип нагревательного элемента', 'Фильтр в носике', 'Материал корпуса',
'Максимальная мощность', 'Количество скоростей', 'Турборежим', 'Комплектация',
'Материал корпуса', 'Максимальная производительность', 'Мощность мотора', 'Режимы работы', 'Ширина',
'Общий полезный объем', 'Материал внешнего покрытия', 'Размораживание холодильной камеры ', 'Дисплей', 'Габариты',
'Загрузка белья для стирки и отжима', 'Загрузка для сушки ', 'Тип загрузки', 'Максимальная скорость отжима', 'Количество программ стирки', 'Функциональные особенности', 'Уровень шума при стирке', 'Габариты',
'Материал покрытия панели', 'Общее количество конфорок', 'Объем духовки', 'Гриль', 'Габариты',
'Максимальная мощность', 'Количество скоростей', 'Объем рабочей емкости', 'Турборежим', 'Измельчитель', 'Мерный стакан',
'Число газовых конфорок', 'Объем духовки', 'Материал покрытия поверхности', 'Электроподжиг варочной поверхности', 'Газконтроль',
'Используемый кофе', 'Мощность', 'Объем',
'Максимальная мощность', 'Вид', 'Число скоростей', 'Материал корпуса', 'Количество насадок', 'Турборежим',
'Максимальная мощность', 'Тип уборки', 'Тип пылесборника', 'Емкость пылесборника',
'Вид', 'Конструкция', 'Максимальный предел взвешивания', 'Точность (шаг деления)', 'Тарокомпенсация',
'Материал изготовления', 'Тип фильтра', 'Количество изделий в комплекте',
'Максимальная мощность', 'Рекомендуемая площадь обогрева', 'Цифровой дисплей', 'Регулировка ступеней мощности',
'Протокол передачи данных', 'Функции', 'Экосистема', 'Напряжение питания',
'Вид нагревательного элемента', 'Мощность', 'Рекомендуемая площадь обогрева', 'Способ установки/крепления', 'Цвет корпуса',
'Напряжение питания', 'Протокол передачи данных', 'Частота радиосигнала',
'Потребляемая мощность', 'Обслуживаемая площадь', 'дисплей', 'гигростат', 'ионизация', 'угольный фильтр',
'Максимальный ток нагрузки', 'Напряжение', 'Максимальная мощность подключения', 'Протокол передачи данных', 'Голосовой помощник',
'Установка', 'Всего конфорок', 'Основной материал изготовления панели', 'Мощность подключения']), 
unnest(array[
		1,	1,	1,	1,	1,			
		2,	2,	2,	2,				
		3,	3,	3,	3,	3,			
		4,	4,	4,	4,	4,			
		5,	5,	5,	5,	5,	5,	5,	5,
		6,	6,	6,	6,	6,			
		7,	7,	7,	7,	7,	7,		
		8,	8,	8,	8,	8,			
		9,	9,	9,					
		10,	10,	10,	10,	10,	10,		
		11,	11,	11,	11,				
		12,	12,	12,	12,	12,			
		13,	13,	13,					
		14,	14,	14,	14,				
		15,	15,	15,	15,				
		16,	16,	16,	16,	16,			
		17,	17,	17,					
		18,	18,	18,	18,	18,	18,		
		19,	19,	19,	19,	19,			
		20,	20,	20,	20				
	]));
	
insert into discounttype (Name) values (UNNEST(ARRAY[
	'Рубли',
	'Проценты']));

select * from item;

-- Полезная фича объединения всех столбцов в одну строку
-- select item.id, string_agg(ItemToCharacteristic.value,', ') from item join ItemToCharacteristic on (ItemToCharacteristic.itemid = item.id) group by item.id;

-- Классный селект
-- select item.name, itemtocharacteristic.value, category.name from item join ItemToCharacteristic on (item.id = itemtoCharacteristic.itemid) 
-- join Characteristic on (Characteristic.id = ItemToCharacteristic.characteristicid) 
-- join category on (category.id = Characteristic.categoryid) where characteristic.name like '%объем%';
