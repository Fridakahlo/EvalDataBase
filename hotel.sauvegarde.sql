-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Ven 25 Mai 2018 à 11:26
-- Version du serveur :  5.7.22-0ubuntu0.16.04.1
-- Version de PHP :  7.0.30-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `hotel`
--

-- --------------------------------------------------------

--
-- Structure de la table `bathrooms`
--

CREATE TABLE `bathrooms` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `description` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `bathrooms`
--

INSERT INTO `bathrooms` (`id`, `description`) VALUES
(1, 'douche'),
(2, 'baignoire'),
(3, 'douche et baignoire');

-- --------------------------------------------------------

--
-- Structure de la table `beds`
--

CREATE TABLE `beds` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `description` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `beds`
--

INSERT INTO `beds` (`id`, `description`) VALUES
(1, 'simple'),
(2, 'double queen'),
(3, 'double king');

-- --------------------------------------------------------

--
-- Structure de la table `bookings`
--

CREATE TABLE `bookings` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `arrival_date` date NOT NULL,
  `departure_date` date NOT NULL,
  `guest` smallint(5) UNSIGNED NOT NULL,
  `state` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `bookings`
--

INSERT INTO `bookings` (`id`, `arrival_date`, `departure_date`, `guest`, `state`) VALUES
(1, '2018-08-25', '2018-09-05', 3, 2),
(2, '2018-08-25', '2018-10-05', 3, 2),
(3, '2018-07-12', '2018-07-18', 2, 3),
(4, '2018-05-23', '2018-05-30', 1, 1),
(5, '2018-06-01', '2018-06-15', 4, 4),
(6, '2018-06-04', '2018-09-06', 5, 2),
(7, '2018-07-22', '2018-07-28', 2, 4),
(8, '2018-08-05', '2018-08-12', 5, 1),
(9, '2018-09-09', '2018-09-14', 4, 2);

-- --------------------------------------------------------

--
-- Structure de la table `bookings_rooms`
--

