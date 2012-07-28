/*
SQLyog Enterprise - MySQL GUI v8.02 RC
MySQL - 5.5.15-log : Database - kmcomputer
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `banner` */

DROP TABLE IF EXISTS `banner`;

CREATE TABLE `banner` (
  `Idbaner` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Descripcion` text COLLATE utf8_unicode_ci,
  `Imagen` varchar(600) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Url` varchar(600) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Precio` double DEFAULT NULL,
  `Orden` tinyint(4) DEFAULT NULL,
  `Estado` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`Idbaner`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `banner` */

LOCK TABLES `banner` WRITE;

insert  into `banner`(`Idbaner`,`Nombre`,`Descripcion`,`Imagen`,`Url`,`Precio`,`Orden`,`Estado`) values (1,'foto 1',NULL,'pame.jpg',NULL,NULL,1,1),(4,'Banner4','esto es un banner','banner4-4.jpg','www.google.com',150,NULL,1),(5,'chelo','gae','chelo-5.jpg','asdasdas',25,2,1);

UNLOCK TABLES;

/*Table structure for table `categoria` */

DROP TABLE IF EXISTS `categoria`;

CREATE TABLE `categoria` (
  `IdCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `Codigo` varchar(50) NOT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Nombre` char(50) DEFAULT NULL,
  `Estado` int(1) DEFAULT '1',
  `IdPadre` int(11) DEFAULT NULL,
  `Slug` char(200) DEFAULT NULL,
  PRIMARY KEY (`IdCategoria`),
  FULLTEXT KEY `cod` (`Codigo`),
  FULLTEXT KEY `des` (`Descripcion`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

/*Data for the table `categoria` */

LOCK TABLES `categoria` WRITE;

insert  into `categoria`(`IdCategoria`,`Codigo`,`Descripcion`,`Nombre`,`Estado`,`IdPadre`,`Slug`) values (38,'','Whisky','Whisky',1,33,'whisky'),(42,'','Gaseosas','Gaseosas',1,32,'gaseosas'),(41,'','Pisco','Pisco',1,33,'pisco'),(40,'','Ron','Ron',1,33,'ron'),(39,'','Vodka','Vodka',1,33,'vodka'),(37,'','Hielo y Otros','Hielo y Otros',1,NULL,'hielo-y-otros'),(43,'CG','CIgarrillos de diferentes marcas','Cigarros',1,NULL,'cigarros'),(35,'','Snacks y Piqueos','Snacks y Piqueos',1,NULL,'snack-y-piqueos'),(34,'','Cerveza','Cerveza',1,33,'cerveza'),(33,'','Licores','Licores',1,NULL,'licores'),(32,'','bebidas','Bebidas',1,NULL,'bebidas'),(44,'','energizantess','Energizantes',1,32,'energizantes');

UNLOCK TABLES;

/*Table structure for table `cliente` */

DROP TABLE IF EXISTS `cliente`;

CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `apellidomaterno` char(50) DEFAULT NULL,
  `apellidopaterno` varchar(50) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `dni` char(18) DEFAULT NULL,
  `web` varchar(50) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `telefono1` varchar(15) DEFAULT NULL,
  `telefono2` varchar(15) DEFAULT NULL,
  `movil` varchar(15) DEFAULT NULL,
  `flagactivo` int(11) DEFAULT NULL,
  `ruc` char(14) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT '1',
  `razonsocial` varchar(100) DEFAULT NULL,
  `idconfirm` char(50) DEFAULT NULL,
  `password` char(10) DEFAULT NULL,
  `idtipousuario` int(11) DEFAULT '2',
  PRIMARY KEY (`idcliente`)
) ENGINE=MyISAM AUTO_INCREMENT=488 DEFAULT CHARSET=utf8;

/*Data for the table `cliente` */

LOCK TABLES `cliente` WRITE;

insert  into `cliente`(`idcliente`,`apellidomaterno`,`apellidopaterno`,`nombre`,`direccion`,`dni`,`web`,`correo`,`telefono1`,`telefono2`,`movil`,`flagactivo`,`ruc`,`estado`,`razonsocial`,`idconfirm`,`password`,`idtipousuario`) values (485,'asd','asd','asda','asdasdadad','12312312',NULL,'nazartj@gmail.com','asdasdas',NULL,NULL,NULL,NULL,1,NULL,'','123123',2),(486,'asdasd','asdasd','nazart jhonn ','asdasdasd','34534534',NULL,'nazarjb@hotmail.com','123123',NULL,NULL,NULL,NULL,1,NULL,'','123123',2),(487,'asdad','aasdasd','nazart','SAASDASDASDAD','44513555',NULL,'nazaSrtj@gmail.com','12412312',NULL,NULL,NULL,NULL,1,NULL,'1f51623dcb931fd4cbaff63eb88c8086',NULL,2);

UNLOCK TABLES;

/*Table structure for table `core_session` */

DROP TABLE IF EXISTS `core_session`;

CREATE TABLE `core_session` (
  `Id` varchar(32) NOT NULL,
  `save_path` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '',
  `Modified` int(11) DEFAULT NULL,
  `LifeTime` int(11) DEFAULT NULL,
  `Data` text,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `core_session` */

LOCK TABLES `core_session` WRITE;

insert  into `core_session`(`Id`,`save_path`,`name`,`Modified`,`LifeTime`,`Data`) values ('06oj4hqh7tq18qcm4omvjkq4f3','','',1343514492,1440,'Zend_Auth|a:1:{s:7:\"storage\";O:8:\"stdClass\":12:{s:9:\"IdUsuario\";s:1:\"1\";s:13:\"NombreUsuario\";s:6:\"nazart\";s:16:\"ApellidosUsuario\";s:6:\"huaman\";s:13:\"IdTipousuario\";s:1:\"1\";s:6:\"Estado\";s:1:\"1\";s:5:\"Login\";s:19:\"nazarjb@hotmail.com\";s:8:\"Telefono\";s:8:\"22312223\";s:6:\"Correo\";s:19:\"nazarjb@hotmail.com\";s:16:\"FlagSuperUsuario\";s:1:\"1\";s:9:\"IdCliente\";N;s:3:\"Dni\";s:8:\"44513555\";s:9:\"Direccion\";N;}}'),('8jbsld29r269r353h1vcdpeh27','','',1343281816,1440,'__ZF|a:3:{s:50:\"Zend_Form_Captcha_d53f8a51843d74fe94e7a6be6329dccb\";a:2:{s:4:\"ENNH\";i:1;s:3:\"ENT\";i:1343281816;}s:50:\"Zend_Form_Captcha_8253175824bb0bd191d9e0130f7f22ff\";a:2:{s:4:\"ENNH\";i:1;s:3:\"ENT\";i:1343281816;}s:50:\"Zend_Form_Captcha_30ae8896833d9b6058ac71820ff5b9c7\";a:2:{s:4:\"ENNH\";i:1;s:3:\"ENT\";i:1343282115;}}Zend_Form_Captcha_8253175824bb0bd191d9e0130f7f22ff|a:1:{s:4:\"word\";s:6:\"cuc5x9\";}kmComputer|a:1:{s:14:\"carritoCompras\";a:1:{i:1;a:14:{s:10:\"IdProducto\";s:1:\"1\";s:11:\"IdCategoria\";s:2:\"32\";s:6:\"Codigo\";s:0:\"\";s:6:\"Nombre\";s:33:\"coca cola descartable medio litro\";s:6:\"Imagen\";s:39:\"coca-cola-descartable-medio-litro-1.jpg\";s:11:\"Descripcion\";s:5:\"nuevo\";s:11:\"PrecioVenta\";s:6:\"123.00\";s:10:\"FlagOferta\";s:1:\"1\";s:12:\"PrecioOferta\";s:1:\"0\";s:12:\"PrecioCompra\";s:7:\"1233.00\";s:4:\"Slug\";s:35:\"coca-cola-descartable-medio-litro-1\";s:8:\"Cantidad\";s:3:\"115\";s:8:\"StockMin\";N;s:8:\"cantidad\";s:1:\"1\";}}}Zend_Form_Captcha_30ae8896833d9b6058ac71820ff5b9c7|a:1:{s:4:\"word\";s:6:\"vyu296\";}'),('k70hf8bh1vvhhqa1c3eteku4l0','','',1343500306,1440,'__ZF|a:3:{s:50:\"Zend_Form_Captcha_a3176afbce24773241efcd1d649809e4\";a:2:{s:4:\"ENNH\";i:1;s:3:\"ENT\";i:1343500493;}s:50:\"Zend_Form_Captcha_56c36fd531380881fc63d1c5bfd19348\";a:2:{s:4:\"ENNH\";i:1;s:3:\"ENT\";i:1343500501;}s:50:\"Zend_Form_Captcha_fe000e8dd19330b56c54ee8bf775c25b\";a:2:{s:4:\"ENNH\";i:1;s:3:\"ENT\";i:1343500605;}}Zend_Form_Captcha_a3176afbce24773241efcd1d649809e4|a:1:{s:4:\"word\";s:6:\"n9b4uu\";}Zend_Form_Captcha_56c36fd531380881fc63d1c5bfd19348|a:1:{s:4:\"word\";s:6:\"xyc39i\";}Zend_Form_Captcha_fe000e8dd19330b56c54ee8bf775c25b|a:1:{s:4:\"word\";s:6:\"d3v9b7\";}'),('okn3ug5ila7du622225uli8114','','',1343281328,1440,'__ZF|a:6:{s:50:\"Zend_Form_Captcha_2b4d432c652a6210061e93b62d8d17e9\";a:2:{s:4:\"ENNH\";i:1;s:3:\"ENT\";i:1343281449;}s:50:\"Zend_Form_Captcha_f85e4d7ae7fe893a22f90cf125d60848\";a:2:{s:4:\"ENNH\";i:1;s:3:\"ENT\";i:1343281527;}s:50:\"Zend_Form_Captcha_b84bb59ded0911267de11e9935d56f73\";a:2:{s:4:\"ENNH\";i:1;s:3:\"ENT\";i:1343281581;}s:50:\"Zend_Form_Captcha_6f9b8c4cee6eac92c4cf024dacab0c2d\";a:2:{s:4:\"ENNH\";i:1;s:3:\"ENT\";i:1343281622;}s:50:\"Zend_Form_Captcha_7aaa9d057195c6e9e28b827fa46396ab\";a:2:{s:4:\"ENNH\";i:1;s:3:\"ENT\";i:1343281624;}s:50:\"Zend_Form_Captcha_c12fd492bae35f7c5a2c7fdb37bfbfee\";a:2:{s:4:\"ENNH\";i:1;s:3:\"ENT\";i:1343281628;}}Zend_Form_Captcha_2b4d432c652a6210061e93b62d8d17e9|a:1:{s:4:\"word\";s:6:\"s6j8cy\";}Zend_Form_Captcha_f85e4d7ae7fe893a22f90cf125d60848|a:1:{s:4:\"word\";s:6:\"zuv234\";}Zend_Form_Captcha_b84bb59ded0911267de11e9935d56f73|a:1:{s:4:\"word\";s:6:\"uo4ed8\";}Zend_Form_Captcha_6f9b8c4cee6eac92c4cf024dacab0c2d|a:1:{s:4:\"word\";s:6:\"v5g5u4\";}Zend_Form_Captcha_7aaa9d057195c6e9e28b827fa46396ab|a:1:{s:4:\"word\";s:6:\"pubi58\";}Zend_Form_Captcha_c12fd492bae35f7c5a2c7fdb37bfbfee|a:1:{s:4:\"word\";s:6:\"regy7y\";}');

UNLOCK TABLES;

/*Table structure for table `detalleslug` */

DROP TABLE IF EXISTS `detalleslug`;

CREATE TABLE `detalleslug` (
  `IdDetalleSlug` int(11) NOT NULL AUTO_INCREMENT,
  `IdProducto` int(11) DEFAULT NULL,
  `IdSlug` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdDetalleSlug`)
) ENGINE=InnoDB AUTO_INCREMENT=411 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `detalleslug` */

