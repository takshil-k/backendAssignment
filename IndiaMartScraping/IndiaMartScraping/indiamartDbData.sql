-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: indiamart
-- ------------------------------------------------------
-- Server version	5.7.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `idcategory` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `idGroupRef` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idcategory`),
  KEY `ix_category_6ae999552a0d2dca` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Brick Making Machines','images/Brick Making Machines/Brick Making Machines.jpg',1),(2,'Passenger Lifts','images/Passenger Lifts/Passenger Lifts.jpg',1),(3,'TMT Bars','images/TMT Bars/TMT Bars.jpg',1),(4,'Plywoods ','images/Plywoods /Plywoods .jpg',1),(5,' Excavator','images/ Excavator/ Excavator.jpg',1),(6,' Emulsion Paints','images/ Emulsion Paints/ Emulsion Paints.jpg',1),(7,'Wooden Door','images/Wooden Door/Wooden Door.jpg',1),(8,' PVC Pipes','images/ PVC Pipes/ PVC Pipes.jpg',1),(9,' Building Brick','images/ Building Brick/ Building Brick.jpg',1),(10,'Snack Machine','images/Snack Machine/Snack Machine.jpg',2),(11,'Air Compressors','images/Air Compressors/Air Compressors.jpg',2),(12,'Water Purification Plants','images/Water Purification Plants/Water Purification Plants.jpg',2),(13,'Rice Mill Machinery','images/Rice Mill Machinery/Rice Mill Machinery.jpg',2),(14,'Arc Welder','images/Arc Welder/Arc Welder.jpg',2),(15,'Bag Making Machine','images/Bag Making Machine/Bag Making Machine.jpg',2),(16,'Animal Feed Making Machine','images/Animal Feed Making Machine/Animal Feed Making Machine.jpg',2),(17,'Oil Extraction Machine','images/Oil Extraction Machine/Oil Extraction Machine.jpg',2),(18,'Garment Printing Machine','images/Garment Printing Machine/Garment Printing Machine.jpg',2),(19,'Ladies Kurtis','images/Ladies Kurtis/Ladies Kurtis.jpg',3),(20,'Mens T-Shirts','images/Mens T-Shirts/Mens T-Shirts.jpg',3),(21,'Blazers','images/Blazers/Blazers.jpg',3),(22,'Safety Shoes','images/Safety Shoes/Safety Shoes.jpg',3),(23,'Trouser','images/Trouser/Trouser.jpg',3),(24,'Mannequins','images/Mannequins/Mannequins.jpg',3),(25,'Commercial Uniforms','images/Commercial Uniforms/Commercial Uniforms.jpg',3),(26,'Shirt','images/Shirt/Shirt.jpg',3),(27,'Synthetic Fabric','images/Synthetic Fabric/Synthetic Fabric.jpg',3),(28,'Photocopier Machine','images/Photocopier Machine/Photocopier Machine.jpg',4),(29,'High Mast Lighting','images/High Mast Lighting/High Mast Lighting.jpg',4),(30,'Billing Machines','images/Billing Machines/Billing Machines.jpg',4),(31,'Inverter Batteries','images/Inverter Batteries/Inverter Batteries.jpg',4),(32,'Automotive Batteries','images/Automotive Batteries/Automotive Batteries.jpg',4),(33,'Solar Batteries','images/Solar Batteries/Solar Batteries.jpg',4),(34,'Street Lights','images/Street Lights/Street Lights.jpg',4),(35,'Flood Lights','images/Flood Lights/Flood Lights.jpg',4),(36,'Spot Lights','images/Spot Lights/Spot Lights.jpg',4),(37,'Submersible Pump','images/Submersible Pump/Submersible Pump.jpg',5),(38,'Automotive Oils','images/Automotive Oils/Automotive Oils.jpg',5),(39,'Water Tanks','images/Water Tanks/Water Tanks.jpg',5),(40,'PVC Sheets','images/PVC Sheets/PVC Sheets.jpg',5),(41,'Conveyor Components','images/Conveyor Components/Conveyor Components.jpg',5),(42,'Plastic Scrap','images/Plastic Scrap/Plastic Scrap.jpg',5),(43,'Packaging Tapes','images/Packaging Tapes/Packaging Tapes.jpg',5),(44,'Industrial Rack','images/Industrial Rack/Industrial Rack.jpg',5),(45,'Water Heater & Geyser','images/Water Heater & Geyser/Water Heater & Geyser.jpg',5),(46,'Rice','images/Rice/Rice.jpg',6),(47,'Wheat','images/Wheat/Wheat.jpg',6),(48,'Pulses','images/Pulses/Pulses.jpg',6),(49,'Carbonated Drinks','images/Carbonated Drinks/Carbonated Drinks.jpg',6),(50,'Cake','images/Cake/Cake.jpg',6),(51,'Namkeen','images/Namkeen/Namkeen.jpg',6),(52,'Carrier Oil','images/Carrier Oil/Carrier Oil.jpg',6),(53,'Candy & Jelly','images/Candy & Jelly/Candy & Jelly.jpg',6),(54,'Confectionery Ingredients','images/Confectionery Ingredients/Confectionery Ingredients.jpg',6);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mainGroups`
