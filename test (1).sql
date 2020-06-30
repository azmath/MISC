-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 30, 2020 at 06:56 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_logs`
--

CREATE TABLE `app_logs` (
  `log_id` int(11) NOT NULL,
  `Timestamp` varchar(255) DEFAULT NULL,
  `Action` varchar(255) DEFAULT NULL,
  `TableName` varchar(255) DEFAULT NULL,
  `RecordID` varchar(255) DEFAULT NULL,
  `SqlQuery` varchar(255) DEFAULT NULL,
  `UserID` varchar(255) DEFAULT NULL,
  `ServerIP` varchar(255) DEFAULT NULL,
  `RequestUrl` text DEFAULT NULL,
  `RequestData` text DEFAULT NULL,
  `RequestCompleted` varchar(255) DEFAULT NULL,
  `RequestMsg` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `contactid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`contactid`, `name`, `email`, `title`, `date_created`, `date_updated`) VALUES
(1, 'rama', 'rama@c.com', 'it infra manager', NULL, NULL),
(2, 'subha', 'subha@c.com', 'it analyst', NULL, NULL),
(3, 'abhishek', 'abhi@c.com', 'it analyst middleware', NULL, NULL),
(4, 'dinesh', 'dine@c.com', 'it analyst fronend', NULL, NULL),
(5, 'prabha', 'prabha@c.com', 'it prject manager', NULL, NULL),
(6, 'tim', 'tim@c.com', 'it analyst', NULL, NULL),
(7, 'manager1', 'mgr1@c.com', 'project manager', NULL, NULL),
(8, 'preeth', 'preeth@c.com', 'it sec analyst', NULL, NULL),
(9, 'manager2', 'mgr2@c.com', 'manager2', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `issues`
--

CREATE TABLE `issues` (
  `id` int(10) NOT NULL,
  `innotas_id` varchar(15) DEFAULT NULL,
  `project_type` varchar(100) NOT NULL,
  `assessment_name` varchar(150) NOT NULL,
  `issue_title` varchar(200) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `severity` varchar(10) DEFAULT NULL,
  `exploitability` varchar(10) DEFAULT NULL,
  `status` varchar(25) DEFAULT NULL,
  `found_on` date DEFAULT NULL,
  `target_date` date DEFAULT NULL,
  `app_support_contact` varchar(100) DEFAULT NULL,
  `manager` varchar(100) DEFAULT NULL,
  `comments` varchar(2000) DEFAULT NULL,
  `recommendation` varchar(1000) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `issues`
--

INSERT INTO `issues` (`id`, `innotas_id`, `project_type`, `assessment_name`, `issue_title`, `description`, `severity`, `exploitability`, `status`, `found_on`, `target_date`, `app_support_contact`, `manager`, `comments`, `recommendation`, `date_created`, `date_updated`, `date_deleted`) VALUES
(1, '12345', 'change assessment', 'Retail Internet Banking - 1345', 'xss', 'xss in id filed', 'Medium', 'Easy', 'Open', '2020-04-28', '2020-05-30', 'subha@c.com', 'mgr1@c.com', 'test comments', 'apply input filtering', NULL, NULL, NULL),
(2, NULL, 'Change Assessment', 'Retail Internet Banking - 1345', 'sqli', NULL, 'Medium', 'Medium', 'Open', '2020-04-29', '2020-05-31', 'subha@c.com', 'rama@c.com', NULL, NULL, NULL, NULL, NULL),
(6, '', 'Change Assessment', 'Retail Internet Banking - 1244', 'input validation', 'sample desc', 'High', 'Difficult', 'Closed', '2020-03-29', '2020-04-29', 'subha@c.com', 'mgr1@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(7, '27382', 'Change Assessment', 'iBusiness 290', 'output validation', 'sample desc', 'Medium', 'Difficult', 'Open', '2020-01-29', '2020-04-14', 'subha@c.com', 'mgr1@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(8, '234234', 'Change Assessment', 'iBusiness 290', 'weak hashes in used', 'sample desc', 'Low', 'Easy', 'Closed', '2020-03-29', '2020-05-25', 'subha@c.com', 'mgr1@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(9, '45', 'Change Assessment', 'iBusiness 333', 'ssl 2.0 in use', 'sample desc', 'High', 'Easy', 'Closed', '2020-03-03', '2020-05-26', 'subha@c.com', 'mgr1@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(10, '645', 'Change Assessment', 'iBusiness 333', 'authenticaiton bypass', 'sample desc', 'Medium', 'Easy', 'Closed', '2020-02-11', '2020-05-31', 'subha@c.com', 'mgr1@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(11, '63', 'Change Assessment', 'iBusiness 333', 'password policy not applied', 'sample desc', 'Low', 'Medium', 'Open', '2020-01-20', '2020-04-01', 'subha@c.com', 'mgr1@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(12, '45', 'Live Assessment', 'iBusiness Q1 2020', 'unauthorized access to other buiness cards', 'sample desc', 'Low', 'Medium', 'Open', '2020-02-04', '2020-05-05', 'subha@c.com', 'mgr1@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(13, '345', 'Live Assessment', 'iBusiness Q1 2020', 'approver auth bypass', 'sample desc', 'Low', 'Easy', 'Open', '2020-05-18', '2020-05-05', 'subha@c.com', 'mgr1@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(14, '34', 'Live Assessment', 'iBusiness Q1 2020', 'sqli in getaccount()', 'sample desc', 'High', 'Difficult', 'Closed', '2020-05-04', '2020-06-16', 'subha@c.com', 'mgr1@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(15, '5', 'Live Assessment', 'iBusiness Q1 2021', 'unsupport webserver in use', 'sample desc', 'Medium', 'Difficult', 'Closed', '2020-05-13', '2020-05-11', 'subha@c.com', 'mgr1@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(16, '456', 'Live Assessment', 'iBusiness Q1 2021', 'otp bypass', 'sample desc', 'Low', 'Easy', 'Closed', '2020-05-13', '2020-06-17', 'subha@c.com', 'mgr1@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(17, '567', 'Live Assessment', 'iBusiness Q1 2021', 'informaiton leakage', 'sample desc', 'High', 'Easy', 'Open', '2020-05-14', '2020-05-04', 'subha@c.com', 'mgr1@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(18, '4', 'Live Assessment', 'Retail internet banking Q4 2019', 'xss in fldsaa', 'sample desc', 'High', 'Easy', 'Closed', '2020-03-22', '2020-05-19', 'subha@c.com', 'mgr1@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(19, '5', 'Live Assessment', 'Retail internet banking Q4 2019', 'hsts not implemented', 'sample desc', 'Medium', 'Medium', 'Closed', '2019-11-03', '2020-05-03', 'subha@c.com', 'mgr1@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(20, '354', 'Live Assessment', 'Retail internet banking Q4 2019', 'informaiton leakage', 'sample desc', 'Low', 'Medium', 'Closed', '2019-12-09', '0000-00-00', 'subha@c.com', 'mgr1@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(21, '45', 'Penetration testing', 'PT 2020', 'vnc weak password', 'sample desc', 'High', 'Easy', 'Open', '2019-11-12', '2020-12-16', 'rama@c.com', 'mgr1@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(22, '66', 'Penetration testing', 'PT 2020', 'unquoted services', 'sample desc', 'Medium', 'Difficult', 'Open', '2019-10-14', '2020-05-13', 'rama@c.com', 'mgr1@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(23, '787', 'Penetration testing', 'PT 2020', 'weak admin password', 'sample desc', 'Low', 'Difficult', 'Open', '2020-02-04', '2020-04-13', 'rama@c.com', 'mgr1@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(24, '456', 'Penetration testing', 'PT 2019', 'issue 1', 'sample desc', 'Low', 'Easy', 'Closed', '2020-02-12', '0000-00-00', 'rama@c.com', 'mgr2@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(25, '43', 'Penetration testing', 'PT 2019', 'issue 2', 'sample desc', 'Low', 'Easy', 'Closed', '2020-02-16', '0000-00-00', 'rama@c.com', 'mgr2@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(26, '65', 'Penetration testing', 'PT 2019', 'issue 3', 'sample desc', 'High', 'Easy', 'Closed', '2019-12-24', '0000-00-00', 'rama@c.com', 'mgr2@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(27, '456', 'Vulnerability assessment', 'Vulnerability assessment 2019', 'issue 1', 'sample desc', 'Medium', 'Medium', 'Open', '2019-12-19', '2020-07-07', 'rama@c.com', 'mgr2@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(28, '3456', 'Vulnerability assessment', 'unwanted services', '', 'sample desc', 'Low', 'Medium', 'Closed', '2019-09-13', '2020-07-07', 'rama@c.com', 'mgr2@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(29, '356', 'Vulnerability assessment', 'VA 2019', 'unwanted users', 'sample desc', 'High', 'Easy', 'Closed', '2020-04-07', '2020-07-07', 'rama@c.com', 'mgr2@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(30, '754', 'Vulnerability assessment', 'VA 2019', 'hp old sofware in used', 'sample desc', 'High', 'Difficult', 'Closed', '2020-04-07', '2020-07-07', 'rama@c.com', 'mgr2@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(31, '673', 'Vulnerability assessment', 'VA 2019', 'winrar old version', 'sample desc', 'Medium', 'Difficult', 'Open', '2020-04-07', '2020-07-07', 'rama@c.com', 'mgr2@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(32, '456', 'Vulnerability assessment', 'old version of AV', '', 'sample desc', 'Low', 'Easy', 'Open', '2020-04-07', '2020-07-07', 'rama@c.com', 'mgr2@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(33, '5467', 'Vulnerability assessment', 'VA 2019', 'issu 890', 'sample desc', 'High', 'Easy', 'Open', '2020-04-07', '2020-07-07', 'rama@c.com', 'mgr2@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(34, '345', 'Vulnerability assessment', 'windows patches missing', '', 'sample desc', 'Medium', 'Easy', 'Closed', '2020-04-07', '2020-07-07', 'rama@c.com', 'mgr2@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(35, '634', 'Vulnerability assessment', 'oracle patches missing', '', 'sample desc', 'Low', 'Medium', 'Closed', '2020-04-07', '2020-07-07', 'rama@c.com', 'mgr2@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(36, '56', 'Vulnerability assessment', 'SMTP server running on workstations', '', 'sample desc', 'Low', 'Medium', 'Closed', '2020-04-07', '2020-07-07', 'rama@c.com', 'mgr2@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(37, '2345345', 'Vulnerability assessment', 'anonymous ftp running on multiple machines', '', 'sample desc', 'Low', 'Easy', 'Open', '2020-04-07', '2020-07-07', 'rama@c.com', 'mgr2@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(38, '34', 'Risk assessment', 'file integrity not updated', '', 'sample desc', 'High', 'Difficult', 'Closed', '2019-02-04', '0000-00-00', 'preeth@c.com', 'mgr2@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(39, '56', 'Risk assessment', 'Risk assessment 2019', 'issue 89', 'sample desc', 'Medium', 'Difficult', 'Closed', '2019-02-04', '0000-00-00', 'preeth@c.com', 'mgr2@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(40, '5678', 'Risk assessment', 'Risk assessment of Cards', 'issue 5', 'sample desc', 'Low', 'Easy', 'Closed', '2019-02-04', '0000-00-00', 'preeth@c.com', 'mgr2@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(41, '3456', 'Risk assessment', 'Risk assessment of Cards', 'pin not encrypted', 'sample desc', 'High', 'Easy', 'Open', '2019-02-04', '2020-04-05', 'preeth@c.com', 'mgr2@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(42, '', 'Change Assessment', 'Retail Internet Banking - 1244', 'input validation', 'sample desc', 'High', 'Difficult', 'Closed', '2019-12-02', '0000-00-00', 'subha@c.com', 'mgr1@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(43, '27382', 'Change Assessment', 'iBusiness 290', 'output validation', 'sample desc', 'Medium', 'Difficult', 'Open', '2019-12-04', '2020-05-30', 'subha@c.com', 'mgr1@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(44, '234234', 'Change Assessment', 'iBusiness 290', 'weak hashes in used', 'sample desc', 'Low', 'Easy', 'Closed', '2019-12-04', '0000-00-00', 'subha@c.com', 'mgr1@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(45, '45', 'Change Assessment', 'iBusiness 333', 'ssl 2.0 in use', 'sample desc', 'High', 'Easy', 'Closed', '2019-12-04', '0000-00-00', 'subha@c.com', 'mgr1@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(46, '645', 'Change Assessment', 'iBusiness 333', 'authenticaiton bypass', 'sample desc', 'Medium', 'Easy', 'Closed', '2019-12-04', '0000-00-00', 'subha@c.com', 'mgr1@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(47, '63', 'Change Assessment', 'iBusiness 333', 'password policy not applied', 'sample desc', 'Low', 'Medium', 'Open', '2019-12-04', '2020-06-30', 'subha@c.com', 'mgr1@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(48, '45', 'Live Assessment', 'iBusiness Q1 2020', 'unauthorized access to other buiness cards', 'sample desc', 'Low', 'Medium', 'Open', '2019-11-04', '2020-03-01', 'subha@c.com', 'mgr1@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(49, '345', 'Live Assessment', 'iBusiness Q1 2020', 'approver auth bypass', 'sample desc', 'Low', 'Easy', 'Open', '2019-11-04', '2020-07-22', 'subha@c.com', 'mgr1@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(50, '34', 'Live Assessment', 'iBusiness Q1 2020', 'sqli in getaccount()', 'sample desc', 'High', 'Difficult', 'Closed', '2019-11-04', '0000-00-00', 'subha@c.com', 'mgr1@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(51, '5', 'Live Assessment', 'iBusiness Q1 2021', 'unsupport webserver in use', 'sample desc', 'Medium', 'Difficult', 'Closed', '2020-01-16', '0000-00-00', 'subha@c.com', 'mgr1@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(52, '456', 'Live Assessment', 'iBusiness Q1 2021', 'otp bypass', 'sample desc', 'Low', 'Easy', 'Closed', '2020-03-03', '0000-00-00', 'subha@c.com', 'mgr1@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(53, '567', 'Live Assessment', 'iBusiness Q1 2021', 'informaiton leakage', 'sample desc', 'High', 'Easy', 'Open', '2020-04-15', '2020-05-28', 'subha@c.com', 'mgr1@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(54, '4', 'Live Assessment', 'Retail internet banking Q4 2019', 'xss in fldsaa', 'sample desc', 'High', 'Easy', 'Closed', '0000-00-00', '0000-00-00', 'subha@c.com', 'mgr1@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(55, '5', 'Live Assessment', 'Retail internet banking Q4 2019', 'hsts not implemented', 'sample desc', 'Medium', 'Medium', 'Open', '0000-00-00', '0000-00-00', 'subha@c.com', 'mgr1@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(56, '354', 'Live Assessment', 'Retail internet banking Q4 2019', 'informaiton leakage', 'sample desc', 'High', 'Medium', 'Open', '2019-12-03', '2020-08-06', 'subha@c.com', 'mgr1@c.com', 'n/a', 'n/a', NULL, NULL, NULL),
(78, '234123', 'Change Assessment', 'rib changes 3784', 'xss', 'test desc', 'High', 'Difficult', 'Open', '2020-05-06', '2020-06-16', 'subha@c.com', 'mgr2@c.com', 'ba', 'asdf', NULL, NULL, NULL),
(79, '12345', 'Live Assessment', 'Cash online Q1 2020', 'sqli injection in temp1 parameter', 'Sample dsecription', 'High', 'Difficult', 'Open', '2020-05-07', '2020-06-11', 'dine@c.com', 'mgr2@c.com', 'sample comments', 'sample comments', NULL, NULL, NULL),
(80, '234123', 'Change Assessment', 'CBD Mobile Applicaiton changes may 2020', 'input validation', 'dfasdf', 'High', 'Difficult', 'Open', '2020-05-13', '2020-05-16', 'mgr1@c.com', 'mgr1@c.com', 'asdf', 'sdfdfg', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `Assessment_name` varchar(100) NOT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  `Status` varchar(10) DEFAULT NULL,
  `Cordinator` varchar(50) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `completiondate` date DEFAULT NULL,
  `comments` varchar(1000) DEFAULT NULL,
  `TechRisk_coordinator` varchar(50) DEFAULT NULL,
  `Security_vendor_name` varchar(50) DEFAULT NULL,
  `attachments` varchar(1000) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `Assessment_name`, `Description`, `Status`, `Cordinator`, `startdate`, `completiondate`, `comments`, `TechRisk_coordinator`, `Security_vendor_name`, `attachments`, `date_created`, `date_updated`) VALUES
(1, 'CBD Mobile Applicaiton changes may 2020', 'sample description', 'open', 'rama@c.com', '2020-05-12', '2020-05-13', 'none', 'dine@c.com', 'iAppsecure', 'uploads/files/bonitasoft-icon-128-128-transparent.png', NULL, NULL),
(2, 'Retail Internet Banking - 1345', 'sdfsadf', 'Open', '', '2020-05-04', '2020-05-28', 'asdf', 'werqwer', 'fasdf', '', NULL, NULL),
(3, 'iBusiness 333 ', 'asdfas', 'closed', 'tim@c.com', '2020-05-03', '2020-05-21', 'asdf', 'tim@c.com', 'fasdf', 'http://localhost/tracker7/uploads/files/6uitvpdrs9k3g02.csv', '2020-05-21 16:46:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project_type`
--

CREATE TABLE `project_type` (
  `id` int(11) NOT NULL,
  `type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project_type`
--

INSERT INTO `project_type` (`id`, `type`) VALUES
(1, 'Change Assessment'),
(2, 'Live Assessment'),
(3, 'Penetration Testing'),
(4, 'Vulnerability Assessment'),
(5, 'Risk Assessment');

-- --------------------------------------------------------

--
-- Table structure for table `severity`
--

CREATE TABLE `severity` (
  `id` int(11) NOT NULL,
  `name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `severity`
--

INSERT INTO `severity` (`id`, `name`) VALUES
(1, 'High'),
(2, 'Medium'),
(3, 'Low'),
(4, 'Info'),
(5, 'NA');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `userid` varchar(50) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `role` varchar(20) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `login_session_key` varchar(255) DEFAULT NULL,
  `email_status` varchar(20) DEFAULT NULL,
  `password_reset_key` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `password_expire_date` datetime DEFAULT '2020-09-15 00:00:00',
  `account_status` varchar(255) DEFAULT 'Pending',
  `user_role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_logs`
--
ALTER TABLE `app_logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`contactid`);

--
-- Indexes for table `issues`
--
ALTER TABLE `issues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_type`
--
ALTER TABLE `project_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `severity`
--
ALTER TABLE `severity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_logs`
--
ALTER TABLE `app_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `contactid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `issues`
--
ALTER TABLE `issues`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `project_type`
--
ALTER TABLE `project_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `severity`
--
ALTER TABLE `severity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
