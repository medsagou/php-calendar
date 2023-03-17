-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 14 mars 2023 à 20:25
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `taotto_bene`
--

-- --------------------------------------------------------

--
-- Structure de la table `creneau_cours`
--

DROP TABLE IF EXISTS `creneau_cours`;
CREATE TABLE IF NOT EXISTS `creneau_cours` (
  `No_Creneau` int NOT NULL AUTO_INCREMENT,
  `refm` int DEFAULT NULL,
  `refs` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`No_Creneau`),
  KEY `refm` (`refm`),
  KEY `refs` (`refs`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `creneau_cours`
--

INSERT INTO `creneau_cours` (`No_Creneau`, `refm`, `refs`) VALUES
(1, 1, 'GH131'),
(2, 2, 'GH131'),
(3, 3, 'GH131'),
(4, 4, 'GH131'),
(5, 5, 'GH131'),
(6, 6, 'GH131'),
(7, 7, 'GA 138'),
(8, 8, 'GH131'),
(9, 9, 'GH131'),
(10, 10, 'GH131'),
(11, 11, 'GH131'),
(12, 12, 'GH131'),
(13, 13, 'GH131'),
(14, 16, 'GH116'),
(15, 17, 'GH131'),
(16, 18, 'GH131'),
(17, 19, 'GH131'),
(18, 20, 'GH131'),
(19, 21, 'GH131'),
(20, 22, 'GH131'),
(22, 16, 'GH117'),
(23, 23, 'GH131');

-- --------------------------------------------------------

--
-- Structure de la table `diplome`
--

DROP TABLE IF EXISTS `diplome`;
CREATE TABLE IF NOT EXISTS `diplome` (
  `Code_diplome` varchar(10) NOT NULL,
  `nom_Diplome` varchar(100) NOT NULL,
  PRIMARY KEY (`Code_diplome`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `diplome`
--

INSERT INTO `diplome` (`Code_diplome`, `nom_Diplome`) VALUES
('AM06M2T', 'M2 Ingénierie de l\'Information Numérique I2N');

-- --------------------------------------------------------

--
-- Structure de la table `diriger`
--

DROP TABLE IF EXISTS `diriger`;
CREATE TABLE IF NOT EXISTS `diriger` (
  `refens` int NOT NULL DEFAULT '0',
  `refd` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`refens`,`refd`),
  KEY `refd` (`refd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `diriger`
--

INSERT INTO `diriger` (`refens`, `refd`) VALUES
(3, 'AM06M2T');

-- --------------------------------------------------------

--
-- Structure de la table `enseignant`
--

DROP TABLE IF EXISTS `enseignant`;
CREATE TABLE IF NOT EXISTS `enseignant` (
  `No_enseignant` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(30) NOT NULL,
  `Prenom` varchar(40) NOT NULL,
  `Adresse_mail` varchar(100) NOT NULL,
  PRIMARY KEY (`No_enseignant`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `enseignant`
--

INSERT INTO `enseignant` (`No_enseignant`, `Nom`, `Prenom`, `Adresse_mail`) VALUES
(1, 'DU CHATEAU', 'Stefan', 'stefan.du-chateau@univ-tlse2.fr'),
(2, 'MORENO', 'José', 'jose.moreno@irit.fr'),
(3, 'DKAKI', 'Taoufiq', 'Taoufiq.Dkaki@irit.fr'),
(4, 'CHAMPLCLAUX', 'Yaël', 'yael.champlcaux@univ-tlse2.fr'),
(5, 'BARTHE', 'Clarisse', 'clarisse.barthe@univ-tlse2.fr'),
(6, 'MOUSSAID', 'Sophia', 'Sophia.MOUSSAID@toulouse-metropole.fr'),
(7, 'FILIPPI', 'Bruno', 'bruno.filippi@univ-tlse2.fr'),
(8, 'AUSSET', 'Laurent', 'laurent.ausset@univ-tlse2.fr'),
(9, 'BASTIAN', 'Tim', 'tim.bastian@me.com'),
(10, 'CRAMA', 'Isabelle', 'isabelle.crama@univ-tlse2.fr'),
(11, 'LACANAL', 'Estelle', 'estelle.lacanal@univ-tlse2.fr'),
(12, 'FERRANTE', 'Eric', 'eric.ferrante@univ-tlse2.fr'),
(13, 'MAGNAN', 'François', 'francoismagnan@gmail.com'),
(14, 'COSTES', 'Mylène', 'mylene.costes@univ-tlse2.fr'),
(15, 'CHARREL', 'Pierre Jean', 'pierre-jean.charrel@univ-tlse2.fr');

-- --------------------------------------------------------

--
-- Structure de la table `enseignement`
--

DROP TABLE IF EXISTS `enseignement`;
CREATE TABLE IF NOT EXISTS `enseignement` (
  `refm` int NOT NULL DEFAULT '0',
  `refens` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`refm`,`refens`),
  KEY `refens` (`refens`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `enseignement`
--

INSERT INTO `enseignement` (`refm`, `refens`) VALUES
(10, 1),
(20, 1),
(4, 2),
(1, 3),
(2, 3),
(12, 3),
(14, 3),
(15, 3),
(19, 3),
(18, 4),
(21, 4),
(22, 4),
(7, 5),
(8, 5),
(16, 6),
(17, 6),
(23, 7),
(5, 8),
(13, 9),
(3, 12),
(9, 13),
(6, 14),
(11, 15);

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

DROP TABLE IF EXISTS `matiere`;
CREATE TABLE IF NOT EXISTS `matiere` (
  `No_Matiere` int NOT NULL AUTO_INCREMENT,
  `nom_Matiere` varchar(50) NOT NULL,
  `Nbre_Heure_an` int DEFAULT NULL,
  `refu` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`No_Matiere`),
  KEY `refu` (`refu`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `matiere`
--

INSERT INTO `matiere` (`No_Matiere`, `nom_Matiere`, `Nbre_Heure_an`, `refu`) VALUES
(1, 'Informatique et Algorithmique', 38, 'AM0I901T'),
(2, 'PHP', 34, 'AM0I901T'),
(3, 'Création site web', 30, 'AM0I901T'),
(4, 'JavaScript', 25, 'AM0I901T'),
(5, 'Audit des systèmes d\'information Pratiques doc', 19, 'AM0I902T'),
(6, 'Pratiques documentaires', 21, 'AM0I902T'),
(7, 'Droit de la propriété intellectuelle', 6, 'AM0I902T'),
(8, 'Règlement général sur la protection des données pe', 4, 'AM0I902T'),
(9, 'Source Info Veille', 48, 'AM0I902T'),
(10, 'XML/JSON', 25, 'AM0I903T'),
(11, 'MERISE/UML', 25, 'AM0I904T'),
(12, 'Bases de données relationnelles SQL', 25, 'AM0I905T'),
(13, 'Outils pour la production d\'images pour le web', 25, 'AM0I906T'),
(14, 'Mémoire théorique et rapport de stage', 630, 'AM0I111T'),
(15, 'Stage de mission', 630, 'AM0I111T'),
(16, 'Méthodologie de la gestion de projet', 18, 'AM0I112T'),
(17, 'Conduite de projet', 7, 'AM0I112T'),
(18, 'Outils et plateformes', 13, 'AM0I113T'),
(19, 'Programmation', 2, 'AM0I113T'),
(20, 'Librairies XML', 5, 'AM0I113T'),
(21, 'Librairies Front end (JS)', 5, 'AM0I113T'),
(22, 'Systèmes de gestion de contenus', 20, 'AM0I114T'),
(23, 'Gestion des projets CMS', 5, 'AM0I114T');

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

DROP TABLE IF EXISTS `salle`;
CREATE TABLE IF NOT EXISTS `salle` (
  `Nom_salle` varchar(50) NOT NULL,
  `Etage` int NOT NULL,
  `Batiment` varchar(30) NOT NULL,
  `Capacite` int DEFAULT NULL,
  `Equipement` text NOT NULL,
  PRIMARY KEY (`Nom_salle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `salle`
--

INSERT INTO `salle` (`Nom_salle`, `Etage`, `Batiment`, `Capacite`, `Equipement`) VALUES
('Amphi F', 0, 'OLYMPE DE GOUGES', 200, 'projecteur, tableaau'),
('GA 138', 1, 'LE GAI SAVOIR', 50, 'tableau'),
('GH116', 1, 'OLYMPE DE GOUGES', 50, 'ordinateur, projecteur, wifi, tableau'),
('GH117', 1, 'OLYMPE DE GOUGES', 50, 'ordinateur, projecteur, wifi, tableau'),
('GH131', 1, 'OLYMPE DE GOUGES', 20, 'ordinateur, projecteur, wifi, tableau'),
('GH133', 1, 'OLYMPE DE GOUGES', 50, 'ordinateur, projecteur, wifi, tableau'),
('GS134', 1, 'OLYMPE DE GOUGES', 100, 'ordinateur, projecteur, wifi, tableau');

-- --------------------------------------------------------

--
-- Structure de la table `ue`
--

DROP TABLE IF EXISTS `ue`;
CREATE TABLE IF NOT EXISTS `ue` (
  `Code_UE` varchar(8) NOT NULL,
  `nom_UE` varchar(100) NOT NULL,
  `Credit` int NOT NULL,
  `refd` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Code_UE`),
  KEY `refd` (`refd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ue`
--

INSERT INTO `ue` (`Code_UE`, `nom_UE`, `Credit`, `refd`) VALUES
('AM0I111T', 'Mémoire et stage', 19, 'AM06M2T'),
('AM0I112T', 'Projet transversal', 4, 'AM06M2T'),
('AM0I113T', 'Outils et environnement pour la gestion de projet', 4, 'AM06M2T'),
('AM0I114T', 'Gestion de contenus web', 3, 'AM06M2T'),
('AM0I901T', 'Programmation web', 9, 'AM06M2T'),
('AM0I902T', 'Environnement et méthodologies documentaires', 7, 'AM06M2T'),
('AM0I903T', 'Documents structurés et formats', 4, 'AM06M2T'),
('AM0I904T', 'Conception et modélisation des systèmes d\'information', 4, 'AM06M2T'),
('AM0I905T', 'Bases de données', 3, 'AM06M2T'),
('AM0I906T', 'Production et traitement d\'images', 3, 'AM06M2T');

-- --------------------------------------------------------

--
-- Structure de la table `version`
--

DROP TABLE IF EXISTS `version`;
CREATE TABLE IF NOT EXISTS `version` (
  `No_Version` int NOT NULL AUTO_INCREMENT,
  `Date_Version` date NOT NULL,
  `Date_Creneau` date NOT NULL,
  `Heure_debut` time NOT NULL,
  `Heure_fin` time NOT NULL,
  `refc` int DEFAULT NULL,
  `refens` int DEFAULT NULL,
  `Statut` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`No_Version`),
  KEY `refc` (`refc`),
  KEY `refens` (`refens`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `version`
--

INSERT INTO `version` (`No_Version`, `Date_Version`, `Date_Creneau`, `Heure_debut`, `Heure_fin`, `refc`, `refens`, `Statut`) VALUES
(1, '2003-01-23', '2010-01-23', '08:00:00', '10:00:00', 1, 3, 'Proposé'),
(2, '2024-01-23', '2003-02-23', '08:20:00', '10:20:00', 2, 3, 'Rejeté'),
(3, '2016-09-22', '2011-01-23', '09:00:00', '10:30:00', 6, 14, 'Salle Affecté'),
(4, '2020-01-23', '2029-01-23', '09:30:00', '12:30:00', 4, 2, 'Validé'),
(5, '2014-03-23', '2029-11-22', '09:40:00', '12:40:00', 3, 12, 'Rejeté'),
(6, '2021-01-23', '2003-03-23', '10:00:00', '13:00:00', 5, 8, 'Validé'),
(7, '2023-09-22', '2003-04-23', '10:30:00', '16:00:00', 7, 5, 'Rejeté'),
(8, '2001-02-23', '2013-02-23', '10:40:00', '16:10:00', 8, 5, 'Salle Affecté'),
(9, '2005-02-23', '2005-01-23', '13:30:00', '16:20:00', 9, 13, 'Validé'),
(10, '2025-02-23', '2007-01-22', '14:00:00', '16:30:00', 10, 1, 'Salle Affecté'),
(11, '2022-01-23', '2008-01-23', '14:10:00', '17:00:00', 11, 15, 'Rejeté'),
(12, '2014-11-22', '2028-02-23', '14:20:00', '17:30:00', 12, 3, 'Proposé'),
(13, '2028-02-23', '2003-10-22', '14:30:00', '18:00:00', 13, 9, 'Validé'),
(14, '2010-10-22', '2003-03-23', '16:00:00', '18:20:00', 1, 3, 'Validé'),
(15, '2011-01-23', '2019-01-23', '16:10:00', '18:30:00', 23, 7, 'Proposé'),
(16, '2030-09-22', '2023-01-23', '16:20:00', '18:40:00', 11, 15, 'Proposé'),
(17, '2016-03-23', '2027-01-23', '16:30:00', '00:00:00', 11, 15, 'Rejeté'),
(18, '2012-01-23', '2023-02-23', '00:00:00', '00:00:00', 8, 5, 'Validé'),
(19, '2018-03-23', '2003-09-23', '00:00:00', '00:00:00', 11, 15, 'Salle Affecté'),
(20, '2012-03-23', '2003-11-23', '00:00:00', '00:00:00', 8, 5, 'Proposé');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `creneau_cours`
--
ALTER TABLE `creneau_cours`
  ADD CONSTRAINT `creneau_cours_ibfk_1` FOREIGN KEY (`refm`) REFERENCES `matiere` (`No_Matiere`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `creneau_cours_ibfk_2` FOREIGN KEY (`refs`) REFERENCES `salle` (`Nom_salle`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `diriger`
--
ALTER TABLE `diriger`
  ADD CONSTRAINT `diriger_ibfk_1` FOREIGN KEY (`refens`) REFERENCES `enseignant` (`No_enseignant`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `diriger_ibfk_2` FOREIGN KEY (`refd`) REFERENCES `diplome` (`Code_diplome`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `enseignement`
--
ALTER TABLE `enseignement`
  ADD CONSTRAINT `enseignement_ibfk_1` FOREIGN KEY (`refm`) REFERENCES `matiere` (`No_Matiere`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `enseignement_ibfk_2` FOREIGN KEY (`refens`) REFERENCES `enseignant` (`No_enseignant`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `matiere`
--
ALTER TABLE `matiere`
  ADD CONSTRAINT `matiere_ibfk_1` FOREIGN KEY (`refu`) REFERENCES `ue` (`Code_UE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `ue`
--
ALTER TABLE `ue`
  ADD CONSTRAINT `ue_ibfk_1` FOREIGN KEY (`refd`) REFERENCES `diplome` (`Code_diplome`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `version`
--
ALTER TABLE `version`
  ADD CONSTRAINT `version_ibfk_1` FOREIGN KEY (`refc`) REFERENCES `creneau_cours` (`No_Creneau`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `version_ibfk_2` FOREIGN KEY (`refens`) REFERENCES `enseignant` (`No_enseignant`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