LOCK TABLES `detalleslug` WRITE;

insert  into `detalleslug`(`IdDetalleSlug`,`IdProducto`,`IdSlug`) values (8,6282,5),(9,6282,1),(10,6282,2),(11,6282,8),(12,6282,9),(13,6283,10),(14,6283,1),(15,6283,2),(16,6283,8),(17,6283,9),(18,6283,11),(291,5,25),(292,5,26),(293,5,27),(294,5,28),(295,5,22),(296,5,23),(297,5,24),(298,5,29),(304,4,30),(305,4,31),(306,4,32),(313,0,34),(314,0,35),(315,0,31),(316,0,27),(317,0,33),(318,0,19),(319,0,36),(320,6,34),(321,6,35),(322,6,31),(323,6,27),(324,6,33),(325,6,19),(326,6,22),(327,6,37),(338,7,38),(339,7,39),(340,7,40),(341,7,41),(342,7,42),(376,3,20),(377,3,31),(378,3,27),(379,3,33),(380,3,19),(381,3,22),(395,2,11),(396,2,8),(397,2,43),(398,2,9),(399,2,15),(400,2,18),(401,2,7),(402,1,1),(403,1,2),(404,1,16),(405,1,8),(406,1,9),(407,1,10),(408,1,15),(409,1,7),(410,1,18);

