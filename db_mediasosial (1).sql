-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 26, 2025 at 01:42 AM
-- Server version: 8.0.17
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_mediasosial`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookmark`
--

CREATE TABLE `bookmark` (
  `BookmarkID` int(11) NOT NULL,
  `PostID` int(11) DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `CommentID` int(11) NOT NULL,
  `PostID` int(11) DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `CommentText` text,
  `Date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`CommentID`, `PostID`, `UserName`, `CommentText`, `Date`) VALUES
(2, 8, 'piyachiceng12', 'eemm', '2025-11-10 05:47:06'),
(3, 8, 'indrawati456', 'hey', '2025-11-12 04:49:28'),
(4, 8, 'indra12345', 'peee', '2025-11-17 00:43:16');

-- --------------------------------------------------------

--
-- Table structure for table `detailpost`
--

CREATE TABLE `detailpost` (
  `PostID` int(11) NOT NULL,
  `ImageID` int(11) NOT NULL,
  `Comment` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

CREATE TABLE `follow` (
  `FollowID` int(11) NOT NULL,
  `FollowName` varchar(50) DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `Follower` varchar(50) DEFAULT NULL,
  `Following` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `ImageID` int(11) NOT NULL,
  `ImageName` varchar(100) DEFAULT NULL,
  `Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lists`
--

CREATE TABLE `lists` (
  `ListID` int(11) NOT NULL,
  `ListName` varchar(255) NOT NULL,
  `Description` text,
  `CreatedBy` varchar(50) NOT NULL,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `IsPrivate` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `NotificationID` int(11) NOT NULL,
  `ToUser` varchar(50) DEFAULT NULL,
  `FromUser` varchar(50) DEFAULT NULL,
  `Type` enum('follow','like','comment') NOT NULL,
  `PostID` int(11) DEFAULT NULL,
  `CommentID` int(11) DEFAULT NULL,
  `Message` varchar(255) DEFAULT NULL,
  `IsRead` tinyint(1) DEFAULT '0',
  `CreatedAt` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`NotificationID`, `ToUser`, `FromUser`, `Type`, `PostID`, `CommentID`, `Message`, `IsRead`, `CreatedAt`) VALUES
(1, 'piyachiceng12', 'indrawati456', 'comment', 8, 3, '@indrawati456 mengomentari postinganmu', 0, '2025-11-12 11:49:28'),
(2, 'piyachiceng12', 'indrawati456', 'like', 8, NULL, '@indrawati456 menyukai postinganmu', 0, '2025-11-12 11:49:32'),
(4, 'piyachiceng12', 'indra12345', 'comment', 8, 4, '@indra12345 mengomentari postinganmu', 0, '2025-11-17 07:43:16'),
(5, 'piyachiceng12', 'indra12345', 'like', 8, NULL, '@indra12345 menyukai postinganmu', 0, '2025-11-26 08:41:44');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `PostID` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `Text` text,
  `UserName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`PostID`, `Date`, `Time`, `Text`, `UserName`) VALUES
(8, '2025-11-10', '05:46:52', 'hai', 'piyachiceng12');

-- --------------------------------------------------------

--
-- Table structure for table `postlike`
--

