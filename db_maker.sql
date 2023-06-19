create table Sale(
	Id SERIAL primary key,
	Name VARCHAR(255),
	Description VARCHAR(255),
	StartTime TIMESTAMP,
	EndTime TIMESTAMP,
	logourl VARCHAR(255),
	SaleLink VARCHAR(255)
);

create table Country(
	ID Serial primary key,
	Name VARCHAR(255)
);

create table Manufacturer(
	ID Serial primary key,
	NAME Varchar(255)
);

create table IType(
	ID Serial primary key,
	Name VARCHAR(255)
);

create table Color(
	ID Serial primary key,
	Name VARCHAR(255)
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

create table Item(
	Id SERIAL primary key,
	Name VARCHAR(255),
	Price FLOAT,
	ItemCount INT,
	logourl VARCHAR(255),
	ItemLink VARCHAR(255),
	CategoryId int NOT NULL,
	CONSTRAINT fk_Category
		FOREIGN KEY(CategoryId)
			REFERENCES Category(Id)
);

create table DiscountType(
	Id SERIAL Primary key,
	Name VARCHAR(255)
);

create table Characteristic(
	Id Serial primary key,
	Name VARCHAR(255)
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

create table ItemInSale(
	ItemId int,
	SaleId int,
	Priority int,
	Discount int,
	DiscType int,
	Price FLOAT,
	CONSTRAINT fk_Sale
		FOREIGN KEY(SaleId)
			REFERENCES Sale(Id),
	CONSTRAINT fk_Item
		FOREIGN KEY(ItemId)
			REFERENCES Item(Id),
	CONSTRAINT fk_DiscountType
		FOREIGN KEY(DiscType)
			REFERENCES DiscountType(id)
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

INSERT INTO Category(Name) 
values 
('Бытовая техника'),
('Красота и здоровье'),
('Смартфоны и фототехника'),
('ТВ, консоли и аудио'), 
('ПК, ноутбуки, переферия'),
('Комплектующие для ПК'),
('Офис и мебель'),
('Сетевое оборудование'),
('Отдых и развлечения'),
('Инструмент и стройка'),
('Садовая техника'),
('Дом, декор и посуда'),
('Автотовары'),
('Аксессуары и услуги');
INSERT INTO ITEM(Name, Features, Price, ItemCount, logourl, CategoryId) 
VALUES ('Корпус DEEPCOOL CL500 [R-CL500-BKNMA1N-G-1] черный','Mid-Tower, Micro-ATX, Mini-ITX, Standard-ATX, USB 3.2 Gen1 Type-A, USB 3.2 Gen2 Type-C', 10000, 5, 'https://logourl.com', 1);
INSERT INTO DiscountType(Name) 
VALUES ('Процент'), ('Сумма');
INSERT INTO SALE(Name, Description, starttime, endtime, logourl) 
VALUES ('Распродажа','Дискриптион', '2023-06-14 12:00:00','2023-07-14 12:00:00', 'url');
INSERT INTO SALE(Name, Description, starttime, endtime, logourl) 
VALUES ('Распродажа','Дискриптион', '2023-06-14 12:00:00','2023-06-15 12:00:00', 'url');
INSERT INTO ItemInSale(ItemId, SaleId, Priority, Discount, DiscType) 
VALUES (1,1,5,20,1);
-- Добавление характеристик
INSERT INTO Characteristic(Name) values ('Тип товара'),('Производитель'),('Страна'),('Цвет');
-- Добавление характеристик товару Корпус DEEPCOOL CL500 [R-CL500-BKNMA1N-G-1] черный
INSERT INTO ItemToCharacteristic(ItemId, CharacteristicId, value) values (1,1,'Корпус'),(1,2,'DEEPCOOL'),(1,3,'Китай'),(1,4,'Черный');
