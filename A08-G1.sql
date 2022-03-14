DROP TABLE IF EXISTS Maintenance;
DROP TABLE IF EXISTS SoldBoat;
DROP TABLE IF EXISTS Dealer;
DROP TABLE IF EXISTS OrderLine;
DROP TABLE IF EXISTS Parts;
DROP TABLE IF EXISTS Orderslip;
DROP TABLE IF EXISTS RentalRecord;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Boat;
DROP TABLE IF EXISTS BoatType;
DROP TABLE IF EXISTS Manufacturer;

CREATE TABLE `Boat` (
  `BoatID` int(11) NOT NULL,
  `BoatDescription` varchar(255) NOT NULL,
  `Model` varchar(255) DEFAULT NULL,
  `ManufacturerID` int(11) NOT NULL,
  `PurchaseDate` date DEFAULT NULL,
  `BoatPrice` int(11) DEFAULT NULL,
  `LastService` date DEFAULT NULL,
  PRIMARY KEY (`BoatID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `BoatType` (
  `BoatDescription` varchar(255) NOT NULL,
  `PriceHalf` int(11) DEFAULT NULL,
  `PriceFull` int(11) DEFAULT NULL,
  PRIMARY KEY (`BoatDescription`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Customer` (
  `CustomerID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Postcode` varchar(255) DEFAULT NULL,
  `Telephone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `UniqueConstraint` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `Dealer` (
  `DealerID` int(11) NOT NULL,
  `DealerName` varchar(255) DEFAULT NULL,
  `Telephone` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DealerID`),
  UNIQUE KEY `UniqueConstraint` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `Maintenance` (
  `BoatID` int(11) NOT NULL,
  `ReferenceNumber` int(11) NOT NULL,
  `FaultDetails` varchar(255) DEFAULT NULL,
  `FaultDate` date DEFAULT NULL,
  `ActionTaken` varchar(255) DEFAULT NULL,
  `ActionDate` date DEFAULT NULL,
  `Priority` int(11) NOT NULL,
  PRIMARY KEY (`ReferenceNumber`,`BoatID`),
  KEY `BoatID` (`BoatID`),
  CONSTRAINT `Maintenance_ibfk_1` FOREIGN KEY (`BoatID`) REFERENCES `Boat` (`BoatID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `Manufacturer` (
  `ManufacturerID` int(11) NOT NULL,
  `Manufacturer` varchar(255) DEFAULT NULL,
  `Telephone` int(11) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ManufacturerID`),
  UNIQUE KEY `UniqueConstraint` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `OrderLine` (
  `PartID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  PRIMARY KEY (`PartID`,`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `Orderslip` (
  `OrderID` int(11) NOT NULL,
  `ManufacturerID` int(11) DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `ManufacturerID` (`ManufacturerID`),
  CONSTRAINT `Orderslip_ibfk_1` FOREIGN KEY (`ManufacturerID`) REFERENCES `Manufacturer` (`ManufacturerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `Parts` (
  `PartID` int(11) NOT NULL,
  PRIMARY KEY (`PartID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `RentalRecord` (
  `RentNumber` int(11) NOT NULL,
  `RentDate` date DEFAULT NULL,
  `RentPeriod` varchar(255) DEFAULT NULL,
  `DatebackDue` date DEFAULT NULL,
  `DateBackActual` date DEFAULT NULL,
  `BoatDescription` varchar(255) DEFAULT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `PaidPrice` int(11) DEFAULT NULL,
  `BoatID` int(11) DEFAULT NULL,
  `ResDate` DATE DEFAULT NULL,
  `Paid(Y/N)` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`RentNumber`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `RentalRecord_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`),
  KEY  `BoatDescription` (`BoatDescription`),
  CONSTRAINT `RentalRecord_des_1` FOREIGN KEY (`BoatDescription`) REFERENCES `BoatType` (`BoatDescription`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `SoldBoat` (
  `DealerID` int(11) NOT NULL,
  `BoatID` int(11) NOT NULL,
  `SalePrice` int(11) DEFAULT NULL,
  `SaleDate` date DEFAULT NULL,
  PRIMARY KEY (`DealerID`,`BoatID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `dalalham`.`Boat`
(`BoatID`,
`BoatDescription`,
`Model`,
`ManufacturerID`,
`PurchaseDate`,
`BoatPrice`,
`LastService`)
VALUES
('1','Std_MBoat','Explorer','1','2010-11-22','3910','2020-10-22'),
('2','VLrg_SBoat','TurboSail','2','2009-10-12','3840','2019-10-08'),
('3','Lrg_SBoat','MasterSail','2','2015-10-12','3240','2020-10-12'),
('4','Sml_SBoat','SmallSailor','3','2015-11-12','2040','2020-10-14'),
('5','Sml_SBoat','SmallSailor','3','2015-11-12','2040','2020-10-13'),
('6','Lrg_MBoat','Grande','5','2015-01-14','5440','2020-10-15'),
('7','Lrg_MBoat','Grande','5','2015-01-14','5440','2020-09-13'),
('8','Std_MBoat','Turbo Mid','2','2015-01-14','5440','2020-09-13'),
('9','Lrg_RBoat','RowStream','3','2015-01-12','440','2020-08-10'),
('10','Std_RBoat','RowerX','4','2015-01-12','320','2020-09-22'),
('11','Lrg_SBoat','Explorer','1','2016-01-10','3320','2020-03-03'),
('12','Std_SBoat','Navigator','1','2016-01-10','3320','2020-04-03'),
('13','Std_MBoat','Turbo Mid','2','2018-02-14','4440','2020-09-14'),
('14','Std_MBoat','Turbo Mid','2','2018-02-14','4440','2020-09-13'),
('15','Lrg_MBoat','MasterBlaster','7','2018-01-14','5440','2019-10-14'),
('16','Lrg_RBoat','HappyRower','8','2018-01-10','340','2020-10-02'),
('17','Sml_RBoat','HappyRower','8','2018-01-10','340','2020-10-02'),
('18','VLrg_RBoat','Streamer','3','2017-01-09','640','2020-10-07'),
('19','VLrg_RBoat','Great Row','4','2019-01-19','650','2020-09-12'),
('20','VLrg_MBoat','SuperBlaster','7','2018-01-14','7440','2020-08-07'),
('21','Std_RBoat','Lizard','6','2017-01-09','440','2020-10-04'),
('22','Lrg_MBoat','Grande','5','2018-02-14','5440','2020-09-13'),
('23','Lrg_SBoat','MasterSail','2','2015-10-12','3240','2020-01-27'),
('24','VLrg_MBoat','Grande','3','2013-10-12','5440','2020-02-20'),
('25','Sml_MBoat','SmallStalion','3','2013-10-12','440','2020-01-20'),
('26','Std_SBoat','Navigator','3','2013-10-12','1230','2020-02-20'),
('27','Lrg_MBoat','Grande','3','2013-10-12','2300','2020-04-20'),
('28','VLrg_MBoat','Grande','3','2013-10-12','5440','2019-02-20');

INSERT INTO `dalalham`.`BoatType`
(`BoatDescription`,
`PriceHalf`,
`PriceFull`)
VALUES
('Lrg_MBoat','150','240'),
('Lrg_RBoat','90','140'),
('Lrg_SBoat','120','180'),
('Sml MBoat','110','170'),
('Sml_RBoat','70','110'),
('Sml_SBoat','90','140'),
('Std_MBoat','125','200'),
('Std_RBoat','80','120'),
('Std_SBoat','100','160'),
('VLrg_MBoat','175','280'),
('VLrg_RBoat','100','160'),
('VLrg_SBoat','170','240');
INSERT INTO `dalalham`.`Customer`
(`CustomerID`,
`Name`,
`Email`,
`Postcode`,
`Telephone`)
VALUES
('1','Dion Brodnecke','dbroes1d@who.int','L34 8DY','07174826351'),
('2','Scarlett Galley','scargr1c@imgur.com','L3 6DF','03260476982'),
('3','SissyGadson','sgadson1b@ucoz.com','L2 7YG','04924556740'),
('4','Tabby Minichi','minitabc@imgur.com','WT6 8UY','07795213673'),
('5','Nellie Greenmon','nelliegreen12@patch.com','L23 8FY','03816078215'),
('6','Hanny Marsters','hmarsters@netlog.com','L21 9FY','07075576685'),
('7','Oswell Aspinell','OsAspinell@digg.com','L5 6FH','09931348133'),
('8','Florance Baston','FloBar@dirtg.com','WT5 8WK','07315082134'),
('9','Candice Tumilson','canditum15@bloomberg.com','L75 8GJ','01639824657'),
('10','Clair Bavin','clairBav@sprog.it','L26 8GH','06245985897'),
('11','John Terry','Terry2D@ok.com','SE10 1NH','0201772227'),
('12','Justin Bieber','Beiber@pop.com','LABC564','0167756413'),
('13','David Hockney','hockers@gall.com','N1 1XY','0154326412'),
('14','David Blaine','blaine@magic.org','N1 1XY','0154326412'),
('15','Hamzah Dalal','Hamzah@magic.org','N2 3XY','07597423451'),
('16','Moasib Arif','Arif@magic.org','BL1 1PY','07321658943'),
('17','Mohammad Abdullah','Abdullah@gmail.com','BL2 1ZY','07894326754'),
('18','Abdi Mohammed','Abdi@Yahoo.org','M2 1FZ','07832476549'),
('19','Muhammed Zamaan','Zamaan@hotmail.com','BL1 1FG','07482956321');
INSERT INTO `dalalham`.`Dealer`
(`DealerID`,
`DealerName`,
`Telephone`,
`Address`,
`Email`)
VALUES
('1','Dalis Vannoort','07574137463','77 A828, Appin, AP7 6GU','dvannoort0@salon.com'),
('2','Joes Junk','07365534221','15 Back Lane, Buxton, BX7 5FY','JoesJunk@zdnet.com'),
('3','Hoebart Kubera','07874051869','4 Finedon House, Marine Parade, Littlestone, LS4 6GU','hkubera2@who.int'),
('4','Eva Iacomettii','07880072148','9 Hartlands, Onslow Road, Newent, NW5 8TU','eiacomettii3@admin.ch'),
('5','Alley Pate','07822040557','07610 Arizona Alley, A67 8GU','apate4@gnu.org'),
('6','Korrie Legge','07380018233','1076 Evesham Road, Astwood Bank, DT5 8JO','klegge5@reference.com'),
('7','Minne Hinkens','07978390430','53 Balby Road, Balby, B7 8HK','mhinkens6@smh.com.au'),
('8','Inigo MacAllaster','07893419552','1910 Farwell Plaza, G56 9FT','imacallaster7@blogspot.com'),
('9','Linell Skeeles','07532931207','57 Great Russell Street, London, NW1 8TU','lskeeles8@goo.gl'),
('10','Sioux Drogan','07417098738','75 Thomas Parsons Square, Ely, EL6 9GU','sdrogan9@dropbox.com'),
('11','Lenux Er','0741498632','78 Thomas Parsons Square, Ely, EL6 9GU','Lenux.E@dropbox.com'),
('12','Runaer','07829403766','12 Eddison Road, M11 9GU','Runaer@office365.com'),
('13','Furg','07483762111','2 Eccles Ave, BB1 2HJ','Furg.Op@gmail.com'),
('14','Dorian','07417043899','4 Yates Street, BR2 2EN','Dorian.M@dropbox.com'),
('15','Holden','07483726654','9 Uturn Road, BB2 3FN','Holdens@dropbox.com');
INSERT INTO `dalalham`.`Maintenance`
(`BoatID`,
`ReferenceNumber`,
`FaultDetails`,
`FaultDate`,
`ActionTaken`,
`ActionDate`,
`Priority`)
VALUES
('1','1','Chipped propeller','2015-02-15','Replace Propeller','2015-02-27','3'),
('3','1','Damaged mast','2016-04-17','Repair Mast','2016-04-27','2'),
('1','2','Bilge pumps gone','2015-07-10','New bilge pumps','2015-08-27','2'),
('3','2','Bent Forestay','2017-07-10','Replace Forestay','2017-08-22','1'),
('3','3','Shot Boom','2018-05-07','Replace Boom','2018-06-06','2'),
('3','4','Rudderstock Chipped','2019-07-07','Repair Rudderstock','2019-07-08','3'),
('1','5','Cutless bearing worn through','2016-12-02','Fit new bearing','2017-01-27','2'),
('1','6','Rudderstock Chipped','2017-12-02','Fit new bearing','2018-01-27','2'),
('13','7','Cutless bearing worn through','2016-12-02','Fit new bearing','2018-01-27','1'),
('16','8','Shot Boom','2016-12-02','Replace Boom','2017-01-27','2'),
('17','9','Bent Forestay','2014-12-02','Replace Forestay','2015-01-27','3'),
('3','10','Cutless bearing worn through','2016-12-02','Fit new bearing','2017-01-27','2');

INSERT INTO `dalalham`.`Maintenance`
(`BoatID`,
`ReferenceNumber`,
`ActionTaken`,
`ActionDate`,
`Priority`)
VALUES
('1','3','New head pumps','2015-08-15','1'),
('1','4','Normal Service','2016-03-20','3'),
('3','5','Normal Service','2020-01-27','3'),
('13','11','Normal Service','2020-09-14','1'),
('14','7','Normal Service','2020-09-13','3'),
('15','8','Normal Service','2019-10-14','2'),
('16','9','Normal Service','2020-10-02','2'),
('17','10','Normal Service','2020-10-02','1');
INSERT INTO `dalalham`.`Maintenance`
(`BoatID`,
`ReferenceNumber`,
`FaultDetails`,
`FaultDate`,
`Priority`)
VALUES
('3','6','Rudderblade busted','2020-10-19','1');
INSERT INTO `dalalham`.`Manufacturer`
(`ManufacturerID`,
`Manufacturer`,
`Telephone`,
`Address`,
`Email`)
VALUES
('1','SuperBoat','1772459666','Unit 7 Centurion Court, Leyland, LE10 2DJ','admin@superboat.co.uk'),
('2','Explorer Boats UK','1704807654','Meadow Lane, Burscough, BU56 8GH','admin@explorerboats.co.uk'),
('3','The Northwich Boat Company','1270160160','Unit 1 Kings Lock Boatyard Booth Lane, Middlewich, MW67 7GY','admin@northwichboats.co.uk'),
('4','Collingwood Boat Builders','1513742985','29 Townsend Street, Collingwood, CL27 2DU','admin@collingwoodboats.co.uk'),
('5','Elton Moss Boat Builders','1270760160','Unit 4 Kings Lock Boatyard Booth Lane, Middlewich, MW63 8TY','admin@eltonmossboats.co.uk'),
('6','Aintree Boat Company Ltd','1515239000','Brookfield Drive, Liverpool, L1 6GU','admin@aintreeboats.co.uk'),
('7','Braidbar Boats Ltd','1625873471','Lord Vernons Wharf Lyme Road Higher, Poynton, PY12 9TS','admin@braidbarboats.co.uk'),
('8','Bourne Boat Builders Ltd','1785714692','Teddesley Road, Penkridge, PE8 7SU','admin@bourneboats.co.uk'),
('9','Stoke on Trent Boat Building Co Ltd','1782813831','Longport Wharf Station Street, Stoke-on-Trent, ST6 9GU','admin@stokeboats.co.uk'),
('10','MGM Boats Narrowboat Builders','1162640009','27 Mill Lane, Leicester, LE6 9FY','admin@mgmboats.co.uk');
INSERT INTO `dalalham`.`OrderLine`
(`PartID`,
`OrderID`,
`Quantity`)
VALUES
('1','3','6'),
('2','2','4'),
('3','1','12'),
('4','4','23'),
('5','5','3');
INSERT INTO `dalalham`.`Orderslip`
(`OrderID`,
`ManufacturerID`)
VALUES
('1','1'),
('2','1'),
('3','2'),
('4','5'),
('5','8');
INSERT INTO `dalalham`.`Parts`
(`PartID`)
VALUES
('1'),
('2'),
('3'),
('4'),
('5');
INSERT INTO `dalalham`.`RentalRecord`
(`RentNumber`,
`RentDate`,
`RentPeriod`,
`DatebackDue`,
`DateBackActual`,
`BoatDescription`,
`CustomerID`,
`PaidPrice`,
`BoatID`,
`Paid(Y/N)`)
VALUES
('4734','2019-05-02','HD','2019-05-02','2019-05-02','Std_MBoat','11','125','1','Y'),
('4745','2019-05-03','HD','2019-05-03','2019-05-03','Std_MBoat','12','125','1','Y'),
('4812','2019-05-04','2D','2019-05-05','2019-05-06','Std_MBoat','13','400','1','Y'),
('4875','2019-05-06','FD','2019-05-06','2019-05-06','Std_MBoat','14','200','1','Y');
INSERT INTO `dalalham`.`RentalRecord`
(`RentNumber`,
`ResDate`,
`RentPeriod`,
`BoatDescription`,
`CustomerID`,
`Paid(Y/N)`,
`BoatID`)
VALUES
('5344','2020-10-20','FD','Lrg_RBoat','1','Y','9'),
('5345','2020-10-20','FD','Sml_RBoat','2','Y','16'),
('5346','2020-10-20','FD','Lrg_MBoat','4','Y','6'),
('5349','2020-10-20','FD','Lrg_RBoat','7','Y','9'),
('5348','2020-10-20','FD','Lrg_MBoat','6','Y','15'),
('5350','2020-10-20','FD','Lrg_SBoat','2','Y','9'),
('5352','2020-10-20','FD','Sml_RBoat','5','Y','16'),
('5353','2020-10-20','FD','Sml_RBoat','5','Y','17'),
('5354','2020-10-20','2D','Std_MBoat','9','Y','14'),
('5351','2020-10-20','FD','Lrg_SBoat','2','','11'),
('5364','2020-10-20','FD','Sml_SBoat','8','Y','4'),
('5355','2020-10-20','2D','Std_MBoat','9','Y','13'),
('5357','2020-10-20','FD','Std_MBoat','6','Y','1'),
('5358','2020-10-20','FD','Std_RBoat','7','Y','10'),
('5366','2020-10-20','HD','Std_RBoat','10','Y','21'),
('5360','2020-10-20','FD','VLrg_MBoat','4','Y','20'),
('5361','2020-10-20','FD','VLrg_SBoat','8','Y','2'),
('5342','2020-04-27','FD','Lrg_SBoat','1','Y','16'),
('5341','2019-10-20','FD','Lrg_MBoat','1','','6'),
('5343','2019-12-09','FD','Lrg_MBoat','2','Y','6');

INSERT INTO `dalalham`.`RentalRecord`
(`RentNumber`,
`ResDate`,
`RentPeriod`,
`BoatDescription`,
`CustomerID`)
VALUES
('5359','2020-10-20','FD','Std_SBoat','10'),
('5362','2020-10-20','FD','VLrg_RBoat','3'),
('5365','2020-10-20','FD','Std_RBoat','3'),
('5363','2020-10-20','FD','VLrg_RBoat','3');

INSERT INTO `dalalham`.`SoldBoat`
(`DealerID`,
`BoatID`,
`SalePrice`,
`SaleDate`)
VALUES
('2','1','1500','2020-01-02'),
('2','2','1600','2019-10-10');

SELECT * FROM dalalham.Boat;
SELECT * FROM dalalham.BoatType;
SELECT * FROM dalalham.Customer;
SELECT * FROM dalalham.Dealer;
SELECT * FROM dalalham.Maintenance;
SELECT * FROM dalalham.Manufacturer;
SELECT * FROM dalalham.OrderLine;
SELECT * FROM dalalham.Orderslip;
SELECT * FROM dalalham.Parts;
SELECT * FROM dalalham.RentalRecord;
SELECT * FROM dalalham.SoldBoat;



