--

DROP TABLE IF EXISTS `mainGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mainGroups` (
  `idmainCategory` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idmainCategory`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mainGroups`
--

LOCK TABLES `mainGroups` WRITE;
/*!40000 ALTER TABLE `mainGroups` DISABLE KEYS */;
INSERT INTO `mainGroups` VALUES (1,'Building Construction Material & Equipment',NULL),(2,'Industrial Plants, Machinery & Equipment',NULL),(3,'Apparel, Clothing & Garments',NULL),(4,'Electronics & Electrical Goods & Supplies',NULL),(5,'Industrial & Engineering Products, Spares and Supplies',NULL),(6,'Food & Beverages',NULL);
/*!40000 ALTER TABLE `mainGroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pageDetails`
--

DROP TABLE IF EXISTS `pageDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pageDetails` (
  `idpageDetails` int(11) NOT NULL AUTO_INCREMENT,
  `pageTitle` varchar(100) DEFAULT NULL,
  `pageMainHeading` varchar(255) DEFAULT NULL,
  `pageSubHeading` varchar(255) DEFAULT NULL,
  `pageMainTag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idpageDetails`),
  KEY `ix_pageDetails_d2566455a6d91453` (`idpageDetails`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pageDetails`
--

LOCK TABLES `pageDetails` WRITE;
/*!40000 ALTER TABLE `pageDetails` DISABLE KEYS */;
INSERT INTO `pageDetails` VALUES (1,'IndiaMART - Indian Manufacturers Suppliers Exporters Directory,India Exporter Manufacturer','We connect Buyers & Sellers','IndiaMART is India\'s largest online B2B marketplace, connecting buyers with suppliers.','Trusted Platform | Safe & Secure | Quick Assistance');
/*!40000 ALTER TABLE `pageDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subCategory`
--

DROP TABLE IF EXISTS `subCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subCategory` (
  `idsubCategory` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `idCategoryRef` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idsubCategory`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subCategory`
--

LOCK TABLES `subCategory` WRITE;
/*!40000 ALTER TABLE `subCategory` DISABLE KEYS */;
INSERT INTO `subCategory` VALUES (1,'Fly Ash Brick Making Machine',1),(2,'Clay Brick Making Machine',1),(3,'Cement Brick Making Machine',1),(4,'Residential Elevator',2),(5,'Kone Passenger lift',2),(6,'Stair Lift',2),(7,'TMT Steel Bars',3),(8,' TATA TMT Bars',3),(9,' Kamdhenu TMT Bars',3),(10,'  Shuttering Plywood',4),(11,'Laminated Plywood',4),(12,'Waterproof Plywood',4),(13,' Hitachi Excavator',5),(14,'Hyundai Excavator',5),(15,'Komatsu Excavator',5),(16,'Asian Emulsion Paints',6),(17,' Berger Emulsion Paints',6),(18,' Nerolac Emulsion Paints',6),(19,'Designer Wooden Door',7),(20,' Plywood Door',7),(21,' Wooden Flush Doors',7),(22,' Finolex Pipes',8),(23,' Rigid PVC Pipes',8),(24,' Flexible PVC Pipes',8),(25,' Red Brick',9),(26,' Fly Ash Bricks',9),(27,'Cement Brick',9),(28,'Namkeen Making Machines',10),(29,'Pani Puri Making Machine ',10),(30,'Kurkure Extruder',10),(31,'Reciprocating Air Compressor',11),(32,'Ingersoll Rand Air Compressors',11),(33,'Oil Free Air Compressor',11),(34,'Water Treatment Plants',12),(35,'Industrial RO System',12),(36,'Water Ionizer Machine',12),(37,'Rice Cutting Machine',13),(38,'Puffed Rice Machinery',13),(39,'Mini Rice Mill',13),(40,'Arc Welding Machines',14),(41,'Inverter ARC Welding Machine',14),(42,'Saw Welding Machine',14),(43,'Non Woven Bag Making Machine',15),(44,'Fully Automatic Paper Bags Making Machine',15),(45,'Plastic Bag Making Machine',15),(46,'Poultry Feed Making Machine',16),(47,'Fish Feed Making Machine',16),(48,'Cattle Feed Machine',16),(49,'Oil Expellers',17),(50,'Mustard Oil Expeller',17),(51,'Edible Oil Extraction Machinery',17),(52,'T Shirt Printer',18),(53,'Screen Printing Machines',18),(54,'Digital Garment Printing Machine',18),(55,'Designer Kurtis',19),(56,'Cotton Kurti',19),(57,'Ladies Woolen Kurti',19),(58,'Mens Round Neck T Shirt',20),(59,'Mens Polo T Shirt',20),(60,'Graphic Printed T-Shirt',20),(61,'Mens Blazer',21),(62,'Womens Blazer',21),(63,'Designer Blazer',21),(64,'Leather Safety Shoes',22),(65,'Steel Toe Safety Shoes',22),(66,'Industrial Shoes',22),(67,'Cargo Pant',23),(68,'Jogger Pant',23),(69,'Chino Trousers',23),(70,'Female Mannequins',24),(71,'Dress Forms',24),(72,'Male Mannequins',24),(73,'Worker Uniform',25),(74,'Housekeeping Uniform',25),(75,'Corporate Uniform',25),(76,'Printed Shirt',26),(77,'Designer Shirt',26),(78,'Plain Shirt',26),(79,'Rayon Fabrics',27),(80,'Faux Fur Fabric',27),(81,'Viscose Fabrics',27),(82,'Xerox Machines',28),(83,'Multifunction Office Machine',28),(84,'Digital Photocopier Machine',28),(85,'Tower Light',29),(86,'LED High Mast Lighting',29),(87,'High Mast System',29),(88,'POS Machines',30),(89,'Cash Registers',30),(90,'Electronic Billing Machine',30),(91,'Tubular Batteries',31),(92,'UPS Batteries',31),(93,'SMF Battery',31),(94,'Car Batteries',32),(95,'Two Wheeler Battery',32),(96,'Electric Vehicle Battery',32),(97,'Solar Inverter Battery',33),(98,'Solar Tubular Battery',33),(99,'Solar UPS Battery',33),(100,'LED Street Lights',34),(101,'Solar Street Lights',34),(102,'Solar LED Street Light',34),(103,'LED Floodlight',35),(104,'High Bay Light',35),(105,'LED Bay Light',35),(106,'LED Spotlight',36),(107,'LED Track Light',36),(108,'Track Light',36),(109,'Borewell Submersible Pump',37),(110,'CRI Submersible Pumps',37),(111,'Open Well Submersible Pump',37),(112,'Engine Oil',38),(113,'Gear Oil',38),(114,'Lubricating Oil',38),(115,'Triple Layered Water Tanks',39),(116,'Stainless Steel Water Tank',39),(117,'Supreme Water Tanks',39),(118,'PVC Foam Sheets',40),(119,'PVC Marble Sheet',40),(120,'Transparent PVC Sheet',40),(121,'Conveyor Belt',41),(122,'Conveyor Rollers',41),(123,'Conveyor Chains',41),(124,'PP Scrap',42),(125,'Pet Bottle Scrap',42),(126,'PET Chips Scrap',42),(127,'Self Adhesive Tapes',43),(128,'BOPP Tapes',43),(129,'Brown Tape',43),(130,'Warehouse Racks',44),(131,'Slotted Angle Racks',44),(132,'Pallet Racks',44),(133,'Solar Water Heater',45),(134,'Electric Geyser',45),(135,'Gas Geyser',45),(136,'Basmati Rice',46),(137,'Parboiled Rice',46),(138,'Brown Rice',46),(139,'Wheat Grains',47),(140,'Milling Wheat',47),(141,'Lokwan Wheat',47),(142,'Toor Dal',48),(143,'Chana Dal',48),(144,'Moong Dal',48),(145,'Soft Drinks',49),(146,'Red Bull Energy Drink',49),(147,'Beverages Mixes',49),(148,'Chocolate Cake',50),(149,'Balck Forest Cake',50),(150,'Cream Cake',50),(151,'Haldiram Namkeen',51),(152,'Spicy Mixture Namkeen',51),(153,'Aloo Bhujia',51),(154,'Neem Oil',52),(155,'Cottonseed Oil',52),(156,'Castor Oil',52),(157,'Flavoured Candies',53),(158,'Toffees',53),(159,'Chewing Gums',53),(160,'Whipped Topping Cream',54),(161,'Sweet Mukhwas',54),(162,'Gelatin Powder',54);
/*!40000 ALTER TABLE `subCategory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-22 16:21:35
