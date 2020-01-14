-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 13, 2020 at 11:06 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlinecourse`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', '828398ebc3572147dbef873da2290956', '2017-01-24 16:21:18', '14-12-2019 01:56:09 PM'),
(2, 'accountant', '1234', '2020-01-13 17:32:23', '');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `courseCode` varchar(255) DEFAULT NULL,
  `courseName` varchar(255) DEFAULT NULL,
  `courseUnit` varchar(255) DEFAULT NULL,
  `noofSeats` int(11) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `courseCode`, `courseName`, `courseUnit`, `noofSeats`, `creationDate`, `updationDate`) VALUES
(5, 'cse309', 'Operating System', '3', 20, '2019-12-16 08:22:05', NULL),
(6, 'CSE300', 'software development -3', '3', 20, '2019-12-17 07:02:10', NULL),
(7, 'cse313', 'Discrete Mathematics', '3', 22, '2019-12-17 07:14:45', NULL),
(8, 'EEE101', 'Fundamental Electronics', '3', 20, '2019-12-17 07:15:17', NULL),
(9, 'CSE 223', 'Compiler', '3', 22, '2019-12-17 07:16:40', NULL),
(10, 'CSE 315', 'Mathamatics Analysis', '3', 20, '2020-01-07 06:51:27', NULL),
(11, 'cse 123', 'java', '3', 20, '2020-01-11 08:23:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `courseenrolls`
--

CREATE TABLE `courseenrolls` (
  `id` int(11) NOT NULL,
  `studentRegno` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `session` int(11) DEFAULT NULL,
  `department` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  `course` int(11) DEFAULT NULL,
  `enrollDate` timestamp NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courseenrolls`
--

INSERT INTO `courseenrolls` (`id`, `studentRegno`, `pincode`, `session`, `department`, `level`, `semester`, `course`, `enrollDate`, `status`) VALUES
(6, '16173103065', '307669', 5, 9, 6, 7, 5, '2019-12-16 08:32:58', 1),
(7, '161731103054', '434835', 6, 9, 7, 8, 6, '2019-12-17 07:04:29', 2),
(8, '16173103072', '837731', 6, 2, 7, 7, 5, '2019-12-17 07:13:08', 1),
(10, '16173103065', '307669', 1, 7, 7, 8, 6, '2019-12-17 08:08:35', 1),
(11, '161731103054', '434835', 3, 9, 8, 7, 5, '2020-01-06 07:09:56', 1),
(12, '16173103061', '154052', 6, 9, 8, 10, 9, '2020-01-07 06:54:37', 0),
(13, '16173103065', '307669', 6, 9, 8, 10, 9, '2020-01-07 08:32:09', 1),
(14, '16173103061', '154052', 3, 9, 8, 8, 8, '2020-01-11 08:39:27', 2),
(16, '16173103072', '837731', 5, 9, 8, 10, 8, '2020-01-13 21:03:32', 1),
(18, '16173103072', '837731', 6, 9, 8, 7, 6, '2020-01-13 21:37:40', 1),
(20, '16173103072', '837731', 6, 9, 8, 9, 11, '2020-01-13 22:05:18', 1);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `department` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `department`, `creationDate`) VALUES
(1, 'Account', '2017-02-09 18:52:00'),
(2, 'HR', '2017-02-09 18:52:04'),
(7, 'IT', '2018-05-21 10:03:15'),
(8, 'Finance', '2019-12-16 08:20:38'),
(9, 'CSE', '2019-12-16 08:30:36'),
(10, 'EEE', '2019-12-17 07:01:08'),
(11, 'BBA', '2020-01-07 06:50:21'),
(12, 'Textile', '2020-01-13 21:39:58');

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `id` int(11) NOT NULL,
  `level` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`id`, `level`, `creationDate`) VALUES
