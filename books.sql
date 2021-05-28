-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 23, 2021 at 07:46 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `books`
--

-- --------------------------------------------------------

--
-- Table structure for table `book_categories`
--

CREATE TABLE `book_categories` (
  `catID` int(11) NOT NULL,
  `catName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book_categories`
--

INSERT INTO `book_categories` (`catID`, `catName`) VALUES
(1, 'Action and Adventure'),
(2, 'History'),
(3, 'Science fiction'),
(4, 'Health and fitness'),
(5, 'Academic General'),
(6, 'Academic Engg'),
(7, 'Academic Non-Science');

-- --------------------------------------------------------

--
-- Table structure for table `book_post`
--

CREATE TABLE `book_post` (
  `postID` int(11) NOT NULL,
  `bookName` varchar(200) NOT NULL,
  `bookPhoto` text NOT NULL,
  `authorName` varchar(100) NOT NULL,
  `bookPrice` varchar(100) NOT NULL,
  `bookCond` varchar(50) NOT NULL,
  `postCond` varchar(50) NOT NULL,
  `postDes` varchar(200) NOT NULL,
  `meetLoc` varchar(100) NOT NULL,
  `userID` int(11) NOT NULL,
  `catID` int(11) NOT NULL,
  `bookLang` varchar(20) NOT NULL,
  `postCreated` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book_post`
--

INSERT INTO `book_post` (`postID`, `bookName`, `bookPhoto`, `authorName`, `bookPrice`, `bookCond`, `postCond`, `postDes`, `meetLoc`, `userID`, `catID`, `bookLang`, `postCreated`) VALUES
(5, 'Teach Yourself', 'images/t.jpg', 'Schild', '150', 'Used', 'Fixed', 'just dummy contet.just dummy contet.just dummy contet.just dummy contet.just dummy contet.just dummy contet.just dummy contet.just dummy contet.just dummy contet.', 'Mirpur', 1, 6, 'English', '2021-02-08'),
(6, 'Algorithms', 'images/algorithms.jpg', 'Cormen', '200', 'Used', 'Fixed', 'asfasfv afaf afsafasf dfsdfs', 'Mirpur', 1, 6, 'English', '0000-00-00'),
(8, 'fafafaf', 'images/60341630283f7.png', 'afafafafaf', '1313', 'Used', 'Fixed', 'fafaef aefafaf', 'Mirpur', 1, 5, 'English', '2021-02-23');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `imgID` int(11) NOT NULL,
  `bookName` varchar(100) NOT NULL,
  `category` varchar(20) NOT NULL,
  `bookPhoto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`imgID`, `bookName`, `category`, `bookPhoto`) VALUES
(37, 'gagrag', '', 'images/60338e9b139d5.png'),
(38, 'zzzzzzzzzzzz', '', 'images/60338ec206bb0.png'),
(39, 'afaffaf', '', 'images/6033d3a60293d.png'),
(40, '', '', 'images/6033ea9d87378.png'),
(41, '', '', 'images/6033eaa33b1fd.png'),
(42, 'afafaf', '', 'images/6033eae559d53.png'),
(43, 'afafaf', 'Item 2', 'images/6033eb254155a.png'),
(44, 'afafaf', '2', 'images/6033eb65b6b0a.png');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `usermail` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `university` varchar(200) NOT NULL,
  `user_mobile` varchar(15) NOT NULL,
  `registrationdate` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `usermail`, `password`, `university`, `user_mobile`, `registrationdate`) VALUES
(1, 'ami', 'abc@gmail.com', '12345', 'BUBT', '', '2021-01-25'),
(2, 'afa', '', '1231', '', '', '2021-01-25'),
(3, 'afaz', 'afafgfdfga', '1231', '', '', '2021-01-25'),
(4, 'afazz', 'afafgfdfga', '1231', '', '', '2021-01-25'),
(5, 'fdafaf', 'afrswgasgags', '1213', 'BUBT', '121435', '2021-01-25'),
(6, 'Arafat', 'ulta@gmail.com', '12345', 'BUET', '`12345', '2021-01-25'),
(8, 'Rabbi', 'rabbi@gmail.com', '12345', 'Bubt', '12141', '2021-01-26'),
(9, 'Rabbiz', 'rabbi@gmail.com', '12345', 'Bubt', '12141', '2021-01-26'),
(11, 'moinul', 'abc@gmail.com', '12345', 'BUBT', '12345', '2021-01-26'),
(12, '', '', '', '', '', '2021-02-23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book_categories`
--
ALTER TABLE `book_categories`
  ADD PRIMARY KEY (`catID`);

--
-- Indexes for table `book_post`
--
ALTER TABLE `book_post`
  ADD PRIMARY KEY (`postID`),
  ADD KEY `catID` (`catID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`imgID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book_categories`
--
ALTER TABLE `book_categories`
  MODIFY `catID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `book_post`
--
ALTER TABLE `book_post`
  MODIFY `postID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `imgID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book_post`
--
ALTER TABLE `book_post`
  ADD CONSTRAINT `book_post_ibfk_1` FOREIGN KEY (`catID`) REFERENCES `book_categories` (`catID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `book_post_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
