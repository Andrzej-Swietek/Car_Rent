-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 03, 2021 at 05:55 PM
-- Server version: 5.7.34
-- PHP Version: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `car_rent_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `Archive`
--

CREATE TABLE `Archive` (
  `ID` int(11) NOT NULL,
  `Id_user` int(11) NOT NULL,
  `Id_car` int(11) NOT NULL,
  `DateStart` varchar(30) NOT NULL,
  `DateEnd` varchar(30) NOT NULL,
  `Status` varchar(255) NOT NULL,
  `Time` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Archive`
--

INSERT INTO `Archive` (`ID`, `Id_user`, `Id_car`, `DateStart`, `DateEnd`, `Status`, `Time`) VALUES
(1, 2, 1, '2021-10-31', '2021-10-14', 'cancelled', '1');

-- --------------------------------------------------------

--
-- Table structure for table `Cars`
--

CREATE TABLE `Cars` (
  `ID` int(11) NOT NULL,
  `Brand` varchar(255) NOT NULL,
  `Model` varchar(255) NOT NULL,
  `Year` varchar(255) NOT NULL,
  `CarCondition` varchar(255) NOT NULL,
  `Image` varchar(255) NOT NULL,
  `Price` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Cars`
--

INSERT INTO `Cars` (`ID`, `Brand`, `Model`, `Year`, `CarCondition`, `Image`, `Price`) VALUES
(1, 'Golf', '3', '1999', 'Niemiec płakał jak sprzedawał.', 'https://a.allegroimg.com/s1024/0c2c12/0cb8fd9f4874a7b2e1c441c0a920', '25'),
(2, 'Tesla', 'Model S', '2021', 'Brand New', 'https://i.wpimg.pl/1200x0/m.autokult.pl/65cc9a70bbf881d901b6e2d3-a44a739.jpg', '50'),
(3, 'Chevrolet', 'Camaro', '2021', 'Perfect', 'https://cdn.motor1.com/images/mgl/0lzY9/s1/camaro-ss-with-1le-package.jpg', '40'),
(4, 'Ford', 'Mustang', '2021', 'Brand New', 'https://www.ford.pl/content/dam/guxeu/rhd/central/cars/2020-mustang-mach-1/launch/gallery/exterior/Ford-Mach1-eu-SHOT_02_Mach_1_Dynamic_Car_to_Car-16x9-2160x1215-Gallery_D_T_M-2.jpg.renditions.original.png', '50'),
(5, 'Fiat', '126', '2022', 'Brand New', 'https://bi.im-g.pl/im/bd/2d/19/z26400189IER,Fiat-126-Vision.jpg', '100');

-- --------------------------------------------------------

--
-- Table structure for table `Reservations`
--

CREATE TABLE `Reservations` (
  `ID` int(11) NOT NULL,
  `Id_user` int(11) NOT NULL,
  `Id_car` int(11) NOT NULL,
  `DateStart` varchar(30) NOT NULL,
  `DateEnd` varchar(30) NOT NULL,
  `Status` varchar(255) NOT NULL DEFAULT 'Pending',
  `Time` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Reservations`
--

INSERT INTO `Reservations` (`ID`, `Id_user`, `Id_car`, `DateStart`, `DateEnd`, `Status`, `Time`) VALUES
(1, 2, 1, '2021-10-07', '2021-10-11', 'Pending', '5'),
(4, 2, 2, '2021-10-30', '2021-10-20', 'Pending', '1'),
(6, 2, 5, '2021-10-30', '2021-10-28', 'Pending', '5'),
(8, 4, 2, '2021-11-10', '2021-11-24', 'Pending', '1');

--
-- Triggers `Reservations`
--
DELIMITER $$
CREATE TRIGGER `ARCHIVE` AFTER DELETE ON `Reservations` FOR EACH ROW INSERT INTO archive VALUES(NULL, old.Id_user, old.Id_car, old.DateStart, old.DateEnd, 'cancelled', old.time)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `Nickname` varchar(30) NOT NULL,
  `Login` varchar(30) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Role` varchar(30) NOT NULL DEFAULT 'client'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `Nickname`, `Login`, `Password`, `Role`) VALUES
(1, 'test', 'test', 'test', 'admin'),
(2, 'SupremeLeader', 'admin', '$2y$10$BSOwfAtjlX8HHEmM1YpUk.3W6W40SHho1v6Eqq3rGYm.ACZGA2QLi', 'admin'),
(4, 'client', 'client', '$2y$10$9WEOiLSr9TV3vx5bPClTpOLo5.5FU5sDjllcXYql.p1Oc0d81FLtq', 'client');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Archive`
--
ALTER TABLE `Archive`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Cars`
--
ALTER TABLE `Cars`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Reservations`
--
ALTER TABLE `Reservations`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Archive`
--
ALTER TABLE `Archive`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Cars`
--
ALTER TABLE `Cars`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Reservations`
--
ALTER TABLE `Reservations`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
