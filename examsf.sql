-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 31 juil. 2023 à 11:26
-- Version du serveur : 8.0.31
-- Version de PHP : 8.1.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `examsf`
--

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230727191126', '2023-07-27 19:11:54', 118),
('DoctrineMigrations\\Version20230727192655', '2023-07-27 19:27:13', 112),
('DoctrineMigrations\\Version20230729214010', '2023-07-29 21:40:30', 228);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sector` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contract` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `release_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `firstname`, `lastname`, `photo`, `sector`, `contract`, `release_date`) VALUES
(23, 'rh@humanbooster.com', '[\"ROLE_RH\"]', '$2y$13$miyAx2n4aanUufVuqWObduTMj4EejJ.EHk/AJwNrfZueaF87IZcxW', 'Arnaud', 'Bravard', 'rh-64c5841f4c197.jpg', 'RH', 'CDI', NULL),
(24, 'gwen@user.fr', '[\"ROLE_USER\"]', '$2y$13$wdUNG3JZFxCGr63iiNf7Mu0RZe1zx1cugbC5xrIVFXkRhsmnxkUpC', 'Gwendoline', 'Dupont', 'gwendoline-64c5853dd6ac8.jpg', 'Comptabilité', 'CDI', NULL),
(25, 'theodule@user.fr', '[\"ROLE_USER\"]', '$2y$13$/P4kx/N3rZG72M5m9dcLCergRPKuXEtUGasBsvANaWC6q80IxkaSq', 'Théodule', 'Tartempion', 'tartempion-64c5860fc9adf.webp', 'Informatique', 'CDI', NULL),
(26, 'mariec@user.fr', '[\"ROLE_USER\"]', '$2y$13$C.cnKipWvQZitdYSFi/cduDmIBTHCQrkheUUaJXj0PUu88AYCJptC', 'Marie-Claire', 'Sévaire', 'marie-64c586968581e.jpg', 'Direction', 'CDI', NULL),
(27, 'debby@user.fr', '[\"ROLE_USER\"]', '$2y$13$6bIw0dPxaJaXR02HxTW9GuMaROmNEdL.bVbwpANXL3djmDklTSepu', 'Debby', 'McCarth', 'debby-64c589c1c292b.jpg', 'RH', 'CDD', NULL),
(42, 'john@user.fr', '[\"ROLE_USER\"]', '$2y$13$3OEjqDBrpeFuDCXB9lPlXuOCj6h3VVfM5QZDFBfUU8bvHbNJkrEf2', 'John', 'Fashion', 'john-64c6a77014089.jpg', 'Informatique', 'CDD', '2023-08-20'),
(43, 'patou@user.fr', '[\"ROLE_USER\"]', '$2y$13$1MKkYSeDR8sIowKyhCJ66uIMROGotyv7KEnYIAfySI..E6UKCWhmG', 'Patrick', 'Tarba', 'patrick-64c6a7a0c9097.jpg', 'Direction', 'CDI', NULL),
(44, 'juju@user.fr', '[\"ROLE_USER\"]', '$2y$13$QYmeanUjhfu42lPgbmIHYOhwHefwTa/G8FFRB1WuafW6jkUdwJ/iy', 'Julie', 'Sourire', 'julie-64c6a7d8bc415.webp', 'Comptabilité', 'Interim', '2023-09-14'),
(51, 'julien@user.fr', '[\"ROLE_USER\"]', '$2y$13$N2.NSBrlkP7gdTzCdbpB6Osiq9yBhPErN5/TpdZFNueTZc9l.YY52', 'Julien', 'Vénère', 'julien-64c7851414816.webp', 'Informatique', 'Interim', '2023-08-27'),
(52, 'odile@user.fr', '[\"ROLE_USER\"]', '$2y$13$Y08rj3Z7e7KHiyVidQqY/eqCV13Kgn3HQwvJcctzuHHRVdXSwAdBK', 'Odile', 'Deray', 'odile-64c78577cac79.jpg', 'RH', 'CDD', '2023-09-12');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
