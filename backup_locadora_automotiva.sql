-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: locadora_automotiva
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

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
-- Table structure for table `aluguel`
--

DROP TABLE IF EXISTS `aluguel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluguel` (
  `alu_id` int(11) NOT NULL AUTO_INCREMENT,
  `alu_data_retirada` date DEFAULT NULL,
  `alu_data_entrega` date DEFAULT NULL,
  `alu_fk_forma_pagamento` int(11) DEFAULT NULL,
  `alu_total` float(10,2) NOT NULL,
  `alu_parcelas` int(11) NOT NULL,
  `alu_obs_entrega` varchar(200) DEFAULT NULL,
  `alu_fk_cliente` int(11) NOT NULL,
  `alu_fk_vendedor` int(11) NOT NULL,
  PRIMARY KEY (`alu_id`),
  KEY `alu_fk_forma_pagamento` (`alu_fk_forma_pagamento`),
  KEY `alu_fk_cliente` (`alu_fk_cliente`),
  KEY `alu_fk_vendedor` (`alu_fk_vendedor`),
  CONSTRAINT `aluguel_ibfk_1` FOREIGN KEY (`alu_fk_forma_pagamento`) REFERENCES `forma_pagamento` (`pag_id`),
  CONSTRAINT `aluguel_ibfk_2` FOREIGN KEY (`alu_fk_cliente`) REFERENCES `cliente` (`cli_id`),
  CONSTRAINT `aluguel_ibfk_3` FOREIGN KEY (`alu_fk_vendedor`) REFERENCES `vendedor` (`vend_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluguel`
--

LOCK TABLES `aluguel` WRITE;
/*!40000 ALTER TABLE `aluguel` DISABLE KEYS */;
/*!40000 ALTER TABLE `aluguel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aluguel_automovel`
--

DROP TABLE IF EXISTS `aluguel_automovel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluguel_automovel` (
  `aluaut_id` int(11) NOT NULL AUTO_INCREMENT,
  `aluaut_fk_aluguel` int(11) NOT NULL,
  `aluaut_fk_automovel` int(11) NOT NULL,
  `aluaut_valor` float(10,2) DEFAULT NULL,
  `aluaut_km_retirada` int(11) DEFAULT NULL,
  PRIMARY KEY (`aluaut_id`),
  KEY `aluaut_fk_automovel` (`aluaut_fk_automovel`),
  KEY `aluaut_fk_aluguel` (`aluaut_fk_aluguel`),
  CONSTRAINT `aluguel_automovel_ibfk_1` FOREIGN KEY (`aluaut_fk_automovel`) REFERENCES `automovel` (`aut_id`),
  CONSTRAINT `aluguel_automovel_ibfk_2` FOREIGN KEY (`aluaut_fk_aluguel`) REFERENCES `aluguel` (`alu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluguel_automovel`
--

LOCK TABLES `aluguel_automovel` WRITE;
/*!40000 ALTER TABLE `aluguel_automovel` DISABLE KEYS */;
/*!40000 ALTER TABLE `aluguel_automovel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `automovel`
--

DROP TABLE IF EXISTS `automovel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `automovel` (
  `aut_id` int(11) NOT NULL AUTO_INCREMENT,
  `aut_tipo_automovel` varchar(50) NOT NULL,
  `aut_categoria` varchar(50) DEFAULT NULL,
  `aut_placa` varchar(10) NOT NULL,
  `aut_fk_modelo` int(11) NOT NULL,
  `aut_cor` varchar(50) NOT NULL,
  `aut_observacao` varchar(200) DEFAULT NULL,
  `aut_fabricacao` date DEFAULT NULL,
  `aut_fk_fornecedor` int(11) NOT NULL,
  `preco_aluguel` float(10,2) DEFAULT NULL,
  `preco_venda` float(10,2) DEFAULT NULL,
  `custo_compra` float(10,2) DEFAULT NULL,
  `aut_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`aut_id`),
  KEY `aut_fk_fornecedor` (`aut_fk_fornecedor`),
  KEY `aut_fk_modelo` (`aut_fk_modelo`),
  CONSTRAINT `automovel_ibfk_1` FOREIGN KEY (`aut_fk_fornecedor`) REFERENCES `fornecedor` (`for_id`),
  CONSTRAINT `automovel_ibfk_2` FOREIGN KEY (`aut_fk_modelo`) REFERENCES `modelo` (`mod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automovel`
--

LOCK TABLES `automovel` WRITE;
/*!40000 ALTER TABLE `automovel` DISABLE KEYS */;
INSERT INTO `automovel` VALUES (1,'Carro','Hatchback','7899ERT',1,'Branco','Apresenta leve arranhão na parte traseira','2014-07-03',1,100.00,200000.00,150000.00,'Alugado'),(2,'Carro','SUV','X43Z78C',2,'Azul','N/A','2020-06-05',1,350.00,500000.00,450000.00,'Vendido'),(3,'Carro','SUV','DRT8990',3,'Cinza','N/A','2017-01-04',1,490.00,350000.00,300000.00,'Disponível'),(4,'Carro','SUV','KQJ1495',4,'Cinza','N/A','2018-03-07',1,270.00,190000.00,140000.00,'Disponível'),(5,'Carro','SUV','HNM3456',5,'Azul','N/A','2021-07-04',1,600.00,570000.00,520000.00,'Vendido'),(6,'Carro','Sedan','SXC1356',6,'Vermelho','N/A','2020-05-01',1,780.00,630000.00,580000.00,'Vendido'),(7,'Carro','Hatchback','8465UIO',7,'Cinza','N/A','2022-01-04',1,945.00,800000.00,750000.00,'Vendido');
/*!40000 ALTER TABLE `automovel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `cli_id` int(11) NOT NULL AUTO_INCREMENT,
  `cli_nome` varchar(100) NOT NULL,
  `cli_contato` varchar(50) NOT NULL,
  `cli_cpf` varchar(50) NOT NULL,
  `cli_cep` varchar(50) DEFAULT NULL,
  `cli_cidade` varchar(50) DEFAULT NULL,
  `cli_rua` varchar(50) DEFAULT NULL,
  `cli_bairro` varchar(50) DEFAULT NULL,
  `cli_numero` int(11) DEFAULT NULL,
  `cli_cnh` varchar(50) DEFAULT NULL,
  `cli_logradouro` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cli_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Aislan Mota de Oliveira','75992289795','09513368513','44009144','Feira de Santana','E','Calumbi',10,'7846542','Cam. 15'),(2,'Zubeia','40028922','98127304','09170342','Feira de Santana','C','Muchila',12,'8273920','Cam. B5');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forma_pagamento`
--

DROP TABLE IF EXISTS `forma_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forma_pagamento` (
  `pag_id` int(11) NOT NULL AUTO_INCREMENT,
  `pag_nome` varchar(50) NOT NULL,
  PRIMARY KEY (`pag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_pagamento`
--

LOCK TABLES `forma_pagamento` WRITE;
/*!40000 ALTER TABLE `forma_pagamento` DISABLE KEYS */;
INSERT INTO `forma_pagamento` VALUES (1,'PIX'),(2,'Cartão Débito'),(3,'Cartão Crédito'),(4,'Financiamento'),(5,'Dinheiro'),(6,'Boleto');
/*!40000 ALTER TABLE `forma_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `for_id` int(11) NOT NULL AUTO_INCREMENT,
  `for_nome` varchar(100) NOT NULL,
  `for_cnpj` varchar(20) NOT NULL,
  `for_contato` varchar(20) DEFAULT NULL,
  `for_cep` varchar(50) DEFAULT NULL,
  `for_pais` varchar(50) DEFAULT NULL,
  `for_cidade` varchar(50) DEFAULT NULL,
  `for_estado` varchar(50) DEFAULT NULL,
  `for_rua` varchar(50) DEFAULT NULL,
  `for_bairro` varchar(50) DEFAULT NULL,
  `for_numero` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`for_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,'Radar Veículos Multimarcas','0938871892','75992289795','234234512','Brasil','Uberaba','MG','45Z','Frinho','23');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca` (
  `mar_id` int(11) NOT NULL AUTO_INCREMENT,
  `mar_nome` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`mar_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'Fiat'),(2,'Citroen'),(3,'Tesla');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo`
--

DROP TABLE IF EXISTS `modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modelo` (
  `mod_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_nome` varchar(50) DEFAULT NULL,
  `mod_fk_marca` int(11) DEFAULT NULL,
  PRIMARY KEY (`mod_id`),
  KEY `mod_fk_marca` (`mod_fk_marca`),
  CONSTRAINT `modelo_ibfk_1` FOREIGN KEY (`mod_fk_marca`) REFERENCES `marca` (`mar_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo`
--

LOCK TABLES `modelo` WRITE;
/*!40000 ALTER TABLE `modelo` DISABLE KEYS */;
INSERT INTO `modelo` VALUES (1,'Uno',1),(2,'Aircross C3',2),(3,'Aircross C5',2),(4,'Aircross C4',2),(5,'Model 3',3),(6,'Model S',3),(7,'Model Y',3),(8,'Model X',3);
/*!40000 ALTER TABLE `modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recebimento`
--

DROP TABLE IF EXISTS `recebimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recebimento` (
  `rec_id` int(11) NOT NULL AUTO_INCREMENT,
  `rec_fk_forma_pagamento` int(11) NOT NULL,
  `rec_fk_vendas` int(11) NOT NULL,
  `rec_fk_aluguel` int(11) NOT NULL,
  `rec_data` date NOT NULL,
  `rec_valor` float(10,2) NOT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `rec_fk_forma_pagamento` (`rec_fk_forma_pagamento`),
  KEY `rec_fk_vendas` (`rec_fk_vendas`),
  KEY `rec_fk_aluguel` (`rec_fk_aluguel`),
  CONSTRAINT `recebimento_ibfk_1` FOREIGN KEY (`rec_fk_forma_pagamento`) REFERENCES `forma_pagamento` (`pag_id`),
  CONSTRAINT `recebimento_ibfk_2` FOREIGN KEY (`rec_fk_vendas`) REFERENCES `vendas` (`ven_id`),
  CONSTRAINT `recebimento_ibfk_3` FOREIGN KEY (`rec_fk_aluguel`) REFERENCES `aluguel` (`alu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recebimento`
--

LOCK TABLES `recebimento` WRITE;
/*!40000 ALTER TABLE `recebimento` DISABLE KEYS */;
INSERT INTO `recebimento` VALUES (1,1,1,0,'2024-03-10',2000000.00);
/*!40000 ALTER TABLE `recebimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendas`
--

DROP TABLE IF EXISTS `vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendas` (
  `ven_id` int(11) NOT NULL AUTO_INCREMENT,
  `ven_situacao` varchar(50) NOT NULL,
  `ven_data_compra` date DEFAULT NULL,
  `ven_fk_forma_pagamento` int(11) DEFAULT NULL,
  `ven_total` float(10,2) NOT NULL,
  `ven_parcelas` int(11) NOT NULL,
  `ven_entrada` float DEFAULT NULL,
  `ven_fk_cliente` int(11) NOT NULL,
  `ven_fk_vendedor` int(11) NOT NULL,
  PRIMARY KEY (`ven_id`),
  KEY `ven_fk_cliente` (`ven_fk_cliente`),
  CONSTRAINT `vendas_ibfk_1` FOREIGN KEY (`ven_fk_cliente`) REFERENCES `cliente` (`cli_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendas`
--

LOCK TABLES `vendas` WRITE;
/*!40000 ALTER TABLE `vendas` DISABLE KEYS */;
INSERT INTO `vendas` VALUES (1,'Aprovada','2024-03-10',1,2000000.00,0,NULL,1,1),(2,'Em Análise','2024-01-01',3,500000.00,36,NULL,2,2);
/*!40000 ALTER TABLE `vendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendas_automovel`
--

DROP TABLE IF EXISTS `vendas_automovel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendas_automovel` (
  `venaut_id` int(11) NOT NULL AUTO_INCREMENT,
  `venaut_fk_vendas` int(11) NOT NULL,
  `venaut_fk_automovel` int(11) NOT NULL,
  `venaut_data_retirada` date NOT NULL,
  `venaut_valor` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`venaut_id`),
  KEY `venaut_fk_automovel` (`venaut_fk_automovel`),
  KEY `venaut_fk_vendas` (`venaut_fk_vendas`),
  CONSTRAINT `vendas_automovel_ibfk_1` FOREIGN KEY (`venaut_fk_automovel`) REFERENCES `automovel` (`aut_id`),
  CONSTRAINT `vendas_automovel_ibfk_2` FOREIGN KEY (`venaut_fk_vendas`) REFERENCES `vendas` (`ven_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendas_automovel`
--

LOCK TABLES `vendas_automovel` WRITE;
/*!40000 ALTER TABLE `vendas_automovel` DISABLE KEYS */;
INSERT INTO `vendas_automovel` VALUES (1,1,5,'2024-03-11',570000.00),(2,1,6,'2024-03-11',630000.00),(3,1,7,'2024-03-11',800000.00),(4,2,2,'2024-01-01',500000.00);
/*!40000 ALTER TABLE `vendas_automovel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedor` (
  `vend_id` int(11) NOT NULL AUTO_INCREMENT,
  `vend_nome` varchar(50) NOT NULL,
  `vend_cpf` varchar(20) NOT NULL,
  `vend_cep` varchar(50) NOT NULL,
  `vend_cidade` varchar(50) DEFAULT NULL,
  `vend_rua` varchar(50) DEFAULT NULL,
  `vend_bairro` varchar(50) DEFAULT NULL,
  `vend_numero` int(11) DEFAULT NULL,
  `vend_contato` varchar(15) NOT NULL,
  `vend_comissao` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`vend_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
INSERT INTO `vendedor` VALUES (1,'Azymondias','0928973021','8899988','Feira de Santana','A','Cidade Nova',3,'7566637384',0.03),(2,'Claudia','98721983','76837802','Feira de Santana','G','Campo Limpo',889,'98798089',0.03);
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-11 11:27:24
