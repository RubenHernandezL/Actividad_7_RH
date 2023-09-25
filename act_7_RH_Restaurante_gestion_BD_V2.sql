CREATE DATABASE  IF NOT EXISTS `restaurante_gestion` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `restaurante_gestion`;
-- MySQL dump 10.13  Distrib 8.0.33, for macos13 (arm64)
--
-- Host: localhost    Database: restaurante_gestion
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(110) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Nombre: este campo se intuye como el nombre completo y los apellidos del cliente en un solo campo, para ello, podríamos proponer un tinytext, pero vamos a utilizar un varchar de 110 que es más que suficiente. Se pudiese dar el caso en el que el nombre de 2 sea igual, por lo que no se aplicaría el campo unique.',
  `telefono` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Telefono: este campo se va a definir como un varchar, ya que no se van a realizar operaciones numéricas ni nada parecido con los números de teléfono de los clientes. En este caso, para definirlos, se ha tomado la idea de que cualquier persona con cualquier número de teléfono de cualquier país pueda reservar. Para eso decidimos utilizar un varchar de 20 que sería mas que suficiente.\nEn este caso de modelo el teléfono de cada cliente va a ser único, ya que dentro de la misma tabla de clientes solo puede existir un nº de teléfono asignado a una persona específica.',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Email: este campo debe recibir una serie de caracteres como letras, números, caracteres especiales, etc… Por dicho motivo se establece como un varchar 50, ya que se han visto casos de mail extremadamente largos y con esto quedarían cubiertos.\nPor otra parte, el mail es único, dentro de la tabla cliente, solo un cliente podrá poseer un mail específico, no se podrían repetir, ya que es información relacionada a la persona.',
  `m_ocupada` tinyint NOT NULL DEFAULT '0' COMMENT 'm_ocupara: campo que hace referencia a, si ese cliente ya posee una mesa ocupada. Puede ser tratado como un boolean representado por tinyint (1/0). Inicialmente ese cliente al darse de alta, no tiene por qué obligatoriamente estar ocupando una mesa, motivo por el cual se inicializa en 0.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `telefono_UNIQUE` (`telefono`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Juan','123456789','cliente1@example.com',1),(2,'María','987654321','cliente2@example.com',1),(3,'Carlos','456789123','cliente3@example.com',1),(4,'Ana','789123456','cliente4@example.com',1),(5,'Luis','234567890','cliente5@example.com',1),(6,'Laura','654321987','cliente6@example.com',1),(7,'Pedro','345678912','cliente7@example.com',1),(8,'Isabel','567890123','cliente8@example.com',1),(9,'Manuel','678912345','cliente9@example.com',1),(10,'Marta','876543210','cliente10@example.com',1),(11,'Rosa','112233445','cliente11@example.com',1),(12,'Javier','334455667','cliente12@example.com',1),(13,'Carmen','556677889','cliente13@example.com',1),(14,'Pablo','778899001','cliente14@example.com',0),(15,'Patricia','990011223','cliente15@example.com',1);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favoritos`
--

DROP TABLE IF EXISTS `favoritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favoritos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int NOT NULL COMMENT 'Cliente_id: campo que representa la relación entre la tabla clientes y la tabla favoritos.',
  `locales_id` int NOT NULL COMMENT 'locales_id: campo que representa la relación entre la tabla locales y la tabla favoritos.',
  PRIMARY KEY (`id`),
  KEY `fk_locales_has_cliente_cliente1_idx` (`cliente_id`),
  KEY `fk_locales_has_cliente_locales1_idx` (`locales_id`),
  CONSTRAINT `fk_locales_has_cliente_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  CONSTRAINT `fk_locales_has_cliente_locales1` FOREIGN KEY (`locales_id`) REFERENCES `locales` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favoritos`
--

