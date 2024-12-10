-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: collaiw225.mysql.db
-- Generation Time: Dec 10, 2024 at 04:06 AM
-- Server version: 8.0.39-30
-- PHP Version: 8.1.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `collaiw225`
--

-- --------------------------------------------------------

--
-- Table structure for table `hors_forfait`
--

CREATE TABLE `hors_forfait` (
  `id_hors_forfait` int NOT NULL,
  `date_hors_forfait` date NOT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `montant` decimal(10,2) NOT NULL,
  `justificatif` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `statut` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `montant_rembourse` decimal(10,2) NOT NULL,
  `id_visiteur` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hors_forfait`
--

INSERT INTO `hors_forfait` (`id_hors_forfait`, `date_hors_forfait`, `libelle`, `montant`, `justificatif`, `statut`, `montant_rembourse`, `id_visiteur`) VALUES
(1, '2024-11-07', 'Achat de fleurs pour Mme Tuchot', 40.00, 'assets/uploads/CultureG_image_thanksgiving_CGINET_AHAMADI.pdf', '', 0.00, 2),
(2, '2024-11-07', 'Achat de fleurs pour Mme Echalier', 40.00, 'assets/uploads/Lettre de motivation Lydz.pdf', 'Remboursement complet', 40.00, 2),
(4, '2024-12-02', '(Gros) tour de manège avec mon chien Hubert', 100.00, 'assets/uploads/Lettre de motivation Cerfrance.pdf', 'En attente', 0.00, 14),
(5, '2024-10-10', 'Achat d\'une Ferrari pour l\'anniversaire d\'un client', 100000.00, 'assets/uploads/Lettre de motivation Eurex.pdf', 'En attente', 0.00, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hors_forfait`
--
ALTER TABLE `hors_forfait`
  ADD PRIMARY KEY (`id_hors_forfait`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hors_forfait`
--
ALTER TABLE `hors_forfait`
  MODIFY `id_hors_forfait` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
