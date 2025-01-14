-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 01, 2025 at 09:12 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `d2`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_role`
--

CREATE TABLE `admin_role` (
  `role_id` int(11) NOT NULL,
  `special_privileges` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_role`
--

INSERT INTO `admin_role` (`role_id`, `special_privileges`) VALUES
(1, 'Manage all devices, create new users'),
(4, 'Full control over devices and automation'),
(6, 'Add or remove devices and schedules'),
(9, 'Modify roles and access levels'),
(11, 'Access logs and set security measures'),
(14, 'Reset passwords and configure settings'),
(16, 'Enable or disable notifications'),
(18, 'Manage scenes and automations'),
(20, 'Perform system diagnostics'),
(22, 'Configure Wi-Fi and device settings');

-- --------------------------------------------------------

--
-- Table structure for table `critical_notification`
--

CREATE TABLE `critical_notification` (
  `notification_id` int(11) NOT NULL,
  `response_time` time NOT NULL,
  `escalation_level` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `critical_notification`
--

INSERT INTO `critical_notification` (`notification_id`, `response_time`, `escalation_level`) VALUES
(1, '00:05:00', 'Level 1'),
(3, '00:10:00', 'Level 2'),
(6, '00:02:00', 'Level 3'),
(9, '00:07:00', 'Level 1'),
(12, '00:15:00', 'Level 2'),
(14, '00:03:00', 'Level 3'),
(15, '00:08:00', 'Level 1'),
(18, '00:20:00', 'Level 2'),
(19, '00:12:00', 'Level 3'),
(23, '00:01:00', 'Level 1');

-- --------------------------------------------------------

--
-- Table structure for table `custom_schedule`
--

CREATE TABLE `custom_schedule` (
  `schedule_id` int(11) NOT NULL,
  `custom_pattern` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `custom_schedule`
--

INSERT INTO `custom_schedule` (`schedule_id`, `custom_pattern`) VALUES
(5, 'Monday, Wednesday, Friday'),
(9, 'Tuesday, Thursday'),
(12, 'Saturday, Sunday'),
(14, 'Every other day'),
(16, 'First and last days of the month'),
(19, 'Weekends only'),
(22, 'Custom holiday settings'),
(24, 'Bi-weekly on Tuesdays'),
(26, 'First Monday of each month'),
(29, 'Alternate Fridays');

-- --------------------------------------------------------

--
-- Table structure for table `daily_schedule`
--

CREATE TABLE `daily_schedule` (
  `schedule_id` int(11) NOT NULL,
  `day_of_week` set('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `daily_schedule`
--

INSERT INTO `daily_schedule` (`schedule_id`, `day_of_week`) VALUES
(1, 'Monday'),
(2, 'Tuesday'),
(6, 'Wednesday'),
(8, 'Thursday'),
(11, 'Friday'),
(15, 'Saturday'),
(18, 'Sunday'),
(21, 'Monday'),
(25, 'Tuesday'),
(28, 'Monday');

-- --------------------------------------------------------

--
-- Table structure for table `device`
--

CREATE TABLE `device` (
  `device_id` int(11) NOT NULL,
  `device_name` varchar(100) NOT NULL,
  `device_type` varchar(100) DEFAULT NULL,
  `status` enum('on','off') NOT NULL,
  `home_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `device`
--

INSERT INTO `device` (`device_id`, `device_name`, `device_type`, `status`, `home_id`) VALUES
(1, 'Smart Light', 'Lighting', 'on', 1),
(2, 'Thermostat', 'HVAC', 'off', 1),
(3, 'Security Camera', 'Camera', 'on', 2),
(4, 'Garage Door', 'Access Control', 'off', 2),
(5, 'Smart Speaker', 'Entertainment', 'on', 3),
(6, 'Smoke Detector', 'Safety', 'on', 3),
(7, 'Smart Lock', 'Access Control', 'off', 4),
(8, 'Smart TV', 'Entertainment', 'on', 5),
(9, 'Coffee Maker', 'Appliance', 'off', 6),
(10, 'Smart Plug', 'Utility', 'on', 7);

-- --------------------------------------------------------

--
-- Table structure for table `guest_role`
--

CREATE TABLE `guest_role` (
  `role_id` int(11) NOT NULL,
  `expiration_date` date NOT NULL,
  `limited_access_area` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `guest_role`
--

INSERT INTO `guest_role` (`role_id`, `expiration_date`, `limited_access_area`) VALUES
(2, '2024-12-31', 'Living Room, Kitchen'),
(5, '2025-01-15', 'Bedroom, Hallway'),
(8, '2025-02-01', 'Garage, Yard'),
(10, '2025-03-01', 'Dining Room'),
(12, '2025-04-10', 'Study Room'),
(13, '2025-05-05', 'Living Room'),
(15, '2025-06-20', 'Kitchen'),
(17, '2025-07-12', 'Bathroom'),
(19, '2025-08-15', 'Patio'),
(21, '2025-09-30', 'All common areas');

-- --------------------------------------------------------

--
-- Table structure for table `home`
--

CREATE TABLE `home` (
  `home_id` int(11) NOT NULL,
  `home_name` varchar(100) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `ssid` varchar(100) DEFAULT NULL,
  `wifi_password` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `home`
--

INSERT INTO `home` (`home_id`, `home_name`, `address`, `ssid`, `wifi_password`, `user_id`) VALUES
(1, 'Smith Residence', '123 Elm St', 'SmithWifi', 'smith123', 1),
(2, 'Doe Villa', '456 Oak Ave', 'DoeWifi', 'doepass', 2),
(3, 'Johnson Home', '789 Pine Rd', 'JohnsonNet', 'johnson123', 3),
(4, 'Jones Estate', '321 Maple Ln', 'JonesWifi', 'jones456', 4),
(5, 'Brown Cottage', '654 Cedar St', 'BrownNet', 'brown789', 5),
(6, 'Wilson Loft', '987 Birch Blvd', 'WilsonWifi', 'wilson101', 6),
(7, 'Lee Mansion', '246 Spruce Dr', 'LeeWifi', 'lee202', 7),
(8, 'Bond Bungalow', '135 Willow Way', 'BondNet', 'bond303', 8),
(9, 'Smith Villa', '246 Oak Way', 'Smith2Wifi', 'smith404', 9),
(10, 'Hardy Tower', '357 Aspen St', 'HardyWifi', 'hardy505', 10),
(11, 'Tom Hardy House', '123 Elm St', 'Network_11', 'pass001', 11),
(12, 'Charlie Brown House', '456 Oak Ave', 'Network_12', 'pass002', 12),
(13, 'Lucy House', '789 Pine Ln', 'Network_13', 'pass003', 13),
(14, 'Snoopy House', '101 Maple Blvd', 'Network_14', 'pass004', 14),
(15, 'Patty House', '202 Birch Rd', 'Network_15', 'pass005', 15),
(16, 'Woodstock House', '303 Cedar Dr', 'Network_16', 'pass006', 16),
(17, 'Schroeder House', '404 Walnut St', 'Network_17', 'pass007', 17),
(18, 'Marcy House', '505 Spruce Ct', 'Network_18', 'pass008', 18),
(19, 'Franklin House', '606 Fir Cir', 'Network_19', 'pass009', 19),
(20, 'Pigen House', '707 Aspen Rd', 'Network_20', 'pass010', 20),
(21, 'Red House', '808 Chestnut Ave', 'Network_21', 'pass011', 21),
(22, 'Violet House', '909 Redwood St', 'Network_22', 'pass012', 22),
(23, 'Frieda House', '1010 Palm Ln', 'Network_23', 'pass013', 23),
(24, 'PattyC House', '1111 Cypress Blvd', 'Network_24', 'pass014', 24),
(25, 'Shermy House', '1212 Sequoia Ct', 'Network_25', 'pass015', 25);

-- --------------------------------------------------------

--
-- Table structure for table `informational_notification`
--

CREATE TABLE `informational_notification` (
  `notification_id` int(11) NOT NULL,
  `log_details` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `informational_notification`
--

INSERT INTO `informational_notification` (`notification_id`, `log_details`) VALUES
(2, 'Device turned off at 09:00 AM'),
(4, 'Temperature adjusted to 72°F successfully'),
(7, 'Light schedule executed at 2:00 PM'),
(8, 'Volume adjusted to 50%'),
(13, 'Weekly report generated and emailed to user'),
(16, 'Wi-Fi reconnected at 11:00 PM'),
(17, 'Motion detected and logged in backyard'),
(20, 'Door unlocked by a guest at 3:00 AM'),
(25, 'Light brightness reduced to 50%'),
(30, 'Firmware updated successfully on smoke detector');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `notification_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `timestamp` datetime NOT NULL,
  `read_status` enum('read','unread') NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `device_id` int(11) DEFAULT NULL,
  `type` enum('critical','warning','informational') NOT NULL DEFAULT 'informational'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`notification_id`, `message`, `timestamp`, `read_status`, `user_id`, `device_id`, `type`) VALUES
(1, 'Smoke detected in the living room', '2024-12-14 08:00:00', 'unread', 1, 1, 'critical'),
(2, 'Device turned off', '2024-12-14 09:00:00', 'read', 1, 2, 'informational'),
(3, 'Battery level critical on the front door lock', '2024-12-14 10:00:00', 'unread', 2, 2, 'critical'),
(4, 'Temperature adjusted to 72°F', '2024-12-14 11:00:00', 'read', 2, 1, 'informational'),
(5, 'Wi-Fi network disconnected', '2024-12-14 12:00:00', 'unread', 3, 3, 'warning'),
(6, 'Unauthorized access detected', '2024-12-14 13:00:00', 'unread', 3, 4, 'critical'),
(7, 'Light schedule completed', '2024-12-14 14:00:00', 'read', 4, 5, 'informational'),
(8, 'Volume adjusted', '2024-12-14 15:00:00', 'read', 4, 6, 'informational'),
(9, 'Fire alarm triggered in the basement', '2024-12-14 16:00:00', 'unread', 5, 7, 'critical'),
(10, 'Battery level low on smoke detector', '2024-12-14 17:00:00', 'unread', 5, 8, 'warning'),
(11, 'Garage door left open', '2024-12-14 18:00:00', 'read', 6, 9, 'warning'),
(12, 'Carbon monoxide detected in the kitchen', '2024-12-14 19:00:00', 'unread', 6, 10, 'critical'),
(13, 'Weekly report generated', '2024-12-14 20:00:00', 'read', 7, 1, 'informational'),
(14, 'Tampering detected on the security camera', '2024-12-14 21:00:00', 'unread', 7, 2, 'critical'),
(15, 'Water leakage detected near the washing machine', '2024-12-14 22:00:00', 'unread', 8, 3, 'critical'),
(16, 'Wi-Fi reconnected successfully', '2024-12-14 23:00:00', 'read', 8, 4, 'informational'),
(17, 'Motion detected in the backyard', '2024-12-15 00:00:00', 'unread', 9, 5, 'informational'),
(18, 'High temperature detected in the server room', '2024-12-15 01:00:00', 'unread', 9, 6, 'critical'),
(19, 'Gas leak detected in the kitchen', '2024-12-15 02:00:00', 'unread', 10, 7, 'critical'),
(20, 'Door unlocked by guest', '2024-12-15 03:00:00', 'read', 10, 8, 'informational'),
(21, 'Network error detected', '2024-12-15 04:00:00', 'unread', 11, 9, 'warning'),
(22, 'New firmware update available', '2024-12-15 05:00:00', 'read', 11, 10, 'informational'),
(23, 'Temperature exceeded limit', '2024-12-15 06:00:00', 'unread', 12, 1, 'critical'),
(24, 'Security alarm triggered', '2024-12-15 07:00:00', 'unread', 12, 2, 'critical'),
(25, 'Light brightness adjusted to 50%', '2024-12-15 08:00:00', 'read', 13, 3, 'informational'),
(26, 'Garage door opened manually', '2024-12-15 09:00:00', 'read', 13, 4, 'informational'),
(27, 'Tampering detected on the main lock', '2024-12-15 10:00:00', 'unread', 14, 5, 'critical'),
(28, 'System diagnostics completed successfully', '2024-12-15 11:00:00', 'read', 14, 6, 'informational'),
(29, 'Smoke detected in the bedroom', '2024-12-15 12:00:00', 'unread', 15, 7, 'critical'),
(30, 'Device firmware updated successfully', '2024-12-15 13:00:00', 'read', 15, 8, 'informational');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `role_type` enum('admin','guest','viewer') NOT NULL,
  `access_level` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `home_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `role_type`, `access_level`, `user_id`, `home_id`) VALUES
(1, 'admin', 'full_access', 1, 1),
(2, 'guest', 'limited_access', 2, 2),
(3, 'viewer', 'read_only', 3, 3),
(4, 'admin', 'full_access', 4, 4),
(5, 'guest', 'limited_access', 5, 5),
(6, 'admin', 'full_access', 6, 6),
(7, 'viewer', 'read_only', 7, 7),
(8, 'guest', 'limited_access', 8, 8),
(9, 'admin', 'full_access', 9, 9),
(10, 'viewer', 'read_only', 10, 10),
(11, 'admin', 'full_access', 11, 2),
(12, 'guest', 'limited_access', 12, 3),
(13, 'viewer', 'read_only', 13, 4),
(14, 'admin', 'full_access', 14, 5),
(15, 'guest', 'limited_access', 15, 6),
(16, 'admin', 'full_access', 16, 7),
(17, 'viewer', 'read_only', 17, 8),
(18, 'guest', 'limited_access', 18, 9),
(19, 'admin', 'full_access', 19, 10),
(20, 'viewer', 'read_only', 20, 1),
(21, 'admin', 'full_access', 21, 2),
(22, 'guest', 'limited_access', 22, 3),
(23, 'viewer', 'read_only', 23, 4),
(24, 'admin', 'full_access', 24, 5),
(25, 'guest', 'limited_access', 25, 6),
(26, 'admin', 'full_access', 26, 7),
(27, 'viewer', 'read_only', 27, 8),
(28, 'guest', 'limited_access', 28, 9),
(29, 'admin', 'full_access', 29, 10),
(30, 'viewer', 'read_only', 30, 1);

-- --------------------------------------------------------

--
-- Table structure for table `scene`
--

CREATE TABLE `scene` (
  `scene_id` int(11) NOT NULL,
  `scene_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `active_status` enum('active','inactive') NOT NULL,
  `home_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `scene`
--

INSERT INTO `scene` (`scene_id`, `scene_name`, `description`, `active_status`, `home_id`) VALUES
(1, 'Morning Routine', 'Turn on lights and coffee maker', 'active', 1),
(2, 'Evening Relax', 'Dim lights and play music', 'inactive', 2),
(3, 'Night Security', 'Activate cameras and alarms', 'active', 3),
(4, 'Movie Mode', 'Dim lights and adjust TV settings', 'inactive', 4),
(5, 'Workout', 'Turn on gym equipment and speaker', 'active', 5),
(6, 'Bedtime', 'Turn off lights and lock doors', 'inactive', 6),
(7, 'Dinner Mode', 'Turn on dining lights and music', 'active', 7),
(8, 'Party Mode', 'Activate party lights and speaker', 'inactive', 8),
(9, 'Away Mode', 'Turn off all devices and set alarms', 'active', 9),
(10, 'Reading Time', 'Adjust lighting to warm white', 'inactive', 10);

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `schedule_id` int(11) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `frequency` enum('daily','weekly','custom') NOT NULL,
  `status` enum('active','inactive') NOT NULL,
  `device_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`schedule_id`, `start_time`, `end_time`, `frequency`, `status`, `device_id`) VALUES
(1, '07:00:00', '08:00:00', 'daily', 'active', 1),
(2, '09:00:00', '10:00:00', 'daily', 'active', 2),
(3, '06:00:00', '07:00:00', 'weekly', 'active', 3),
(4, '18:00:00', '19:00:00', 'weekly', 'inactive', 4),
(5, '20:00:00', '21:00:00', 'custom', 'active', 5),
(6, '08:30:00', '09:30:00', 'daily', 'active', 6),
(7, '15:00:00', '16:00:00', 'weekly', 'inactive', 7),
(8, '22:00:00', '23:00:00', 'daily', 'active', 8),
(9, '11:00:00', '12:00:00', 'custom', 'inactive', 9),
(10, '14:00:00', '15:00:00', 'weekly', 'active', 10),
(11, '07:15:00', '08:15:00', 'daily', 'active', 1),
(12, '16:00:00', '17:00:00', 'custom', 'active', 2),
(13, '05:30:00', '06:30:00', 'weekly', 'active', 3),
(14, '19:00:00', '20:00:00', 'custom', 'inactive', 4),
(15, '21:30:00', '22:30:00', 'daily', 'active', 5),
(16, '10:00:00', '11:00:00', 'daily', 'active', 6),
(17, '13:30:00', '14:30:00', 'weekly', 'inactive', 7),
(18, '23:00:00', '00:00:00', 'daily', 'active', 8),
(19, '12:00:00', '13:00:00', 'custom', 'active', 9),
(20, '17:00:00', '18:00:00', 'weekly', 'active', 10),
(21, '07:45:00', '08:45:00', 'daily', 'active', 1),
(22, '16:30:00', '17:30:00', 'custom', 'active', 2),
(23, '05:15:00', '06:15:00', 'weekly', 'active', 3),
(24, '18:30:00', '19:30:00', 'custom', 'inactive', 4),
(25, '20:30:00', '21:30:00', 'daily', 'active', 5),
(26, '10:30:00', '11:30:00', 'daily', 'active', 6),
(27, '14:00:00', '15:00:00', 'weekly', 'inactive', 7),
(28, '23:30:00', '00:30:00', 'daily', 'active', 8),
(29, '13:00:00', '14:00:00', 'custom', 'active', 9),
(30, '18:00:00', '19:00:00', 'weekly', 'active', 10);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `email`, `password`, `name`, `phone_number`) VALUES
(1, 'johnsmith', 'john@example.com', 'hashedpass1', 'John Smith', '1234567890'),
(2, 'janedoe', 'jane@example.com', 'hashedpass2', 'Jane Doe', '2345678901'),
(3, 'alicejohnson', 'alice@example.com', 'hashedpass3', 'Alice Johnson', '3456789012'),
(4, 'bobjones', 'bob@example.com', 'hashedpass4', 'Bob Jones', '4567890123'),
(5, 'emilybrown', 'emily@example.com', 'hashedpass5', 'Emily Brown', '5678901234'),
(6, 'mikewilson', 'mike@example.com', 'hashedpass6', 'Mike Wilson', '6789012345'),
(7, 'saralee', 'sarah@example.com', 'hashedpass7', 'Sarah Lee', '7890123456'),
(8, 'jamesbond', 'james@example.com', 'hashedpass8', 'James Bond', '8901234567'),
(9, 'lisasmith', 'lisa@example.com', 'hashedpass9', 'Lisa Smith', '9012345678'),
(10, 'tomhardy', 'tom@example.com', 'hashedpass10', 'Tom Hardy', '0123456789'),
(11, 'charliebrown', 'charlie@example.com', 'hashedpass11', 'Charlie Brown', '1111111111'),
(12, 'lucyvanpelt', 'lucy@example.com', 'hashedpass12', 'Lucy Van Pelt', '2222222222'),
(13, 'linusvanpelt', 'linus@example.com', 'hashedpass13', 'Linus Van Pelt', '3333333333'),
(14, 'snoopydog', 'snoopy@example.com', 'hashedpass14', 'Snoopy Dog', '4444444444'),
(15, 'peppermintpatty', 'patty1@example.com', 'hashedpass15', 'Peppermint Patty', '5555555555'),
(16, 'woodstockbird', 'woodstock@example.com', 'hashedpass16', 'Woodstock Bird', '6666666666'),
(17, 'schroederpiano', 'schroeder@example.com', 'hashedpass17', 'Schroeder Piano', '7777777777'),
(18, 'marcymarcie', 'marcy@example.com', 'hashedpass18', 'Marcy Marcie', '8888888888'),
(19, 'franklingrand', 'franklin@example.com', 'hashedpass19', 'Franklin Grand', '9999999999'),
(20, 'pigpenmessy', 'pigpen@example.com', 'hashedpass20', 'Pig-Pen Messy', '1010101010'),
(21, 'redbaron', 'redbaron@example.com', 'hashedpass21', 'Red Baron', '1212121212'),
(22, 'violetgray', 'violet@example.com', 'hashedpass22', 'Violet Gray', '1313131313'),
(23, 'friedaafro', 'frieda@example.com', 'hashedpass23', 'Frieda Afro', '1414141414'),
(24, 'pattycake', 'patty@example.com', 'hashedpass24', 'Patty Cake', '1515151515'),
(25, 'shermybest', 'shermy@example.com', 'hashedpass25', 'Shermy Best', '1616161616'),
(26, 'charlottebraun', 'charlotte@example.com', 'hashedpass26', 'Charlotte Braun', '1717171717'),
(27, 'loriland', 'lori@example.com', 'hashedpass27', 'Lori Land', '1818181818'),
(28, 'haroldsmith', 'harold@example.com', 'hashedpass28', 'Harold Smith', '1919191919'),
(29, 'wendysky', 'wendy@example.com', 'hashedpass29', 'Wendy Sky', '2020202020'),
(30, 'timglory', 'tim@example.com', 'hashedpass30', 'Tim Glory', '2121212121');

-- --------------------------------------------------------

--
-- Table structure for table `viewer_role`
--

CREATE TABLE `viewer_role` (
  `role_id` int(11) NOT NULL,
  `read_only_features` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `viewer_role`
--

INSERT INTO `viewer_role` (`role_id`, `read_only_features`) VALUES
(3, 'View device statuses, access logs'),
(7, 'Monitor security camera feeds'),
(11, 'Check schedule statuses'),
(14, 'View active scenes'),
(16, 'Inspect notifications'),
(18, 'Review user activity logs'),
(20, 'Monitor device battery levels'),
(23, 'Track automation success rates'),
(25, 'View temperature settings'),
(27, 'Access smart home diagnostics');

-- --------------------------------------------------------

--
-- Table structure for table `warning_notification`
--

CREATE TABLE `warning_notification` (
  `notification_id` int(11) NOT NULL,
  `suggested_action` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `warning_notification`
--

INSERT INTO `warning_notification` (`notification_id`, `suggested_action`) VALUES
(5, 'Reconnect to Wi-Fi network'),
(10, 'Replace the battery in the smoke detector'),
(11, 'Close the garage door to secure the property'),
(21, 'Check the router or reset the network'),
(22, 'Update the firmware to the latest version'),
(26, 'Confirm manual operation was intended'),
(27, 'Inspect the lock for any damage'),
(28, 'Review the diagnostics for device performance'),
(29, 'Verify if it is a false alarm or take action'),
(30, 'Ensure all devices are running the latest firmware');

-- --------------------------------------------------------

--
-- Table structure for table `weekly_schedule`
--

CREATE TABLE `weekly_schedule` (
  `schedule_id` int(11) NOT NULL,
  `week_of_month` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `weekly_schedule`
--

INSERT INTO `weekly_schedule` (`schedule_id`, `week_of_month`) VALUES
(3, 'First week'),
(4, 'Second week'),
(7, 'Third week'),
(10, 'Fourth week'),
(13, 'Last week'),
(17, 'First and third weeks'),
(20, 'Second and fourth weeks'),
(23, 'First two weeks'),
(27, 'Last two weeks'),
(30, 'Every week');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_role`
--
ALTER TABLE `admin_role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `critical_notification`
--
ALTER TABLE `critical_notification`
  ADD PRIMARY KEY (`notification_id`);

--
-- Indexes for table `custom_schedule`
--
ALTER TABLE `custom_schedule`
  ADD PRIMARY KEY (`schedule_id`);

--
-- Indexes for table `daily_schedule`
--
ALTER TABLE `daily_schedule`
  ADD PRIMARY KEY (`schedule_id`);

--
-- Indexes for table `device`
--
ALTER TABLE `device`
  ADD PRIMARY KEY (`device_id`),
  ADD KEY `home_id` (`home_id`);

--
-- Indexes for table `guest_role`
--
ALTER TABLE `guest_role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `home`
--
ALTER TABLE `home`
  ADD PRIMARY KEY (`home_id`),
  ADD KEY `fk_home_user` (`user_id`);

--
-- Indexes for table `informational_notification`
--
ALTER TABLE `informational_notification`
  ADD PRIMARY KEY (`notification_id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `device_id` (`device_id`),
  ADD KEY `fk_notification_user` (`user_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`),
  ADD KEY `home_id` (`home_id`),
  ADD KEY `fk_scene_user` (`user_id`);

--
-- Indexes for table `scene`
--
ALTER TABLE `scene`
  ADD PRIMARY KEY (`scene_id`),
  ADD KEY `home_id` (`home_id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `device_id` (`device_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `viewer_role`
--
ALTER TABLE `viewer_role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `warning_notification`
--
ALTER TABLE `warning_notification`
  ADD PRIMARY KEY (`notification_id`);

--
-- Indexes for table `weekly_schedule`
--
ALTER TABLE `weekly_schedule`
  ADD PRIMARY KEY (`schedule_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `device`
--
ALTER TABLE `device`
  MODIFY `device_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `home`
--
ALTER TABLE `home`
  MODIFY `home_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `scene`
--
ALTER TABLE `scene`
  MODIFY `scene_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_role`
--
ALTER TABLE `admin_role`
  ADD CONSTRAINT `admin_role_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);

--
-- Constraints for table `critical_notification`
--
ALTER TABLE `critical_notification`
  ADD CONSTRAINT `critical_notification_ibfk_1` FOREIGN KEY (`notification_id`) REFERENCES `notification` (`notification_id`) ON DELETE CASCADE;

--
-- Constraints for table `custom_schedule`
--
ALTER TABLE `custom_schedule`
  ADD CONSTRAINT `custom_schedule_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`schedule_id`) ON DELETE CASCADE;

--
-- Constraints for table `daily_schedule`
--
ALTER TABLE `daily_schedule`
  ADD CONSTRAINT `daily_schedule_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`schedule_id`) ON DELETE CASCADE;

--
-- Constraints for table `device`
--
ALTER TABLE `device`
  ADD CONSTRAINT `device_ibfk_1` FOREIGN KEY (`home_id`) REFERENCES `home` (`home_id`);

--
-- Constraints for table `guest_role`
--
ALTER TABLE `guest_role`
  ADD CONSTRAINT `guest_role_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);

--
-- Constraints for table `home`
--
ALTER TABLE `home`
  ADD CONSTRAINT `fk_home_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_ID`),
  ADD CONSTRAINT `home_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_ID`);

--
-- Constraints for table `informational_notification`
--
ALTER TABLE `informational_notification`
  ADD CONSTRAINT `informational_notification_ibfk_1` FOREIGN KEY (`notification_id`) REFERENCES `notification` (`notification_id`) ON DELETE CASCADE;

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `fk_notification_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_ID`),
  ADD CONSTRAINT `notif_fk` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_ID`),
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_ID`),
  ADD CONSTRAINT `notification_ibfk_2` FOREIGN KEY (`device_id`) REFERENCES `device` (`device_id`);

--
-- Constraints for table `role`
--
ALTER TABLE `role`
  ADD CONSTRAINT `fk_scene_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_ID`),
  ADD CONSTRAINT `role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_ID`),
  ADD CONSTRAINT `role_ibfk_2` FOREIGN KEY (`home_id`) REFERENCES `home` (`home_id`);

--
-- Constraints for table `scene`
--
ALTER TABLE `scene`
  ADD CONSTRAINT `scene_ibfk_1` FOREIGN KEY (`home_id`) REFERENCES `home` (`home_id`);

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`device_id`) REFERENCES `device` (`device_id`);

--
-- Constraints for table `viewer_role`
--
ALTER TABLE `viewer_role`
  ADD CONSTRAINT `viewer_role_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);

--
-- Constraints for table `warning_notification`
--
ALTER TABLE `warning_notification`
  ADD CONSTRAINT `warning_notification_ibfk_1` FOREIGN KEY (`notification_id`) REFERENCES `notification` (`notification_id`) ON DELETE CASCADE;

--
-- Constraints for table `weekly_schedule`
--
ALTER TABLE `weekly_schedule`
  ADD CONSTRAINT `weekly_schedule_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`schedule_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
