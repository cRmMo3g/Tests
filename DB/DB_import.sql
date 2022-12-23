-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 23, 2022 at 12:49 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tests`
--

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `tests_id` int(11) NOT NULL,
  `question` text COLLATE utf8mb4_bin NOT NULL,
  `answer` longtext COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`answer`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `tests_id`, `question`, `answer`) VALUES
(1, 1, 'Latvijas Valsts prezidents 2022.gada?', '[{\"id\": 1, \"answer\": \"Egils Levits\", \"isValidate\": true}, {\"id\": 2, \"answer\": \"Jānis Rozentāls\", \"isValidate\": false}, {\"id\": 3, \"answer\": \"Kaut kads jautajums\", \"isValidate\": false}, {\"id\": 4, \"answer\": \"Vaira Vīķe Freiberga\", \"isValidate\": false}]'),
(2, 1, 'Krišjānis Kariņš ieņemamais amats?', '[{\"id\": 1, \"answer\": \"Sētnieks\", \"isValidate\": false}, {\"id\": 2, \"answer\": \"valsts premjerministrs\", \"isValidate\": true}]'),
(3, 1, 'Uz cik ilgu laiku ievēl saeimu?', '[{\"id\": 1, \"answer\": \"2 gadiem\", \"isValidate\": false}, {\"id\": 2, \"answer\": \"4 gadiem\", \"isValidate\": true}, {\"id\": 3, \"answer\": \"1 gadu\", \"isValidate\": false}, {\"id\": 4, \"answer\": \"6 gadiem\", \"isValidate\": false}]'),
(12, 3, 'Zemes lodes centrs?', '[{\"id\": 1, \"answer\": \"Zemes garoza\", \"isValidate\": false}, {\"id\": 2, \"answer\": \"Zemes kodols\", \"isValidate\": true}, {\"id\": 3, \"answer\": \"Zemes vidus\", \"isValidate\": false}, {\"id\": 4, \"answer\": \"Kolka\", \"isValidate\": false}]'),
(13, 3, 'Zemes pavadonis ?', '[{\"id\": 1, \"answer\": \"Mars\", \"isValidate\": false}, {\"id\": 2, \"answer\": \"Jupīters\", \"isValidate\": false}, {\"id\": 3, \"answer\": \"Mēness\", \"isValidate\": true}, {\"id\": 4, \"answer\": \"Venēra\", \"isValidate\": false}]'),
(14, 2, 'Cik kalendāro mēnešu ir vienā gadā?', '[{\"id\": 1, \"answer\": \"12\", \"isValidate\": true}, {\"id\": 2, \"answer\": \"9\", \"isValidate\": false}, {\"id\": 3, \"answer\": \"40\", \"isValidate\": false}, {\"id\": 4, \"answer\": \"11\", \"isValidate\": false}]'),
(15, 2, 'Vasaras mēneši?', '[{\"id\": 1, \"answer\": \"Marts, aprīlis, maijs\", \"isValidate\": false}, {\"id\": 2, \"answer\": \"Jūnijs, jūlījs, augusts\", \"isValidate\": true}, {\"id\": 3, \"answer\": \"septembris, oktobris, novembris\", \"isValidate\": false}, {\"id\": 4, \"answer\": \"decembris, janvāris, februāris\", \"isValidate\": false}]'),
(16, 2, 'Kurš mēneša nosaukums nav pareizs?', '[{\"id\": 1, \"answer\": \"Maijs\", \"isValidate\": false}, {\"id\": 2, \"answer\": \"Janvāris\", \"isValidate\": false}, {\"id\": 3, \"answer\": \"Oktobris\", \"isValidate\": false}, {\"id\": 4, \"answer\": \"Docents\", \"isValidate\": true}, {\"id\": 4, \"answer\": \"Augusts\", \"isValidate\": false}]'),
(17, 4, 'Cik jautājumu, ir vienam jautājumam?', '[{\"id\": 1, \"answer\": \"Viena\", \"isValidate\": true}, {\"id\": 2, \"answer\": \"Divas\", \"isValidate\": false}]');

-- --------------------------------------------------------

--
-- Table structure for table `tests_cat`
--

CREATE TABLE `tests_cat` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `tests_cat`
--

INSERT INTO `tests_cat` (`id`, `name`) VALUES
(1, 'Par Latviju'),
(2, 'Gadalaiki, dienas'),
(3, 'Zemslode'),
(4, 'Viens jautājums');

-- --------------------------------------------------------

--
-- Table structure for table `user_answer`
--

CREATE TABLE `user_answer` (
  `id` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `category` int(11) NOT NULL,
  `question` text COLLATE utf8mb4_bin NOT NULL,
  `answer` text COLLATE utf8mb4_bin NOT NULL,
  `correct` text COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `user_answer`
--

INSERT INTO `user_answer` (`id`, `username`, `category`, `question`, `answer`, `correct`) VALUES
(1, 'Ričards', 1, 'Latvijas Valsts prezidents 2022.gada?', 'Vaira Vīķe Freiberga', 'false'),
(2, 'Ričards', 1, 'Krišjānis Kariņš ieņemamais amats?', 'valsts premjerministrs', 'true'),
(3, 'Ričards', 1, 'Uz cik ilgu laiku ievēl saeimu?', '4 gadiem', 'true'),
(4, 'Ričards', 3, 'Zemes lodes centrs?', 'Zemes kodols', 'true'),
(5, 'Ričards', 3, 'Zemes pavadonis ?', 'Mēness', 'true'),
(6, 'Ričards', 4, 'Cik jautājumu, ir vienam jautājumam?', 'Divas', 'false');

-- --------------------------------------------------------

--
-- Table structure for table `user_confirm_tests`
--

CREATE TABLE `user_confirm_tests` (
  `id` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `tests_id` int(11) NOT NULL,
  `count_correct` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `user_confirm_tests`
--

INSERT INTO `user_confirm_tests` (`id`, `username`, `tests_id`, `count_correct`) VALUES
(1, 'Ričards', 2, 1),
(2, 'Ričards', 3, 0),
(3, 'Ričards', 4, 0),
(4, 'Ričards', 2, 2),
(5, 'Ričards', 1, 0),
(6, 'sdsa', 1, 1),
(7, 'Ričards', 4, 0),
(8, 'Ričards', 1, 0),
(9, 'Ričards', 1, 1),
(10, 'Ričards', 3, 1),
(11, 'Ričards', 4, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tests_id` (`tests_id`);

--
-- Indexes for table `tests_cat`
--
ALTER TABLE `tests_cat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_answer`
--
ALTER TABLE `user_answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category`);

--
-- Indexes for table `user_confirm_tests`
--
ALTER TABLE `user_confirm_tests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tests_id` (`tests_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tests_cat`
--
ALTER TABLE `tests_cat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_answer`
--
ALTER TABLE `user_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_confirm_tests`
--
ALTER TABLE `user_confirm_tests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`tests_id`) REFERENCES `tests_cat` (`id`);

--
-- Constraints for table `user_answer`
--
ALTER TABLE `user_answer`
  ADD CONSTRAINT `user_answer_ibfk_1` FOREIGN KEY (`category`) REFERENCES `tests_cat` (`id`);

--
-- Constraints for table `user_confirm_tests`
--
ALTER TABLE `user_confirm_tests`
  ADD CONSTRAINT `user_confirm_tests_ibfk_1` FOREIGN KEY (`tests_id`) REFERENCES `tests_cat` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
