-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 14 sep. 2020 à 11:10
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `tutoratrefonte`
--

-- --------------------------------------------------------

--
-- Structure de la table `archive`
--

DROP TABLE IF EXISTS `archive`;
CREATE TABLE IF NOT EXISTS `archive` (
  `id_archive` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_matiere` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `commentaires` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `nbParticipants` int(11) NOT NULL,
  `duree` int(11) NOT NULL,
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
  `intitule` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_classe`),
  KEY `Fk_Promo` (`id_promo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `classe`
--

INSERT INTO `classe` (`id_classe`, `id_promo`, `intitule`) VALUES
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
  `contenu` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateCreation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_question` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_personne` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_reply` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_comment`),
  KEY `IDX_9474526CF45F47C8` (`id_question`),
  KEY `IDX_9474526CF6B8ABB9` (`id_personne`),
  KEY `id_reply` (`id_reply`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `comment`
--

INSERT INTO `comment` (`id_comment`, `contenu`, `dateCreation`, `id_question`, `id_personne`, `id_reply`) VALUES
('125e3936-7cad-455c-9dd9-fd844ecebb19', '\n                    Lorem ipsum dolor sit amet, consectetur adipisicing elit.\n                    Aperiam blanditiis error hic omnis recusandae reiciendis suscipit totam vero voluptas?\n                    A delectus dignissimos esse iste pariatur quis quo quos rem vero!\n                ', '2020-09-10 09:58:23', NULL, '6593c62a-f0e3-11ea-adc1-0242ac120002', '6c8bdba2-82ec-47ab-b0c1-2f4e9371832c '),
('1f97ebf0-79cc-452d-95ea-cb25ae451fb9', 'a oue  ?', '2020-09-10 09:59:09', NULL, '6593c62a-f0e3-11ea-adc1-0242ac120002', 'dffa3025-32d7-403d-a047-338499ce7ef9'),
('20fb385e-73f9-4245-85e0-0b791c27ab70', '1rg59e1g', '2020-09-10 07:43:49', '08f370bf-a5ae-42be-814e-6acee8bb4b79', '6593c62a-f0e3-11ea-adc1-0242ac120002', NULL),
('294b3d23-0321-49a8-9c44-a21ffdb38756', 'frfeffeef', '2020-09-11 07:38:41', NULL, '6593c62a-f0e3-11ea-adc1-0242ac120002', 'c5975f97-28d8-4bdd-a18d-7e7f2efccbce'),
('35783bb2-fb02-4bdf-9cb3-083a164ff7c0', 'A oue ?', '2020-09-11 07:15:14', NULL, '6593c62a-f0e3-11ea-adc1-0242ac120002', 'd6d37540-d73d-4a95-be99-80b1aa960b1a'),
('425229b9-19b2-43c4-a3c5-b731e1611f62', 'Vas pas voire Sur google', '2020-09-11 08:46:01', 'f835206d-a60a-4e46-8acd-5f352685e14c', '6593c62a-f0e3-11ea-adc1-0242ac120002', NULL),
('4c6bb384-9263-41d8-b583-52d7c20a3ddc', 'A oue ?', '2020-09-11 07:19:05', NULL, '6593c62a-f0e3-11ea-adc1-0242ac120002', 'd6d37540-d73d-4a95-be99-80b1aa960b1a'),
('570c68a4-21ee-4c5a-99f3-a034b42b405f', '\n                    Lorem ipsum dolor sit amet, consectetur adipisicing elit.\n                    Aperiam blanditiis error hic omnis recusandae reiciendis suscipit totam vero voluptas?\n                    A delectus dignissimos esse iste pariatur quis quo quos rem vero!\n                ', '2020-09-10 07:36:42', '99ab9dff-6f25-47bb-a4ad-d05e9949bab2', '6593c62a-f0e3-11ea-adc1-0242ac120002', NULL),
('595f0488-5b57-483e-bb7a-aa77c11619a2', 'Commentaire', '2020-09-11 08:30:58', '9dc5694f-78df-4aa1-b86d-ea5950d0c919', '6593c62a-f0e3-11ea-adc1-0242ac120002', NULL),
('59de8d6b-6c60-449d-8236-9af37eb7f4f8', 'efefeffe', '2020-09-11 07:38:51', NULL, '6593c62a-f0e3-11ea-adc1-0242ac120002', 'd6d37540-d73d-4a95-be99-80b1aa960b1a'),
('5d479fcf-4ee3-455e-b41a-057ad139c0a7', 'EFEFEF', '2020-09-11 07:26:19', NULL, '6593c62a-f0e3-11ea-adc1-0242ac120002', '9caf6528-dda1-4526-9ddb-02f0b9ecbc00'),
('6c8bdba2-82ec-47ab-b0c1-2f4e9371832c', 'test', '2020-09-10 09:55:38', '99ab9dff-6f25-47bb-a4ad-d05e9949bab2', '6593c62a-f0e3-11ea-adc1-0242ac120002', NULL),
('7178b6d8-740f-4f17-bf87-acec4137ef95', 'Vas voire sur Bing', '2020-09-11 08:45:35', 'f835206d-a60a-4e46-8acd-5f352685e14c', '6593c62a-f0e3-11ea-adc1-0242ac120002', NULL),
('75b436a3-07f1-468a-bed2-ef25d8f92f6d', 'fefefef', '2020-09-11 07:38:34', '08f370bf-a5ae-42be-814e-6acee8bb4b79', '6593c62a-f0e3-11ea-adc1-0242ac120002', NULL),
('7bf162fe-d0e0-4914-a8a6-aca57000c2b0', 'Tout ca', '2020-09-11 08:31:11', NULL, '6593c62a-f0e3-11ea-adc1-0242ac120002', '595f0488-5b57-483e-bb7a-aa77c11619a2'),
('87e47003-6060-4e23-959c-6e3872f2b75b', 'efefefef', '2020-09-11 07:19:12', '08f370bf-a5ae-42be-814e-6acee8bb4b79', '6593c62a-f0e3-11ea-adc1-0242ac120002', NULL),
('8e2cbabc-c8f4-4b3b-a18c-124cc999baa0', 'Oui', '2020-09-11 08:46:48', NULL, '6593c62a-f0e3-11ea-adc1-0242ac120002', '425229b9-19b2-43c4-a3c5-b731e1611f62'),
('9afe42dd-8694-49b0-ad05-e26ed0606b9b', 'ets', '2020-09-10 08:48:14', NULL, '6593c62a-f0e3-11ea-adc1-0242ac120002', NULL),
('9caf6528-dda1-4526-9ddb-02f0b9ecbc00', 'test', '2020-09-11 07:20:19', '08f370bf-a5ae-42be-814e-6acee8bb4b79', '6593c62a-f0e3-11ea-adc1-0242ac120002', NULL),
('9f2c72b8-d897-419b-b181-9f8844edf888', 'efefef', '2020-09-11 07:26:09', '08f370bf-a5ae-42be-814e-6acee8bb4b79', '6593c62a-f0e3-11ea-adc1-0242ac120002', NULL),
('b5f80bd1-daa2-4653-944e-c0f5915f7e3f', 'efefefef', '2020-09-11 07:38:45', NULL, '6593c62a-f0e3-11ea-adc1-0242ac120002', '87e47003-6060-4e23-959c-6e3872f2b75b'),
('c5975f97-28d8-4bdd-a18d-7e7f2efccbce', 'efefef', '2020-09-11 07:25:58', '08f370bf-a5ae-42be-814e-6acee8bb4b79', '6593c62a-f0e3-11ea-adc1-0242ac120002', NULL),
('d6d37540-d73d-4a95-be99-80b1aa960b1a', 'whuewhfuwef', '2020-09-10 07:43:56', '08f370bf-a5ae-42be-814e-6acee8bb4b79', '6593c62a-f0e3-11ea-adc1-0242ac120002', NULL),
('dba2bf03-b9b4-4750-ac51-a7a7d9f22a9f', 'eteetet', '2020-09-10 09:58:57', NULL, '6593c62a-f0e3-11ea-adc1-0242ac120002', '6c8bdba2-82ec-47ab-b0c1-2f4e9371832c '),
('dffa3025-32d7-403d-a047-338499ce7ef9', '\n                    Lorem ipsum dolor sit amet, consectetur adipisicing elit.\n                    Aperiam blanditiis error hic omnis recusandae reiciendis suscipit totam vero voluptas?\n                    A delectus dignissimos esse iste pariatur quis quo quos rem vero!\n                ', '2020-09-10 09:43:04', '99ab9dff-6f25-47bb-a4ad-d05e9949bab2', '6593c62a-f0e3-11ea-adc1-0242ac120002', NULL),
('e28070e7-a65b-4a0f-a521-b39f3fe73621', '\n                    uos rem vero!\n                ', '2020-09-10 08:38:16', NULL, '6593c62a-f0e3-11ea-adc1-0242ac120002', NULL),
('e65c0de8-41e9-4df4-a462-bbcac127fb70', 'A oue ?', '2020-09-11 07:15:13', NULL, '6593c62a-f0e3-11ea-adc1-0242ac120002', 'd6d37540-d73d-4a95-be99-80b1aa960b1a'),
('eb10d2dc-84fd-4e1d-b138-68a82addf464', 'Oui, il te donne un numero ou faut pas appleer', '2020-09-11 08:46:39', NULL, '6593c62a-f0e3-11ea-adc1-0242ac120002', '425229b9-19b2-43c4-a3c5-b731e1611f62'),
('f369f90d-d8e5-480a-b572-98c2e0a4080b', ' soy sage', '2020-09-10 08:42:46', NULL, '6593c62a-f0e3-11ea-adc1-0242ac120002', NULL);

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
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `commentaires` text COLLATE utf8mb4_unicode_ci,
  `nbParticipants` int(11) DEFAULT NULL,
  `duree` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `stage` tinyint(1) NOT NULL,
  `salle` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id_cours`),
  KEY `Fk_Matiere` (`id_matiere`),
  KEY `fk_cours_promo1_idx` (`id_promo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cours`
--

INSERT INTO `cours` (`id_cours`, `id_matiere`, `id_promo`, `intitule`, `date`, `commentaires`, `nbParticipants`, `duree`, `status`, `stage`, `salle`) VALUES
('33b6ad9c-0b3b-4acf-ab3f-64bac47cdc13', '7a6b1453-37da-4ec3-b89d-85b9bd5a2896', '7464AE15-7BF8-44FF-93AB-B4856D432626', 'PHP', '2020-09-13 11:36:35', 'je says po', NULL, NULL, 1, 0, NULL),
('503f0566-55e4-44ab-a629-9977197c85ad', 'e62ad251-ae27-456a-a3c8-737be5ed6fa1', '009B6DE0-4775-4BFA-BD90-D3A5C3F605B5', 'Maths', '2020-09-13 11:36:35', 'je sais plus ', NULL, NULL, 1, 0, NULL),
('7c357313-26f3-49a3-a7b0-9e449539e318', 'e62ad251-ae27-456a-a3c8-737be5ed6fa1', 'A7AC7F17-102E-458F-A8C9-398E8DE41895', 'HTML/CSS', '2020-09-13 11:36:35', 'je suis plus la ', NULL, NULL, 1, 0, NULL),
('86079f3a-e84d-480d-80e6-dad20f50bfc8', '7a6b1453-37da-4ec3-b89d-85b9bd5a2896', '5DC4FEC4-CDD0-4451-9594-86968D4CFDEA', 'Anglais', '2020-09-13 11:36:35', 'je sais pas ', NULL, NULL, 1, 0, NULL);

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
('6b816c57-9f4f-49e5-91bf-bbadaa85a1d4', 'IFAGE'),
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
  `heure` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `validationAdmin` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_matiere`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `matiere`
--

INSERT INTO `matiere` (`id_matiere`, `intitule`, `validationAdmin`) VALUES
('7a6b1453-37da-4ec3-b89d-85b9bd5a2896', 'PHP', 1),
('d0a908b6-51ee-4a6d-a00d-abe4102f8b06', 'HTML/CSS', 1),
('e62ad251-ae27-456a-a3c8-737be5ed6fa1', 'Test', 1);

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
('2d1804ae-94b0-4f45-8670-ae4bbc258507', 'Besoin d\'aide'),
('2dd15861-c47e-4c32-a322-2f137dfc5dad', 'A l\'aise'),
('d0d6e789-1a50-470f-9e54-4f54a2160cb8', 'Expert');

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
  `role` tinyint(1) NOT NULL,
  `password` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci,
  `image` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id_personne`),
  KEY `Fk_Classe` (`id_classe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `personne`
--

INSERT INTO `personne` (`id_personne`, `id_classe`, `nom`, `prenom`, `role`, `password`, `mail`, `token`, `image`) VALUES
('6593c62a-f0e3-11ea-adc1-0242ac120002', 'A93BC5AB-5A72-4ED3-BFA7-C8DA09B31AEA', 'Le Floch', 'Breval', 1, 'test', 'breva2@gm.co', '917bb914-f0e3-11ea-adc1-0242ac120002', NULL),
('f5f8e577-8408-4719-99c2-5834cc4cc290', 'A93BC5AB-5A72-4ED3-BFA7-C8DA09B31AEA', 'Catifait', 'Léo', 1, 'test', 'leoteahupoo@gmail.com', NULL, NULL);

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
  `rang_personne` tinyint(1) NOT NULL,
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
-- Structure de la table `promo`
--

DROP TABLE IF EXISTS `promo`;
CREATE TABLE IF NOT EXISTS `promo` (
  `id_promo` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_ecole` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `intitule` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_promo`),
  KEY `Fk_Ecole` (`id_ecole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `promo`
--

INSERT INTO `promo` (`id_promo`, `id_ecole`, `intitule`) VALUES
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
  PRIMARY KEY (`id_proposition`),
  KEY `IDX_C7CDC353AA033611` (`id_createur`),
  KEY `Fk_Matiere3` (`id_matiere`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `proposition`
--

INSERT INTO `proposition` (`id_proposition`, `id_createur`, `id_matiere`) VALUES
('8e199b78-f80f-46aa-a06f-3fd0b278415a', '6593c62a-f0e3-11ea-adc1-0242ac120002', 'e62ad251-ae27-456a-a3c8-737be5ed6fa1'),
('9170e135-4abb-44b1-b358-58956e28126b', 'f5f8e577-8408-4719-99c2-5834cc4cc290', 'e62ad251-ae27-456a-a3c8-737be5ed6fa1');

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

--
-- Déchargement des données de la table `proposition_promo`
--

INSERT INTO `proposition_promo` (`id_proposition`, `id_promo`) VALUES
('8e199b78-f80f-46aa-a06f-3fd0b278415a', '7464AE15-7BF8-44FF-93AB-B4856D432626'),
('9170e135-4abb-44b1-b358-58956e28126b', 'CA367B50-DB05-457E-B293-D46F14EE54DD');

-- --------------------------------------------------------

--
-- Structure de la table `question_forum`
--

DROP TABLE IF EXISTS `question_forum`;
CREATE TABLE IF NOT EXISTS `question_forum` (
  `id_question` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `id_personne` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_matiere` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_question`),
  KEY `IDX_B5C0AFC9F6B8ABB9` (`id_personne`),
  KEY `id_matiere` (`id_matiere`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `question_forum`
--

INSERT INTO `question_forum` (`id_question`, `titre`, `description`, `id_personne`, `id_matiere`, `status`, `date`) VALUES
('08f370bf-a5ae-42be-814e-6acee8bb4b79', 'J\'aime les cannards !!! (c pas vré ptdr)', 'C meme pas du PHP ', '6593c62a-f0e3-11ea-adc1-0242ac120002', '7a6b1453-37da-4ec3-b89d-85b9bd5a2896', 0, '2020-09-08 14:25:50'),
('0c0a2e97-9a02-4112-99e7-6351785c863b', 'Comment on fait une base de donnée avec PHP ? ', 'J\'utilise php, et je n\'arrive pas a trouver comment creer une base de donnée avec ! ^^\' \r\n', '6593c62a-f0e3-11ea-adc1-0242ac120002', '7a6b1453-37da-4ec3-b89d-85b9bd5a2896', 0, '2020-09-08 08:10:32'),
('132', 'Titre ICi ? ', 'Description ici ! ', '6593c62a-f0e3-11ea-adc1-0242ac120002', '7a6b1453-37da-4ec3-b89d-85b9bd5a2896', 0, '2020-09-08 08:10:32'),
('3a62a224-f0f1-11ea-adc1-0242ac120002', 'Test Psk', '4g4gerhtrutrjtyjtrysjrykwsykwyskwrykrykwrk', '6593c62a-f0e3-11ea-adc1-0242ac120002', '7a6b1453-37da-4ec3-b89d-85b9bd5a2896', 0, '2020-09-08 08:10:32'),
('99ab9dff-6f25-47bb-a4ad-d05e9949bab2', 'Nouvelle question mdr psk jaim pa les mdr', 'werwepi  iowsd kpoeksow uifpow g', '6593c62a-f0e3-11ea-adc1-0242ac120002', '7a6b1453-37da-4ec3-b89d-85b9bd5a2896', 0, '2020-09-08 14:41:48'),
('9dc5694f-78df-4aa1-b86d-ea5950d0c919', 'TEfweefwef', 'ergerger', '6593c62a-f0e3-11ea-adc1-0242ac120002', 'e62ad251-ae27-456a-a3c8-737be5ed6fa1', 0, '2020-09-11 08:30:27'),
('9f910e14-f0e3-11ea-adc1-0242ac120002', 'Comment on fait des sites ?', 'J\'ai un soucis ! Je n\'arrive pas a faire des sites web ! pouvez vous m\'aider ?? \r\nJ\'aimerais utilisé PHP! Avec WAMP par exemple 😁 ', '6593c62a-f0e3-11ea-adc1-0242ac120002', '7a6b1453-37da-4ec3-b89d-85b9bd5a2896', 0, '2020-09-08 08:10:32'),
('e26a8dcf-4b47-475f-a660-0864b9db3818', 'T\'entative de post', 'Ca ma souler en faite ', '6593c62a-f0e3-11ea-adc1-0242ac120002', '7a6b1453-37da-4ec3-b89d-85b9bd5a2896', 0, '2020-09-08 08:22:26'),
('f835206d-a60a-4e46-8acd-5f352685e14c', 'Comment se suicider ?', 'Google me donne pas la reponse, on ma dit d\'aller voir sur bing, mais je prefere encore me suicider.... ', '6593c62a-f0e3-11ea-adc1-0242ac120002', '7a6b1453-37da-4ec3-b89d-85b9bd5a2896', 0, '2020-09-09 09:10:08');

-- --------------------------------------------------------

--
-- Structure de la table `vote`
--

DROP TABLE IF EXISTS `vote`;
CREATE TABLE IF NOT EXISTS `vote` (
  `id_vote` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_personne` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_question` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_vote`),
  KEY `IDX_5A108564F6B8ABB9` (`id_personne`),
  KEY `IDX_5A108564F45F47C8` (`id_question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vote`
--

INSERT INTO `vote` (`id_vote`, `id_personne`, `id_question`) VALUES
('1438b7c4-64f9-4403-b229-00fb9af42f44', '6593c62a-f0e3-11ea-adc1-0242ac120002', 'f835206d-a60a-4e46-8acd-5f352685e14c'),
('1aacc0d1-c903-4794-a004-75a5237887f5', '6593c62a-f0e3-11ea-adc1-0242ac120002', 'e26a8dcf-4b47-475f-a660-0864b9db3818'),
('2d03ed0a-0279-4e1a-8574-5ea943db0021', '6593c62a-f0e3-11ea-adc1-0242ac120002', '132'),
('303f6deb-1d59-471d-895d-52b004dc1b8a', '6593c62a-f0e3-11ea-adc1-0242ac120002', '99ab9dff-6f25-47bb-a4ad-d05e9949bab2'),
('3c8f50ac-f0eb-11ea-adc1-0242ac120002', '6593c62a-f0e3-11ea-adc1-0242ac120002', '9f910e14-f0e3-11ea-adc1-0242ac120002'),
('7fe56f3c-1bb9-4ee3-aa62-d14356986506', '6593c62a-f0e3-11ea-adc1-0242ac120002', '3a62a224-f0f1-11ea-adc1-0242ac120002'),
('cb8b93d9-f586-4fd9-a67e-d207ab5585a2', '6593c62a-f0e3-11ea-adc1-0242ac120002', '08f370bf-a5ae-42be-814e-6acee8bb4b79'),
('e386b07f-ece5-41d3-a2b1-8a0e8b3a2488', '6593c62a-f0e3-11ea-adc1-0242ac120002', '0c0a2e97-9a02-4112-99e7-6351785c863b'),
('f924cde6-e8b9-4fdf-abe6-c0333b887aa6', '6593c62a-f0e3-11ea-adc1-0242ac120002', 'f835206d-a60a-4e46-8acd-5f352685e14c');

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
  ADD CONSTRAINT `FK_D7FEF5E15E96DBCB` FOREIGN KEY (`id_promo`) REFERENCES `promo` (`id_promo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_D7FEF5E1B61F4EC` FOREIGN KEY (`id_archive`) REFERENCES `archive` (`id_archive`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `classe`
--
ALTER TABLE `classe`
  ADD CONSTRAINT `FK_8F87BF965E96DBCB` FOREIGN KEY (`id_promo`) REFERENCES `promo` (`id_promo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_9474526CF45F47C8` FOREIGN KEY (`id_question`) REFERENCES `question_forum` (`id_question`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_9474526CF6B8ABB9` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id_personne`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`id_reply`) REFERENCES `comment` (`id_comment`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `cours`
--
ALTER TABLE `cours`
  ADD CONSTRAINT `FK_FDCA8C9C4E89FE3A` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id_matiere`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_FDCA8C9C5E96DBCB` FOREIGN KEY (`id_promo`) REFERENCES `promo` (`id_promo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `personne`
--
ALTER TABLE `personne`
  ADD CONSTRAINT `FK_FCEC9EFA9B00A7B` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id_classe`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `FK_E92B9DF5134FCDAC` FOREIGN KEY (`id_cours`) REFERENCES `cours` (`id_cours`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_E92B9DF55F15257A` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id_personne`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `personne_proposition`
--
ALTER TABLE `personne_proposition`
  ADD CONSTRAINT `FK_C05A0E025F15257A` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id_personne`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_C05A0E02DFDF0EA4` FOREIGN KEY (`id_proposition`) REFERENCES `proposition` (`id_proposition`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `personne_tag`
--
ALTER TABLE `personne_tag`
  ADD CONSTRAINT `FK_9B46B5894E89FE3A` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id_matiere`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_9B46B5895F15257A` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id_personne`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_9B46B5896DE84686` FOREIGN KEY (`id_niveau`) REFERENCES `niveau` (`id_niveau`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `promo`
--
ALTER TABLE `promo`
  ADD CONSTRAINT `FK_B0139AFBE7FD2B9C` FOREIGN KEY (`id_ecole`) REFERENCES `ecole` (`id_ecole`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `proposition`
--
ALTER TABLE `proposition`
  ADD CONSTRAINT `FK_C7CDC3534E89FE3A` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id_matiere`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_C7CDC353AA033611` FOREIGN KEY (`id_createur`) REFERENCES `personne` (`id_personne`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `proposition_promo`
--
ALTER TABLE `proposition_promo`
  ADD CONSTRAINT `FK_E43282B5E96DBCB` FOREIGN KEY (`id_promo`) REFERENCES `promo` (`id_promo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_E43282BDFDF0EA4` FOREIGN KEY (`id_proposition`) REFERENCES `proposition` (`id_proposition`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `question_forum`
--
ALTER TABLE `question_forum`
  ADD CONSTRAINT `FK_B5C0AFC9F6B8ABB9` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id_personne`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `question_forum_ibfk_1` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id_matiere`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `vote`
--
ALTER TABLE `vote`
  ADD CONSTRAINT `FK_5A108564F45F47C8` FOREIGN KEY (`id_question`) REFERENCES `question_forum` (`id_question`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_5A108564F6B8ABB9` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id_personne`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
