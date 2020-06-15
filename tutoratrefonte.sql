-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 26 mai 2020 à 10:38
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `tutoratrefonte`
--

-- --------------------------------------------------------

--
-- Structure de la table `archive`
--

DROP TABLE IF EXISTS `archive`;
CREATE TABLE IF NOT EXISTS `archive` (
  `id_archive` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_matiere` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `commentaires` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `nbParticipants` int(11) NOT NULL,
  `duree` double NOT NULL,
  PRIMARY KEY (`id_archive`),
  KEY `Fk_MatiereArchive` (`id_matiere`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `archive_promo`
--

DROP TABLE IF EXISTS `archive_promo`;
CREATE TABLE IF NOT EXISTS `archive_promo` (
  `id_archive` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_promo` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_archive`,`id_promo`),
  KEY `IDX_D7FEF5E1B61F4EC` (`id_archive`),
  KEY `IDX_D7FEF5E15E96DBCB` (`id_promo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

DROP TABLE IF EXISTS `classe`;
CREATE TABLE IF NOT EXISTS `classe` (
  `id_classe` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_promo` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `classe` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_classe`),
  KEY `Fk_Promo` (`id_promo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `classe`
--

INSERT INTO `classe` (`id_classe`, `id_promo`, `classe`) VALUES
('15FEAC24-640C-494C-A357-C2F2F4E53A8C', 'A7AC7F17-102E-458F-A8C9-398E8DE41895', 'Classe 2 DEV'),
('166C4409-377A-43E2-A166-5215980B5A81', '009B6DE0-4775-4BFA-BD90-D3A5C3F605B5', 'Classe 1'),
('1E8F99EF-4277-4E9B-B993-8196756E15DB', '7464AE15-7BF8-44FF-93AB-B4856D432626', 'Classe 1'),
('28BC3DDD-8E8D-4F79-8CE3-B9C4979483F5', '5DC4FEC4-CDD0-4451-9594-86968D4CFDEA', 'Classe 1'),
('38AB7148-A2F8-4A4A-8639-B26E02374EEC', 'A7516064-F3FB-41BB-815C-A195DE9E92C9', 'Classe 3 RES'),
('5FEA68B5-8A56-4B18-80CB-D8DA0920DD12', 'A7516064-F3FB-41BB-815C-A195DE9E92C9', 'Classe 1 DEV'),
('6077FCFC-FBF4-4260-BC76-0121644AFE9B', 'CA367B50-DB05-457E-B293-D46F14EE54DD', 'Classe 2'),
('6F0B14AD-2843-4175-AEFA-3B4133B415CB', 'AA177EF6-0763-4C6A-89C2-E5B66EC50C2A', 'Classe 2'),
('7B599BDA-D0FD-412B-BDB3-D1AF0835E545', 'A7516064-F3FB-41BB-815C-A195DE9E92C9', 'Classe 2 DEV'),
('A5124385-2E71-4F92-9FF4-9CF8BC80BDB4', 'CA367B50-DB05-457E-B293-D46F14EE54DD', 'Classe 1 '),
('A93BC5AB-5A72-4ED3-BFA7-C8DA09B31AEA', 'AA177EF6-0763-4C6A-89C2-E5B66EC50C2A', 'Classe 1'),
('ADCB7760-54B2-44C8-9C0A-58CCFEE5D525', 'A7AC7F17-102E-458F-A8C9-398E8DE41895', 'Classe 3 RES'),
('D8E8198E-91A5-4301-800B-2F89C7093910', '009B6DE0-4775-4BFA-BD90-D3A5C3F605B5', 'Classe 2'),
('EB56ECE5-3F99-4C08-BF71-1FC3FDCFBC03', '83193C6F-BE87-4287-A575-86C3FC9F98FA', 'Classe 1'),
('F105CF7D-9DCF-4B87-BE53-208EC695EBEB', 'A7AC7F17-102E-458F-A8C9-398E8DE41895', 'Classe 1 DEV');

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `id_comment` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` datetime NOT NULL,
  `QuestionForum` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Personne` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_comment`),
  KEY `IDX_9474526CF45F47C8` (`QuestionForum`),
  KEY `IDX_9474526CF6B8ABB9` (`Personne`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

DROP TABLE IF EXISTS `cours`;
CREATE TABLE IF NOT EXISTS `cours` (
  `id_cours` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_matiere` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_promo` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `intitule` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `heure` time NOT NULL,
  `date` date NOT NULL,
  `dateCreation` datetime DEFAULT NULL,
  `commentaires` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nbInscrits` int(11) DEFAULT NULL,
  `nbParticipants` int(11) DEFAULT NULL,
  `duree` double DEFAULT NULL,
  `status` int(11) NOT NULL,
  `stage` int(11) NOT NULL,
  `salle` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_cours`),
  KEY `Fk_Matiere` (`id_matiere`),
  KEY `fk_cours_promo1_idx` (`id_promo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ecole`
--

DROP TABLE IF EXISTS `ecole`;
CREATE TABLE IF NOT EXISTS `ecole` (
  `id_ecole` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `intitule` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_ecole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ecole`
--

INSERT INTO `ecole` (`id_ecole`, `intitule`) VALUES
('820C2351-DD85-4EC8-9070-8535A7F2D432', 'WIS'),
('D5BEFEB1-C72A-452B-ACEF-C79C26D2F6DF', 'EPSI');

-- --------------------------------------------------------

--
-- Structure de la table `logs`
--

DROP TABLE IF EXISTS `logs`;
CREATE TABLE IF NOT EXISTS `logs` (
  `id_log` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_cours` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `heure` datetime NOT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `logs_proposition`
--

DROP TABLE IF EXISTS `logs_proposition`;
CREATE TABLE IF NOT EXISTS `logs_proposition` (
  `id_log` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_proposition` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `heure` datetime DEFAULT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

DROP TABLE IF EXISTS `matiere`;
CREATE TABLE IF NOT EXISTS `matiere` (
  `id_matiere` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `intitule` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `validationAdmin` int(11) NOT NULL,
  `dateCreation` datetime DEFAULT NULL,
  PRIMARY KEY (`id_matiere`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `niveau`
--

DROP TABLE IF EXISTS `niveau`;
CREATE TABLE IF NOT EXISTS `niveau` (
  `id_niveau` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `intitule` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_niveau`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `niveau`
--

INSERT INTO `niveau` (`id_niveau`, `intitule`) VALUES
('1', 'Expert'),
('2', 'A l\'aise'),
('3', 'Besoin d\'aide');

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

DROP TABLE IF EXISTS `personne`;
CREATE TABLE IF NOT EXISTS `personne` (
  `id_personne` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_classe` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nom` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` int(11) NOT NULL,
  `password` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_personne`),
  KEY `Fk_Classe` (`id_classe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personne_archive`
--

DROP TABLE IF EXISTS `personne_archive`;
CREATE TABLE IF NOT EXISTS `personne_archive` (
  `id_personne` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_archive` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_personne`,`id_archive`),
  KEY `IDX_B73B9615F15257A` (`id_personne`),
  KEY `IDX_B73B961B61F4EC` (`id_archive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personne_cours`
--

DROP TABLE IF EXISTS `personne_cours`;
CREATE TABLE IF NOT EXISTS `personne_cours` (
  `id_personne` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_cours` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rang_personne` int(11) NOT NULL,
  PRIMARY KEY (`id_personne`,`id_cours`),
  KEY `IDX_E92B9DF55F15257A` (`id_personne`),
  KEY `IDX_E92B9DF5134FCDAC` (`id_cours`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personne_proposition`
--

DROP TABLE IF EXISTS `personne_proposition`;
CREATE TABLE IF NOT EXISTS `personne_proposition` (
  `id_personne` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_proposition` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_personne`,`id_proposition`),
  KEY `IDX_C05A0E025F15257A` (`id_personne`),
  KEY `IDX_C05A0E02DFDF0EA4` (`id_proposition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personne_search`
--

DROP TABLE IF EXISTS `personne_search`;
CREATE TABLE IF NOT EXISTS `personne_search` (
  `id_personne` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_classe` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nom` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`id_personne`),
  KEY `IDX_808AE34AA9B00A7B` (`id_classe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personne_tag`
--

DROP TABLE IF EXISTS `personne_tag`;
CREATE TABLE IF NOT EXISTS `personne_tag` (
  `id_personne` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_niveau` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_matiere` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_personne`,`id_matiere`),
  KEY `IDX_9B46B5895F15257A` (`id_personne`),
  KEY `IDX_9B46B5896DE84686` (`id_niveau`),
  KEY `IDX_9B46B5894E89FE3A` (`id_matiere`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personne_tags`
--

DROP TABLE IF EXISTS `personne_tags`;
CREATE TABLE IF NOT EXISTS `personne_tags` (
  `id_personne` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_tag` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_matiere` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_personne`,`id_tag`,`id_matiere`),
  KEY `IDX_8FF1B23A5F15257A` (`id_personne`),
  KEY `IDX_8FF1B23A9D2D5FD9` (`id_tag`),
  KEY `IDX_8FF1B23A4E89FE3A` (`id_matiere`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `promo`
--

DROP TABLE IF EXISTS `promo`;
CREATE TABLE IF NOT EXISTS `promo` (
  `id_promo` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_ecole` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `promo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_promo`),
  KEY `Fk_Ecole` (`id_ecole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `promo`
--

INSERT INTO `promo` (`id_promo`, `id_ecole`, `promo`) VALUES
('009B6DE0-4775-4BFA-BD90-D3A5C3F605B5', 'D5BEFEB1-C72A-452B-ACEF-C79C26D2F6DF', 'B2'),
('5DC4FEC4-CDD0-4451-9594-86968D4CFDEA', '820C2351-DD85-4EC8-9070-8535A7F2D432', 'Wis1'),
('7464AE15-7BF8-44FF-93AB-B4856D432626', '820C2351-DD85-4EC8-9070-8535A7F2D432', 'Wis3'),
('83193C6F-BE87-4287-A575-86C3FC9F98FA', '820C2351-DD85-4EC8-9070-8535A7F2D432', 'Wis2'),
('A7516064-F3FB-41BB-815C-A195DE9E92C9', 'D5BEFEB1-C72A-452B-ACEF-C79C26D2F6DF', 'B3'),
('A7AC7F17-102E-458F-A8C9-398E8DE41895', 'D5BEFEB1-C72A-452B-ACEF-C79C26D2F6DF', 'I1'),
('AA177EF6-0763-4C6A-89C2-E5B66EC50C2A', 'D5BEFEB1-C72A-452B-ACEF-C79C26D2F6DF', 'B1'),
('CA367B50-DB05-457E-B293-D46F14EE54DD', 'D5BEFEB1-C72A-452B-ACEF-C79C26D2F6DF', 'I2');

-- --------------------------------------------------------

--
-- Structure de la table `proposition`
--

DROP TABLE IF EXISTS `proposition`;
CREATE TABLE IF NOT EXISTS `proposition` (
  `id_proposition` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_createur` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_matiere` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nb_vote` int(11) NOT NULL,
  `dateCreation` datetime DEFAULT NULL,
  PRIMARY KEY (`id_proposition`),
  KEY `IDX_C7CDC353AA033611` (`id_createur`),
  KEY `Fk_Matiere3` (`id_matiere`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `proposition_promo`
--

DROP TABLE IF EXISTS `proposition_promo`;
CREATE TABLE IF NOT EXISTS `proposition_promo` (
  `id_proposition` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_promo` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_proposition`,`id_promo`),
  KEY `IDX_E43282BDFDF0EA4` (`id_proposition`),
  KEY `IDX_E43282B5E96DBCB` (`id_promo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `question_forum`
--

DROP TABLE IF EXISTS `question_forum`;
CREATE TABLE IF NOT EXISTS `question_forum` (
  `id_question` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `nb_vote` int(11) NOT NULL DEFAULT 0,
  `Personne` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `matiere` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `statut` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_question`),
  KEY `IDX_B5C0AFC9F6B8ABB9` (`Personne`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `id_tag` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `intitule` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `vote`
--

DROP TABLE IF EXISTS `vote`;
CREATE TABLE IF NOT EXISTS `vote` (
  `id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` datetime NOT NULL,
  `Personne` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `QuestionForum` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5A108564F6B8ABB9` (`Personne`),
  KEY `IDX_5A108564F45F47C8` (`QuestionForum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `archive`
--
ALTER TABLE `archive`
  ADD CONSTRAINT `FK_D5FC5D9C4E89FE3A` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id_matiere`);

--
-- Contraintes pour la table `archive_promo`
--
ALTER TABLE `archive_promo`
  ADD CONSTRAINT `FK_D7FEF5E15E96DBCB` FOREIGN KEY (`id_promo`) REFERENCES `promo` (`id_promo`),
  ADD CONSTRAINT `FK_D7FEF5E1B61F4EC` FOREIGN KEY (`id_archive`) REFERENCES `archive` (`id_archive`);

--
-- Contraintes pour la table `classe`
--
ALTER TABLE `classe`
  ADD CONSTRAINT `FK_8F87BF965E96DBCB` FOREIGN KEY (`id_promo`) REFERENCES `promo` (`id_promo`);

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_9474526CF45F47C8` FOREIGN KEY (`QuestionForum`) REFERENCES `question_forum` (`id_question`),
  ADD CONSTRAINT `FK_9474526CF6B8ABB9` FOREIGN KEY (`Personne`) REFERENCES `personne` (`id_personne`);

--
-- Contraintes pour la table `cours`
--
ALTER TABLE `cours`
  ADD CONSTRAINT `FK_FDCA8C9C4E89FE3A` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id_matiere`),
  ADD CONSTRAINT `FK_FDCA8C9C5E96DBCB` FOREIGN KEY (`id_promo`) REFERENCES `promo` (`id_promo`);

--
-- Contraintes pour la table `personne`
--
ALTER TABLE `personne`
  ADD CONSTRAINT `FK_FCEC9EFA9B00A7B` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id_classe`);

--
-- Contraintes pour la table `personne_archive`
--
ALTER TABLE `personne_archive`
  ADD CONSTRAINT `FK_B73B9615F15257A` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id_personne`),
  ADD CONSTRAINT `FK_B73B961B61F4EC` FOREIGN KEY (`id_archive`) REFERENCES `archive` (`id_archive`);

--
-- Contraintes pour la table `personne_cours`
--
ALTER TABLE `personne_cours`
  ADD CONSTRAINT `FK_E92B9DF5134FCDAC` FOREIGN KEY (`id_cours`) REFERENCES `cours` (`id_cours`),
  ADD CONSTRAINT `FK_E92B9DF55F15257A` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id_personne`);

--
-- Contraintes pour la table `personne_proposition`
--
ALTER TABLE `personne_proposition`
  ADD CONSTRAINT `FK_C05A0E025F15257A` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id_personne`),
  ADD CONSTRAINT `FK_C05A0E02DFDF0EA4` FOREIGN KEY (`id_proposition`) REFERENCES `proposition` (`id_proposition`);

--
-- Contraintes pour la table `personne_tag`
--
ALTER TABLE `personne_tag`
  ADD CONSTRAINT `FK_9B46B5894E89FE3A` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id_matiere`),
  ADD CONSTRAINT `FK_9B46B5895F15257A` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id_personne`),
  ADD CONSTRAINT `FK_9B46B5896DE84686` FOREIGN KEY (`id_niveau`) REFERENCES `niveau` (`id_niveau`);

--
-- Contraintes pour la table `personne_tags`
--
ALTER TABLE `personne_tags`
  ADD CONSTRAINT `FK_8FF1B23A9D2D5FD9` FOREIGN KEY (`id_tag`) REFERENCES `tags` (`id_tag`);

--
-- Contraintes pour la table `promo`
--
ALTER TABLE `promo`
  ADD CONSTRAINT `FK_B0139AFBE7FD2B9C` FOREIGN KEY (`id_ecole`) REFERENCES `ecole` (`id_ecole`);

--
-- Contraintes pour la table `proposition`
--
ALTER TABLE `proposition`
  ADD CONSTRAINT `FK_C7CDC3534E89FE3A` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id_matiere`),
  ADD CONSTRAINT `FK_C7CDC353AA033611` FOREIGN KEY (`id_createur`) REFERENCES `personne` (`id_personne`);

--
-- Contraintes pour la table `proposition_promo`
--
ALTER TABLE `proposition_promo`
  ADD CONSTRAINT `FK_E43282B5E96DBCB` FOREIGN KEY (`id_promo`) REFERENCES `promo` (`id_promo`),
  ADD CONSTRAINT `FK_E43282BDFDF0EA4` FOREIGN KEY (`id_proposition`) REFERENCES `proposition` (`id_proposition`);

--
-- Contraintes pour la table `question_forum`
--
ALTER TABLE `question_forum`
  ADD CONSTRAINT `FK_B5C0AFC9F6B8ABB9` FOREIGN KEY (`Personne`) REFERENCES `personne` (`id_personne`);

--
-- Contraintes pour la table `vote`
--
ALTER TABLE `vote`
  ADD CONSTRAINT `FK_5A108564F45F47C8` FOREIGN KEY (`QuestionForum`) REFERENCES `question_forum` (`id_question`),
  ADD CONSTRAINT `FK_5A108564F6B8ABB9` FOREIGN KEY (`Personne`) REFERENCES `personne` (`id_personne`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
