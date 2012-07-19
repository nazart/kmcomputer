/*
SQLyog Enterprise - MySQL GUI v8.02 RC
MySQL - 5.5.15-log : Database - kmcomputer
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`kmcomputer` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `kmcomputer`;

/*Table structure for table `articulo` */

DROP TABLE IF EXISTS `articulo`;

CREATE TABLE `articulo` (
  `idarticulo` int(11) NOT NULL AUTO_INCREMENT,
  `idcategoria` int(11) NOT NULL,
  `idcombo` int(11) DEFAULT NULL,
  `idunidad` int(11) NOT NULL,
  `codigo` char(15) NOT NULL,
  `nombre` char(100) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `precioventa` decimal(10,2) DEFAULT NULL,
  `preciocompra` decimal(10,2) DEFAULT NULL,
  `cantidad` smallint(6) NOT NULL,
  `stock_min` smallint(6) DEFAULT NULL,
  `peso` decimal(10,2) DEFAULT NULL,
  `ubicacion` char(4) DEFAULT NULL,
  `fla` int(11) DEFAULT NULL,
  `imagen` char(200) DEFAULT NULL,
  `slug` char(200) DEFAULT NULL,
  `slugbusqueda` text,
  `idsubcategoria` int(11) DEFAULT NULL,
  `flagportada` int(1) DEFAULT '0',
  `flagoferta` int(11) DEFAULT NULL,
  `preciooferta` int(11) DEFAULT NULL,
  PRIMARY KEY (`idarticulo`),
  KEY `fk_art_sub_fam` (`idcategoria`),
  KEY `fk_art_combo1` (`idcombo`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `articulo` */

LOCK TABLES `articulo` WRITE;

insert  into `articulo`(`idarticulo`,`idcategoria`,`idcombo`,`idunidad`,`codigo`,`nombre`,`descripcion`,`precioventa`,`preciocompra`,`cantidad`,`stock_min`,`peso`,`ubicacion`,`fla`,`imagen`,`slug`,`slugbusqueda`,`idsubcategoria`,`flagportada`,`flagoferta`,`preciooferta`) values (1,32,NULL,0,'','coca cola descartable medio litro','nuevo','123.00','1233.00',115,NULL,NULL,NULL,1,'coca-cola-descartable-medio-litro-1.jpg','coca-cola-descartable-medio-litro-1','bebida soda gaseosa helada',42,1,1,0),(2,32,NULL,0,'','pepsi medio litroo','pepsi medio litro','123.00','123.00',-8,NULL,NULL,NULL,1,'pepsi-medio-litroo-2.jpg','pepsi-medio-litroo-2','pepsi medio litro soda helada gaseosa',42,0,0,0),(3,33,NULL,0,'','Cristal 355 mL 12pack','Cristal 355 mL 12pack','3.45','1.34',-5,NULL,NULL,NULL,1,'cristal-355-ml-12pack-3.jpg','cristal-355-ml-12pack-3','cristal 355 ml 12pack cerveza chela',34,1,1,23),(4,33,NULL,0,'','Cusqueña 355 mL12pack','Cusqueña 355 mL12pack','2.45','1.34',-17,NULL,NULL,NULL,1,'cusquena-355-ml12pack-4.jpg','cusquena-355-ml12pack-4','cusquena 355 ml12pack',34,1,NULL,NULL),(5,33,NULL,0,'','Barena 330 mL 6pack','Barena 330 mL 6pack','2.45','0.00',0,NULL,NULL,NULL,1,'barena-330-ml-6pack-5.jpg','barena-330-ml-6pack-5','barena 330 ml 6pack chela six pack sixpack',34,1,NULL,NULL),(6,33,NULL,0,'','Pilsen Callao 355 mL 12pack','Pilsen Callao 355 mL 12pack','23.00','21.00',0,NULL,NULL,NULL,1,'pilsen-callao-355-ml-12pack-6.jpg','pilsen-callao-355-ml-12pack-6','pilsen callao 355 ml 12pack cerveza chela licor',34,1,NULL,NULL),(7,33,NULL,0,'','Whisky Johnnie Walker Red Label','Whisky Johnnie Walker Red Label','150.00','100.00',0,NULL,NULL,NULL,1,'whisky-johnnie-walker-red-label-7.jpg','whisky-johnnie-walker-red-label-7','whisky johnnie walker red label',38,1,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `banner` */

DROP TABLE IF EXISTS `banner`;

CREATE TABLE `banner` (
  `idbanner` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8_unicode_ci,
  `imagen` varchar(600) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(600) COLLATE utf8_unicode_ci DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `orden` tinyint(4) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`idbanner`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `banner` */

LOCK TABLES `banner` WRITE;

insert  into `banner`(`idbanner`,`nombre`,`descripcion`,`imagen`,`url`,`precio`,`orden`,`estado`) values (1,'foto 1',NULL,'pame.jpg',NULL,NULL,1,1),(4,'Banner4','esto es un banner','banner4-4.jpg','www.google.com',150,NULL,1),(5,'chelo','gae','chelo-5.jpg','asdasdas',25,2,1);

UNLOCK TABLES;

/*Table structure for table `categoria` */

DROP TABLE IF EXISTS `categoria`;

CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `nombre` char(50) DEFAULT NULL,
  `estado` int(1) DEFAULT '1',
  `idpadre` int(11) DEFAULT NULL,
  PRIMARY KEY (`idcategoria`),
  FULLTEXT KEY `cod` (`codigo`),
  FULLTEXT KEY `des` (`descripcion`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

/*Data for the table `categoria` */

LOCK TABLES `categoria` WRITE;

insert  into `categoria`(`idcategoria`,`codigo`,`descripcion`,`nombre`,`estado`,`idpadre`) values (38,'','Whisky','Whisky',1,33),(42,'','Gaseosas','Gaseosas',1,32),(41,'','Pisco','Pisco',1,33),(40,'','Ron','Ron',1,33),(39,'','Vodka','Vodka',1,33),(37,'','Hielo y Otros','Hielo y Otros',1,NULL),(43,'CG','CIgarrillos de diferentes marcas','Cigarros',1,NULL),(35,'','Snacks y Piqueos','Snacks y Piqueos',1,NULL),(34,'','Cerveza','Cerveza',1,33),(33,'','Licores','Licores',1,NULL),(32,'','bebidas','Bebidas',1,NULL),(44,'','energizantess','Energizantes',1,32);

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

insert  into `core_session`(`Id`,`save_path`,`name`,`Modified`,`LifeTime`,`Data`) values ('11pal61qtf7h9e95i3micr3m54','','',1330903615,1440,''),('1kijr3rnsof5pnlk824h0mrcm1','','',1335572515,1440,''),('1ktvj41tm7un00jv5va0si9hd6','','',1335572405,1440,''),('2895a5jvbpgs1hcgrfrgcsn4o2','','',1335572389,1440,''),('2oc77732389bj8k4inavkji5h1','','',1332029428,1440,'dojo|a:1:{s:13:\"listaArticulo\";a:2:{i:3;a:22:{s:10:\"idarticulo\";s:1:\"3\";s:11:\"idcategoria\";s:2:\"33\";s:7:\"idcombo\";N;s:8:\"idunidad\";s:1:\"0\";s:6:\"codigo\";s:0:\"\";s:6:\"nombre\";s:21:\"Cristal 355 mL 12pack\";s:11:\"descripcion\";s:21:\"Cristal 355 mL 12pack\";s:11:\"precioventa\";s:4:\"3.45\";s:12:\"preciocompra\";s:4:\"1.34\";s:8:\"cantidad\";s:2:\"-5\";s:9:\"stock_min\";N;s:4:\"peso\";N;s:9:\"ubicacion\";N;s:3:\"fla\";s:1:\"1\";s:6:\"imagen\";s:27:\"cristal-355-ml-12pack-3.jpg\";s:4:\"slug\";s:23:\"cristal-355-ml-12pack-3\";s:12:\"slugbusqueda\";s:35:\"cristal 355 ml 12pack cerveza chela\";s:14:\"idsubcategoria\";s:2:\"34\";s:11:\"flagportada\";s:1:\"1\";s:10:\"flagoferta\";s:1:\"1\";s:12:\"preciooferta\";s:2:\"23\";s:16:\"cantidadArticulo\";i:2;}i:7;a:22:{s:10:\"idarticulo\";s:1:\"7\";s:11:\"idcategoria\";s:2:\"33\";s:7:\"idcombo\";N;s:8:\"idunidad\";s:1:\"0\";s:6:\"codigo\";s:0:\"\";s:6:\"nombre\";s:31:\"Whisky Johnnie Walker Red Label\";s:11:\"descripcion\";s:31:\"Whisky Johnnie Walker Red Label\";s:11:\"precioventa\";s:6:\"150.00\";s:12:\"preciocompra\";s:6:\"100.00\";s:8:\"cantidad\";s:1:\"0\";s:9:\"stock_min\";N;s:4:\"peso\";N;s:9:\"ubicacion\";N;s:3:\"fla\";s:1:\"1\";s:6:\"imagen\";s:37:\"whisky-johnnie-walker-red-label-7.jpg\";s:4:\"slug\";s:33:\"whisky-johnnie-walker-red-label-7\";s:12:\"slugbusqueda\";s:31:\"whisky johnnie walker red label\";s:14:\"idsubcategoria\";s:2:\"38\";s:11:\"flagportada\";s:1:\"1\";s:10:\"flagoferta\";N;s:12:\"preciooferta\";N;s:16:\"cantidadArticulo\";s:1:\"1\";}}}'),('2p06fnbhhh7k9uo3q8ah6pm8d4','','',1330000578,1440,'CESecurity|s:320:\"MzAwfDEwMDAwfDEwMDB8MTAwMHwxMDAwfC9VcGxvYWRzfC9VcGxvYWRzfC9VcGxvYWRzfC9UZW1wbGF0ZXN8L1VwbG9hZHN8dHJ1ZXx0cnVlfHRydWV8dHJ1ZXwuanBnLC5qcGVnLC5naWYsLnBuZ3wuYXZpLC5tcGcsLm1wZWcsLm1wMywud2F2LC53bXZ8LnR4dCwuZG9jLC5wZGYsLnppcCwucmFyLC5hdmksLm1wZywubXBlZywuanBnLC5qcGVnLC5naWYsLnBuZywuaHRtfC5odG1sLC5odG18ZW4tZW58fHx8fHxmYWxzZXw=\";'),('43pm1h6tnu1t29jrl0luiins72','','',1342393535,1440,''),('5a035u6ksu6sgupf2ph5gk8ap2','','',1330658741,1440,''),('5h6n6iur89u7ubd3irng1rb400','','',1335573101,1440,''),('5jjc3fuimdg2pl8q79viq421c4','','',1335572457,1440,''),('5mal51r1jjp837n5g6cdctijc2','','',1335572454,1440,''),('6ekni216sklfqgr74vjgq6q6b7','','',1335572557,1440,''),('7jp727buov6v6jj2ev60vlbpp5','','',1335572568,1440,''),('8khjs93jcbg6glg309f7nj4n03','','',1335572384,1440,''),('8rfuk9tg4fkv2va76kg21ej4j2','','',1335572415,1440,''),('9205603d0envca483v8fnbncs5','','',1335572531,1440,''),('96f1opqrk6u0st85doilsu4vf6','','',1335572524,1440,''),('ab8gscs5ks9lkmoa8mb1ispu50','','',1330185608,1440,'Zend_Auth|a:1:{s:7:\"storage\";O:8:\"stdClass\":17:{s:9:\"idcliente\";s:3:\"486\";s:15:\"apellidomaterno\";s:6:\"asdasd\";s:15:\"apellidopaterno\";s:6:\"asdasd\";s:6:\"nombre\";s:13:\"nazart jhonn \";s:9:\"direccion\";s:9:\"asdasdasd\";s:3:\"dni\";s:8:\"34534534\";s:3:\"web\";N;s:6:\"correo\";s:19:\"nazarjb@hotmail.com\";s:9:\"telefono1\";s:6:\"123123\";s:9:\"telefono2\";N;s:5:\"movil\";N;s:10:\"flagactivo\";N;s:3:\"ruc\";N;s:6:\"estado\";s:1:\"1\";s:11:\"razonsocial\";N;s:9:\"idconfirm\";s:0:\"\";s:13:\"idtipousuario\";s:1:\"2\";}}dojo|a:1:{s:13:\"listaArticulo\";N;}'),('auk1b87c5m2ee3q3o7608uobi1','','',1335572537,1440,''),('c6gi96gbdj743vbhd4ps9mlmh3','','',1332030351,1440,'dojo|a:1:{s:13:\"listaArticulo\";a:0:{}}'),('cdfsgnb6l6b77dk9flh1568o56','','',1335572491,1440,''),('cf8hh0vfr1a4ajp48qh1tjmrm6','','',1335572440,1440,''),('d2b1ik3r89iek7obkclbogr8d5','','',1335572445,1440,''),('d73nidr2h9qv6an44hvircnih7','','',1335572602,1440,''),('dn2078lhkt0eobmkb7bjrhfd56','','',1335572547,1440,''),('ega4est4occqid07iii842n4q5','','',1335572481,1440,''),('ehb772skkumupae0gi2nsl51b5','','',1335572520,1440,''),('f4qu9423s186e0kgrrb0p3ij17','','',1335573239,1440,''),('g14eneutborinlfacv3sjmv921','','',1335572511,1440,''),('g6gm2b6fn5l95nc84og47qrbf1','','',1335572348,1440,''),('gm4gc94vg5b6j0kumrvldsfq21','','',1339650452,1440,''),('gq08bnl1t298jbs9vdrjm9v8v1','','',1330400618,1440,'dojo|a:1:{s:9:\"idCliente\";N;}'),('h1pvfc6n6i15evtsord5jb3qh0','','',1335572392,1440,''),('h9p198fd08cunp282ibjrb0fg2','','',1335572379,1440,'dojo|a:1:{s:13:\"listaArticulo\";N;}'),('hsjtou3t2hmh8fe7fo3h3fhce5','','',1335572551,1440,''),('hutipa5j41o7v89obid20nkaa2','','',1330152230,1440,''),('imog4rkf450c3umuham91h1sm4','','',1331777418,1440,''),('jcsnjvmp9ljlnvitmvdje6un16','','',1335572527,1440,''),('kqm2bjmbh5kld5t511joe9adk3','','',1335572428,1440,''),('lkfs9mdnt9e9a399plt0g379k1','','',1335572460,1440,''),('luaeq0pfdium7o1dd1hf9kvl92','','',1331610341,1440,''),('mbefrif5ggd9tehvsfg605plm0','','',1335572493,1440,''),('mtf74mc0ugsigfqhm6e8eu21a5','','',1335572485,1440,''),('mulgnh6bb25ttm7su7jkhm6uo6','','',1335572423,1440,''),('n24u2336v71kf966nj5d2pd212','','',1335572505,1440,''),('n36ea8f8b2toqq9vmliqhors61','','',1335572410,1440,''),('n817l3saf30tg1shsjtrvqi8f1','','',1335572362,1440,''),('nf80drh08qsqevb35s75q8vl02','','',1335572543,1440,''),('os2vu3debvt8v1g72mubjr3bl4','','',1330060938,1440,'Zend_Auth|a:1:{s:7:\"storage\";O:8:\"stdClass\":13:{s:9:\"idusuario\";s:1:\"1\";s:6:\"nombre\";s:6:\"nazart\";s:15:\"apellidopaterno\";s:6:\"huaman\";s:15:\"apellidomaterno\";s:4:\"jara\";s:13:\"idtipousuario\";s:1:\"1\";s:6:\"estado\";s:1:\"1\";s:5:\"login\";s:19:\"nazarjb@hotmail.com\";s:8:\"telefono\";s:8:\"22312223\";s:6:\"correo\";s:19:\"nazarjb@hotmail.com\";s:16:\"FlagSuperUsuario\";s:1:\"1\";s:9:\"idcliente\";N;s:3:\"dni\";s:8:\"44513555\";s:9:\"direccion\";N;}}dojo|a:1:{s:15:\"articuloEnLista\";a:0:{}}'),('osa1s07bgrtpt1avmch4eaq1p6','','',1335572498,1440,''),('pjhi9jbcsfq0adq1ct7ghoh7o3','','',1335572467,1440,''),('pq7n28r1sajqrp1iqbhi45itu6','','',1330658369,1440,''),('qftv5g3viv02qto0u7igb880i3','','',1335572419,1440,''),('ruv0fip692bhh803svs6erid25','','',1335572536,1440,''),('s4gq0rjdtuuqkblp8pqnk1kfb3','','',1335572472,1440,''),('s5e10v8dn55mkqjt1regomp5l7','','',1335572435,1440,''),('tqsn11v2bjti5r9249ds6tnnv5','','',1335572449,1440,''),('vtjaaikm5etq4u5d7ekc15tvs1','','',1330659181,1440,'dojo|a:2:{s:13:\"listaArticulo\";a:1:{i:3;a:22:{s:10:\"idarticulo\";s:1:\"3\";s:11:\"idcategoria\";s:2:\"33\";s:7:\"idcombo\";N;s:8:\"idunidad\";s:1:\"0\";s:6:\"codigo\";s:0:\"\";s:6:\"nombre\";s:21:\"Cristal 355 mL 12pack\";s:11:\"descripcion\";s:21:\"Cristal 355 mL 12pack\";s:11:\"precioventa\";s:4:\"3.45\";s:12:\"preciocompra\";s:4:\"1.34\";s:8:\"cantidad\";s:2:\"-5\";s:9:\"stock_min\";N;s:4:\"peso\";N;s:9:\"ubicacion\";N;s:3:\"fla\";s:1:\"1\";s:6:\"imagen\";s:27:\"cristal-355-ml-12pack-3.jpg\";s:4:\"slug\";s:23:\"cristal-355-ml-12pack-3\";s:12:\"slugbusqueda\";s:35:\"cristal 355 ml 12pack cerveza chela\";s:14:\"idsubcategoria\";s:2:\"34\";s:11:\"flagportada\";s:1:\"1\";s:10:\"flagoferta\";s:1:\"1\";s:12:\"preciooferta\";s:2:\"23\";s:16:\"cantidadArticulo\";s:1:\"1\";}}s:9:\"idCliente\";s:3:\"486\";}Zend_Auth|a:1:{s:7:\"storage\";O:8:\"stdClass\":17:{s:9:\"idcliente\";s:3:\"486\";s:15:\"apellidomaterno\";s:6:\"asdasd\";s:15:\"apellidopaterno\";s:6:\"asdasd\";s:6:\"nombre\";s:13:\"nazart jhonn \";s:9:\"direccion\";s:9:\"asdasdasd\";s:3:\"dni\";s:8:\"34534534\";s:3:\"web\";N;s:6:\"correo\";s:19:\"nazarjb@hotmail.com\";s:9:\"telefono1\";s:6:\"123123\";s:9:\"telefono2\";N;s:5:\"movil\";N;s:10:\"flagactivo\";N;s:3:\"ruc\";N;s:6:\"estado\";s:1:\"1\";s:11:\"razonsocial\";N;s:9:\"idconfirm\";s:0:\"\";s:13:\"idtipousuario\";s:1:\"2\";}}');

UNLOCK TABLES;

/*Table structure for table `detalleslug` */

DROP TABLE IF EXISTS `detalleslug`;

CREATE TABLE `detalleslug` (
  `iddetalleslug` int(11) NOT NULL AUTO_INCREMENT,
  `idarticulo` int(11) DEFAULT NULL,
  `idslug` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddetalleslug`)
) ENGINE=InnoDB AUTO_INCREMENT=411 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `detalleslug` */

LOCK TABLES `detalleslug` WRITE;

insert  into `detalleslug`(`iddetalleslug`,`idarticulo`,`idslug`) values (8,6282,5),(9,6282,1),(10,6282,2),(11,6282,8),(12,6282,9),(13,6283,10),(14,6283,1),(15,6283,2),(16,6283,8),(17,6283,9),(18,6283,11),(291,5,25),(292,5,26),(293,5,27),(294,5,28),(295,5,22),(296,5,23),(297,5,24),(298,5,29),(304,4,30),(305,4,31),(306,4,32),(313,0,34),(314,0,35),(315,0,31),(316,0,27),(317,0,33),(318,0,19),(319,0,36),(320,6,34),(321,6,35),(322,6,31),(323,6,27),(324,6,33),(325,6,19),(326,6,22),(327,6,37),(338,7,38),(339,7,39),(340,7,40),(341,7,41),(342,7,42),(376,3,20),(377,3,31),(378,3,27),(379,3,33),(380,3,19),(381,3,22),(395,2,11),(396,2,8),(397,2,43),(398,2,9),(399,2,15),(400,2,18),(401,2,7),(402,1,1),(403,1,2),(404,1,16),(405,1,8),(406,1,9),(407,1,10),(408,1,15),(409,1,7),(410,1,18);

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

/*Table structure for table `relacionararticulo` */

DROP TABLE IF EXISTS `relacionararticulo`;

CREATE TABLE `relacionararticulo` (
  `idrelacionarticulo` int(11) NOT NULL AUTO_INCREMENT,
  `idarticulo` int(11) DEFAULT NULL,
  `idarticulorelacionado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idrelacionarticulo`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `relacionararticulo` */

LOCK TABLES `relacionararticulo` WRITE;

insert  into `relacionararticulo`(`idrelacionarticulo`,`idarticulo`,`idarticulorelacionado`) values (7,3,4),(8,3,5),(9,3,6),(10,3,7),(11,7,3),(12,7,4),(13,7,5),(14,7,6);

UNLOCK TABLES;

/*Table structure for table `slug` */

DROP TABLE IF EXISTS `slug`;

CREATE TABLE `slug` (
  `idslug` int(11) NOT NULL AUTO_INCREMENT,
  `nombreslug` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idslug`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `slug` */

LOCK TABLES `slug` WRITE;

insert  into `slug`(`idslug`,`nombreslug`) values (1,'coca'),(2,'cola'),(3,'wisky'),(4,'ron'),(5,'bebidas'),(6,'pisco'),(7,'gaseosa'),(8,'medio'),(9,'litro'),(10,'bebida'),(11,'pepsi'),(12,'1'),(13,'2'),(14,'cocagaseosabebidasoda'),(15,'soda'),(16,'descartable'),(17,'bebidasodagaseosahelada'),(18,'helada'),(19,'cerveza'),(20,'cristal'),(21,'litros'),(22,'chela'),(23,'six'),(24,'pack'),(25,'barena'),(26,'330'),(27,'ml'),(28,'6pack'),(29,'sixpack'),(30,'cusquena'),(31,'355'),(32,'ml12pack'),(33,'12pack'),(34,'pilsen'),(35,'callao'),(36,'licores'),(37,'licor'),(38,'whisky'),(39,'johnnie'),(40,'walker'),(41,'red'),(42,'label'),(43,'litroo');

UNLOCK TABLES;

/*Table structure for table `tipousuario` */

DROP TABLE IF EXISTS `tipousuario`;

CREATE TABLE `tipousuario` (
  `idtipousuario` int(11) NOT NULL,
  `nombretipousuario` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idtipousuario`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `tipousuario` */

LOCK TABLES `tipousuario` WRITE;

insert  into `tipousuario`(`idtipousuario`,`nombretipousuario`) values (1,'Usuarios del sistema'),(2,'Clientes');

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
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apellidopaterno` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apellidomaterno` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idtipousuario` int(11) DEFAULT '1',
  `estado` int(11) DEFAULT '1',
  `login` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono` char(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `correo` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FlagSuperUsuario` int(1) DEFAULT '0',
  `idcliente` int(11) DEFAULT NULL,
  `dni` int(8) DEFAULT NULL,
  `direccion` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`idusuario`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `usuario` */

LOCK TABLES `usuario` WRITE;

insert  into `usuario`(`idusuario`,`nombre`,`apellidopaterno`,`apellidomaterno`,`idtipousuario`,`estado`,`login`,`password`,`telefono`,`correo`,`FlagSuperUsuario`,`idcliente`,`dni`,`direccion`) values (1,'nazart','huaman','jara',1,1,'nazarjb@hotmail.com','123123','22312223','nazarjb@hotmail.com',1,NULL,44513555,NULL);

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
