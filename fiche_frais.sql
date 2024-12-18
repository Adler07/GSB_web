-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: collaiw225.mysql.db
-- Generation Time: Dec 10, 2024 at 04:07 AM
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
-- Table structure for table `fiche_frais`
--

CREATE TABLE `fiche_frais` (
  `n°fiche_frais` int NOT NULL,
  `montant_repas` decimal(10,2) DEFAULT NULL,
  `nombre_repas` int NOT NULL,
  `montant_hebergement` decimal(10,2) DEFAULT NULL,
  `nombre_hebergement` int NOT NULL,
  `montant_deplacement` decimal(10,2) DEFAULT '0.00',
  `nombre_deplacement` int NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `date_soumission` date NOT NULL,
  `justificatif` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `kilometres_voiture` int DEFAULT '0',
  `statut` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `montant_rembourse` decimal(10,2) DEFAULT '0.00',
  `id_visiteur` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fiche_frais`
--

INSERT INTO `fiche_frais` (`n°fiche_frais`, `montant_repas`, `nombre_repas`, `montant_hebergement`, `nombre_hebergement`, `montant_deplacement`, `nombre_deplacement`, `total`, `date_soumission`, `justificatif`, `kilometres_voiture`, `statut`, `montant_rembourse`, `id_visiteur`) VALUES
(1, 120.00, 0, 250.00, 0, 720.00, 0, 1090.00, '2024-10-01', '', 0, '', 0.00, NULL),
(2, 0.00, 0, 1250.00, 0, 2800.00, 0, 4050.00, '2024-09-11', '', 0, '', 0.00, NULL),
(3, 20.00, 0, 50.00, 0, 0.00, 0, 70.00, '2024-08-01', '', 0, '', 0.00, NULL),
(4, 400.00, 0, 250.00, 0, 75.00, 0, 725.00, '2024-07-27', '', 0, '', 0.00, NULL),
(5, 86.00, 0, 37.00, 0, 991.00, 0, 1114.00, '2024-07-10', '', 0, '', 0.00, NULL),
(9, 11.00, 0, 1250.00, 0, 993.00, 0, 2254.00, '2024-11-02', '', 0, '', 0.00, NULL),
(10, 11.00, 0, 1250.00, 0, 993.00, 0, 2254.00, '2024-11-02', '', 0, '', 0.00, NULL),
(11, 789.00, 0, 999.99, 0, 25.00, 0, 1813.99, '2024-03-09', '', 0, '', 0.00, NULL),
(12, 40.00, 4, 250.00, 3, 100.00, 4, 390.00, '2024-11-06', 'assets/uploads/Etonnement.pdf', 0, '', 0.00, NULL),
(13, 120.00, 5, 250.00, 4, 0.00, 0, 0.00, '2024-11-12', 'assets/uploads/Preparation_Partie_Theorique.pdf', NULL, '', 0.00, NULL),
(14, 120.00, 11, 350.00, 6, 0.00, 0, 0.00, '2024-11-13', 'assets/uploads/Tutoriel d\'Intégration de Chart.js.pdf', 40, '', 0.00, NULL),
(15, 120.00, 3, 250.00, 5, 0.00, 0, 0.00, '2024-11-05', 'assets/uploads/SQL_Fr_PPT01_etudiant_corrigé.pdf', 45, '', 0.00, NULL),
(16, 120.00, 3, 250.00, 5, 0.00, 0, 0.00, '2024-11-05', 'assets/uploads/SQL_Fr_PPT01_etudiant_corrigé.pdf', 45, '', 0.00, NULL),
(17, 120.00, 3, 250.00, 5, 0.00, 0, 0.00, '2024-11-05', 'assets/uploads/SQL_Fr_PPT01_etudiant_corrigé.pdf', 45, '', 0.00, NULL),
(18, 400.00, 12, 420.00, 8, 0.00, 0, 880.00, '2024-11-02', 'Array', 120, 'Remboursement partiel', 600.00, 2),
(19, 85.00, 4, 225.00, 2, NULL, 0, 435.00, '2024-09-04', 'assets/uploads/corrige_sujet_polynesie-CEJM.pdf', 250, 'Refusé', 0.00, 2),
(20, 60.00, 6, 300.00, 3, 0.00, 0, 460.00, '2024-11-01', 'assets/uploads/corrige_sujet_polynesie-CEJM.pdf\r\n', 200, 'Remboursement partiel', 300.00, 2),
(21, 220.00, 2, 52.00, 4, 0.00, 0, 274.50, '2024-10-10', 'assets/uploads/SQL_Fr_PPT01_etudiant_corrigé.pdf\r\n', 5, 'Remboursement complet', 274.50, 2),
(22, 100.00, 2, 250.00, 3, NULL, 1, 370.00, '2024-05-16', 'assets/uploads/Exemple-Annexes-9-1-B-Fiche-descriptive.pdf', 24, 'Remboursement complet', 370.00, NULL),
(23, 100.00, 5, 120.00, 3, NULL, 0, 230.00, '2024-04-04', 'assets/uploads/Lettre de motivation ADW Network.pdf', 20, 'En attente', 0.00, NULL),
(24, 400.00, 12, 800.00, 6, NULL, 0, 1270.00, '2024-12-01', 'assets/uploads/Lettre de motivation BCI.pdf', 140, 'En attente', 0.00, 14);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fiche_frais`
--
ALTER TABLE `fiche_frais`
  ADD PRIMARY KEY (`n°fiche_frais`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fiche_frais`
--
ALTER TABLE `fiche_frais`
  MODIFY `n°fiche_frais` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
