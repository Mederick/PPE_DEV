-- MySQL dump 10.13  Distrib 5.6.34, for osx10.9 (x86_64)
--
-- Host: localhost    Database: castellane
-- ------------------------------------------------------
-- Server version	5.6.34

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
-- Table structure for table `CLIENT`
--

DROP TABLE IF EXISTS `CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT` (
  `N°_CLIENT` int(10) NOT NULL,
  `NOM_CLIENT` char(30) DEFAULT NULL,
  `PRÉNOM_CLIENT` char(30) DEFAULT NULL,
  `ADRESSE_CLIENT` char(50) DEFAULT NULL,
  `DATE_DE_NAISSANCE` date DEFAULT NULL,
  `TÉLÉPHONE` int(10) DEFAULT NULL,
  `DATE_INSCRIPTION` date DEFAULT NULL,
  `MODE_FACTURATION` char(30) DEFAULT NULL,
  PRIMARY KEY (`N°_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ETABLISSEMENT`
--

DROP TABLE IF EXISTS `ETABLISSEMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ETABLISSEMENT` (
  `DEGRÉ` char(30) NOT NULL,
  `NOM` char(50) DEFAULT NULL,
  `ADRESSE` char(50) DEFAULT NULL,
  PRIMARY KEY (`DEGRÉ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ETABLISSEMENT`
--

LOCK TABLES `ETABLISSEMENT` WRITE;
/*!40000 ALTER TABLE `ETABLISSEMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ETABLISSEMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ETUDIANT`
--

DROP TABLE IF EXISTS `ETUDIANT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ETUDIANT` (
  `N°_CLIENT` int(10) NOT NULL,
  `DEGRÉ` char(30) NOT NULL,
  `NIVEAU_ETUDE` char(20) DEFAULT NULL,
  `REDUCTION` char(3) DEFAULT NULL,
  `NOM_CLIENT` char(30) DEFAULT NULL,
  `PRÉNOM_CLIENT` char(30) DEFAULT NULL,
  `ADRESSE_CLIENT` char(50) DEFAULT NULL,
  `DATE_DE_NAISSANCE` date DEFAULT NULL,
  `TÉLÉPHONE` int(10) DEFAULT NULL,
  `DATE_INSCRIPTION` date DEFAULT NULL,
  `MODE_FACTURATION` char(30) DEFAULT NULL,
  PRIMARY KEY (`N°_CLIENT`),
  KEY `I_FK_ETUDIANT_ETABLISSEMENT` (`DEGRÉ`),
  CONSTRAINT `etudiant_ibfk_1` FOREIGN KEY (`DEGRÉ`) REFERENCES `ETABLISSEMENT` (`DEGRÉ`),
  CONSTRAINT `etudiant_ibfk_2` FOREIGN KEY (`N°_CLIENT`) REFERENCES `CLIENT` (`N°_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ETUDIANT`
--

LOCK TABLES `ETUDIANT` WRITE;
/*!40000 ALTER TABLE `ETUDIANT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ETUDIANT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EXAM`
--

DROP TABLE IF EXISTS `EXAM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EXAM` (
  `ID_EXAM` int(20) NOT NULL,
  `CODE_TYPE` int(5) NOT NULL,
  PRIMARY KEY (`ID_EXAM`),
  KEY `I_FK_EXAM_TYPE_EXAM` (`CODE_TYPE`),
  CONSTRAINT `exam_ibfk_1` FOREIGN KEY (`CODE_TYPE`) REFERENCES `TYPE_EXAM` (`CODE_TYPE`),
  CONSTRAINT `exam_ibfk_2` FOREIGN KEY (`CODE_TYPE`) REFERENCES `TYPE_EXAM` (`CODE_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EXAM`
--

LOCK TABLES `EXAM` WRITE;
/*!40000 ALTER TABLE `EXAM` DISABLE KEYS */;
/*!40000 ALTER TABLE `EXAM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EXAM_CODE`
--

DROP TABLE IF EXISTS `EXAM_CODE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EXAM_CODE` (
  `ID_EXAM` int(20) NOT NULL,
  `N°_CLIENT` int(10) NOT NULL,
  `DATE_C` date DEFAULT NULL,
  `HEURE_C` time DEFAULT NULL,
  `RESULTAT_C` char(15) DEFAULT NULL,
  PRIMARY KEY (`ID_EXAM`,`N°_CLIENT`),
  KEY `I_FK_EXAM_CODE_CLIENT` (`N°_CLIENT`),
  CONSTRAINT `exam_code_ibfk_1` FOREIGN KEY (`ID_EXAM`) REFERENCES `EXAM` (`ID_EXAM`),
  CONSTRAINT `exam_code_ibfk_2` FOREIGN KEY (`N°_CLIENT`) REFERENCES `CLIENT` (`N°_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EXAM_CODE`
--

LOCK TABLES `EXAM_CODE` WRITE;
/*!40000 ALTER TABLE `EXAM_CODE` DISABLE KEYS */;
/*!40000 ALTER TABLE `EXAM_CODE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EXAM_PERMIS`
--

DROP TABLE IF EXISTS `EXAM_PERMIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EXAM_PERMIS` (
  `N°_CLIENT` int(10) NOT NULL,
  `ID_EXAM` int(20) NOT NULL,
  `DATE_P` date DEFAULT NULL,
  `HEURE_P` time DEFAULT NULL,
  `RESULTAT_P` char(15) DEFAULT NULL,
  PRIMARY KEY (`N°_CLIENT`,`ID_EXAM`),
  KEY `I_FK_EXAM_PERMIS_CLIENT` (`N°_CLIENT`),
  KEY `I_FK_EXAM_PERMIS_EXAM` (`ID_EXAM`),
  CONSTRAINT `exam_permis_ibfk_1` FOREIGN KEY (`N°_CLIENT`) REFERENCES `CLIENT` (`N°_CLIENT`),
  CONSTRAINT `exam_permis_ibfk_2` FOREIGN KEY (`ID_EXAM`) REFERENCES `EXAM` (`ID_EXAM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EXAM_PERMIS`
--

LOCK TABLES `EXAM_PERMIS` WRITE;
/*!40000 ALTER TABLE `EXAM_PERMIS` DISABLE KEYS */;
/*!40000 ALTER TABLE `EXAM_PERMIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `H_N°LEÇON_LEÇON`
--

DROP TABLE IF EXISTS `H_N°LEÇON_LEÇON`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `H_N°LEÇON_LEÇON` (
  `N°LEÇON` int(2) NOT NULL,
  `DATE_HISTO` date NOT NULL,
  PRIMARY KEY (`N°LEÇON`,`DATE_HISTO`),
  KEY `I_FK_H_N°LEÇON_LEÇON_LEÇON` (`N°LEÇON`),
  CONSTRAINT `h_n°leçon_leçon_ibfk_1` FOREIGN KEY (`N°LEÇON`) REFERENCES `LEÇON` (`N°LEÇON`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table d''historisation des modifications de la table LEÇON';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `H_N°LEÇON_LEÇON`
--

LOCK TABLES `H_N°LEÇON_LEÇON` WRITE;
/*!40000 ALTER TABLE `H_N°LEÇON_LEÇON` DISABLE KEYS */;
/*!40000 ALTER TABLE `H_N°LEÇON_LEÇON` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LEÇON`
--

DROP TABLE IF EXISTS `LEÇON`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LEÇON` (
  `N°LEÇON` int(2) NOT NULL,
  `DATE_LEÇON` date DEFAULT NULL,
  `HEURE_LEÇON` char(5) DEFAULT NULL,
  `TARIF_HEURE` char(5) DEFAULT NULL,
  PRIMARY KEY (`N°LEÇON`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LEÇON`
--

LOCK TABLES `LEÇON` WRITE;
/*!40000 ALTER TABLE `LEÇON` DISABLE KEYS */;
/*!40000 ALTER TABLE `LEÇON` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MODÉLE`
--

DROP TABLE IF EXISTS `MODÉLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MODÉLE` (
  `CODE_MODÉLE` int(10) NOT NULL,
  `NOM_MODÉLE` char(50) DEFAULT NULL,
  `ANNÉE_MODÈLE` date DEFAULT NULL,
  PRIMARY KEY (`CODE_MODÉLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MODÉLE`
--

LOCK TABLES `MODÉLE` WRITE;
/*!40000 ALTER TABLE `MODÉLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `MODÉLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MOIS`
--

DROP TABLE IF EXISTS `MOIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MOIS` (
  `N°MOIS` int(2) NOT NULL,
  `ANNÉE` date DEFAULT NULL,
  PRIMARY KEY (`N°MOIS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MOIS`
--

LOCK TABLES `MOIS` WRITE;
/*!40000 ALTER TABLE `MOIS` DISABLE KEYS */;
/*!40000 ALTER TABLE `MOIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MONITEUR`
--

DROP TABLE IF EXISTS `MONITEUR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MONITEUR` (
  `N°MONITEUR` int(10) NOT NULL,
  `NOM_MONTEUR` char(30) DEFAULT NULL,
  `DATE_EMBAUCHE` date DEFAULT NULL,
  PRIMARY KEY (`N°MONITEUR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MONITEUR`
--

LOCK TABLES `MONITEUR` WRITE;
/*!40000 ALTER TABLE `MONITEUR` DISABLE KEYS */;
/*!40000 ALTER TABLE `MONITEUR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MOTO`
--

DROP TABLE IF EXISTS `MOTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MOTO` (
  `CODE_MODÉLE` int(10) NOT NULL,
  `CYLINDRE` char(10) DEFAULT NULL,
  `PUISSANCE` char(10) DEFAULT NULL,
  `NOM_MODÉLE` char(50) DEFAULT NULL,
  `ANNÉE_MODÈLE` date DEFAULT NULL,
  PRIMARY KEY (`CODE_MODÉLE`),
  CONSTRAINT `moto_ibfk_1` FOREIGN KEY (`CODE_MODÉLE`) REFERENCES `MODÉLE` (`CODE_MODÉLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MOTO`
--

LOCK TABLES `MOTO` WRITE;
/*!40000 ALTER TABLE `MOTO` DISABLE KEYS */;
/*!40000 ALTER TABLE `MOTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PLANNING`
--

DROP TABLE IF EXISTS `PLANNING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PLANNING` (
  `N°LEÇON` int(2) NOT NULL,
  `N°_CLIENT` int(10) NOT NULL,
  `N°MONITEUR` int(10) NOT NULL,
  `CODE_MODÉLE` int(10) NOT NULL,
  `DATE_HEURE_DÉBUT` datetime DEFAULT NULL,
  `DATE_HEURE_FIN` datetime DEFAULT NULL,
  PRIMARY KEY (`N°LEÇON`,`N°_CLIENT`,`N°MONITEUR`,`CODE_MODÉLE`),
  KEY `I_FK_PLANNING_LEÇON` (`N°LEÇON`),
  KEY `I_FK_PLANNING_CLIENT` (`N°_CLIENT`),
  KEY `I_FK_PLANNING_MONITEUR` (`N°MONITEUR`),
  KEY `I_FK_PLANNING_MODÉLE` (`CODE_MODÉLE`),
  CONSTRAINT `planning_ibfk_1` FOREIGN KEY (`N°LEÇON`) REFERENCES `LEÇON` (`N°LEÇON`),
  CONSTRAINT `planning_ibfk_2` FOREIGN KEY (`N°_CLIENT`) REFERENCES `CLIENT` (`N°_CLIENT`),
  CONSTRAINT `planning_ibfk_3` FOREIGN KEY (`N°MONITEUR`) REFERENCES `MONITEUR` (`N°MONITEUR`),
  CONSTRAINT `planning_ibfk_4` FOREIGN KEY (`CODE_MODÉLE`) REFERENCES `MODÉLE` (`CODE_MODÉLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PLANNING`
--

LOCK TABLES `PLANNING` WRITE;
/*!40000 ALTER TABLE `PLANNING` DISABLE KEYS */;
/*!40000 ALTER TABLE `PLANNING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROULER`
--

DROP TABLE IF EXISTS `ROULER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ROULER` (
  `N°MOIS` int(2) NOT NULL,
  `N°VÉHICULE` int(10) NOT NULL,
  `N°_KM_PARCOURRUS_DANS_LE_MOIS` int(8) DEFAULT NULL,
  PRIMARY KEY (`N°MOIS`,`N°VÉHICULE`),
  KEY `I_FK_ROULER_MOIS` (`N°MOIS`),
  KEY `I_FK_ROULER_VÉHICULE` (`N°VÉHICULE`),
  CONSTRAINT `rouler_ibfk_1` FOREIGN KEY (`N°MOIS`) REFERENCES `MOIS` (`N°MOIS`),
  CONSTRAINT `rouler_ibfk_2` FOREIGN KEY (`N°VÉHICULE`) REFERENCES `VÉHICULE` (`N°VÉHICULE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROULER`
--

LOCK TABLES `ROULER` WRITE;
/*!40000 ALTER TABLE `ROULER` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROULER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SALARIÉ`
--

DROP TABLE IF EXISTS `SALARIÉ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SALARIÉ` (
  `N°_CLIENT` int(10) NOT NULL,
  `NOM_ENTREPRISE` char(32) DEFAULT NULL,
  `NOM_CLIENT` char(30) DEFAULT NULL,
  `PRÉNOM_CLIENT` char(30) DEFAULT NULL,
  `ADRESSE_CLIENT` char(50) DEFAULT NULL,
  `DATE_DE_NAISSANCE` date DEFAULT NULL,
  `TÉLÉPHONE` int(10) DEFAULT NULL,
  `DATE_INSCRIPTION` date DEFAULT NULL,
  `MODE_FACTURATION` char(30) DEFAULT NULL,
  PRIMARY KEY (`N°_CLIENT`),
  CONSTRAINT `salarié_ibfk_1` FOREIGN KEY (`N°_CLIENT`) REFERENCES `CLIENT` (`N°_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SALARIÉ`
--

LOCK TABLES `SALARIÉ` WRITE;
/*!40000 ALTER TABLE `SALARIÉ` DISABLE KEYS */;
/*!40000 ALTER TABLE `SALARIÉ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TYPE_EXAM`
--

DROP TABLE IF EXISTS `TYPE_EXAM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TYPE_EXAM` (
  `CODE_TYPE` int(5) NOT NULL,
  `LIBELLE_TYPE` char(40) DEFAULT NULL,
  PRIMARY KEY (`CODE_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TYPE_EXAM`
--

LOCK TABLES `TYPE_EXAM` WRITE;
/*!40000 ALTER TABLE `TYPE_EXAM` DISABLE KEYS */;
/*!40000 ALTER TABLE `TYPE_EXAM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ULTILISER`
--

DROP TABLE IF EXISTS `ULTILISER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ULTILISER` (
  `N°LEÇON` int(2) NOT NULL,
  `N°VÉHICULE` int(10) NOT NULL,
  PRIMARY KEY (`N°LEÇON`,`N°VÉHICULE`),
  KEY `I_FK_ULTILISER_LEÇON` (`N°LEÇON`),
  KEY `I_FK_ULTILISER_VÉHICULE` (`N°VÉHICULE`),
  CONSTRAINT `ultiliser_ibfk_1` FOREIGN KEY (`N°LEÇON`) REFERENCES `LEÇON` (`N°LEÇON`),
  CONSTRAINT `ultiliser_ibfk_2` FOREIGN KEY (`N°VÉHICULE`) REFERENCES `VÉHICULE` (`N°VÉHICULE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ULTILISER`
--

LOCK TABLES `ULTILISER` WRITE;
/*!40000 ALTER TABLE `ULTILISER` DISABLE KEYS */;
/*!40000 ALTER TABLE `ULTILISER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VÉHICULE`
--

DROP TABLE IF EXISTS `VÉHICULE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VÉHICULE` (
  `N°VÉHICULE` int(10) NOT NULL,
  `CODE_MODÉLE` int(10) NOT NULL,
  `N°IMMATRICULATION` char(20) DEFAULT NULL,
  `DATE_ACHAT` date DEFAULT NULL,
  `NB_KM_INITIAL` int(8) DEFAULT NULL,
  PRIMARY KEY (`N°VÉHICULE`),
  KEY `I_FK_VÉHICULE_MODÉLE` (`CODE_MODÉLE`),
  CONSTRAINT `véhicule_ibfk_1` FOREIGN KEY (`CODE_MODÉLE`) REFERENCES `MODÉLE` (`CODE_MODÉLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VÉHICULE`
--

LOCK TABLES `VÉHICULE` WRITE;
/*!40000 ALTER TABLE `VÉHICULE` DISABLE KEYS */;
/*!40000 ALTER TABLE `VÉHICULE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VOITURE`
--

DROP TABLE IF EXISTS `VOITURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VOITURE` (
  `CODE_MODÉLE` int(10) NOT NULL,
  `TYPE_CONSO` char(40) DEFAULT NULL,
  `NOM_MODÉLE` char(50) DEFAULT NULL,
  `ANNÉE_MODÈLE` date DEFAULT NULL,
  PRIMARY KEY (`CODE_MODÉLE`),
  CONSTRAINT `voiture_ibfk_1` FOREIGN KEY (`CODE_MODÉLE`) REFERENCES `MODÉLE` (`CODE_MODÉLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VOITURE`
--

LOCK TABLES `VOITURE` WRITE;
/*!40000 ALTER TABLE `VOITURE` DISABLE KEYS */;
/*!40000 ALTER TABLE `VOITURE` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-24 10:30:35
