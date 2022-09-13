-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 13, 2022 at 12:54 PM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test_work`
--

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id_user` int(11) NOT NULL,
  `post` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id_user`, `post`) VALUES
(20, 'jnbajaebjarjb'),
(20, 'SSDSFDf'),
(20, 'zdfzsef'),
(20, 'asdvnlvkas'),
(20, 'dasfsa'),
(11, '1234'),
(22, '123456'),
(11, 'sdfasdf'),
(23, 'sfaasfafsfasfasfs');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `nickname` varchar(30) NOT NULL,
  `token` varchar(270) NOT NULL,
  `last_login` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `nickname`, `token`, `last_login`) VALUES
(10, '42df55041d8d6de9e5e80a2c055590a3', '2C2w2c2r2@311K0a0i1I0i1G0c0`0a1I0d0g0`0h0b0h0g0g0h0`1J1L0d0a1G0b', 'qwerty', '256f1b8e23d08b1216f46c7ecb964b23', '2022-09-11'),
(11, 'f8499d18157ae47999af68ea8a9142eb', '1N241Q0g1L1L0f0e0i1I1I1K0h0h0b1J1I0h1H1G0b0f1H0c0c0a1H0i0d0e0b0e', '123', '', '2022-09-12'),
(12, 'a5fa843bcc30fabcb0341049e796f19b', '2?2>2l27250h0h1I1L1J0i0h0f1I1H0h0c0e0g1H0f0d0a0d1G0g0c0i0i0c1K0c', 'kkoha', '', '2022-09-11'),
(13, 'd2790b372975cff0dd06927c34b3b68a', '2p2`2@2s0g0a1H1H1H0e1I0d1J0b1G0e1K0i0c0f1J1H0g0i1K1L0a0`1I0a0i1L', 'nick', '76574ac3853c8b0c541aa6e978a146d3', '2022-09-11'),
(14, '2d0e2fc9ffc6afa9529247f8a34f9c96', '2o272?2y2g1K1G0f1I1I0h0d0i1I0c0`0b1L1G0e1L0`1L0g1I0b0b0h1L1I1L0e', 'nerzul', '', '2022-09-12'),
(15, 'ec6a6536ca304edf844d1d248a4f08dc', '1O1I23230i1H1J1H0e0b1J0`0d1J1I0b0`0`0c0f1J1H1J0h0c0a0c1K1J0`0e0e', '1234', 'f5e245ddf91937c1d1d68eaac966cb4a', '2022-09-11'),
(16, '224cf2b695a5e8ecaecfb9015161fa4b', '232124211T1N1M2:1V1J25252h272d1G0g1H1K0`1I1L0d0b1H0h1I0i0c0g0e0i', 'asfghjhkgfd', 'c358283f9ed2c884526b660275e03d90', '2022-09-11'),
(17, '69b101e485a52594996e4db1d3d24aa8', '252g2V2D1y2g170d0i0`1K1J0i1J0`1K0d0d0`0e0a1H0f0c1L0c0h1J0g0g1I0a', 'VQRV3RV', '03ca4232b2162bee70d4aac6b8df9bc5', '2022-09-11'),
(18, '400377b3e0a9a896644822e6fa0d4ee7', '232n1U272c2;221y1R2m1J0f1I0a0a0g0g0d1I0h1L0g0`0e1K1H0e0f0f1G0i0b', 'fbbfk;mfbm;dbf', '496f8c6862256c38584a3b59f81ba35f', '2022-09-11'),
(19, '665a6c680b96032baeda064966b68354', '282H2G2h2D2t2v2j2G2s2C2j2r0b0h0i1I0g0`1J0a0b0b0b1G1G0b0c1L0b0`0g', 'aaweweawe', '', '2022-09-11'),
(20, 'c1987fbb25dd5dc305ab2f00fe465eeb', '2q2J252D0h0b1K1K0d0g1I0c1L1L1L1J0e1J1I1J0g0d0i1L0h0d0`1L1I1J1J0d', 'qwer', '', '2022-09-11'),
(21, '5259ee4a034fdeddd1b65be92debe731', '262@222g2f0h0`0c1H0b1I1K0d0i1K0d1G0e0d0a0`0f0h1J0d0i0e1G1H0e0g0`', 'asdf', '', '2022-09-11'),
(22, 'd6be2bb070c99029f0737a8106f259ee', '2j2A2F2B2p0c1J0c0`0e0d1J0h0h0f0h1I0i0e0`1K0a0i0d0f0c0`0`1G0c1L0d', 'lutor', '', '2022-09-12'),
(23, '3d90daaab376e7a60d763f64255910fd', '2>2E252E2H302D2t2e2>2u2H0i1G1G0i1I0c0e1H1K0d1H0i1G0f0i0d1H1G0i1H', 'lorg', '', '2022-09-12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
