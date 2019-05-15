-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sysdba
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.34-MariaDB

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
-- Table structure for table `almacen`
--

DROP TABLE IF EXISTS `almacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `almacen` (
  `almacen_id` varchar(20) NOT NULL,
  `almacen_nombre` varchar(50) NOT NULL,
  `almacen_codigo` varchar(20) NOT NULL,
  `almacen_direccion` varchar(100) NOT NULL,
  `almacen_telefono` varchar(20) NOT NULL,
  `almacen_email` varchar(50) NOT NULL,
  PRIMARY KEY (`almacen_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacen`
--

LOCK TABLES `almacen` WRITE;
/*!40000 ALTER TABLE `almacen` DISABLE KEYS */;
INSERT INTO `almacen` VALUES ('1','Tienda Principal','T01','jr. Moquegua','987654321','tienda@gmail.com');
/*!40000 ALTER TABLE `almacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogo`
--

DROP TABLE IF EXISTS `catalogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogo` (
  `catalogo_id` varchar(20) NOT NULL,
  `catalogo_producto_id` varchar(20) NOT NULL,
  `catalogo_precio_venta` decimal(10,2) NOT NULL,
  PRIMARY KEY (`catalogo_id`),
  KEY `producto_catalogo_fk` (`catalogo_producto_id`),
  CONSTRAINT `producto_catalogo_fk` FOREIGN KEY (`catalogo_producto_id`) REFERENCES `producto` (`producto_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogo`
--

LOCK TABLES `catalogo` WRITE;
/*!40000 ALTER TABLE `catalogo` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `categoria_id` varchar(20) NOT NULL,
  `categoria_nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`categoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES ('1','inplementos deportivos');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `cliente_id` varchar(20) NOT NULL,
  `cliente_nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`cliente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compra` (
  `compra_id` varchar(20) NOT NULL,
  `compra_serie` varchar(10) NOT NULL,
  `compra_numero` varchar(10) NOT NULL,
  `compra_importe_total` decimal(10,2) NOT NULL,
  `compra_fecha` date NOT NULL,
  `compra_almacen_id` varchar(20) NOT NULL,
  `compra_comprobante_id` varchar(20) NOT NULL,
  PRIMARY KEY (`compra_id`),
  KEY `comprobante_compra_fk` (`compra_comprobante_id`),
  KEY `almacen_compra_fk` (`compra_almacen_id`),
  CONSTRAINT `almacen_compra_fk` FOREIGN KEY (`compra_almacen_id`) REFERENCES `almacen` (`almacen_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `comprobante_compra_fk` FOREIGN KEY (`compra_comprobante_id`) REFERENCES `comprobante` (`comprobante_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES ('001','F001','1',450.00,'2019-05-08','1','1'),('002','F002','11',150.00,'2019-05-08','1','1');
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_detalle`
--

DROP TABLE IF EXISTS `compra_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compra_detalle` (
  `compra_detalle_id` varchar(20) NOT NULL,
  `compra_detalle_cantidad` decimal(10,2) NOT NULL,
  `compra_detalle_precio_unitario` decimal(10,2) NOT NULL,
  `compra_detalle_importe_item` decimal(10,2) NOT NULL,
  `compra_detalle_compra_id` varchar(20) NOT NULL,
  `compra_detalle_producto_id` varchar(20) NOT NULL,
  PRIMARY KEY (`compra_detalle_id`),
  KEY `compra_compra_detalle_fk` (`compra_detalle_compra_id`),
  KEY `producto_compra_detalle_fk` (`compra_detalle_producto_id`),
  CONSTRAINT `compra_compra_detalle_fk` FOREIGN KEY (`compra_detalle_compra_id`) REFERENCES `compra` (`compra_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `producto_compra_detalle_fk` FOREIGN KEY (`compra_detalle_producto_id`) REFERENCES `producto` (`producto_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_detalle`
--

LOCK TABLES `compra_detalle` WRITE;
/*!40000 ALTER TABLE `compra_detalle` DISABLE KEYS */;
INSERT INTO `compra_detalle` VALUES ('001',10.00,45.00,450.00,'001','01'),('002',10.00,15.00,50.00,'002','02');
/*!40000 ALTER TABLE `compra_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprobante`
--

DROP TABLE IF EXISTS `comprobante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comprobante` (
  `comprobante_id` varchar(20) NOT NULL,
  `comprobante_nombre` varchar(100) NOT NULL,
  `comprobante_codigo` varchar(20) NOT NULL,
  PRIMARY KEY (`comprobante_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprobante`
--

LOCK TABLES `comprobante` WRITE;
/*!40000 ALTER TABLE `comprobante` DISABLE KEYS */;
INSERT INTO `comprobante` VALUES ('1','Boleta','03'),('2','factura','01');
/*!40000 ALTER TABLE `comprobante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `producto_id` varchar(20) NOT NULL,
  `producto_nombre` varchar(100) NOT NULL,
  `producto_codigo` varchar(50) NOT NULL,
  `producto_precio_referencial` decimal(10,2) NOT NULL,
  `producto_marca` varchar(100) NOT NULL,
  `producto_categoria_id` varchar(20) NOT NULL,
  PRIMARY KEY (`producto_id`),
  KEY `categoria_producto_fk` (`producto_categoria_id`),
  CONSTRAINT `categoria_producto_fk` FOREIGN KEY (`producto_categoria_id`) REFERENCES `categoria` (`categoria_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES ('01','Balon','001',45.00,'MiKasa','1'),('02','Silbato','002',15.00,'Glovivion','1');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta` (
  `venta_id` varchar(20) NOT NULL,
  `venta_serie` varchar(10) NOT NULL,
  `venta_numero` varchar(10) NOT NULL,
  `venta_importe_total` decimal(10,2) NOT NULL,
  `venta_fecha` date NOT NULL,
  `venta_comprobante_id` varchar(20) NOT NULL,
  `venta_almacen_id` varchar(20) NOT NULL,
  `venta_cliente_id` varchar(20) NOT NULL,
  PRIMARY KEY (`venta_id`),
  KEY `cliente_venta_fk` (`venta_cliente_id`),
  KEY `comprobante_venta_fk` (`venta_comprobante_id`),
  KEY `almacen_venta_fk` (`venta_almacen_id`),
  CONSTRAINT `almacen_venta_fk` FOREIGN KEY (`venta_almacen_id`) REFERENCES `almacen` (`almacen_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cliente_venta_fk` FOREIGN KEY (`venta_cliente_id`) REFERENCES `cliente` (`cliente_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `comprobante_venta_fk` FOREIGN KEY (`venta_comprobante_id`) REFERENCES `comprobante` (`comprobante_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_detalle`
--

DROP TABLE IF EXISTS `venta_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta_detalle` (
  `venta_detalle_id` varchar(20) NOT NULL,
  `venta_id` varchar(20) NOT NULL,
  `venta_detalle_cantidad` decimal(10,2) NOT NULL,
  `venta_detalle_precio_unitario` decimal(10,2) NOT NULL,
  `venta_detalle_importe_item` decimal(10,2) NOT NULL,
  `venta_detalle_producto_id` varchar(20) NOT NULL,
  PRIMARY KEY (`venta_detalle_id`),
  KEY `venta_venta_detalle_fk` (`venta_id`),
  KEY `producto_venta_detalle_fk` (`venta_detalle_producto_id`),
  CONSTRAINT `producto_venta_detalle_fk` FOREIGN KEY (`venta_detalle_producto_id`) REFERENCES `producto` (`producto_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `venta_venta_detalle_fk` FOREIGN KEY (`venta_id`) REFERENCES `venta` (`venta_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_detalle`
--

LOCK TABLES `venta_detalle` WRITE;
/*!40000 ALTER TABLE `venta_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta_detalle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-08 12:17:46