LOCK TABLES `favoritos` WRITE;
/*!40000 ALTER TABLE `favoritos` DISABLE KEYS */;
INSERT INTO `favoritos` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,1),(9,9,2),(10,10,3),(11,1,5),(12,1,3);
/*!40000 ALTER TABLE `favoritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locales`
--

DROP TABLE IF EXISTS `locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locales` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id: para la identificación única del campo un “id” y como todo id del tipo INT , primar key, not null y auto incremental.\n',
  `nombre` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Nombre: es el campo que detalla el nombre del restaurante que debe ser una cadena de caracteres varchar de longitud 60, esto debería ser más que suficiente para cualquier nombre de un restaurante. Si dicho restaurante es una cadena o una franquicia puede repetirse el nombre del mismo, por lo cual no se le aplicaría la propiedad unique.',
  `direccion` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Dirección: Se ha intentado definir como un mediumtext, pero al ser un campo único e intentar hacer el Forward Engneering se genera un error ya que pide que se especifique la longitud del campo. Para subsanar dicho error y como las direcciones dependiendo del lugar de españa (o del mundo), donde se sitúe el local, deben de llevar el país, comunicad autónoma, provincia, calle, edificio, planta, puerta y código postal; se va a definir como un varchar de 200, el cual se estima que es suficiente para definir cualquier dirección. El modelo de negocio necesitan de una dirección física para funcionar, si tomamos en cuentas nuevos modelos como restaurantes de cocinas cerradas, donde los pedidos son a través de aplicaciones de reparto, se puede establecer una única dirección fiscal para la cadena de restaurantes; en cambio si son restaurantes de ir a comer en físico al local, el cual es nuestro caso, la dirección del emplazamiento debería ser única “unique”.',
  `telefono` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Telefono: este campo se va a definir como un varchar, ya que no se van a realizar operaciones numéricas ni nada parecido con los números de teléfono de los locales. En este caso, para definirlos, se ha tomado la idea de que el restaurante se pueda expandir a otros países y o continentes, lo que modificaría el código de área e incrementaría los caracteres del campo. Para enfrentarnos a eso se ha decidido utilizar un varchar de 20 que sería mas que suficiente.\nEn este modelo de negocio el teléfono de cada local va a ser único, para asegurarnos de que cada local esté asociado con un número de teléfono único en la base de datos.',
  `nombre_del_responsable` varchar(110) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Nombre del responsable: este campo se intuye como el nombre completo y los apellidos de la persona responsable del restaurante en un solo campo para ello, podríamos proponer un tinytext, pero utilizaremos un varchar de 110 que es más que suficiente. Se puede dar el caso en que mas de un restaurante de la misa cadena posean 1 solo encargado, y que este, se desplace entre los locales mas cercanos dentro de la misma ciudad, pueblos, etc. Por otra parte se encuentra el caso de que el nombre de 2 responsables sea el mismo, por lo que no se aplicaría el campo unique.',
  `abierto` tinyint NOT NULL DEFAULT '1' COMMENT 'Abierto: será un campo tipo boolean (tinyint) inicializado en 1 ya que al abrir un local o restaurante su estado inicial sería abierto. Si estuviese cerrado sería representado por 0. ',
  PRIMARY KEY (`id`),
  UNIQUE KEY `telefono_UNIQUE` (`telefono`),
  UNIQUE KEY `dirección_UNIQUE` (`direccion`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locales`
--

LOCK TABLES `locales` WRITE;
/*!40000 ALTER TABLE `locales` DISABLE KEYS */;
INSERT INTO `locales` VALUES (1,'El Rincón del Sabor','Calle Principal, Ciudad A','123456789','Juan Pérez',1),(2,'La Trattoria Italiana','Avenida Central, Ciudad B','987654321','María González',1),(3,'Asador Don Carlos','Paseo del Sol, Ciudad C','456789123','Carlos Rodríguez',1),(4,'Sushi Fusion','Calle Sakura, Ciudad D','789123456','Ana López',1),(5,'La Parrillada Argentina','Avenida del Fuego, Ciudad E','234567890','Luis Martínez',1),(6,'El Bistró de la Luna','Calle Luna, Ciudad F','654321987','Laura Sánchez',1),(7,'Taste of India','Avenida Especias, Ciudad G','345678912','Pedro Fernández',1);
/*!40000 ALTER TABLE `locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesas`
--

DROP TABLE IF EXISTS `mesas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mesas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero_mesa` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Número de mesa: ya que varios restaurantes pueden poseer un mismo número de mesa, eso causaría que dicho campo se repitiera en la tabla, por lo que no puede poseer la propiedad unique. Por otra parte, como no se prevee realizar ningún cálculo con el número de la mesa, sino utilizarlo como un identificador únicamente, se le aplica el tipo varchar con una serie de 3 caracteres pudiendo instalar un total de 999 mesas por local.',
  `numero_comensales` int NOT NULL COMMENT 'Numero de comensales: es el numero de personas que ocuparán la mesa, debe ser un número entero y vamos a tener que sacar cálculos matemáticos por lo cual es un INT. El número de comensales se puede repetir si la mesa es de 2, 4 , 6 u 8 puestos, por lo tanto no es un valor único.',
  `ocupada` tinyint NOT NULL DEFAULT '0' COMMENT 'Ocupada: va a ser un campo boolean que va a tener un valor tinyint 0 o 1 dependiendo si se encuentra o no ocupada, cuando se establezca el numero de comensales y el número de mesa, al establecer una nueva mesa en el local, se debe inicializar como 0 ya que no va a estar inmediatamente asignada a ningún cliente.',
  `fecha_ocupacion` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de ocupación: como se quiere registrar de forma precisa la fecha y la hora en que esa mesa fue ocupada, se le va a otorgar un tipo DATETIME, el cual va a estar inicializado con la función NOW() para poder recibir la fecha y hora precisa en que la mesa ha sido ocupada. Este campo puede ser NOT NULL, ya que si la mesa no se encuentra ocupada, debe representarse como un campo vacío. Por otra parte,  puede que 2 mesas se ocupen o se reserven a la misma hora en la misma fecha, por lo cual tampoco sería un valor único en la tabla “no es unique”.',
  `locales_id` int NOT NULL COMMENT 'locales_id : es el campo relacional entre las mesas y el local.',
  `cliente_id` int DEFAULT NULL COMMENT 'Cliente_id: es el campo relacional entre el cliente y las mesas, inicialmente cuando se colocan nuevas mesas en un local, estas no se encuentran asignadas a ningún cliente, por lo tanto debe se inicializarme como NULL. El campo debe permanecer como NULL mientras no se encuentre reservada ni ocupada por ningún cliente. Por dicho motivo no es un campo nulo.\nComo un cliente es capaz de poder reservar y ocupar varias mesas dependiendo del número de comensales, tampoco se podría definir como un campo único.',
  PRIMARY KEY (`id`),
  KEY `fk_mesas_locales_idx` (`locales_id`),
  KEY `fk_mesas_cliente1_idx` (`cliente_id`),
  CONSTRAINT `fk_mesas_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  CONSTRAINT `fk_mesas_locales` FOREIGN KEY (`locales_id`) REFERENCES `locales` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesas`
--

LOCK TABLES `mesas` WRITE;
/*!40000 ALTER TABLE `mesas` DISABLE KEYS */;
INSERT INTO `mesas` VALUES (1,'1',4,1,'2023-09-22 13:00:00',1,1),(2,'2',2,0,NULL,1,NULL),(3,'3',6,0,NULL,1,NULL),(4,'4',8,1,'2023-09-22 14:00:00',1,2),(5,'1',2,1,'2023-09-22 15:00:00',2,4),(6,'2',4,0,NULL,2,NULL),(7,'3',6,1,'2023-09-22 16:00:00',2,5),(8,'4',8,0,NULL,2,NULL),(9,'1',4,1,'2023-09-22 17:00:00',3,7),(10,'2',2,0,NULL,3,NULL),(11,'3',6,0,NULL,3,NULL),(12,'4',8,1,'2023-09-22 18:00:00',3,8),(13,'1',2,0,NULL,4,NULL),(14,'2',4,1,'2023-09-22 19:00:00',4,9),(15,'3',6,0,NULL,4,NULL),(16,'4',8,1,'2023-09-22 20:00:00',4,10),(17,'1',4,1,'2023-09-22 21:00:00',5,12),(18,'2',2,0,NULL,5,NULL),(19,'3',6,0,NULL,5,NULL),(20,'4',8,1,'2023-09-22 22:00:00',5,13),(21,'1',4,1,'2023-09-22 23:00:00',6,15),(22,'2',2,0,NULL,6,NULL),(23,'3',6,0,NULL,6,NULL),(24,'4',8,1,'2023-09-22 22:00:00',6,3),(25,'1',4,1,'2023-09-22 21:00:00',7,6),(26,'2',2,0,NULL,7,NULL),(27,'3',6,0,NULL,7,NULL),(28,'4',8,1,'2023-09-22 20:00:00',7,11);
/*!40000 ALTER TABLE `mesas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-25 18:43:42