(5, 'Level 1', '2017-02-09 19:04:04'),
(6, 'level 2', '2017-02-09 19:04:12'),
(7, 'level 4', '2017-02-09 19:04:17'),
(8, 'level 3', '2020-01-06 07:08:08');

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE `semester` (
  `id` int(11) NOT NULL,
  `semester` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `semester`
--

INSERT INTO `semester` (`id`, `semester`, `creationDate`, `updationDate`) VALUES
(7, 'fall-19', '2019-12-16 08:30:26', NULL),
(8, 'summer 20', '2019-12-17 07:01:00', NULL),
(9, 'fall-18', '2019-12-17 07:14:05', NULL),
(10, 'fall-20', '2020-01-07 06:49:29', NULL),
(11, 'spring-20', '2020-01-13 21:39:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `id` int(11) NOT NULL,
  `session` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`id`, `session`, `creationDate`) VALUES
(2, '2016', '2017-02-09 18:27:41'),
(3, '2017', '2018-05-21 10:01:54'),
(4, '2018', '2018-05-21 10:01:58'),
(5, '2019-20', '2019-12-16 08:30:05'),
(6, '2020', '2019-12-17 07:00:48'),
(7, '2015', '2020-01-13 21:39:06');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `StudentRegno` varchar(255) NOT NULL,
  `studentPhoto` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `studentName` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `session` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `semester` varchar(255) DEFAULT NULL,
  `cgpa` decimal(10,2) DEFAULT NULL,
  `creationdate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`StudentRegno`, `studentPhoto`, `password`, `studentName`, `pincode`, `session`, `department`, `semester`, `cgpa`, `creationdate`, `updationDate`) VALUES
('10806121', '', '828398ebc3572147dbef873da2290956', 'Sumaiya Farha	', '715948', '', '', '', '7.25', '2017-02-11 19:38:32', '14-12-2019 01:51:54 PM'),
('12345', NULL, 'f925916e2754e5e03f75dd58a5733251', 'John', '131863', '', '', '', '0.00', '2018-08-25 05:50:51', ''),
('125966', '', 'f925916e2754e5e03f75dd58a5733251', 'Test user', '385864', '', '', '', '0.00', '2017-02-11 19:48:03', ''),
('16173103054', NULL, 'd3c849e5a3506313f8c071aa785c87fe', 'Sumaiya Farha', '147268', NULL, NULL, NULL, NULL, '2019-12-14 11:14:32', NULL),
('16173103061', NULL, '828398ebc3572147dbef873da2290956', 'Tonmoy Ghosh', '154052', NULL, NULL, NULL, NULL, '2020-01-07 06:52:19', NULL),
('16173103065', NULL, '828398ebc3572147dbef873da2290956', 'Farha Tabassum', '307669', NULL, NULL, NULL, NULL, '2019-12-16 08:24:17', '07-01-2020 01:00:45 PM'),
('16173103072', NULL, '828398ebc3572147dbef873da2290956', 'Kazol Biswas', '837731', NULL, NULL, NULL, NULL, '2019-12-17 07:02:57', NULL),
('161731103054', NULL, 'cb18d5673020fe345eefc3d2745a4575', 'Umme Sumaiya', '434835', NULL, NULL, NULL, NULL, '2019-12-17 06:58:16', '17-12-2019 12:35:25 PM');

-- --------------------------------------------------------

--
-- Table structure for table `student_payment`
--

CREATE TABLE `student_payment` (
  `pay_id` int(11) NOT NULL,
  `student_id` varchar(255) NOT NULL,
  `semester_id` int(11) NOT NULL,
  `reg_fee` varchar(255) NOT NULL,
  `tuition_fee` varchar(255) DEFAULT NULL,
  `recept_serial` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_payment`
--

INSERT INTO `student_payment` (`pay_id`, `student_id`, `semester_id`, `reg_fee`, `tuition_fee`, `recept_serial`) VALUES
(1, '16173103072', 8, '6000', NULL, '123456'),
(2, '16173103072', 7, '6000', NULL, '2564'),
(3, '16173103072', 9, '6000', NULL, '123456');

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `studentRegno` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `studentRegno`, `userip`, `loginTime`, `logout`, `status`) VALUES
(1, '10806121', 0x3a3a3100000000000000000000000000, '2017-02-11 20:05:58', '', 1),
(2, '10806121', 0x3a3a3100000000000000000000000000, '2017-02-11 20:07:18', '', 1),
(3, '10806121', 0x3a3a3100000000000000000000000000, '2017-02-11 20:08:46', '', 1),
(4, '10806121', 0x3a3a3100000000000000000000000000, '2017-02-11 20:26:15', '', 1),
(5, '10806121', 0x3a3a3100000000000000000000000000, '2017-02-11 20:27:11', '', 1),
(6, '10806121', 0x3a3a3100000000000000000000000000, '2017-02-11 20:28:19', '', 1),
(7, '10806121', 0x3a3a3100000000000000000000000000, '2017-02-11 20:29:30', '', 1),
(8, '10806121', 0x3a3a3100000000000000000000000000, '2017-02-11 20:30:39', '12-02-2017 02:00:40 AM', 1),
(9, '10806121', 0x3a3a3100000000000000000000000000, '2017-02-11 20:32:12', '12-02-2017 02:21:40 AM', 1),
(10, '10806121', 0x3a3a3100000000000000000000000000, '2017-02-11 20:51:50', '12-02-2017 05:14:45 AM', 1),
(11, '10806121', 0x3a3a3100000000000000000000000000, '2017-02-12 05:41:24', '12-02-2017 11:49:58 AM', 1),
(12, '10806121', 0x3a3a3100000000000000000000000000, '2017-02-12 06:20:05', '', 1),
(13, '10806121', 0x3a3a3100000000000000000000000000, '2017-02-12 06:20:23', '12-02-2017 12:09:59 PM', 1),
(14, '10806121', 0x3a3a3100000000000000000000000000, '2018-05-21 09:49:06', '21-05-2018 03:30:53 PM', 1),
(15, '10806121', 0x3a3a3100000000000000000000000000, '2018-05-21 10:19:15', '', 1),
(16, '12345', 0x3a3a3100000000000000000000000000, '2018-08-25 05:51:42', '25-08-2018 11:23:02 AM', 1),
(17, '10806121', 0x3a3a3100000000000000000000000000, '2019-12-14 08:19:45', '14-12-2019 04:35:33 PM', 1),
(18, '10806121', 0x3a3a3100000000000000000000000000, '2019-12-14 11:07:38', NULL, 1),
(19, '10806121', 0x3a3a3100000000000000000000000000, '2019-12-16 05:29:32', '16-12-2019 11:00:01 AM', 1),
(20, '10806121', 0x3a3a3100000000000000000000000000, '2019-12-16 05:31:39', NULL, 1),
(21, '10806121', 0x3a3a3100000000000000000000000000, '2019-12-16 05:47:19', NULL, 1),
(22, '10806121', 0x3a3a3100000000000000000000000000, '2019-12-16 05:57:42', NULL, 1),
(23, '10806121', 0x3a3a3100000000000000000000000000, '2019-12-16 06:40:17', NULL, 1),
(24, '10806121', 0x3a3a3100000000000000000000000000, '2019-12-16 07:24:52', NULL, 1),
(25, '10806121', 0x3a3a3100000000000000000000000000, '2019-12-16 07:25:31', NULL, 1),
(26, '10806121', 0x3a3a3100000000000000000000000000, '2019-12-16 07:35:30', '16-12-2019 01:05:41 PM', 1),
(27, '16173103065', 0x3a3a3100000000000000000000000000, '2019-12-16 08:25:26', NULL, 1),
(28, '16173103065', 0x3a3a3100000000000000000000000000, '2019-12-17 06:51:12', '17-12-2019 12:24:05 PM', 1),
(29, '161731103054', 0x3a3a3100000000000000000000000000, '2019-12-17 06:58:38', '17-12-2019 12:41:32 PM', 1),
(30, '16173103072', 0x3a3a3100000000000000000000000000, '2019-12-17 07:11:52', NULL, 1),
(31, '16173103072', 0x3a3a3100000000000000000000000000, '2019-12-17 07:17:11', NULL, 1),
(32, '16173103065', 0x3a3a3100000000000000000000000000, '2019-12-17 07:57:58', NULL, 1),
(33, '161731103054', 0x3a3a3100000000000000000000000000, '2020-01-06 07:00:37', NULL, 1),
(34, '161731103054', 0x3a3a3100000000000000000000000000, '2020-01-07 06:53:04', '07-01-2020 12:23:13 PM', 1),
(35, '16173103061', 0x3a3a3100000000000000000000000000, '2020-01-07 06:53:27', '07-01-2020 12:24:43 PM', 1),
(36, '16173103061', 0x3a3a3100000000000000000000000000, '2020-01-07 07:29:10', '07-01-2020 12:59:46 PM', 1),
(37, '16173103065', 0x3a3a3100000000000000000000000000, '2020-01-07 07:30:18', NULL, 1),
(38, '16173103065', 0x3a3a3100000000000000000000000000, '2020-01-07 08:29:50', '07-01-2020 02:10:18 PM', 1),
(39, '16173103065', 0x3a3a3100000000000000000000000000, '2020-01-11 08:19:12', '11-01-2020 01:50:32 PM', 1),
(40, '16173103061', 0x3a3a3100000000000000000000000000, '2020-01-11 08:38:00', NULL, 1),
(41, '16173103072', 0x3a3a3100000000000000000000000000, '2020-01-13 21:01:48', '14-01-2020 02:33:50 AM', 1),
(42, '16173103072', 0x3a3a3100000000000000000000000000, '2020-01-13 21:19:54', '14-01-2020 02:50:49 AM', 1),
(43, '16173103072', 0x3a3a3100000000000000000000000000, '2020-01-13 21:36:06', NULL, 1),
(44, '16173103072', 0x3a3a3100000000000000000000000000, '2020-01-13 21:58:46', NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courseenrolls`
--
ALTER TABLE `courseenrolls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`StudentRegno`);

--
-- Indexes for table `student_payment`
--
ALTER TABLE `student_payment`
  ADD PRIMARY KEY (`pay_id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `courseenrolls`
--
ALTER TABLE `courseenrolls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `semester`
--
ALTER TABLE `semester`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `student_payment`
--
ALTER TABLE `student_payment`
  MODIFY `pay_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
