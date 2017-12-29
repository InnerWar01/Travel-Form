-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 30, 2016 at 07:39 PM
-- Server version: 5.7.10-log
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `travel_agency`
--

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
`Num_Client` int(10) NOT NULL,
  `Nom_Client` varchar(20) NOT NULL,
  `Prénom_Client` varchar(50) NOT NULL,
  `Civilité_Client` varchar(15) NOT NULL,
  `Adresse_Client` varchar(100) NOT NULL,
  `Ville_Client` varchar(30) NOT NULL,
  `Pays_Client` varchar(20) NOT NULL,
  `Mail_Client` varchar(50) NOT NULL,
  `Tel_Client` varchar(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`Num_Client`, `Nom_Client`, `Prénom_Client`, `Civilité_Client`, `Adresse_Client`, `Ville_Client`, `Pays_Client`, `Mail_Client`, `Tel_Client`) VALUES
(1, 'Dupont', 'Stéphane', 'Monsieur', '3 Rue de Rivoli', 'Paris', 'France', 'dupont.stephane@gmail.com', '612345678'),
(2, 'Dupont', 'Cécille', 'Madame', '3 Rue de Rivoli', 'Paris', 'France', 'dupont.cecille@gmail.com', '698654325'),
(3, 'Dupont', 'Simon', 'Monsieur', '3 Rue de Rivoli', 'Paris', 'France', 'simon.dupont@gmail.com', '654448511'),
(4, 'Dupont', 'Elvire', 'Mlle', '3 Rue de Rivoli', 'Paris', 'France', 'elvire.dupont@gmail.com', '612145558'),
(5, 'Renoir', 'Claude', 'Monsieur', '84 Boulevard Marius Vivier Merle', 'Lyon', 'France', 'claude.renoir@gmail.fr', '33478601560'),
(6, 'Pierre', 'Emilie', 'Madame', 'Avalon, Grosvenor Pl, Dublin 6', 'Dublin', 'Ireland', 'pierre.emilie@gmail.com', '35314971499');

-- --------------------------------------------------------

--
-- Table structure for table `guide`
--

