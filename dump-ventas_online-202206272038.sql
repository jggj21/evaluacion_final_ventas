-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: ventas_online
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `Categorias`
--

DROP TABLE IF EXISTS `Categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categorias`
--

LOCK TABLES `Categorias` WRITE;
/*!40000 ALTER TABLE `Categorias` DISABLE KEYS */;
INSERT INTO `Categorias` VALUES (1,'Bebidas'),(2,'Muebles'),(3,'Electronico'),(4,'Frutas'),(5,'Verduras'),(6,'Lacteos');
/*!40000 ALTER TABLE `Categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PrecioProductos`
--

DROP TABLE IF EXISTS `PrecioProductos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PrecioProductos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idproducto` int DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `idtipoventa` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `PrecioProductos_FK` (`idproducto`),
  KEY `PrecioProductos_FK_1` (`idtipoventa`),
  CONSTRAINT `PrecioProductos_FK` FOREIGN KEY (`idproducto`) REFERENCES `Productos` (`id`),
  CONSTRAINT `PrecioProductos_FK_1` FOREIGN KEY (`idtipoventa`) REFERENCES `TipoVenta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PrecioProductos`
--

LOCK TABLES `PrecioProductos` WRITE;
/*!40000 ALTER TABLE `PrecioProductos` DISABLE KEYS */;
/*!40000 ALTER TABLE `PrecioProductos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Productos`
--

DROP TABLE IF EXISTS `Productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idproveedor` int DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `idcategoria` int DEFAULT NULL,
  `imagen` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Productos_FK` (`idproveedor`),
  KEY `Productos_FK_1` (`idcategoria`),
  CONSTRAINT `Productos_FK` FOREIGN KEY (`idproveedor`) REFERENCES `Proveedores` (`id`),
  CONSTRAINT `Productos_FK_1` FOREIGN KEY (`idcategoria`) REFERENCES `Categorias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Productos`
--

LOCK TABLES `Productos` WRITE;
/*!40000 ALTER TABLE `Productos` DISABLE KEYS */;
INSERT INTO `Productos` VALUES (1,4,'Melocoton',4,'https://www.hogarmania.com/archivos/201305/melocotones-xl-668x400x80xX.jpg'),(2,1,'Pepsi',1,'https://walmartgt.vtexassets.com/arquivos/ids/243220-800-600?v=637798886708370000&width=800&height=600&aspect=true'),(3,2,'Sofa',2,'https://images.demandware.net/dw/image/v2/BBBV_PRD/on/demandware.static/-/Sites-master-catalog/default/dwd633af54/images/700000/704909.jpg?sw=2000'),(4,3,'Celular',3,'https://www.tecnofacil.com.gt/media/catalog/product/cache/2/image/500x523/9a1cf866937fe184bfc3b11490fb0dcb/y/p/yp7-black-02.jpg'),(5,5,'Zanahoria',5,'https://img.freepik.com/foto-gratis/zanahoria-entera-aislada_88281-1988.jpg?w=2000'),(6,6,'Leche de Almendra',6,'https://siman.vtexassets.com/arquivos/ids/774830-500-auto?v=637317374440270000&width=500&height=auto&aspect=true');
/*!40000 ALTER TABLE `Productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Proveedores`
--

DROP TABLE IF EXISTS `Proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Proveedores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `telefono` int NOT NULL,
  `direccion` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Proveedores`
--

LOCK TABLES `Proveedores` WRITE;
/*!40000 ALTER TABLE `Proveedores` DISABLE KEYS */;
INSERT INTO `Proveedores` VALUES (1,'Proveedor de bebidas',78705250,'4ta Calle 3-52'),(2,'Proveedor de muebles',78708080,'5ta Calle 3-85'),(3,'Proveedor electronico',78447777,'3era Calle'),(4,'Proveedor de frutas',54807070,'1era Calle'),(5,'Proveedor de verdudas',50807070,'6ta Calle'),(6,'Proveedor de lacteos',72809080,'7ta Calle 3-80');
/*!40000 ALTER TABLE `Proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TipoVenta`
--

DROP TABLE IF EXISTS `TipoVenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TipoVenta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TipoVenta`
--

LOCK TABLES `TipoVenta` WRITE;
/*!40000 ALTER TABLE `TipoVenta` DISABLE KEYS */;
INSERT INTO `TipoVenta` VALUES (1,'Mayoreo'),(2,'Unitario'),(3,'Oferta'),(4,'Liquidacion');
/*!40000 ALTER TABLE `TipoVenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'ventas_online'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-27 20:38:46