CREATE TABLE `postlike` (
  `LikeID` int(11) NOT NULL,
  `PostID` int(11) DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `postlike`
--

INSERT INTO `postlike` (`LikeID`, `PostID`, `UserName`) VALUES
(5, 8, 'piyachiceng12'),
(6, 8, 'indrawati456'),
(8, 8, 'indra12345');

-- --------------------------------------------------------

--
-- Table structure for table `reposts`
--

CREATE TABLE `reposts` (
  `RepostID` int(11) NOT NULL,
  `PostID` int(11) NOT NULL,
  `RepostedBy` varchar(255) NOT NULL,
  `RepostDate` date NOT NULL,
  `RepostTime` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserName` varchar(50) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `Bio` text,
  `ProfileImage` varchar(255) DEFAULT 'default.png',
  `DisplayName` varchar(50) NOT NULL,
  `Location` varchar(100) NOT NULL,
  `Website` varchar(255) NOT NULL,
  `BannerPicture` varchar(255) NOT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserName`, `FirstName`, `LastName`, `Email`, `Password`, `Bio`, `ProfileImage`, `DisplayName`, `Location`, `Website`, `BannerPicture`, `CreatedAt`, `UpdatedAt`) VALUES
('indra12345', 'indra', 'wati', 'iw011453@gmail.com', 'indra123', NULL, 'default.png', '', '', '', '', '2025-11-17 00:41:21', '2025-11-17 00:41:21'),
('indraw12345', 'indra', 'wati', 'ellemarsh20@gmail.com', 'nctdream07', NULL, 'default.png', '', '', '', '', '2025-11-26 01:23:15', '2025-11-26 01:23:15'),
('indrawati12345', 'indra', 'wati', 'iw011453@gmail.com', 'nctdream07', NULL, 'default.png', '', '', '', '', '2025-11-26 01:22:30', '2025-11-26 01:22:30'),
('indrawati456', 'indra', 'wati', 'iw011453@gmail.com', 'indra123', NULL, 'default.png', '', '', '', '', '2025-11-12 03:43:36', '2025-11-12 03:43:36'),
('piyachiceng12', 'oktavia', 'ningrum', 'piyaimoet234@gmail.com', 'piya12345', NULL, 'default.png', '', '', '', '', '2025-11-10 05:31:17', '2025-11-10 05:31:17'),
('yayaastecuu', 'yaya', 'stecu', 'yayakaramoyy@gmail.com', 'juyeon11', NULL, 'default.png', '', '', '', '', '2025-11-11 01:49:16', '2025-11-11 01:49:16');

-- --------------------------------------------------------

--
-- Table structure for table `userlists`
--

CREATE TABLE `userlists` (
  `UserListID` int(11) NOT NULL,
  `ListID` int(11) DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `AddedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookmark`
--
ALTER TABLE `bookmark`
  ADD PRIMARY KEY (`BookmarkID`),
  ADD KEY `PostID` (`PostID`),
  ADD KEY `UserName` (`UserName`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`CommentID`),
  ADD KEY `PostID` (`PostID`),
  ADD KEY `UserName` (`UserName`);

--
-- Indexes for table `detailpost`
--
ALTER TABLE `detailpost`
  ADD PRIMARY KEY (`PostID`,`ImageID`),
  ADD KEY `ImageID` (`ImageID`);

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`FollowID`),
  ADD KEY `UserName` (`UserName`),
  ADD KEY `Follower` (`Follower`),
  ADD KEY `Following` (`Following`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`ImageID`);

--
-- Indexes for table `lists`
--
ALTER TABLE `lists`
  ADD PRIMARY KEY (`ListID`),
  ADD KEY `CreatedBy` (`CreatedBy`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`NotificationID`),
  ADD KEY `ToUser` (`ToUser`),
  ADD KEY `FromUser` (`FromUser`),
  ADD KEY `PostID` (`PostID`),
  ADD KEY `CommentID` (`CommentID`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`PostID`),
  ADD KEY `UserName` (`UserName`);

--
-- Indexes for table `postlike`
--
ALTER TABLE `postlike`
  ADD PRIMARY KEY (`LikeID`),
  ADD KEY `PostID` (`PostID`),
  ADD KEY `UserName` (`UserName`);

--
-- Indexes for table `reposts`
--
ALTER TABLE `reposts`
  ADD PRIMARY KEY (`RepostID`),
  ADD KEY `PostID` (`PostID`),
  ADD KEY `RepostedBy` (`RepostedBy`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserName`);

--
-- Indexes for table `userlists`
--
ALTER TABLE `userlists`
  ADD PRIMARY KEY (`UserListID`),
  ADD KEY `ListID` (`ListID`),
  ADD KEY `UserName` (`UserName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookmark`
--
ALTER TABLE `bookmark`
  MODIFY `BookmarkID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `CommentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `follow`
--
ALTER TABLE `follow`
  MODIFY `FollowID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `ImageID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lists`
--
ALTER TABLE `lists`
  MODIFY `ListID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `NotificationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `PostID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `postlike`
--
ALTER TABLE `postlike`
  MODIFY `LikeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `reposts`
--
ALTER TABLE `reposts`
  MODIFY `RepostID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userlists`
--
ALTER TABLE `userlists`
  MODIFY `UserListID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookmark`
--
ALTER TABLE `bookmark`
  ADD CONSTRAINT `bookmark_ibfk_1` FOREIGN KEY (`PostID`) REFERENCES `post` (`PostID`),
  ADD CONSTRAINT `bookmark_ibfk_2` FOREIGN KEY (`UserName`) REFERENCES `user` (`UserName`);

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`PostID`) REFERENCES `post` (`PostID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`UserName`) REFERENCES `user` (`UserName`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detailpost`
--
ALTER TABLE `detailpost`
  ADD CONSTRAINT `detailpost_ibfk_1` FOREIGN KEY (`PostID`) REFERENCES `post` (`PostID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detailpost_ibfk_2` FOREIGN KEY (`ImageID`) REFERENCES `image` (`ImageID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `follow`
--
ALTER TABLE `follow`
  ADD CONSTRAINT `follow_ibfk_1` FOREIGN KEY (`UserName`) REFERENCES `user` (`UserName`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `follow_ibfk_2` FOREIGN KEY (`Follower`) REFERENCES `user` (`UserName`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `follow_ibfk_3` FOREIGN KEY (`Following`) REFERENCES `user` (`UserName`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lists`
--
ALTER TABLE `lists`
  ADD CONSTRAINT `lists_ibfk_1` FOREIGN KEY (`CreatedBy`) REFERENCES `user` (`UserName`);

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`ToUser`) REFERENCES `user` (`UserName`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notification_ibfk_2` FOREIGN KEY (`FromUser`) REFERENCES `user` (`UserName`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notification_ibfk_3` FOREIGN KEY (`PostID`) REFERENCES `post` (`PostID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notification_ibfk_4` FOREIGN KEY (`CommentID`) REFERENCES `comment` (`CommentID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`UserName`) REFERENCES `user` (`UserName`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `postlike`
--
ALTER TABLE `postlike`
  ADD CONSTRAINT `postlike_ibfk_1` FOREIGN KEY (`PostID`) REFERENCES `post` (`PostID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `postlike_ibfk_2` FOREIGN KEY (`UserName`) REFERENCES `user` (`UserName`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reposts`
--
ALTER TABLE `reposts`
  ADD CONSTRAINT `reposts_ibfk_1` FOREIGN KEY (`PostID`) REFERENCES `post` (`PostID`),
  ADD CONSTRAINT `reposts_ibfk_2` FOREIGN KEY (`RepostedBy`) REFERENCES `user` (`UserName`);

--
-- Constraints for table `userlists`
--
ALTER TABLE `userlists`
  ADD CONSTRAINT `userlists_ibfk_1` FOREIGN KEY (`ListID`) REFERENCES `lists` (`ListID`),
  ADD CONSTRAINT `userlists_ibfk_2` FOREIGN KEY (`UserName`) REFERENCES `user` (`UserName`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
