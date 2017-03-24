-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  localhost
-- Généré le :  Jeu 23 Mars 2017 à 21:35
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

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(3, 'Enfants'),
(2, 'Jeunes'),
(4, 'Loisirs'),
(1, 'Senior');

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

CREATE TABLE IF NOT EXISTS `image` (
  `id` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alt` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(23, 'jpeg', 'sm3.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `team`
--

CREATE TABLE IF NOT EXISTS `team` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `image_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `level` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `palmares` longtext COLLATE utf8_unicode_ci NOT NULL,
  `ranking` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `team`
--

INSERT INTO `team` (`id`, `category_id`, `image_id`, `name`, `level`, `palmares`, `ranking`, `updated_at`, `slug`) VALUES
(1, 1, 1, 'SM1', 'Excellence Région', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus.', 'http://www.ff-handball.org/competitions/championnats-regionaux/pays-de-la-loire.html?tx_obladygesthand_pi1%5Bcompetition_id%5D=4255&cHash=57e3ad98a674e785e2c9366e1d40ab62', NULL, 'sm1'),
(2, 1, 2, 'SM2', 'Excellence Départementale', 'Lorem bacon dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus.', 'http://www.ff-handball.org/competitions/championnats-regionaux/pays-de-la-loire.html?tx_obladygesthand_pi1%5Bcompetition_id%5D=4255&cHash=57e3ad98a674e785e2c9366e1d40ab62', '2017-03-21 17:35:55', 'sm2'),
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
(22, 4, 22, 'Loisirs Féminine', 'Poule 4', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur debitis dolor doloremque error, esse magnam magni minima nobis pariatur quibusdam quos reiciendis sapiente! Atque commodi consequatur nobis optio. Fugit, natus.', 'http://www.ff-handball.org/competitions/championnats-regionaux/pays-de-la-loire.html?tx_obladygesthand_pi1%5Bcompetition_id%5D=4255&cHash=57e3ad98a674e785e2c9366e1d40ab62', NULL, 'loisirs-feminine');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_64C19C15E237E06` (`name`);

--
-- Index pour la table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C4E0A61F5E237E06` (`name`),
  ADD UNIQUE KEY `UNIQ_C4E0A61F989D9B62` (`slug`),
  ADD UNIQUE KEY `UNIQ_C4E0A61F3DA5256D` (`image_id`),
  ADD KEY `IDX_C4E0A61F12469DE2` (`category_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT pour la table `team`
--
ALTER TABLE `team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `team`
--
ALTER TABLE `team`
  ADD CONSTRAINT `FK_C4E0A61F12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FK_C4E0A61F3DA5256D` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
