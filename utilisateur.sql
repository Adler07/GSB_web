-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2024 at 03:19 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gsb1`
--

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) NOT NULL,
  `ville` varchar(100) DEFAULT NULL,
  `code_postal` varchar(11) DEFAULT NULL,
  `statut` varchar(50) DEFAULT NULL,
  `id_role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `prenom`, `email`, `pass`, `telephone`, `ville`, `code_postal`, `statut`, `id_role`) VALUES
(1, 'Dupont', 'Jean', 'jean.dupont@gsb.com', '$2y$10$Z8IQ5Gd.AQ6kg1ozrZw/w.W8n36oPFFba5oPCq/yaLTHZzmv5vP/a', '0624928371', 'Lyon', '69001', 'Actif', 1),
(2, 'Richard', 'Pierre', 'pierre.richard@gsb.com', '$2y$10$V.geuaA8O21huTiUvPCKNesjehv7RW75T20aW0rAXF966I/CTa5XK', '0782948822', 'Villeurbanne', '69001', 'Actif', 3),
(3, 'Dupont', 'Marie', 'marie.dupont@gsb.com', '$2y$10$hJ9A7GQLREC3/VmMl1coWO9/wrYqyWY0KoXeQ4CCxX7tcdkO.JQDK', '0648211452', 'Lyon', '69003', 'Actif', 2),
(5, 'Echalotte', 'Kevin', 'kevin.echalotte@gmail.com', '$2y$10$6yvtlgo16OwDYW8UGlRQGOYTW91DHQRh0moNSNRzDnRK2O/EjDaUC', '0672265562', 'Macon', '69001', 'Actif', 2),
(6, 'Philippot', 'Maxime', 'maxence.philippot@gmail.com', '$2y$10$xOHGqdkNHEWWJtvdLW.ud.FsEqABF3s8xpgRZg9cUcFUY9WmZsFi.', '0746625176', 'Macon', '69001', 'Actif', 3),
(7, 'Catarossi', 'Evan', 'evan.catarossi@gmail.com', '$2y$10$M30AsGWnKrnTlUecIWaKPOofRfRJiyID1Wqod87AHbmY4MksbdSgW', '0612345678', 'Beynost', '69001', 'Actif', 3),
(11, 'Ginet', 'Collain', 'collain.ginet@gmail.com', '$2y$10$M4oNI9lp/DbO0Kr6BIp6COumL619BWGUQ0NVbVE3i1zsIEzNRq3pG', '0695512438', 'Dagneux', '01120', 'Actif', 1),
(12, 'Hamadi', 'Abass', 'abass.hamadi@gmail.com', '$2y$10$ahePP.X2yy/ZFRgNqbgZ5OauxQJbC8i9oXZfq0rb7FJOWK80lZhwu', '0678029416', 'Lyon', '69001', 'Actif', 2),
(13, 'Gente', 'Remi', 'remi.gente@gmail.com', '$2y$10$1xklZotCRNHpsAymLjTFAO9tTC7.a3uNRn.DsJAoEwUD4.TfWEIsm', '0648291199', 'Lyon', '69001', 'Actif', 3),
(14, 'Ginet', 'Jean', 'jean.ginet@gmail.com', '$2y$10$6V1tXealgIuFFLEgAfOefuCq4ADJRDtbCHJQs2zHX71qKY9sMVf6m', '0677889911', 'Dagneux', '01120', 'Actif', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_utilisateur_role` (`id_role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `fk_utilisateur_role` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
