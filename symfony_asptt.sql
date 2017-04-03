-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  localhost
-- Généré le :  Lun 03 Avril 2017 à 19:58
-- Version du serveur :  5.7.14
-- Version de PHP :  7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `symfony_asptt`
--
CREATE DATABASE IF NOT EXISTS `symfony_asptt` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `symfony_asptt`;

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_880E0D7692FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_880E0D76A0D96FBF` (`email_canonical`),
  UNIQUE KEY `UNIQ_880E0D76C05FB297` (`confirmation_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vider la table avant d'insérer `admin`
--

TRUNCATE TABLE `admin`;
--
-- Contenu de la table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `salt`, `roles`, `username_canonical`, `email`, `email_canonical`, `enabled`, `last_login`, `confirmation_token`, `password_requested_at`) VALUES
(1, 'admin', 'Ql4LBG/YsR4EIRNROaWWc6kbInZHC/VQNpFDct07ATd9ydl3Sb8g/dxFC2wrwzdqz3LNvRelgWBJmImSWB8DPw==', '82mZlhT1c4ppnFVD8YHb488f6ncgzy6RLt2nOEiNTaE', 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 'admin', 'admin@asptt.fr', 'admin@asptt.fr', 1, '2017-04-03 15:55:31', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_64C19C15E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vider la table avant d'insérer `category`
--

TRUNCATE TABLE `category`;
--
-- Contenu de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(5, 'Administration'),
(3, 'Enfants'),
(2, 'Jeunes'),
(4, 'Loisirs'),
(1, 'Senior');

-- --------------------------------------------------------

--
-- Structure de la table `date`
--

CREATE TABLE IF NOT EXISTS `date` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_AA9E377AAA9E377A` (`date`),
  UNIQUE KEY `UNIQ_AA9E377A989D9B62` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vider la table avant d'insérer `date`
--

TRUNCATE TABLE `date`;
--
-- Contenu de la table `date`
--

INSERT INTO `date` (`id`, `date`, `slug`) VALUES
(11, '2017-03-26 00:00:00', '2017-03-26-00-00'),
(12, '2017-04-01 00:00:00', '2017-04-01-00-00'),
(13, '2017-03-25 00:00:00', '2017-03-25-00-00'),
(14, '2017-04-02 00:00:00', '2017-04-02-00-00'),
(15, '2017-04-08 00:00:00', '2017-04-08-00-00'),
(16, '2017-04-09 00:00:00', '2017-04-09-00-00');

-- --------------------------------------------------------

--
-- Structure de la table `day`
--

CREATE TABLE IF NOT EXISTS `day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_E5A029905E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vider la table avant d'insérer `day`
--

TRUNCATE TABLE `day`;
--
-- Contenu de la table `day`
--

INSERT INTO `day` (`id`, `name`) VALUES
(4, 'Jeudi'),
(1, 'Lundi'),
(2, 'Mardi'),
(3, 'Mercredi'),
(6, 'Samedi'),
(5, 'Vendredi');

-- --------------------------------------------------------

--
-- Structure de la table `edito`
--

CREATE TABLE IF NOT EXISTS `edito` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vider la table avant d'insérer `edito`
--

TRUNCATE TABLE `edito`;
--
-- Contenu de la table `edito`
--

INSERT INTO `edito` (`id`, `title`, `content`, `author`, `date`) VALUES
(1, 'Edito du mois', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci animi blanditiis commodi cupiditate, eveniet rerum suscipit tenetur! Adipisci consequuntur debitis iure laborum magnam officia quisquam. Accusantium nemo quas voluptates? Illum!\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci animi blanditiis commodi cupiditate, eveniet rerum suscipit tenetur! Adipisci consequuntur debitis iure laborum magnam officia quisquam. Accusantium nemo quas voluptates? Illum!\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci animi blanditiis commodi cupiditate, eveniet rerum suscipit tenetur! Adipisci consequuntur debitis iure laborum magnam officia quisquam. Accusantium nemo quas voluptates? Illum!\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci animi blanditiis commodi cupiditate, eveniet rerum suscipit tenetur! Adipisci consequuntur debitis iure laborum magnam officia quisquam. Accusantium nemo quas voluptates? Illum!\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci animi blanditiis commodi cupiditate, eveniet rerum suscipit tenetur! Adipisci consequuntur debitis iure laborum magnam officia quisquam. Accusantium nemo quas voluptates? Illum!\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci animi blanditiis commodi cupiditate, eveniet rerum suscipit tenetur! Adipisci consequuntur debitis iure laborum magnam officia quisquam. Accusantium nemo quas voluptates? Illum!', 'Bernard', '2017-04-04 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `event`
--

CREATE TABLE IF NOT EXISTS `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `opponent` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hour` datetime NOT NULL,
  `place_id` int(11) DEFAULT NULL,
  `place_responsable_id` int(11) DEFAULT NULL,
  `table_responsable_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3BAE0AA7296CD8AE` (`team_id`),
  KEY `IDX_3BAE0AA7B897366B` (`date_id`),
  KEY `IDX_3BAE0AA7DA6A219` (`place_id`),
  KEY `IDX_3BAE0AA778C3AB5E` (`place_responsable_id`),
  KEY `IDX_3BAE0AA72D013E8F` (`table_responsable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vider la table avant d'insérer `event`
--

TRUNCATE TABLE `event`;
--
-- Contenu de la table `event`
--

INSERT INTO `event` (`id`, `date_id`, `team_id`, `opponent`, `hour`, `place_id`, `place_responsable_id`, `table_responsable_id`) VALUES
(4, 11, 1, 'As Rezé', '1970-01-01 17:00:00', 1, 8, 2),
(5, 11, 2, 'St Sébastien', '1970-01-01 18:30:00', 2, NULL, NULL),
(6, 11, 4, 'Nantes HSBC', '1970-01-01 15:00:00', 5, NULL, NULL),
(7, 12, 1, 'Orvault', '1970-01-01 20:00:00', 5, NULL, NULL),
(8, 12, 2, 'Coueron', '1970-01-01 11:00:00', 5, NULL, NULL),
(9, 12, 4, 'Nantes H', '1970-01-01 16:30:00', 4, NULL, NULL),
(10, 13, 1, 'loser team', '1970-01-01 06:00:00', 4, NULL, NULL),
(11, 13, 2, 'Gorges HC', '1970-01-01 14:00:00', 3, 13, 5),
(12, 13, 4, 'Fury Hand', '1970-01-01 19:00:00', 5, NULL, NULL),
(13, 14, 5, 'La Chapelle', '1970-01-01 18:00:00', 5, 14, 1),
(14, 14, 1, 'Angers', '1970-01-01 20:00:00', 1, NULL, NULL),
(15, 14, 4, 'Nantes Hand', '1970-01-01 18:30:00', 2, 13, 6),
(16, 15, 1, 'As Cannes', '1970-01-01 11:00:00', 5, 10, 4),
(17, 15, 8, 'HS Angers', '1970-01-01 19:00:00', 1, 4, 1),
(18, 15, 4, 'Nantes Iles', '1970-01-01 17:00:00', 1, 11, 2),
(19, 16, 12, 'Coueron', '1970-01-01 16:30:00', 5, 14, 3),
(20, 16, 6, 'Les Sorinieres', '1970-01-01 15:00:00', 4, 4, 1),
(21, 16, 14, 'Oudon Hand', '1970-01-01 11:00:00', 5, 8, 5);

-- --------------------------------------------------------

--
-- Structure de la table `fair_play`
--

CREATE TABLE IF NOT EXISTS `fair_play` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vider la table avant d'insérer `fair_play`
--

TRUNCATE TABLE `fair_play`;
--
-- Contenu de la table `fair_play`
--

INSERT INTO `fair_play` (`id`, `title`, `content`) VALUES
(1, 'Charte Asptt Nantes', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab animi ex excepturi laudantium libero magni nesciunt odit. Cumque doloremque fuga ipsam, laboriosam magnam molestiae nostrum optio, placeat quisquam reiciendis unde?\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Ab animi ex excepturi laudantium libero magni nesciunt odit. Cumque doloremque fuga ipsam, laboriosam magnam molestiae nostrum optio, placeat quisquam reiciendis unde?\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Ab animi ex excepturi laudantium libero magni nesciunt odit. Cumque doloremque fuga ipsam, laboriosam magnam molestiae nostrum optio, placeat quisquam reiciendis unde?\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Ab animi ex excepturi laudantium libero magni nesciunt odit. Cumque doloremque fuga ipsam, laboriosam magnam molestiae nostrum optio, placeat quisquam reiciendis unde?\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.');

-- --------------------------------------------------------

--
-- Structure de la table `history`
--

CREATE TABLE IF NOT EXISTS `history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vider la table avant d'insérer `history`
--

TRUNCATE TABLE `history`;
--
-- Contenu de la table `history`
--

INSERT INTO `history` (`id`, `title`, `content`) VALUES
(1, 'Histoire de l\'Asptt Nantes', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab cupiditate, delectus eaque earum enim esse eum eveniet, exercitationem illum magni nisi nulla odio, officia perspiciatis quasi quisquam tempora totam unde?\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Ab cupiditate, delectus eaque earum enim esse eum eveniet, exercitationem illum magni nisi nulla odio, officia perspiciatis quasi quisquam tempora totam unde?\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Ab cupiditate, delectus eaque earum enim esse eum eveniet, exercitationem illum magni nisi nulla odio, officia perspiciatis quasi quisquam tempora totam unde?\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Ab cupiditate, delectus eaque earum enim esse eum eveniet, exercitationem illum magni nisi nulla odio, officia perspiciatis quasi quisquam tempora totam unde?Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.');

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

CREATE TABLE IF NOT EXISTS `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vider la table avant d'insérer `image`
--

TRUNCATE TABLE `image`;
--
-- Contenu de la table `image`
--

INSERT INTO `image` (`id`, `url`, `alt`) VALUES
(1, 'jpeg', 'senior1.jpg'),
(2, 'jpeg', 'SM2.JPG'),
(3, 'jpeg', 'sm3.jpg'),
(4, 'jpeg', 'sf1.jpg'),
(5, 'jpeg', 'sf2.jpg'),
(6, 'jpeg', '20f.jpg'),
(7, 'jpeg', '18m.JPG'),
(8, 'jpeg', '16m1.JPG'),
(9, 'jpeg', '16m1.JPG'),
(10, 'jpeg', '16f.JPG'),
(11, 'jpeg', '14f.jpg'),
(12, 'jpeg', '14m.jpg'),
(13, 'jpeg', '14m.jpg'),
(14, 'jpeg', '12m.jpg'),
(15, 'jpeg', '12m2.jpg'),
(16, 'jpeg', '12f.jpg'),
(17, 'jpeg', '11m2.jpg'),
(18, 'jpeg', '10m.jpg'),
(19, 'jpeg', '10m2.jpg'),
(20, 'jpeg', 'mini-hand.jpg'),
(21, 'jpeg', 'loisirsm.jpg'),
(22, 'jpeg', 'loisirsf.jpg'),
(23, 'jpeg', 'sm3.jpg'),
(24, 'jpeg', 'Logo_France_2017_Handball.jpg'),
(25, 'jpeg', 'kermesse.jpg'),
(26, 'jpeg', 'Allison+Pineau+Olympics+Day+5+Handball+UR2XSaSgkz1l.jpg'),
(27, 'jpeg', 'images.jpg'),
(28, 'jpeg', 'mini-hand.jpg'),
(29, 'jpeg', 'karabaticjpg.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `place`
--

CREATE TABLE IF NOT EXISTS `place` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `adress` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_741D53CD5E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vider la table avant d'insérer `place`
--

TRUNCATE TABLE `place`;
--
-- Contenu de la table `place`
--

INSERT INTO `place` (`id`, `name`, `adress`, `postal_code`, `city`, `phone`) VALUES
(1, 'Salle Longchamp', 'Rue Fernand Pineau Chaillou', '44300', 'Nantes', '0225555522'),
(2, 'Salle des Dervalières', 'Rue Jean-Marc Nattier', '44000', 'Nantes', '0225352544'),
(3, 'Salle Gaston Serpette', 'Boulevard Gaston Serpette', '44400', 'Nantes', '0224783355'),
(4, 'Salle Coubertin', 'Lycée CARCOUET Boulevard du Massacre', '44000', 'Nantes', '0225555522'),
(5, 'Extérieur', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `position`
--

CREATE TABLE IF NOT EXISTS `position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_462CE4F55E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vider la table avant d'insérer `position`
--

TRUNCATE TABLE `position`;
--
-- Contenu de la table `position`
--

INSERT INTO `position` (`id`, `name`) VALUES
(11, 'Animation'),
(8, 'Arbitrage'),
(9, 'Communication'),
(2, 'Entraineur'),
(1, 'Joueur'),
(12, 'Loisir'),
(10, 'Matériel'),
(6, 'Partenariats'),
(3, 'Président'),
(5, 'Secrétaire'),
(7, 'Technique'),
(4, 'Trésorier');

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seo_id` int(11) DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL,
  `post_category_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `published_at` datetime NOT NULL,
  `validated` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_5A8A6C8D97E3DD86` (`seo_id`),
  UNIQUE KEY `UNIQ_5A8A6C8D3DA5256D` (`image_id`),
  KEY `IDX_5A8A6C8DFE0617CD` (`post_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vider la table avant d'insérer `post`
--

TRUNCATE TABLE `post`;
--
-- Contenu de la table `post`
--

INSERT INTO `post` (`id`, `seo_id`, `image_id`, `post_category_id`, `title`, `content`, `author`, `published_at`, `validated`) VALUES
(1, 1, 24, 1, 'Championnat du monde 2017', 'Le Championnat du monde de handball masculin 2017 est la 25e édition du Championnat du monde de handball qui a lieu du 11 au 29 janvier 2017. C\'est une compétition organisée par la Fédération internationale de handball, elle réunit les meilleures sélections nationales.\r\n\r\nElle est organisée par la France pour la troisième fois après 1970 et 2001. L\'équipe de France, vainqueur de l\'édition précédente se déroulant au Qatar, remet son titre en jeu.\r\n\r\nVictorieuse en finale contre la Norvège, l\'équipe de France remporte son sixième titre mondial. La Slovénie complète le podium. C\'est la première apparition de la Norvège et de la Slovénie sur un podium mondial.\r\n\r\nAvec 28 010 spectateurs réunis deux fois au Stade Pierre-Mauroy de Lille pour les matches de l\'équipe de France, cette édition marque un double record d\'affluence pour un match de handball en France et dans un tournoi international.', 'Manolo', '2017-03-30 00:00:00', 0),
(2, 2, 25, 2, 'Kermesse du club', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Gérard', '2017-03-30 00:00:00', 0),
(3, 3, 26, 1, 'Match équipe de France Féminine', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Jean', '2017-03-24 00:00:00', 1),
(4, 4, 27, 2, 'L\'équipe de -14 M en demi finale de la coupe', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Sylvie', '2017-02-23 00:00:00', 1),
(5, 5, 28, 2, 'Venez découvrir le mini-hand', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Jean', '2017-01-22 00:00:00', 1),
(6, 6, 29, 1, 'Karabatic élu meilleur joueur du monde 2016', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Bernard', '2017-01-16 00:00:00', 1);

-- --------------------------------------------------------

--
-- Structure de la table `post_category`
--

CREATE TABLE IF NOT EXISTS `post_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vider la table avant d'insérer `post_category`
--

TRUNCATE TABLE `post_category`;
--
-- Contenu de la table `post_category`
--

INSERT INTO `post_category` (`id`, `name`) VALUES
(1, 'Handball'),
(2, 'Club');

-- --------------------------------------------------------

--
-- Structure de la table `seo`
--

CREATE TABLE IF NOT EXISTS `seo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_6C71EC302B36786B` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vider la table avant d'insérer `seo`
--

TRUNCATE TABLE `seo`;
--
-- Contenu de la table `seo`
--

INSERT INTO `seo` (`id`, `title`, `description`) VALUES
(1, 'Championnat du monde 2017', 'Championnat du monde 2017'),
(2, 'Kermesse du club', 'Kermesse du club le vendredi 26 avril'),
(3, 'Match équipe de France Féminine', 'Match équipe de France Féminine'),
(4, 'L\'équipe de -14 M en demi finale de la coupe', 'L\'équipe de -14 M en demi finale de la coupe'),
(5, 'Venez découvrir le mini-hand', 'Venez découvrir le mini-hand'),
(6, 'Karabatic élu meilleur joueur du monde 2016', 'Karabatic élu meilleur joueur du monde 2016');

-- --------------------------------------------------------

--
-- Structure de la table `team`
--

CREATE TABLE IF NOT EXISTS `team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `image_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `level` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `palmares` longtext COLLATE utf8_unicode_ci NOT NULL,
  `ranking` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C4E0A61F5E237E06` (`name`),
  UNIQUE KEY `UNIQ_C4E0A61F989D9B62` (`slug`),
  UNIQUE KEY `UNIQ_C4E0A61F3DA5256D` (`image_id`),
  KEY `IDX_C4E0A61F12469DE2` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vider la table avant d'insérer `team`
--

TRUNCATE TABLE `team`;
--
-- Contenu de la table `team`
--

INSERT INTO `team` (`id`, `category_id`, `image_id`, `name`, `level`, `palmares`, `ranking`, `updated_at`, `slug`) VALUES
(1, 1, 1, 'SM1', 'Excellence Région', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus.', 'http://www.ff-handball.org/competitions/championnats-regionaux/pays-de-la-loire.html?tx_obladygesthand_pi1%5Bcompetition_id%5D=4255&cHash=57e3ad98a674e785e2c9366e1d40ab62', NULL, 'sm1'),
(2, 1, 2, 'SM2', 'Excellence Départementale', 'Lorem binou dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus.', 'http://www.ff-handball.org/competitions/championnats-regionaux/pays-de-la-loire.html?tx_obladygesthand_pi1%5Bcompetition_id%5D=4255&cHash=57e3ad98a674e785e2c9366e1d40ab62', '2017-03-24 11:16:25', 'sm2'),
(3, 1, 3, 'SM3', 'Division 2 Départementale Poule B', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus.', 'http://www.ff-handball.org/competitions/championnats-regionaux/pays-de-la-loire.html?tx_obladygesthand_pi1%5Bcompetition_id%5D=4255&cHash=57e3ad98a674e785e2c9366e1d40ab62', NULL, 'sm3'),
(4, 1, 4, 'SF1', 'Prénationale', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus.', 'http://www.ff-handball.org/competitions/championnats-regionaux/pays-de-la-loire.html?tx_obladygesthand_pi1%5Bcompetition_id%5D=4255&cHash=57e3ad98a674e785e2c9366e1d40ab62', NULL, 'sf1'),
(5, 1, 5, 'SF2', 'Excellence Région Poule 2', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus.', 'http://www.ff-handball.org/competitions/championnats-regionaux/pays-de-la-loire.html?tx_obladygesthand_pi1%5Bcompetition_id%5D=4255&cHash=57e3ad98a674e785e2c9366e1d40ab62', NULL, 'sf2'),
(6, 2, 6, '-20F', 'Région Poule D', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus.', 'http://www.ff-handball.org/competitions/championnats-regionaux/pays-de-la-loire.html?tx_obladygesthand_pi1%5Bcompetition_id%5D=4255&cHash=57e3ad98a674e785e2c9366e1d40ab62', NULL, '-20f'),
(7, 2, 7, '-18M', 'Division 4', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus.', 'http://www.ff-handball.org/competitions/championnats-regionaux/pays-de-la-loire.html?tx_obladygesthand_pi1%5Bcompetition_id%5D=4255&cHash=57e3ad98a674e785e2c9366e1d40ab62', NULL, '-18m'),
(8, 2, 8, '-16M', 'Division 2', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus.', 'http://www.ff-handball.org/competitions/championnats-regionaux/pays-de-la-loire.html?tx_obladygesthand_pi1%5Bcompetition_id%5D=4255&cHash=57e3ad98a674e785e2c9366e1d40ab62', NULL, '-16m'),
(9, 2, 9, '-16M2', 'Division 8', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus.', 'http://www.ff-handball.org/competitions/championnats-regionaux/pays-de-la-loire.html?tx_obladygesthand_pi1%5Bcompetition_id%5D=4255&cHash=57e3ad98a674e785e2c9366e1d40ab62', NULL, '-16m2'),
(10, 2, 10, '-16F', 'Division 3', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus.', 'http://www.ff-handball.org/competitions/championnats-regionaux/pays-de-la-loire.html?tx_obladygesthand_pi1%5Bcompetition_id%5D=4255&cHash=57e3ad98a674e785e2c9366e1d40ab62', NULL, '-16f'),
(11, 2, 11, '-14F', 'Division 2', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus.', 'http://www.ff-handball.org/competitions/championnats-regionaux/pays-de-la-loire.html?tx_obladygesthand_pi1%5Bcompetition_id%5D=4255&cHash=57e3ad98a674e785e2c9366e1d40ab62', NULL, '-14f'),
(12, 2, 12, '-14M', 'Division 2', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus.', 'http://www.ff-handball.org/competitions/championnats-regionaux/pays-de-la-loire.html?tx_obladygesthand_pi1%5Bcompetition_id%5D=4255&cHash=57e3ad98a674e785e2c9366e1d40ab62', NULL, '-14m'),
(13, 2, 13, '-14M2', 'Division 8', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus.', 'http://www.ff-handball.org/competitions/championnats-regionaux/pays-de-la-loire.html?tx_obladygesthand_pi1%5Bcompetition_id%5D=4255&cHash=57e3ad98a674e785e2c9366e1d40ab62', NULL, '-14m2'),
(14, 3, 14, '-12M', 'Division 1 Poule B', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus.', 'http://www.ff-handball.org/competitions/championnats-regionaux/pays-de-la-loire.html?tx_obladygesthand_pi1%5Bcompetition_id%5D=4255&cHash=57e3ad98a674e785e2c9366e1d40ab62', NULL, '-12m'),
(15, 3, 15, '-12M2', 'Division 4', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus.', 'http://www.ff-handball.org/competitions/championnats-regionaux/pays-de-la-loire.html?tx_obladygesthand_pi1%5Bcompetition_id%5D=4255&cHash=57e3ad98a674e785e2c9366e1d40ab62', NULL, '-12m2'),
(16, 3, 16, '-12F', 'Division 2', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus.', 'http://www.ff-handball.org/competitions/championnats-regionaux/pays-de-la-loire.html?tx_obladygesthand_pi1%5Bcompetition_id%5D=4255&cHash=57e3ad98a674e785e2c9366e1d40ab62', NULL, '-12f'),
(17, 3, 17, '-11 Mixte', 'Division 2', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus.', 'http://www.ff-handball.org/competitions/championnats-regionaux/pays-de-la-loire.html?tx_obladygesthand_pi1%5Bcompetition_id%5D=4255&cHash=57e3ad98a674e785e2c9366e1d40ab62', NULL, '-11mixte'),
(18, 3, 18, '-10 Mixte', 'Division 4', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus.', 'http://www.ff-handball.org/competitions/championnats-regionaux/pays-de-la-loire.html?tx_obladygesthand_pi1%5Bcompetition_id%5D=4255&cHash=57e3ad98a674e785e2c9366e1d40ab62', NULL, '-10mixte'),
(19, 3, 19, '-10 Mixte 2', 'Poule 4', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus.', 'http://www.ff-handball.org/competitions/championnats-regionaux/pays-de-la-loire.html?tx_obladygesthand_pi1%5Bcompetition_id%5D=4255&cHash=57e3ad98a674e785e2c9366e1d40ab62', NULL, '-10mixte2'),
(20, 3, 20, 'Mini-hand', 'école de Handball', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus.', 'http://www.ff-handball.org/competitions/championnats-regionaux/pays-de-la-loire.html?tx_obladygesthand_pi1%5Bcompetition_id%5D=4255&cHash=57e3ad98a674e785e2c9366e1d40ab62', NULL, 'mini-hand'),
(21, 4, 21, 'Loisirs Masculine', 'Poule 4', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus.', 'http://www.ff-handball.org/competitions/championnats-regionaux/pays-de-la-loire.html?tx_obladygesthand_pi1%5Bcompetition_id%5D=4255&cHash=57e3ad98a674e785e2c9366e1d40ab62', NULL, 'loisirs-masculine'),
(22, 4, 22, 'Loisirs Féminine', 'Poule 4', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus.', 'http://www.ff-handball.org/competitions/championnats-regionaux/pays-de-la-loire.html?tx_obladygesthand_pi1%5Bcompetition_id%5D=4255&cHash=57e3ad98a674e785e2c9366e1d40ab62', NULL, 'loisirs-feminine'),
(23, 5, NULL, 'Administration', 'admin', 'admin', 'http://asptt-nanteshandball.wixsite.com/asptt-handball-nts', NULL, 'administration'),
(24, 5, NULL, 'non attribué', 'non attribué', 'non attribué', 'http://stackoverflow.com/questions/29030418/symfony2-entity-form-field-with-empty-value', NULL, 'non-attribue');

-- --------------------------------------------------------

--
-- Structure de la table `training`
--

CREATE TABLE IF NOT EXISTS `training` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `place_id` int(11) DEFAULT NULL,
  `hour` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D5128A8F9C24126` (`day_id`),
  KEY `IDX_D5128A8F296CD8AE` (`team_id`),
  KEY `IDX_D5128A8FDA6A219` (`place_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vider la table avant d'insérer `training`
--

TRUNCATE TABLE `training`;
--
-- Contenu de la table `training`
--

INSERT INTO `training` (`id`, `day_id`, `team_id`, `place_id`, `hour`) VALUES
(1, 1, 12, 1, '1970-01-01 17:30:00'),
(2, 1, 8, 1, '1970-01-01 19:00:00'),
(3, 1, 7, 1, '1970-01-01 19:00:00'),
(4, 2, 11, 4, '1970-01-01 18:30:00'),
(5, 2, 9, 2, '1970-01-01 18:30:00'),
(6, 2, 1, 2, '1970-01-01 20:00:00'),
(7, 2, 2, 2, '1970-01-01 20:00:00'),
(8, 2, 14, 1, '1970-01-01 18:00:00'),
(9, 2, 6, 1, '1970-01-01 19:00:00'),
(10, 2, 4, 1, '1970-01-01 20:30:00'),
(11, 2, 5, 1, '1970-01-01 20:30:00'),
(12, 3, 18, 1, '1970-01-01 13:45:00'),
(13, 3, 17, 1, '1970-01-01 13:45:00'),
(14, 3, 16, 1, '1970-01-01 15:25:00'),
(15, 3, 14, 1, '1970-01-01 17:05:00'),
(16, 3, 12, 1, '1970-01-01 18:45:00'),
(17, 3, 21, 1, '1970-01-01 20:15:00'),
(18, 3, 22, 1, '1970-01-01 20:15:00'),
(19, 3, 8, 3, '1970-01-01 18:30:00'),
(20, 3, 7, 3, '1970-01-01 18:30:00'),
(21, 4, 10, 1, '1970-01-01 18:30:00'),
(22, 4, 6, 1, '1970-01-01 18:30:00'),
(23, 4, 1, 1, '1970-01-01 20:30:00'),
(24, 4, 2, 1, '1970-01-01 20:30:00'),
(25, 5, 9, 1, '1970-01-01 18:00:00'),
(26, 5, 4, 1, '1970-01-01 19:30:00'),
(27, 5, 5, 1, '1970-01-01 19:30:00'),
(28, 6, 20, 1, '1970-01-01 10:15:00');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_id` int(11) NOT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `birthdate` datetime NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8D93D649296CD8AE` (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vider la table avant d'insérer `user`
--

TRUNCATE TABLE `user`;
--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `team_id`, `firstname`, `lastname`, `birthdate`, `email`) VALUES
(4, 23, 'Agnes', 'Tessier', '1913-02-17 00:00:00', 'agnes@gmail.com'),
(5, 1, 'Kevin', 'Doudon', '1988-05-18 00:00:00', 'keke44@hotmail.com'),
(6, 1, 'Bernard', 'Larchet', '1971-06-14 00:00:00', 'nanar@laposte.net'),
(7, 1, 'Thomas', 'Bibi', '1988-03-16 00:00:00', 'tom@yahoo.fr'),
(8, 23, 'Olivier', 'Baubineau', '1958-05-16 00:00:00', 'oliv@asptt.fr'),
(9, 23, 'Lydie', 'Telion', '1970-08-18 00:00:00', 'lydie@asptt.fr'),
(10, 23, 'Jean', 'Douasy', '1959-11-06 00:00:00', 'com@asptt.fr'),
(11, 4, 'David', 'Hasselhoff', '1972-01-03 00:00:00', 'david@asptt.fr'),
(12, 2, 'Philippe', 'Tavot', '1970-10-16 00:00:00', 'phil@asptt.fr'),
(13, 23, 'Francis', 'Tatanne', '1953-06-16 00:00:00', 'francis@asptt.fr'),
(14, 4, 'Carine', 'Boulay', '1983-04-15 00:00:00', 'carine@asptt.fr'),
(15, 12, 'Robert', 'Bonnet', '1960-04-06 00:00:00', 'rob@asptt.fr'),
(16, 1, 'Alexandre', 'Reltho', '1992-03-05 00:00:00', 'alex@gmail.com'),
(17, 24, 'Non attribué', 'Non attribué', '1912-11-18 00:00:00', 'null@yahoo.com');

-- --------------------------------------------------------

--
-- Structure de la table `user_position`
--

CREATE TABLE IF NOT EXISTS `user_position` (
  `user_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`position_id`),
  KEY `IDX_A6A100F5A76ED395` (`user_id`),
  KEY `IDX_A6A100F5DD842E46` (`position_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Vider la table avant d'insérer `user_position`
--

TRUNCATE TABLE `user_position`;
--
-- Contenu de la table `user_position`
--

INSERT INTO `user_position` (`user_id`, `position_id`) VALUES
(4, 5),
(5, 1),
(6, 2),
(7, 1),
(8, 3),
(9, 4),
(10, 9),
(11, 2),
(11, 8),
(12, 2),
(12, 10),
(13, 6),
(14, 1),
(14, 11),
(15, 2),
(15, 12),
(16, 1);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `FK_3BAE0AA7296CD8AE` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`),
  ADD CONSTRAINT `FK_3BAE0AA72D013E8F` FOREIGN KEY (`table_responsable_id`) REFERENCES `team` (`id`),
  ADD CONSTRAINT `FK_3BAE0AA778C3AB5E` FOREIGN KEY (`place_responsable_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_3BAE0AA7B897366B` FOREIGN KEY (`date_id`) REFERENCES `date` (`id`),
  ADD CONSTRAINT `FK_3BAE0AA7DA6A219` FOREIGN KEY (`place_id`) REFERENCES `place` (`id`);

--
-- Contraintes pour la table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `FK_5A8A6C8D3DA5256D` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`),
  ADD CONSTRAINT `FK_5A8A6C8D97E3DD86` FOREIGN KEY (`seo_id`) REFERENCES `seo` (`id`),
  ADD CONSTRAINT `FK_5A8A6C8DFE0617CD` FOREIGN KEY (`post_category_id`) REFERENCES `post_category` (`id`);

--
-- Contraintes pour la table `team`
--
ALTER TABLE `team`
  ADD CONSTRAINT `FK_C4E0A61F12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FK_C4E0A61F3DA5256D` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`);

--
-- Contraintes pour la table `training`
--
ALTER TABLE `training`
  ADD CONSTRAINT `FK_D5128A8F296CD8AE` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`),
  ADD CONSTRAINT `FK_D5128A8F9C24126` FOREIGN KEY (`day_id`) REFERENCES `day` (`id`),
  ADD CONSTRAINT `FK_D5128A8FDA6A219` FOREIGN KEY (`place_id`) REFERENCES `place` (`id`);

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_8D93D649296CD8AE` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`);

--
-- Contraintes pour la table `user_position`
--
ALTER TABLE `user_position`
  ADD CONSTRAINT `FK_A6A100F5A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A6A100F5DD842E46` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
