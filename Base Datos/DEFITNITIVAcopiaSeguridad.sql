-- MySQL dump 10.13  Distrib 8.0.13, for Linux (x86_64)
--
-- Host: localhost    Database: Inventario
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Asig_PK`
--

DROP TABLE IF EXISTS `Asig_PK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Asig_PK` (
  `n_tab` varchar(45) NOT NULL,
  `valor` int(11) NOT NULL,
  PRIMARY KEY (`n_tab`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Asig_PK`
--

LOCK TABLES `Asig_PK` WRITE;
/*!40000 ALTER TABLE `Asig_PK` DISABLE KEYS */;
INSERT INTO `Asig_PK` VALUES ('Detalle_Mov',0),('Empleado',1),('Empresa',1),('Movimiento_Inv',2),('Producto',4),('Rol',1),('Tipo_Mov',1),('Usuario_Rol',1);
/*!40000 ALTER TABLE `Asig_PK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Detalle_Mov`
--

DROP TABLE IF EXISTS `Detalle_Mov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Detalle_Mov` (
  `Movimiento_Inv_id_mov_inv` int(11) NOT NULL,
  `Producto_id_producto` int(11) NOT NULL,
  `cantidad_prod_mov` int(11) NOT NULL,
  `precio_prod_mov` float(10,5) DEFAULT NULL,
  PRIMARY KEY (`Movimiento_Inv_id_mov_inv`,`Producto_id_producto`),
  KEY `fk_Detalle_Mov_Movimiento_Inv1_idx` (`Movimiento_Inv_id_mov_inv`),
  KEY `fk_Detalle_Mov_Producto1_idx` (`Producto_id_producto`),
  CONSTRAINT `fk_Detalle_Mov_Movimiento_Inv1` FOREIGN KEY (`Movimiento_Inv_id_mov_inv`) REFERENCES `Movimiento_Inv` (`id_mov_inv`),
  CONSTRAINT `fk_Detalle_Mov_Producto1` FOREIGN KEY (`Producto_id_producto`) REFERENCES `Producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Detalle_Mov`
--

LOCK TABLES `Detalle_Mov` WRITE;
/*!40000 ALTER TABLE `Detalle_Mov` DISABLE KEYS */;
INSERT INTO `Detalle_Mov` VALUES (1,3,10,0.20000),(2,4,10,0.20000);
/*!40000 ALTER TABLE `Detalle_Mov` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empleado`
--

DROP TABLE IF EXISTS `Empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Empleado` (
  `id_empleado` int(11) NOT NULL,
  `nombre_empleado` varchar(45) NOT NULL,
  `Empresa_id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `fk_Empleado_Empresa1_idx` (`Empresa_id_empresa`),
  CONSTRAINT `fk_Empleado_Empresa1` FOREIGN KEY (`Empresa_id_empresa`) REFERENCES `Empresa` (`id_empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empleado`
--

LOCK TABLES `Empleado` WRITE;
/*!40000 ALTER TABLE `Empleado` DISABLE KEYS */;
INSERT INTO `Empleado` VALUES (1,'OSCAR',1);
/*!40000 ALTER TABLE `Empleado` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_empleado` BEFORE INSERT ON `Empleado` FOR EACH ROW begin
	DECLARE var INT;    

	SELECT Inventario.fnc_AsigPK('Empleado') into var;    
    SET var = var+1;
    SET NEW.id_empleado = var;
    
    UPDATE Inventario.Asig_PK SET valor = var WHERE n_tab like 'Empleado';
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Empresa`
--

DROP TABLE IF EXISTS `Empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Empresa` (
  `id_empresa` int(11) NOT NULL,
  `razon_social_empresa` varchar(45) NOT NULL,
  PRIMARY KEY (`id_empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empresa`
--

LOCK TABLES `Empresa` WRITE;
/*!40000 ALTER TABLE `Empresa` DISABLE KEYS */;
INSERT INTO `Empresa` VALUES (1,'EMPRESA 1');
/*!40000 ALTER TABLE `Empresa` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_emp` BEFORE INSERT ON `Empresa` FOR EACH ROW begin
	DECLARE var INT;    

	SELECT Inventario.fnc_AsigPK('Empresa') into var;    
    SET var = var+1;
    SET NEW.id_empresa = var;
    
    UPDATE Inventario.Asig_PK SET valor = var WHERE n_tab like 'Empresa';
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Movimiento_Inv`
--

DROP TABLE IF EXISTS `Movimiento_Inv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Movimiento_Inv` (
  `id_mov_inv` int(11) NOT NULL,
  `fecha_mov_inv` date NOT NULL,
  `Tipo_Mov_id_tipo_mov` int(11) NOT NULL,
  `Usuario_Rol_id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_mov_inv`),
  KEY `fk_Movimiento_Inv_Tipo_Mov1_idx` (`Tipo_Mov_id_tipo_mov`),
  KEY `fk_Movimiento_Inv_Usuario_Rol1_idx` (`Usuario_Rol_id_usuario`),
  CONSTRAINT `fk_Movimiento_Inv_Tipo_Mov1` FOREIGN KEY (`Tipo_Mov_id_tipo_mov`) REFERENCES `Tipo_Mov` (`id_tipo_mov`),
  CONSTRAINT `fk_Movimiento_Inv_Usuario_Rol1` FOREIGN KEY (`Usuario_Rol_id_usuario`) REFERENCES `Usuario_Rol` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Movimiento_Inv`
--

LOCK TABLES `Movimiento_Inv` WRITE;
/*!40000 ALTER TABLE `Movimiento_Inv` DISABLE KEYS */;
INSERT INTO `Movimiento_Inv` VALUES (2,'2018-11-06',1,1);
/*!40000 ALTER TABLE `Movimiento_Inv` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_mov` BEFORE INSERT ON `Movimiento_Inv` FOR EACH ROW begin
	DECLARE var INT;    

	SELECT Inventario.fnc_AsigPK('Movimiento_Inv') into var;    
	SET var = var+1;
    SET NEW.id_mov_inv = var;
    SET NEW.fecha_mov_inv = date(sysdate());
    UPDATE Inventario.Asig_PK SET valor = var WHERE n_tab like 'Movimiento_Inv';
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Producto`
--

DROP TABLE IF EXISTS `Producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Producto` (
  `id_producto` int(11) NOT NULL,
  `descripcion_prod` varchar(45) NOT NULL,
  `stock` int(11) NOT NULL,
  `precio_stock` float NOT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Producto`
--

LOCK TABLES `Producto` WRITE;
/*!40000 ALTER TABLE `Producto` DISABLE KEYS */;
INSERT INTO `Producto` VALUES (4,'TUERCA 1',10,0.02);
/*!40000 ALTER TABLE `Producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_prod` BEFORE INSERT ON `Producto` FOR EACH ROW begin
	DECLARE var INT;    

	SELECT Inventario.fnc_AsigPK('Producto') into var;    
	SET var = var+1;
    SET NEW.id_producto = var;
    UPDATE Inventario.Asig_PK SET valor = var WHERE n_tab like 'Producto';
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Rol`
--

DROP TABLE IF EXISTS `Rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Rol` (
  `id_rol` int(11) NOT NULL,
  `rol` varchar(45) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rol`
--

LOCK TABLES `Rol` WRITE;
/*!40000 ALTER TABLE `Rol` DISABLE KEYS */;
INSERT INTO `Rol` VALUES (1,'JEFE ADMINISTRATIVO');
/*!40000 ALTER TABLE `Rol` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_rol` BEFORE INSERT ON `Rol` FOR EACH ROW begin
	DECLARE var INT;    

	SELECT Inventario.fnc_AsigPK('Rol') into var;    
    SET var = var+1;
    SET NEW.id_rol = var;
    
    UPDATE Inventario.Asig_PK SET valor = var WHERE n_tab like 'Rol';
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Tipo_Mov`
--

DROP TABLE IF EXISTS `Tipo_Mov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Tipo_Mov` (
  `id_tipo_mov` int(11) NOT NULL,
  `descripcion_tipo_mov` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tipo_mov`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tipo_Mov`
--

LOCK TABLES `Tipo_Mov` WRITE;
/*!40000 ALTER TABLE `Tipo_Mov` DISABLE KEYS */;
INSERT INTO `Tipo_Mov` VALUES (1,'ENTRADA');
/*!40000 ALTER TABLE `Tipo_Mov` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tip_Mov` BEFORE INSERT ON `Tipo_Mov` FOR EACH ROW begin
	DECLARE var INT;    

	SELECT Inventario.fnc_AsigPK('Tipo_Mov') into var;    
	SET var = var+1;
    SET NEW.id_tipo_mov = var;
    UPDATE Inventario.Asig_PK SET valor = var WHERE n_tab like 'Tipo_Mov';
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Usuario_Rol`
--

DROP TABLE IF EXISTS `Usuario_Rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Usuario_Rol` (
  `id_usuario` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(65) DEFAULT NULL,
  `Empleado_id_empleado` int(11) NOT NULL,
  `Rol_id_rol` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `fk_Usuario_Empleado1_idx` (`Empleado_id_empleado`),
  KEY `fk_Usuario_Rol_Rol1_idx` (`Rol_id_rol`),
  CONSTRAINT `fk_Usuario_Empleado1` FOREIGN KEY (`Empleado_id_empleado`) REFERENCES `Empleado` (`id_empleado`),
  CONSTRAINT `fk_Usuario_Rol_Rol1` FOREIGN KEY (`Rol_id_rol`) REFERENCES `Rol` (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario_Rol`
--

LOCK TABLES `Usuario_Rol` WRITE;
/*!40000 ALTER TABLE `Usuario_Rol` DISABLE KEYS */;
INSERT INTO `Usuario_Rol` VALUES (1,'danviad21','6934b3815889af081baf11c64b6877d54b12cbdd224a37a6d3672a02d104bfeb',1,1);
/*!40000 ALTER TABLE `Usuario_Rol` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_user` BEFORE INSERT ON `Usuario_Rol` FOR EACH ROW begin
	DECLARE var INT;    

	SELECT Inventario.fnc_AsigPK('Usuario_Rol') into var;    
	SET var = var+1;
    SET NEW.id_usuario = var;
    SET NEW.password = sha2(NEW.password,256);
    UPDATE Inventario.Asig_PK SET valor = var WHERE n_tab like 'Usuario_Rol';
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping routines for database 'Inventario'
--
/*!50003 DROP FUNCTION IF EXISTS `fnc_AsigPk` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fnc_AsigPk`(nombtab varchar(50)) RETURNS int(11)
    DETERMINISTIC
begin
    DECLARE var  Integer;
 
	SELECT valor into var FROM Asig_PK WHERE upper(n_tab) = upper(nombtab);
 	if var is null then
		return -1;
	else return var;
    end if;
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `gen_Traslado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `gen_Traslado`(key1 integer,key2 integer,cant integer,precio float,tipMov integer)
BEGIN
	DECLARE var varchar(50);
    
    SELECT descripcion_tipo_mov into var FROM Tipo_Mov WHERE id_tipo_mov = tipMov; 
	
    if cant >0 then
		if upper(var) like 'SALIDA' then
			SET cant = cant * -1;
			SET precio = precio * -1;
		end if;
    
		insert into Detalle_Mov values(key1,key2,cant,precio);
		update Producto set stock = stock + cant, precio_stock = precio/cant + precio_stock
        WHERE id_producto = key2;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `todasTab` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `todasTab`()
BEGIN
	DECLARE done INT DEFAULT FALSE;
    DECLARE param1 varchar(50);
    DECLARE param2 varchar(50);
	DECLARE c1 CURSOR FOR
		SELECT tab.TABLE_NAME, tab1.n_tab
		FROM information_schema.TABLES tab left join Asig_PK tab1
			on (tab.table_name=tab1.n_tab)
		WHERE upper(tab.TABLE_SCHEMA) LIKE 'INVENTARIO' AND upper(tab.TABLE_NAME) NOT LIKE UPPER('Asig_PK');
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

	OPEN c1;

	read_loop: LOOP
		FETCH c1 INTO param1, param2;
		
        IF done THEN
			LEAVE read_loop;
		END IF;
	
		IF param2 is null then
			insert into Asig_PK values(param1,0);
		END IF;
	END LOOP;

	CLOSE c1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-07  0:42:22
