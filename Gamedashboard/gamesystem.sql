-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 27, 2021 at 08:23 PM
-- Server version: 10.5.9-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gamesystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

CREATE TABLE `game` (
  `id` int(11) NOT NULL,
  `name` varchar(1000) NOT NULL,
  `price` varchar(1000) NOT NULL,
  `Tags` varchar(1000) NOT NULL,
  `platform` varchar(1000) NOT NULL,
  `realeseDate` varchar(1000) NOT NULL,
  `story` varchar(3000) NOT NULL,
  `requiments` varchar(1000) NOT NULL,
  `image` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`id`, `name`, `price`, `Tags`, `platform`, `realeseDate`, `story`, `requiments`, `image`) VALUES
(7, 'exaple', '', 'exaple ,exaple , ', 'IOS', '2021-05-11', 'asdsadsada', 'dasdsadsadsadsadsad', 'https://i.imgur.com/BaYGPR6.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `gamedone`
--

CREATE TABLE `gamedone` (
  `id` int(11) NOT NULL,
  `gameId` varchar(1000) NOT NULL,
  `timeStamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gamedone`
--

INSERT INTO `gamedone` (`id`, `gameId`, `timeStamp`) VALUES
(1, '4', '2021-05-27 15:41:30'),
(2, '4', '2021-05-27 16:01:26'),
(3, '4', '2021-05-27 16:02:17'),
(4, '4', '2021-05-27 16:02:39'),
(5, '4', '2021-05-27 16:02:45'),
(6, '4', '2021-05-27 16:25:29'),
(7, ' 7', '2021-05-27 18:12:03'),
(8, ' 7', '2021-05-27 18:12:09');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(1000) NOT NULL,
  `Address` varchar(1000) NOT NULL,
  `tel` varchar(1000) NOT NULL,
  `age` varchar(1000) NOT NULL,
  `email` varchar(1000) NOT NULL,
  `game` varchar(1000) NOT NULL,
  `matchCount` int(11) NOT NULL,
  `score` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `Address`, `tel`, `age`, `email`, `game`, `matchCount`, `score`) VALUES
(1, 'Nadun Sandeepa', '45/4, Delgoda', '+94711044617', '34', 'nadun@gmail.com', '7', 22, 21),
(2, 'Chamath Shayamal', '45/4, Delgoda', '+94711044609', '23', 'chamath@gmail.com', '7', 13, 1),
(3, 'Lakidu Gamage', '45/4, Delgoda', '+94711044610', '34', 'lakidu@gmail.com', '7', 4, 1),
(4, 'harasha_S', '67, Colombo', '0711099098', '23', 'harshana@gmail.com', '7', 1, 1),
(5, 'jayani_s', '45/4, Galle', '+94711044609', '34', 'jayani@gmail.com', '7', 2, 1),
(7, 'Nadun Sandeepa', '45/4,galle ', '+94711044609', '34', 'nadun20@gmail.com', '7', 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gamedone`
--
ALTER TABLE `gamedone`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `game`
--
ALTER TABLE `game`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `gamedone`
--
ALTER TABLE `gamedone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