CREATE TABLE IF NOT EXISTS `guide` (
`Num_Guide` int(5) NOT NULL,
  `Nom_Guide` varchar(20) NOT NULL,
  `Prénom_Guide` varchar(20) NOT NULL,
  `Num_Pays` int(5) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=62 ;

--
-- Dumping data for table `guide`
--

INSERT INTO `guide` (`Num_Guide`, `Nom_Guide`, `Prénom_Guide`, `Num_Pays`) VALUES
(11, 'Dupuis', 'Marie', 1),
(21, 'Juan', 'Pedro', 2),
(31, 'Bogelli', 'Mario', 3),
(41, 'Perei', 'Jose', 4),
(51, 'Smith', 'John', 5),
(61, 'Brecht', 'Julia', 6);

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE IF NOT EXISTS `hotel` (
`Num_Hotel` int(5) NOT NULL,
  `Num_Région` varchar(6) NOT NULL,
  `Nom_Hotel` varchar(40) NOT NULL,
  `Adresse_Hotel` varchar(40) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=514 ;

--
-- Dumping data for table `hotel`
--

INSERT INTO `hotel` (`Num_Hotel`, `Num_Région`, `Nom_Hotel`, `Adresse_Hotel`) VALUES
(111, '11', 'Hôtel de Vendôme', '1 Place Vendrôme'),
(213, '21', 'Mercure Roma Centro Colosseo', 'Via Firenze, 8, 00184'),
(311, '31', 'Lazio Hotel', 'Via Vicenza, 8, 00185'),
(413, '41', 'Hotel Barcelona Princess', 'Avinguda Diagonal, 1, 08019'),
(513, '51', 'Steigenberger Hotel', 'Los-Angeles-Platz 1, 10789');

-- --------------------------------------------------------

--
-- Table structure for table `langue`
--

CREATE TABLE IF NOT EXISTS `langue` (
  `Code_Langue` varchar(5) NOT NULL,
  `Libellé_Langue` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `langue`
--

INSERT INTO `langue` (`Code_Langue`, `Libellé_Langue`) VALUES
('de', 'Allemand'),
('en', 'Anglais'),
('es', 'Espagnol'),
('fr', 'Francais'),
('it', 'Italien'),
('por', 'Portugais');

-- --------------------------------------------------------

--
-- Table structure for table `monument`
--

CREATE TABLE IF NOT EXISTS `monument` (
  `Nom_Monument` varchar(30) NOT NULL,
  `Prix_Entrée_Monument` smallint(6) DEFAULT '0',
  `Num_Ville` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `monument`
--

INSERT INTO `monument` (`Nom_Monument`, `Prix_Entrée_Monument`, `Num_Ville`) VALUES
('British Museum', 0, 'C5'),
('Casa Batllo', 23, 'C2'),
('Cathédrale Notre-Dame', 0, 'C1'),
('Château de Saint-Georges', 7, 'C4'),
('Colisée', 7, 'C3'),
('Fontaine de Trevi', 0, 'C3'),
('Île aux Musée', 8, 'C6'),
('La Sagrada Familia', 15, 'C2'),
('La Tour Eiffel', 17, 'C1'),
('London Eye', 21, 'C5'),
('Madame Tussaud''s Museum', 25, 'C5'),
('Mur de Berlin', 0, 'C6'),
('Musée Calouste-Gulbenkian', 5, 'C4'),
('Musée du Louvre', 13, 'C1'),
('Panthéon', 5, 'C3'),
('Parc Güel', 0, 'C2'),
('Porte de Brandebourg', 0, 'C6'),
('Tour de Belém', 5, 'C4');

-- --------------------------------------------------------

--
-- Table structure for table `paiement`
--

CREATE TABLE IF NOT EXISTS `paiement` (
`Num_Paiement` int(5) NOT NULL,
  `Montant_Paiement` int(11) NOT NULL,
  `Date_Paiement` date NOT NULL,
  `Num_Client` int(10) NOT NULL,
  `Code_Voyage` int(5) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=351 ;

--
-- Dumping data for table `paiement`
--

INSERT INTO `paiement` (`Num_Paiement`, `Montant_Paiement`, `Date_Paiement`, `Num_Client`, `Code_Voyage`) VALUES
(345, 1680, '2015-12-01', 1, 1),
(346, 1680, '2016-02-01', 2, 1),
(347, 1200, '2016-01-20', 3, 2),
(348, 1060, '2016-03-23', 4, 3),
(349, 1680, '2016-03-18', 5, 1),
(350, 1590, '2016-03-30', 6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `pays`
--

CREATE TABLE IF NOT EXISTS `pays` (
`Num_Pays` int(5) NOT NULL,
  `Nom_Pays` varchar(30) NOT NULL,
  `Code_Tel_Pays` smallint(6) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `pays`
--

INSERT INTO `pays` (`Num_Pays`, `Nom_Pays`, `Code_Tel_Pays`) VALUES
(1, 'France', 33),
(2, 'Espagne', 34),
(3, 'Italie', 39),
(4, 'Portugal', 35),
(5, 'Royaume-Uni', 44),
(6, 'Allemagne', 49);

-- --------------------------------------------------------

--
-- Table structure for table `region`
--

CREATE TABLE IF NOT EXISTS `region` (
  `Num_Région` varchar(6) NOT NULL,
  `Nom_Région` varchar(20) NOT NULL,
  `Num_Pays` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `region`
--

INSERT INTO `region` (`Num_Région`, `Nom_Région`, `Num_Pays`) VALUES
('11', 'Ile-de-France', 1),
('21', 'Catalonia', 2),
('31', 'Latium', 3),
('41', 'Lisbonne', 4),
('51', 'Angleterre', 5),
('61', 'Brandebourg', 6);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE IF NOT EXISTS `reservation` (
`Num_Réservation` int(11) NOT NULL,
  `Date_Départ` date NOT NULL,
  `Nb_Places_Réservées` int(11) NOT NULL,
  `Num_Client` int(10) NOT NULL,
  `Code_Voyage` int(5) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`Num_Réservation`, `Date_Départ`, `Nb_Places_Réservées`, `Num_Client`, `Code_Voyage`) VALUES
(1, '2016-07-01', 4, 1, 1),
(2, '2016-05-21', 4, 2, 1),
(3, '2016-06-09', 4, 3, 2),
(4, '2016-08-17', 2, 4, 3),
(5, '2016-05-21', 4, 5, 1),
(6, '2016-04-08', 3, 6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `ville`
--

CREATE TABLE IF NOT EXISTS `ville` (
  `Num_Ville` varchar(6) NOT NULL,
  `Nom_Ville` varchar(20) NOT NULL,
  `Num_Région` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ville`
--

INSERT INTO `ville` (`Num_Ville`, `Nom_Ville`, `Num_Région`) VALUES
('C1', 'Paris', '11'),
('C2', 'Barcelone', '21'),
('C3', 'Rome', '31'),
('C4', 'Lisbonne', '41'),
('C5', 'Londres', '51'),
('C6', 'Berlin', '61');

-- --------------------------------------------------------

--
-- Table structure for table `voyage`
--

CREATE TABLE IF NOT EXISTS `voyage` (
  `Code_Voyage` int(5) NOT NULL,
  `Nom_Voyage` varchar(20) NOT NULL,
  `Durée_Voyage` varchar(20) NOT NULL,
  `Prix_Indicatif` int(11) NOT NULL,
  `Ville_Départ` varchar(20) NOT NULL,
  `Ville_Arrivée` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `voyage`
--

INSERT INTO `voyage` (`Code_Voyage`, `Nom_Voyage`, `Durée_Voyage`, `Prix_Indicatif`, `Ville_Départ`, `Ville_Arrivée`) VALUES
(1, 'VOYAGE1', '8 jours', 420, 'Londres', 'Rome'),
(2, 'VOYAGE2', '5 jours', 300, 'Lisbonne', 'Barcelone'),
(3, 'VOYAGE3', '14 jours', 530, 'Paris', 'Barcelone');

-- --------------------------------------------------------

--
-- Table structure for table `voyage_etape`
--

CREATE TABLE IF NOT EXISTS `voyage_etape` (
  `Code_Voyage` int(5) NOT NULL,
  `Rang` smallint(6) NOT NULL,
  `Ville_Etape` varchar(20) NOT NULL,
  `Type_Transport` varchar(20) NOT NULL,
  `Nombre_Jours` smallint(6) NOT NULL,
  `Num_Guide` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `voyage_etape`
--

INSERT INTO `voyage_etape` (`Code_Voyage`, `Rang`, `Ville_Etape`, `Type_Transport`, `Nombre_Jours`, `Num_Guide`) VALUES
(1, 1, 'Londres', 'Bus', 2, 51),
(1, 2, 'Paris', 'Bus', 2, 11),
(1, 3, 'Berlin', 'Bus', 2, 61),
(1, 4, 'Rome', 'Bus', 2, 31),
(2, 1, 'Lisbonne', 'Avion', 3, 41),
(2, 2, 'Barcelone', 'Avion', 2, 21),
(3, 1, 'Paris', 'Avion', 3, 11),
(3, 2, 'Rome', 'Avion', 5, 31),
(3, 3, 'Barcelone', 'Avion', 6, 21);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client`
--
ALTER TABLE `client`
 ADD PRIMARY KEY (`Num_Client`);

--
-- Indexes for table `guide`
--
ALTER TABLE `guide`
 ADD PRIMARY KEY (`Num_Guide`), ADD KEY `guide_ibfk_1` (`Num_Pays`);

--
-- Indexes for table `hotel`
--
ALTER TABLE `hotel`
 ADD PRIMARY KEY (`Num_Hotel`), ADD KEY `hotel_ibfk_1` (`Num_Région`);

--
-- Indexes for table `langue`
--
ALTER TABLE `langue`
 ADD PRIMARY KEY (`Code_Langue`);

--
-- Indexes for table `monument`
--
ALTER TABLE `monument`
 ADD PRIMARY KEY (`Nom_Monument`), ADD KEY `Num_Ville` (`Num_Ville`);

--
-- Indexes for table `paiement`
--
ALTER TABLE `paiement`
 ADD PRIMARY KEY (`Num_Paiement`), ADD KEY `paiement_ibfk_2` (`Num_Client`), ADD KEY `paiement_ibfk_3` (`Code_Voyage`);

--
-- Indexes for table `pays`
--
ALTER TABLE `pays`
 ADD PRIMARY KEY (`Num_Pays`);

--
-- Indexes for table `region`
--
ALTER TABLE `region`
 ADD PRIMARY KEY (`Num_Région`), ADD KEY `region_ibfk_1` (`Num_Pays`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
 ADD PRIMARY KEY (`Num_Réservation`), ADD KEY `reservation_ibfk_3` (`Num_Client`), ADD KEY `reservation_ibfk_4` (`Code_Voyage`);

--
-- Indexes for table `ville`
--
ALTER TABLE `ville`
 ADD PRIMARY KEY (`Num_Ville`), ADD KEY `Num_Région` (`Num_Région`);

--
-- Indexes for table `voyage`
--
ALTER TABLE `voyage`
 ADD PRIMARY KEY (`Code_Voyage`);

--
-- Indexes for table `voyage_etape`
--
ALTER TABLE `voyage_etape`
 ADD PRIMARY KEY (`Code_Voyage`,`Rang`), ADD KEY `Num_Guide` (`Num_Guide`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
MODIFY `Num_Client` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `guide`
--
ALTER TABLE `guide`
MODIFY `Num_Guide` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=62;
--
-- AUTO_INCREMENT for table `hotel`
--
ALTER TABLE `hotel`
MODIFY `Num_Hotel` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=514;
--
-- AUTO_INCREMENT for table `paiement`
--
ALTER TABLE `paiement`
MODIFY `Num_Paiement` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=351;
--
-- AUTO_INCREMENT for table `pays`
--
ALTER TABLE `pays`
MODIFY `Num_Pays` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
MODIFY `Num_Réservation` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `guide`
--
ALTER TABLE `guide`
ADD CONSTRAINT `guide_ibfk_1` FOREIGN KEY (`Num_Pays`) REFERENCES `pays` (`Num_Pays`);

--
-- Constraints for table `hotel`
--
ALTER TABLE `hotel`
ADD CONSTRAINT `hotel_ibfk_1` FOREIGN KEY (`Num_Région`) REFERENCES `region` (`Num_Région`);

--
-- Constraints for table `monument`
--
ALTER TABLE `monument`
ADD CONSTRAINT `monument_ibfk_1` FOREIGN KEY (`Num_Ville`) REFERENCES `ville` (`Num_Ville`);

--
-- Constraints for table `paiement`
--
ALTER TABLE `paiement`
ADD CONSTRAINT `paiement_ibfk_2` FOREIGN KEY (`Num_Client`) REFERENCES `client` (`Num_Client`),
ADD CONSTRAINT `paiement_ibfk_3` FOREIGN KEY (`Code_Voyage`) REFERENCES `voyage` (`Code_Voyage`);

--
-- Constraints for table `region`
--
ALTER TABLE `region`
ADD CONSTRAINT `region_ibfk_1` FOREIGN KEY (`Num_Pays`) REFERENCES `pays` (`Num_Pays`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`Num_Client`) REFERENCES `client` (`Num_Client`),
ADD CONSTRAINT `reservation_ibfk_4` FOREIGN KEY (`Code_Voyage`) REFERENCES `voyage` (`Code_Voyage`);

--
-- Constraints for table `ville`
--
ALTER TABLE `ville`
ADD CONSTRAINT `ville_ibfk_1` FOREIGN KEY (`Num_Région`) REFERENCES `region` (`Num_Région`);

--
-- Constraints for table `voyage_etape`
--
ALTER TABLE `voyage_etape`
ADD CONSTRAINT `Code_Voyage` FOREIGN KEY (`Code_Voyage`) REFERENCES `voyage` (`Code_Voyage`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `Num_Guide` FOREIGN KEY (`Num_Guide`) REFERENCES `guide` (`Num_Guide`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