UNLOCK TABLES;

/*Table structure for table `detalletransaccion` */

DROP TABLE IF EXISTS `detalletransaccion`;

CREATE TABLE `detalletransaccion` (
  `IdDetalleTransaccion` int(11) NOT NULL AUTO_INCREMENT,
  `IdTransaccion` int(11) DEFAULT NULL,
  `IdProducto` int(11) DEFAULT NULL,
  `PrecioProducto` float DEFAULT NULL,
  `PrecioOferta` float DEFAULT NULL,
  `Igv` float DEFAULT NULL,
  PRIMARY KEY (`IdDetalleTransaccion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `detalletransaccion` */

LOCK TABLES `detalletransaccion` WRITE;

UNLOCK TABLES;

/*Table structure for table `imagenproducto` */

DROP TABLE IF EXISTS `imagenproducto`;

CREATE TABLE `imagenproducto` (
  `IdImagen` int(11) NOT NULL AUTO_INCREMENT,
  `IdProducto` int(11) DEFAULT NULL,
  `NombreImagen` text,
  PRIMARY KEY (`IdImagen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `imagenproducto` */

LOCK TABLES `imagenproducto` WRITE;

UNLOCK TABLES;

/*Table structure for table `ofertareciente` */

DROP TABLE IF EXISTS `ofertareciente`;

CREATE TABLE `ofertareciente` (
  `IdOfertaReciente` int(11) NOT NULL AUTO_INCREMENT,
  `IdProducto` int(11) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `Posicion` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdOfertaReciente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ofertareciente` */

LOCK TABLES `ofertareciente` WRITE;

UNLOCK TABLES;

/*Table structure for table `producto` */

DROP TABLE IF EXISTS `producto`;

CREATE TABLE `producto` (
  `IdProducto` int(11) NOT NULL AUTO_INCREMENT,
  `IdCategoria` int(11) NOT NULL,
  `IdCombo` int(11) DEFAULT NULL,
  `IdUnidad` int(11) NOT NULL,
  `Codigo` char(15) NOT NULL,
  `Nombre` char(100) NOT NULL,
  `Descripcion` varchar(150) DEFAULT NULL,
  `PrecioVenta` decimal(10,2) DEFAULT NULL,
  `PrecioCompra` decimal(10,2) DEFAULT NULL,
  `Cantidad` smallint(6) NOT NULL,
  `StockMin` smallint(6) DEFAULT NULL,
  `Peso` decimal(10,2) DEFAULT NULL,
  `Ubicacion` char(4) DEFAULT NULL,
  `Fla` int(11) DEFAULT NULL,
  `Imagen` char(200) DEFAULT NULL,
  `Slug` char(200) DEFAULT NULL,
  `SlugBusqeuda` text,
  `IdSubcategoria` int(11) DEFAULT NULL,
  `FlagPortada` int(1) DEFAULT '0',
  `FlagOferta` int(11) DEFAULT NULL,
  `PrecioOferta` int(11) DEFAULT NULL,
  `Detalle` text,
  PRIMARY KEY (`IdProducto`),
  KEY `fk_art_sub_fam` (`IdCategoria`),
  KEY `fk_art_combo1` (`IdCombo`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `producto` */

LOCK TABLES `producto` WRITE;

insert  into `producto`(`IdProducto`,`IdCategoria`,`IdCombo`,`IdUnidad`,`Codigo`,`Nombre`,`Descripcion`,`PrecioVenta`,`PrecioCompra`,`Cantidad`,`StockMin`,`Peso`,`Ubicacion`,`Fla`,`Imagen`,`Slug`,`SlugBusqeuda`,`IdSubcategoria`,`FlagPortada`,`FlagOferta`,`PrecioOferta`,`Detalle`) values (1,32,NULL,0,'','coca cola descartable medio litro','nuevo','123.00','1233.00',115,NULL,NULL,NULL,1,'coca-cola-descartable-medio-litro-1.jpg','coca-cola-descartable-medio-litro-1','bebida soda gaseosa helada',42,1,1,0,NULL),(2,32,NULL,0,'','pepsi medio litroo','pepsi medio litro','123.00','123.00',-8,NULL,NULL,NULL,1,'pepsi-medio-litroo-2.jpg','pepsi-medio-litroo-2','pepsi medio litro soda helada gaseosa',42,0,0,0,NULL),(3,33,NULL,0,'','Cristal 355 mL 12pack','Cristal 355 mL 12pack','3.45','1.34',-5,NULL,NULL,NULL,1,'cristal-355-ml-12pack-3.jpg','cristal-355-ml-12pack-3','cristal 355 ml 12pack cerveza chela',34,1,1,23,NULL),(4,33,NULL,0,'','Cusqueña 355 mL12pack','Cusqueña 355 mL12pack','2.45','1.34',-17,NULL,NULL,NULL,1,'cusquena-355-ml12pack-4.jpg','cusquena-355-ml12pack-4','cusquena 355 ml12pack',34,1,NULL,NULL,NULL),(5,33,NULL,0,'','Barena 330 mL 6pack','Barena 330 mL 6pack','2.45','0.00',0,NULL,NULL,NULL,1,'barena-330-ml-6pack-5.jpg','barena-330-ml-6pack-5','barena 330 ml 6pack chela six pack sixpack',34,1,NULL,NULL,NULL),(6,33,NULL,0,'','Pilsen Callao 355 mL 12pack','Pilsen Callao 355 mL 12pack','23.00','21.00',0,NULL,NULL,NULL,1,'pilsen-callao-355-ml-12pack-6.jpg','pilsen-callao-355-ml-12pack-6','pilsen callao 355 ml 12pack cerveza chela licor',34,1,NULL,NULL,NULL),(7,33,NULL,0,'','Whisky Johnnie Walker Red Label','Whisky Johnnie Walker Red Label','150.00','100.00',0,NULL,NULL,NULL,1,'whisky-johnnie-walker-red-label-7.jpg','whisky-johnnie-walker-red-label-7','whisky johnnie walker red label',38,1,NULL,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `productodestacado` */

DROP TABLE IF EXISTS `productodestacado`;

CREATE TABLE `productodestacado` (
  `IdProductoDestacado` int(11) NOT NULL AUTO_INCREMENT,
  `IdProducto` int(11) DEFAULT NULL,
  `FechaRegistro` datetime DEFAULT NULL,
  `Posicion` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdProductoDestacado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `productodestacado` */

LOCK TABLES `productodestacado` WRITE;

UNLOCK TABLES;

/*Table structure for table `relacionproductos` */

DROP TABLE IF EXISTS `relacionproductos`;

CREATE TABLE `relacionproductos` (
  `IdRelacionProducto` int(11) NOT NULL AUTO_INCREMENT,
  `IdProducto` int(11) DEFAULT NULL,
  `IdProductoRelacionado` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdRelacionProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `relacionproductos` */

LOCK TABLES `relacionproductos` WRITE;

insert  into `relacionproductos`(`IdRelacionProducto`,`IdProducto`,`IdProductoRelacionado`) values (7,3,4),(8,3,5),(9,3,6),(10,3,7),(11,7,3),(12,7,4),(13,7,5),(14,7,6);

UNLOCK TABLES;

/*Table structure for table `slug` */

DROP TABLE IF EXISTS `slug`;

CREATE TABLE `slug` (
  `IdSlug` int(11) NOT NULL AUTO_INCREMENT,
  `NombreSlug` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IdSlug`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `slug` */

LOCK TABLES `slug` WRITE;

insert  into `slug`(`IdSlug`,`NombreSlug`) values (1,'coca'),(2,'cola'),(3,'wisky'),(4,'ron'),(5,'bebidas'),(6,'pisco'),(7,'gaseosa'),(8,'medio'),(9,'litro'),(10,'bebida'),(11,'pepsi'),(12,'1'),(13,'2'),(14,'cocagaseosabebidasoda'),(15,'soda'),(16,'descartable'),(17,'bebidasodagaseosahelada'),(18,'helada'),(19,'cerveza'),(20,'cristal'),(21,'litros'),(22,'chela'),(23,'six'),(24,'pack'),(25,'barena'),(26,'330'),(27,'ml'),(28,'6pack'),(29,'sixpack'),(30,'cusquena'),(31,'355'),(32,'ml12pack'),(33,'12pack'),(34,'pilsen'),(35,'callao'),(36,'licores'),(37,'licor'),(38,'whisky'),(39,'johnnie'),(40,'walker'),(41,'red'),(42,'label'),(43,'litroo');

UNLOCK TABLES;

/*Table structure for table `tipousuario` */

DROP TABLE IF EXISTS `tipousuario`;

CREATE TABLE `tipousuario` (
  `IdTipoUsuario` int(11) NOT NULL,
  `NombreTipoUsuario` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`IdTipoUsuario`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `tipousuario` */

LOCK TABLES `tipousuario` WRITE;

insert  into `tipousuario`(`IdTipoUsuario`,`NombreTipoUsuario`) values (1,'Usuarios del sistema'),(2,'Clientes');

UNLOCK TABLES;

/*Table structure for table `transaccion` */

DROP TABLE IF EXISTS `transaccion`;

CREATE TABLE `transaccion` (
  `IdTransaccion` int(11) NOT NULL AUTO_INCREMENT,
  `FechaRegistroTransaccion` datetime DEFAULT NULL,
  `FechaPagoTransaccion` datetime DEFAULT NULL,
  `EstadoTransaccion` int(11) DEFAULT NULL,
  `PrecioTransaccion` float DEFAULT NULL,
  `IdUsuario` int(11) DEFAULT NULL,
  `TramaEnvioTransaccion` text,
  `TipoPagoTransaccion` int(11) DEFAULT NULL,
  `TramaRespuesta` text,
  `CipTransaccion` text,
  PRIMARY KEY (`IdTransaccion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `transaccion` */

LOCK TABLES `transaccion` WRITE;

UNLOCK TABLES;

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `IdUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `NombreUsuario` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ApellidosUsuario` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IdTipousuario` int(11) DEFAULT '1',
  `Estado` int(11) DEFAULT '1',
  `Login` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Password` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Telefono` char(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Correo` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FlagSuperUsuario` int(1) DEFAULT '0',
  `IdCliente` int(11) DEFAULT NULL,
  `Dni` int(8) DEFAULT NULL,
  `Direccion` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`IdUsuario`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `usuario` */

LOCK TABLES `usuario` WRITE;

insert  into `usuario`(`IdUsuario`,`NombreUsuario`,`ApellidosUsuario`,`IdTipousuario`,`Estado`,`Login`,`Password`,`Telefono`,`Correo`,`FlagSuperUsuario`,`IdCliente`,`Dni`,`Direccion`) values (1,'nazart','huaman',1,1,'nazarjb@hotmail.com','1231$$123$$4297f44b13955235245b2497399d7a93','22312223','nazarjb@hotmail.com',1,NULL,44513555,NULL);

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