CREATE TABLE `bookings_rooms` (
  `booking` smallint(5) UNSIGNED NOT NULL,
  `room` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `bookings_rooms`
--

INSERT INTO `bookings_rooms` (`booking`, `room`) VALUES
(1, 2),
(2, 6),
(3, 3),
(5, 4),
(6, 1),
(8, 5),
(9, 3),
(3, 2),
(1, 6),
(3, 1),
(6, 4);

-- --------------------------------------------------------

--
-- Structure de la table `bookings_services`
--

CREATE TABLE `bookings_services` (
  `booking` smallint(5) UNSIGNED NOT NULL,
  `service` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `bookings_services`
--

INSERT INTO `bookings_services` (`booking`, `service`) VALUES
(1, 2),
(2, 6),
(3, 3),
(5, 4),
(6, 1),
(8, 5),
(9, 7),
(3, 2),
(1, 6),
(3, 7),
(6, 4);

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'matériel'),
(2, 'bien être'),
(3, 'repas'),
(4, 'spécial');

-- --------------------------------------------------------

--
-- Structure de la table `guests`
--

CREATE TABLE `guests` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `phone_number` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `address` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `guests`
--

INSERT INTO `guests` (`id`, `first_name`, `last_name`, `phone_number`, `email`, `address`, `password`) VALUES
(1, 'Pedro', 'Sanchez', '05.35.24.23.65', 'pedrosanchez@gmail.com', '21 Place de la Fontaine 12345 Golinhac, France', 'pedroparamo'),
(2, 'Maria', 'Krotz', '04.45.24.33.66', 'mariakrotz@aol.com', '35 Loet Av 67456 Munich, Alemagne', 'ilovihi'),
(3, 'Itoki', 'Chen', '55.34.67.99.27', 'itokichen@yuyuzu.com', '89 Avazuni St 36866 Sichuan, Chine', 'kakunitzu'),
(4, 'Laurence', 'Lapierre', '06.35.24.23.65', 'laurencelapierre@gmail.com', '46 Av. Fleuri 34567 Metz', 'loloveutpas'),
(5, 'Selena', 'Williams', '01.96.37.67.90', 'selenawilliams@yahoo.com', '1 Malibu avenue 56789 California', 'iamthebest');

-- --------------------------------------------------------

--
-- Structure de la table `rooms`
--

CREATE TABLE `rooms` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(45) NOT NULL,
  `area` float NOT NULL,
  `kind_room` tinyint(1) NOT NULL,
  `floor` smallint(6) NOT NULL,
  `view` varchar(45) NOT NULL,
  `accessibility` tinyint(1) NOT NULL,
  `cost` float NOT NULL,
  `bathroom` smallint(5) UNSIGNED NOT NULL,
  `bed` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `rooms`
--

INSERT INTO `rooms` (`id`, `name`, `area`, `kind_room`, `floor`, `view`, `accessibility`, `cost`, `bathroom`, `bed`) VALUES
(1, 'Moscou', 28.5, 0, 1, 'Mer', 1, 225, 3, 3),
(2, 'Paris', 18.5, 1, 1, 'Montagne', 0, 180.5, 1, 1),
(3, 'Rio', 22.5, 0, 2, 'Mer', 1, 200, 2, 2),
(4, 'Tokio', 15.7, 1, 2, 'Montagne', 0, 165.6, 1, 2),
(5, 'Dublin', 25, 0, 3, 'Mer', 0, 215, 2, 3),
(6, 'Oslo', 19.5, 1, 3, 'Montagne', 1, 190, 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `services`
--

CREATE TABLE `services` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` text NOT NULL,
  `cost` float NOT NULL,
  `availability` tinyint(1) NOT NULL,
  `category` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `services`
--

INSERT INTO `services` (`id`, `name`, `description`, `cost`, `availability`, `category`) VALUES
(1, 'Petit Déjeuner en chambre', 'PDJ Continental', 25, 1, 3),
(2, 'Minibar', '2 paquets de snacks, eau plate et petillant, chocolat, vin blanc et mousseaux, gin et vodka', 85, 0, 3),
(3, 'Bouteille de Champagne', 'Roederer Brut 75 cl et corbeille de fraises', 140, 1, 3),
(4, 'Pret ordinateur portable', 'HP 234 avec connexion internet et programmes de base', 20, 1, 1),
(5, 'Massage', '45 min realisé au wellness', 75, 1, 2),
(6, 'Scort Boy', 'Mission de 2 hr', 245, 0, 4),
(7, 'Resevation de voiture', 'Categorie a choisir par le client', 25, 0, 4);

-- --------------------------------------------------------

--
-- Structure de la table `states`
--

CREATE TABLE `states` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `description` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `states`
--

INSERT INTO `states` (`id`, `description`) VALUES
(1, 'en cours'),
(2, 'paiement effectué'),
(3, 'annulé'),
(4, 'a attente de confimation');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `bathrooms`
--
ALTER TABLE `bathrooms`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `beds`
--
ALTER TABLE `beds`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_guest` (`guest`),
  ADD KEY `fk_state` (`state`);

--
-- Index pour la table `bookings_rooms`
--
ALTER TABLE `bookings_rooms`
  ADD KEY `fk_booking__rooms` (`booking`),
  ADD KEY `fk_room` (`room`);

--
-- Index pour la table `bookings_services`
--
ALTER TABLE `bookings_services`
  ADD KEY `fk_booking` (`booking`),
  ADD KEY `fk_service` (`service`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `guests`
--
ALTER TABLE `guests`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_bathroom` (`bathroom`),
  ADD KEY `fk_bed` (`bed`);

--
-- Index pour la table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_category` (`category`);

--
-- Index pour la table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `bathrooms`
--
ALTER TABLE `bathrooms`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `beds`
--
ALTER TABLE `beds`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `guests`
--
ALTER TABLE `guests`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `services`
--
ALTER TABLE `services`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `states`
--
ALTER TABLE `states`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `fk_guest` FOREIGN KEY (`guest`) REFERENCES `guests` (`id`),
  ADD CONSTRAINT `fk_state` FOREIGN KEY (`state`) REFERENCES `states` (`id`);

--
-- Contraintes pour la table `bookings_rooms`
--
ALTER TABLE `bookings_rooms`
  ADD CONSTRAINT `fk_booking__rooms` FOREIGN KEY (`booking`) REFERENCES `bookings` (`id`),
  ADD CONSTRAINT `fk_room` FOREIGN KEY (`room`) REFERENCES `rooms` (`id`);

--
-- Contraintes pour la table `bookings_services`
--
ALTER TABLE `bookings_services`
  ADD CONSTRAINT `fk_booking` FOREIGN KEY (`booking`) REFERENCES `bookings` (`id`),
  ADD CONSTRAINT `fk_service` FOREIGN KEY (`service`) REFERENCES `services` (`id`);

--
-- Contraintes pour la table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `fk_bathroom` FOREIGN KEY (`bathroom`) REFERENCES `bathrooms` (`id`),
  ADD CONSTRAINT `fk_bed` FOREIGN KEY (`bed`) REFERENCES `beds` (`id`);

--
-- Contraintes pour la table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`category`) REFERENCES `categories` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
