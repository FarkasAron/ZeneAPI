-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: localhost
-- Létrehozás ideje: 2026. Jan 26. 13:22
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `zenek`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `albums`
--

CREATE TABLE `albums` (
  `id` int(11) NOT NULL,
  `band_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `release_year` int(11) NOT NULL,
  `cover_url` varchar(255) DEFAULT NULL,
  `total_streams` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `albums`
--

INSERT INTO `albums` (`id`, `band_id`, `title`, `release_year`, `cover_url`, `total_streams`) VALUES
(1, 1, 'Lunar Strain', 1994, 'Lunar Strain.jpg', 25000000),
(2, 1, 'The Jester Race', 1996, 'The Jester Race.jpg', 65000000),
(3, 1, 'Whoracle', 1997, 'Whoracle.jpg', 87000000),
(4, 1, 'Colony', 1999, 'Colony.jpg', 98000000),
(5, 1, 'Clayman', 2000, 'Clayman.jpg', 125000000),
(6, 1, 'Reroute to Remain', 2002, 'Reroute to Remain.jpg', 98000000),
(7, 1, 'Soundtrack to Your Escape', 2004, 'Soundtrack to Your Escape.jpg', 112000000),
(8, 1, 'Come Clarity', 2006, 'Come Clarity.jpg', 134000000),
(9, 1, 'A Sense of Purpose', 2008, 'A Sense of Purpose.jpg', 89000000),
(10, 1, 'Sounds of a Playground Fading', 2011, 'Sounds of a Playground Fading.jpg', 87000000),
(11, 1, 'Siren Charms', 2014, 'Siren Charms.jpg', 76000000),
(12, 1, 'Battles', 2016, 'Battles.jpg', 76000000),
(13, 1, 'I, the Mask', 2019, 'I, the Mask.jpg', 143000000),
(14, 1, 'Foregone', 2023, 'Foregone.jpg', 156000000),
(15, 1, '', 0, NULL, 0),
(16, 3, 'When Dream and Day Unite', 1989, NULL, 0),
(17, 3, 'Images and Words', 1992, NULL, 0),
(18, 3, 'Awake', 1994, NULL, 0),
(19, 3, 'Falling Into Infinity', 1997, NULL, 0),
(20, 3, 'Metropolis Pt. 2: Scenes from a Memory', 1999, NULL, 0),
(21, 3, 'Six Degrees of Inner Turbulence', 2002, NULL, 0),
(22, 3, 'Train of Thought', 2003, NULL, 0),
(23, 3, 'Octavarium', 2005, NULL, 0),
(24, 3, 'Systematic Chaos', 2007, NULL, 0),
(25, 3, 'Black Clouds & Silver Linings', 2009, NULL, 0),
(26, 3, 'A Dramatic Turn of Events', 2011, NULL, 0),
(27, 3, 'Dream Theater', 2013, NULL, 0),
(28, 3, 'The Astonishing', 2016, NULL, 0),
(29, 3, 'Distance Over Time', 2019, NULL, 0),
(30, 3, 'A View from the Top of the World', 2021, NULL, 0),
(31, 3, 'Parasomnia', 2025, NULL, 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `artists`
--

CREATE TABLE `artists` (
  `id` int(11) NOT NULL,
  `full_name` varchar(200) NOT NULL,
  `birth_year` int(11) DEFAULT NULL,
  `birth_country` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `artists`
--

INSERT INTO `artists` (`id`, `full_name`, `birth_year`, `birth_country`) VALUES
(1, 'Jesper Strömblad', 1972, 'Sweden'),
(2, 'Glenn Ljungström', 1974, 'Sweden'),
(3, 'Johan Larsson', 1974, 'Sweden'),
(4, 'Anders Fridén', 1973, 'Sweden'),
(5, 'Björn Gelotte', 1975, 'Sweden'),
(6, 'Daniel Svensson', 1977, 'Sweden'),
(7, 'Peter Iwers', 1975, 'Sweden'),
(8, 'Niclas Engelin', 1972, 'Sweden'),
(9, 'Joe Rickard', 1986, 'USA'),
(10, 'Bryce Paul', 1990, 'USA'),
(11, 'Tanner Wayne', 1990, 'USA'),
(12, 'Chris Broderick', 1970, 'USA'),
(13, 'Liam Wilson', 1979, 'USA'),
(14, 'Anders Iwers', 1972, 'Sweden'),
(15, 'Karl Näslund', NULL, 'Sweden'),
(16, 'Mikael Stanne', 1974, 'Sweden'),
(17, 'Daniel Erlandsson', 1976, 'Sweden'),
(20, 'John Petrucci', 1967, NULL),
(21, 'John Myung', 1967, NULL),
(22, 'Mike Portnoy', 1967, NULL),
(23, 'James LaBrie', 1963, NULL),
(24, 'Jordan Rudess', 1956, NULL),
(25, 'Chris Collins', 1966, NULL),
(26, 'Charlie Dominici', 1951, NULL),
(27, 'Kevin Moore', 1967, NULL),
(28, 'Derek Sherinian', 1966, NULL),
(29, 'Mike Mangini', 1963, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `artist_instruments`
--

CREATE TABLE `artist_instruments` (
  `artist_id` int(11) NOT NULL,
  `instrument_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `artist_instruments`
--

INSERT INTO `artist_instruments` (`artist_id`, `instrument_id`) VALUES
(1, 2),
(2, 2),
(3, 3),
(4, 1),
(5, 2),
(6, 4),
(7, 3),
(8, 2),
(9, 4),
(10, 3),
(11, 4),
(12, 2),
(13, 3);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `bands`
--

CREATE TABLE `bands` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `formed_year` int(11) DEFAULT NULL,
  `origin_country` varchar(100) DEFAULT NULL,
  `genre_primary` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `bands`
--

INSERT INTO `bands` (`id`, `name`, `formed_year`, `origin_country`, `genre_primary`) VALUES
(1, 'In Flames', 1990, 'Sweden', 'Melodic Death Metal'),
(3, 'Dream Theater', 1985, 'USA', 'Progressive Metal');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `band_memberships`
--

CREATE TABLE `band_memberships` (
  `id` int(11) NOT NULL,
  `band_id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `role` varchar(100) DEFAULT NULL,
  `active_period` varchar(50) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `band_memberships`
--

INSERT INTO `band_memberships` (`id`, `band_id`, `artist_id`, `role`, `active_period`, `start_date`, `end_date`) VALUES
(1, 1, 1, 'guitar', '1990–2010', '1990-01-01', '2010-02-01'),
(2, 1, 2, 'guitar', '1993–1997', '1993-01-01', '1997-01-01'),
(3, 1, 3, 'bass', '1993–1997', '1993-01-01', '1997-01-01'),
(4, 1, 4, 'vocals', '1995–', '1995-01-01', NULL),
(5, 1, 5, 'guitar', '1995–', '1998-01-01', NULL),
(6, 1, 6, 'drums', '1998–2015', '1998-01-01', '2015-01-01'),
(7, 1, 7, 'bass', '1997–2016', '1998-01-01', '2016-11-01'),
(8, 1, 8, 'guitar', '1997–1998, 2011–2019', '2011-01-01', '2019-01-01'),
(9, 1, 9, 'drums', '2016–2019', '2016-01-01', '2019-01-01'),
(10, 1, 10, 'bass', '2017–2023', '2017-01-01', '2023-01-01'),
(11, 1, 12, 'guitar', '2019–', '2019-01-01', NULL),
(12, 1, 11, 'drums', '2018–2023', '2018-01-01', NULL),
(13, 1, 10, 'bass', '2017–2023', '2017-01-01', '2023-01-01'),
(14, 1, 13, 'bass', '2023–', '2023-01-01', NULL),
(15, 1, 16, 'vocals (session)', '1993', '1993-01-01', '1993-12-31'),
(16, 1, 14, 'bass (session)', '1997', '1995-01-01', '1995-12-31'),
(17, 1, 15, 'guitar', '1990–1993', '1990-01-01', '1992-12-31'),
(18, 1, 17, 'drums (session)', '1998', '1995-01-01', '1995-12-31'),
(32, 3, 20, 'Guitar', '1985–', NULL, NULL),
(33, 3, 21, 'Bass', '1985–', NULL, NULL),
(34, 3, 22, 'Drums', '1985–2010, 2023–', NULL, NULL),
(35, 3, 23, 'Vocals', '1991–', NULL, NULL),
(36, 3, 24, 'Keyboards', '1999–', NULL, NULL),
(37, 3, 25, 'Vocals', '1985–1986', NULL, NULL),
(38, 3, 26, 'Vocals', '1987–1989', NULL, NULL),
(39, 3, 27, 'Keyboards', '1986–1994', NULL, NULL),
(40, 3, 28, 'Keyboards', '1995–1999', NULL, NULL),
(41, 3, 29, 'Drums', '2011–2023', NULL, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `instruments`
--

CREATE TABLE `instruments` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `instruments`
--

INSERT INTO `instruments` (`id`, `name`) VALUES
(3, 'Bass'),
(4, 'Drums'),
(2, 'Guitar'),
(5, 'Keyboards'),
(1, 'Vocals');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tracks`
--

CREATE TABLE `tracks` (
  `id` int(11) NOT NULL,
  `album_id` int(11) NOT NULL,
  `track_number` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `duration_seconds` int(11) DEFAULT NULL,
  `total_streams` bigint(20) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `tracks`
--

INSERT INTO `tracks` (`id`, `album_id`, `track_number`, `title`, `duration_seconds`, `total_streams`) VALUES
(1, 1, 1, 'Behind Space', 294, 12000000),
(2, 1, 2, 'Lunar Strain', 245, 2200000),
(3, 1, 3, 'Starforsaken', 189, 1800000),
(4, 1, 4, 'Dreamscape', 225, 1600000),
(5, 1, 5, 'Everlost (Part I)', 256, 2000000),
(6, 1, 6, 'Everlost (Part II)', 177, 1900000),
(7, 1, 7, 'Hårgalåten', 146, 12000000),
(8, 1, 8, 'In Flames', 333, 1700000),
(9, 1, 9, 'Upon an Oaken Throne', 169, 1400000),
(10, 1, 10, 'Clad in Shadows', 169, 12000000),
(11, 2, 1, 'Moonshield', 298, 30000000),
(12, 2, 2, 'The Jester\'s Dance', 129, 27000000),
(13, 2, 3, 'Artifacts of the Black Rain', 197, 25000000),
(14, 2, 4, 'Graveland', 166, 23000000),
(15, 2, 5, 'Lord Hypnos', 241, 22000000),
(16, 2, 6, 'Dead Eternity', 301, 21000000),
(17, 2, 7, 'The Jester Race', 291, 20000000),
(18, 2, 8, 'December Flower', 250, 15000000),
(19, 2, 9, 'Wayfaerer', 281, 17000000),
(20, 2, 10, 'Dead God in Me', 255, 16000000),
(21, 3, 1, 'Jotun', 234, 28000000),
(22, 3, 2, 'Food for the Gods', 261, 25000000),
(23, 3, 3, 'Gyroscope', 206, 23000000),
(24, 3, 4, 'Dialogue with the Stars', 181, 21000000),
(25, 3, 5, 'The Hive', 243, 20000000),
(26, 3, 6, 'Jester Script Transfigured', 346, 19000000),
(27, 3, 7, 'Morphing into Primal', 185, 17000000),
(28, 3, 8, 'Worlds Within the Margin', 306, 16000000),
(29, 3, 9, 'Episode 666', 225, 15000000),
(30, 3, 10, 'Everything Counts', 197, 14000000),
(31, 3, 11, 'Whoracle', 163, 13000000),
(32, 4, 1, 'Embody the Invisible', 217, 42000000),
(33, 4, 2, 'Ordinary Story', 256, 39000000),
(34, 4, 3, 'Scorn', 218, 37000000),
(35, 4, 4, 'Colony', 279, 35000000),
(36, 4, 5, 'Zombie Inc.', 305, 33000000),
(37, 4, 6, 'Pallar Anders Visa', 101, 28000000),
(38, 4, 7, 'Coerced Coexistence', 254, 26000000),
(39, 4, 8, 'Resin', 201, 24000000),
(40, 4, 9, 'Behind Space \'99', 238, 22000000),
(41, 4, 10, 'Insipid 2000', 225, 8000000),
(42, 4, 11, 'The New Word', 198, 14000000),
(43, 5, 1, 'Bullet Ride', 282, 45000000),
(44, 5, 2, 'Pinball Map', 248, 38000000),
(45, 5, 3, 'Only for the Weak', 295, 32000000),
(46, 5, 4, '...As the Future Repeats Today', 207, 21000000),
(47, 5, 5, 'Square Nothing', 237, 19000000),
(48, 5, 6, 'Clayman', 208, 17000000),
(49, 5, 7, 'Satellites and Astronauts', 300, 18000000),
(50, 5, 8, 'Brush the Dust Away', 197, 16000000),
(51, 5, 9, 'Swim', 194, 15000000),
(52, 5, 10, 'Suburban Me', 215, 14000000),
(53, 5, 11, 'Another Day in Quicksand', 216, 12000000),
(54, 6, 1, 'Reroute to Remain', 233, 15000000),
(55, 6, 2, 'System', 219, 9000000),
(56, 6, 3, 'Drifter', 190, 8000000),
(57, 6, 4, 'Trigger', 298, 18000000),
(58, 6, 5, 'Cloud Connected', 220, 24000000),
(59, 6, 6, 'Transparent', 243, 7000000),
(60, 6, 7, 'Dawn of a New Day', 220, 6000000),
(61, 6, 8, 'Egonomic', 156, 14000000),
(62, 6, 9, 'Minus', 225, 7000000),
(63, 6, 10, 'Dismiss the Cynics', 218, 8000000),
(64, 6, 11, 'Free Fall', 238, 7000000),
(65, 6, 12, 'Dark Signs', 200, 6000000),
(66, 6, 13, 'Metaphor', 219, 9000000),
(67, 6, 14, 'Black & White', 213, 7000000),
(68, 7, 1, 'F(r)iend', 207, 42000000),
(69, 7, 2, 'The Quiet Place', 225, 39000000),
(70, 7, 3, 'Dead Alone', 222, 37000000),
(71, 7, 4, 'Touch of Red', 252, 35000000),
(72, 7, 5, 'Like You Better Dead', 202, 33000000),
(73, 7, 6, 'My Sweet Shadow', 278, 31000000),
(74, 7, 7, 'Evil in a Closet', 242, 29000000),
(75, 7, 8, 'In Search for I', 202, 27000000),
(76, 7, 9, 'Borders and Shading', 261, 25000000),
(77, 7, 10, 'Superhero of the Computer Rage', 240, 23000000),
(78, 7, 11, 'Dial 595-Escape', 228, 21000000),
(79, 7, 12, 'Bottled', 256, 19000000),
(80, 7, 13, 'Discover Me Like Emptiness', 338, 10000000),
(81, 8, 1, 'Take This Life', 215, 52000000),
(82, 8, 2, 'Leeches', 175, 48000000),
(83, 8, 3, 'Reflect the Storm', 256, 46000000),
(84, 8, 4, 'Dead End', 202, 44000000),
(85, 8, 5, 'Scream', 192, 42000000),
(86, 8, 6, 'Come Clarity', 255, 40000000),
(87, 8, 7, 'Vacuum', 219, 38000000),
(88, 8, 8, 'Pacing Death\'s Trail', 180, 36000000),
(89, 8, 9, 'Crawl Through Knives', 242, 34000000),
(90, 8, 10, 'Versus Terminus', 199, 32000000),
(91, 8, 11, 'Our Infinite Struggle', 226, 30000000),
(92, 8, 12, 'Vanishing Light', 194, 28000000),
(93, 8, 13, 'Your Bedtime Story Is Scaring Everyone', 319, 26000000),
(94, 9, 1, 'The Mirror\'s Truth', 181, 49000000),
(95, 9, 2, 'Disconnected', 218, 47000000),
(96, 9, 3, 'Sleepless Again', 251, 45000000),
(97, 9, 4, 'Alias', 291, 43000000),
(98, 9, 5, 'I\'m the Highway', 223, 9000000),
(99, 9, 6, 'Delight and Angers', 220, 39000000),
(100, 9, 7, 'Move Through Me', 187, 37000000),
(101, 9, 8, 'The Chosen Pessimist', 495, 35000000),
(102, 9, 9, 'Sober and Irrelevant', 204, 33000000),
(103, 9, 10, 'Condemned', 216, 31000000),
(104, 9, 11, 'Drenched in Fear', 211, 11000000),
(105, 9, 12, 'March to the Shore', 209, 18000000),
(106, 10, 1, 'Sounds of a Playground Fading', 282, 9000000),
(107, 10, 2, 'Deliver Us', 211, 18000000),
(108, 10, 3, 'All for Me', 272, 6000000),
(109, 10, 4, 'The Puzzle', 275, 6000000),
(110, 10, 5, 'Fear Is the Weakness', 243, 7000000),
(111, 10, 6, 'Where the Dead Ships Dwell', 268, 15000000),
(112, 10, 7, 'The Attic', 196, 5000000),
(113, 10, 8, 'Darker Times', 205, 5000000),
(114, 10, 9, 'Ropes', 223, 7000000),
(115, 10, 10, 'Enter Tragedy', 239, 5000000),
(116, 10, 11, 'Jester\'s Door', 157, 4000000),
(117, 10, 12, 'A New Dawn', 353, 6000000),
(118, 10, 13, 'Liberation', 312, 8000000),
(119, 11, 1, 'In Plain View', 245, 42000000),
(120, 11, 2, 'Everything\'s Gone', 204, 40000000),
(121, 11, 3, 'Paralyzed', 256, 38000000),
(122, 11, 4, 'Through Oblivion', 218, 36000000),
(123, 11, 5, 'With Eyes Wide Open', 239, 34000000),
(124, 11, 6, 'Siren Charms', 185, 32000000),
(125, 11, 7, 'When the World Explodes', 279, 30000000),
(126, 11, 8, 'Rusted Nail', 295, 28000000),
(127, 11, 9, 'Dead Eyes', 324, 26000000),
(128, 11, 10, 'Monsters in the Ballroom', 233, 24000000),
(129, 11, 11, 'Filtered Truth', 212, 22000000),
(130, 12, 1, 'Drained', 246, 6000000),
(131, 12, 2, 'The End', 238, 9000000),
(132, 12, 3, 'Like Sand', 223, 6000000),
(133, 12, 4, 'The Truth', 184, 16000000),
(134, 12, 5, 'In My Room', 205, 5000000),
(135, 12, 6, 'Before I Fall', 207, 6000000),
(136, 12, 7, 'Through My Eyes', 230, 5000000),
(137, 12, 8, 'Battles', 178, 7000000),
(138, 12, 9, 'Here Until Forever', 259, 6000000),
(139, 12, 10, 'Underneath My Skin', 210, 5000000),
(140, 12, 11, 'Wallflower', 426, 8000000),
(141, 12, 12, 'Save Me', 252, 7000000),
(142, 13, 1, 'Voices', 287, 56000000),
(143, 13, 2, 'I, the Mask', 221, 54000000),
(144, 13, 3, 'Call My Name', 213, 52000000),
(145, 13, 4, 'I Am Above', 229, 50000000),
(146, 13, 5, 'Follow Me', 295, 48000000),
(147, 13, 6, '(This Is Our) House', 258, 46000000),
(148, 13, 7, 'We Will Remember', 244, 44000000),
(149, 13, 8, 'In This Life', 232, 42000000),
(150, 13, 9, 'Burn', 223, 40000000),
(151, 13, 10, 'Deep Inside', 261, 38000000),
(152, 13, 11, 'All the Pain', 269, 36000000),
(153, 13, 12, 'Stay with Me', 316, 34000000),
(154, 14, 1, 'The Beginning of All Things That Will End', 134, 60000000),
(155, 14, 2, 'State of Slow Decay', 239, 58000000),
(156, 14, 3, 'Meet Your Maker', 238, 56000000),
(157, 14, 4, 'Bleeding Out', 242, 54000000),
(158, 14, 5, 'Foregone Pt. 1', 205, 52000000),
(159, 14, 6, 'Foregone Pt. 2', 271, 50000000),
(160, 14, 7, 'Pure Light of Mind', 267, 48000000),
(161, 14, 8, 'The Great Deceiver', 226, 46000000),
(162, 14, 9, 'In the Dark', 258, 44000000),
(163, 14, 10, 'A Dialogue in B Flat Minor', 269, 42000000),
(164, 14, 11, 'Cynosure', 246, 40000000),
(165, 14, 12, 'End the Transmission', 223, 38000000),
(168, 16, 1, 'A Fortune in Lies', NULL, 0),
(169, 16, 2, 'Status Seeker', NULL, 0),
(170, 16, 3, 'The Ytse Jam', NULL, 0),
(171, 16, 4, 'The Killing Hand', NULL, 0),
(172, 16, 5, 'Light Fuse and Get Away', NULL, 0),
(173, 16, 6, 'Afterlife', NULL, 0),
(174, 16, 7, 'The Ones Who Help to Set the Sun', NULL, 0),
(175, 16, 8, 'Only a Matter of Time', NULL, 0),
(176, 17, 1, 'Pull Me Under', NULL, 0),
(177, 17, 2, 'Another Day', NULL, 0),
(178, 17, 3, 'Take the Time', NULL, 0),
(179, 17, 4, 'Surrounded', NULL, 0),
(180, 17, 5, 'Metropolis—Part I: The Miracle and the Sleeper', NULL, 0),
(181, 17, 6, 'Under a Glass Moon', NULL, 0),
(182, 17, 7, 'Wait for Sleep', NULL, 0),
(183, 17, 8, 'Learning to Live', NULL, 0),
(184, 18, 1, '6:00', NULL, 0),
(185, 18, 2, 'Caught in a Web', NULL, 0),
(186, 18, 3, 'Innocence Faded', NULL, 0),
(187, 18, 4, 'A Mind Beside Itself: I. Erotomania', NULL, 0),
(188, 18, 5, 'A Mind Beside Itself: II. Voices', NULL, 0),
(189, 18, 6, 'A Mind Beside Itself: III. The Silent Man', NULL, 0),
(190, 18, 7, 'The Mirror', NULL, 0),
(191, 18, 8, 'Lie', NULL, 0),
(192, 18, 9, 'Lifting Shadows Off a Dream', NULL, 0),
(193, 18, 10, 'Scarred', NULL, 0),
(194, 18, 11, 'Space-Dye Vest', NULL, 0),
(195, 19, 1, 'New Millennium', NULL, 0),
(196, 19, 2, 'You Not Me', NULL, 0),
(197, 19, 3, 'Peruvian Skies', NULL, 0),
(198, 19, 4, 'Hollow Years', NULL, 0),
(199, 19, 5, 'Burning My Soul', NULL, 0),
(200, 19, 6, 'Hell’s Kitchen', NULL, 0),
(201, 19, 7, 'Lines in the Sand', NULL, 0),
(202, 19, 8, 'Take Away My Pain', NULL, 0),
(203, 19, 9, 'Just Let Me Breathe', NULL, 0),
(204, 19, 10, 'Anna Lee', NULL, 0),
(205, 19, 11, 'Trial of Tears', NULL, 0),
(206, 20, 1, 'Regression', NULL, 0),
(207, 20, 2, 'Overture 1928', NULL, 0),
(208, 20, 3, 'Strange Déjà Vu', NULL, 0),
(209, 20, 4, 'Through My Words', NULL, 0),
(210, 20, 5, 'Fatal Tragedy', NULL, 0),
(211, 20, 6, 'Beyond This Life', NULL, 0),
(212, 20, 7, 'Through Her Eyes', NULL, 0),
(213, 20, 8, 'Home', NULL, 0),
(214, 20, 9, 'The Dance of Eternity', NULL, 0),
(215, 20, 10, 'One Last Time', NULL, 0),
(216, 20, 11, 'The Spirit Carries On', NULL, 0),
(217, 20, 12, 'Finally Free', NULL, 0),
(218, 21, 1, 'The Glass Prison', NULL, 0),
(219, 21, 2, 'Blind Faith', NULL, 0),
(220, 21, 3, 'Misunderstood', NULL, 0),
(221, 21, 4, 'The Great Debate', NULL, 0),
(222, 21, 5, 'Disappear', NULL, 0),
(223, 21, 6, 'Six Degrees of Inner Turbulence: I. Overture', NULL, 0),
(224, 21, 7, 'Six Degrees of Inner Turbulence: II. About to Crash', NULL, 0),
(225, 21, 8, 'Six Degrees of Inner Turbulence: III. War Inside My Head', NULL, 0),
(226, 21, 9, 'Six Degrees of Inner Turbulence: IV. The Test That Stumped Them All', NULL, 0),
(227, 21, 10, 'Six Degrees of Inner Turbulence: V. Goodnight Kiss', NULL, 0),
(228, 21, 11, 'Six Degrees of Inner Turbulence: VI. Solitary Shell', NULL, 0),
(229, 21, 12, 'Six Degrees of Inner Turbulence: VII. About to Crash (Reprise)', NULL, 0),
(230, 21, 13, 'Six Degrees of Inner Turbulence: VIII. Losing Time/Grand Finale', NULL, 0),
(231, 22, 1, 'As I Am', NULL, 0),
(232, 22, 2, 'This Dying Soul', NULL, 0),
(233, 22, 3, 'Endless Sacrifice', NULL, 0),
(234, 22, 4, 'Honor Thy Father', NULL, 0),
(235, 22, 5, 'Vacant', NULL, 0),
(236, 22, 6, 'Stream of Consciousness', NULL, 0),
(237, 22, 7, 'In the Name of God', NULL, 0),
(238, 23, 1, 'The Root of All Evil', NULL, 0),
(239, 23, 2, 'The Answer Lies Within', NULL, 0),
(240, 23, 3, 'These Walls', NULL, 0),
(241, 23, 4, 'I Walk Beside You', NULL, 0),
(242, 23, 5, 'Panic Attack', NULL, 0),
(243, 23, 6, 'Never Enough', NULL, 0),
(244, 23, 7, 'Sacrificed Sons', NULL, 0),
(245, 23, 8, 'Octavarium', NULL, 0),
(246, 24, 1, 'In the Presence of Enemies – Part I', NULL, 0),
(247, 24, 2, 'Forsaken', NULL, 0),
(248, 24, 3, 'Constant Motion', NULL, 0),
(249, 24, 4, 'The Dark Eternal Night', NULL, 0),
(250, 24, 5, 'Repentance', NULL, 0),
(251, 24, 6, 'Prophets of War', NULL, 0),
(252, 24, 7, 'The Ministry of Lost Souls', NULL, 0),
(253, 24, 8, 'In the Presence of Enemies – Part II', NULL, 0),
(254, 25, 1, 'A Nightmare to Remember', NULL, 0),
(255, 25, 2, 'A Rite of Passage', NULL, 0),
(256, 25, 3, 'Wither', NULL, 0),
(257, 25, 4, 'The Shattered Fortress', NULL, 0),
(258, 25, 5, 'The Best of Times', NULL, 0),
(259, 25, 6, 'The Count of Tuscany', NULL, 0),
(260, 26, 1, 'On the Backs of Angels', NULL, 0),
(261, 26, 2, 'Build Me Up, Break Me Down', NULL, 0),
(262, 26, 3, 'Lost Not Forgotten', NULL, 0),
(263, 26, 4, 'This Is the Life', NULL, 0),
(264, 26, 5, 'Bridges in the Sky', NULL, 0),
(265, 26, 6, 'Outcry', NULL, 0),
(266, 26, 7, 'Far from Heaven', NULL, 0),
(267, 26, 8, 'Breaking All Illusions', NULL, 0),
(268, 26, 9, 'Beneath the Surface', NULL, 0),
(269, 27, 1, 'False Awakening Suite', NULL, 0),
(270, 27, 2, 'The Enemy Inside', NULL, 0),
(271, 27, 3, 'The Looking Glass', NULL, 0),
(272, 27, 4, 'Enigma Machine', NULL, 0),
(273, 27, 5, 'The Bigger Picture', NULL, 0),
(274, 27, 6, 'Behind the Veil', NULL, 0),
(275, 27, 7, 'Surrender to Reason', NULL, 0),
(276, 27, 8, 'Along for the Ride', NULL, 0),
(277, 27, 9, 'Illumination Theory', NULL, 0),
(278, 28, 1, 'Descent of the NOMACS', NULL, 0),
(279, 28, 2, 'Dystopian Overture', NULL, 0),
(280, 28, 3, 'The Gift of Music', NULL, 0),
(281, 28, 4, 'The Answer', NULL, 0),
(282, 28, 5, 'A Better Life', NULL, 0),
(283, 28, 6, 'Lord Nafaryus', NULL, 0),
(284, 28, 7, 'A Savior in the Square', NULL, 0),
(285, 28, 8, 'When Your Time Has Come', NULL, 0),
(286, 28, 9, 'Act of Faythe', NULL, 0),
(287, 28, 10, 'A Life Left Behind', NULL, 0),
(288, 28, 11, 'Ravenskill', NULL, 0),
(289, 28, 12, 'Chosen', NULL, 0),
(290, 28, 13, 'A Tempting Offer', NULL, 0),
(291, 28, 14, 'Digital Discord', NULL, 0),
(292, 28, 15, 'The Road to Revolution', NULL, 0),
(293, 28, 16, '2285 Entr’acte', NULL, 0),
(294, 28, 17, 'Moment of Betrayal', NULL, 0),
(295, 28, 18, 'Heaven’s Cove', NULL, 0),
(296, 28, 19, 'Begin Again', NULL, 0),
(297, 28, 20, 'The Path That Divides', NULL, 0),
(298, 28, 21, 'Machine Chatter', NULL, 0),
(299, 28, 22, 'The Walking Shadow', NULL, 0),
(300, 28, 23, 'My Last Farewell', NULL, 0),
(301, 28, 24, 'Losing Faythe', NULL, 0),
(302, 28, 25, 'Whispers on the Wind', NULL, 0),
(303, 28, 26, 'Hymn of a Thousand Voices', NULL, 0),
(304, 28, 27, 'Our New World', NULL, 0),
(305, 28, 28, 'Power Down', NULL, 0),
(306, 28, 29, 'Astonishing', NULL, 0),
(307, 29, 1, 'Untethered Angel', NULL, 0),
(308, 29, 2, 'Paralyzed', NULL, 0),
(309, 29, 3, 'Fall Into the Light', NULL, 0),
(310, 29, 4, 'Barstool Warrior', NULL, 0),
(311, 29, 5, 'Room 137', NULL, 0),
(312, 29, 6, 'S2N', NULL, 0),
(313, 29, 7, 'At Wit’s End', NULL, 0),
(314, 29, 8, 'Out of Reach', NULL, 0),
(315, 29, 9, 'Pale Blue Dot', NULL, 0),
(316, 30, 1, 'The Alien', NULL, 0),
(317, 30, 2, 'Answering the Call', NULL, 0),
(318, 30, 3, 'Invisible Monster', NULL, 0),
(319, 30, 4, 'Sleeping Giant', NULL, 0),
(320, 30, 5, 'Transcending Time', NULL, 0),
(321, 30, 6, 'Awaken the Master', NULL, 0),
(322, 30, 7, 'A View from the Top of the World', NULL, 0),
(323, 31, 1, 'Parasomnia', NULL, 0),
(324, 31, 2, 'The Unconscious Realm', NULL, 0),
(325, 31, 3, 'Shadows in Sleep', NULL, 0),
(326, 31, 4, 'Lucid Dreamscape', NULL, 0),
(327, 31, 5, 'Nightmare Within', NULL, 0),
(328, 31, 6, 'Awakening', NULL, 0);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_band_album` (`band_id`,`title`);

--
-- A tábla indexei `artists`
--
ALTER TABLE `artists`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `artist_instruments`
--
ALTER TABLE `artist_instruments`
  ADD PRIMARY KEY (`artist_id`,`instrument_id`),
  ADD KEY `instrument_id` (`instrument_id`);

--
-- A tábla indexei `bands`
--
ALTER TABLE `bands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- A tábla indexei `band_memberships`
--
ALTER TABLE `band_memberships`
  ADD PRIMARY KEY (`id`),
  ADD KEY `band_id` (`band_id`),
  ADD KEY `artist_id` (`artist_id`);

--
-- A tábla indexei `instruments`
--
ALTER TABLE `instruments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- A tábla indexei `tracks`
--
ALTER TABLE `tracks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_album_track` (`album_id`,`track_number`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `albums`
--
ALTER TABLE `albums`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT a táblához `artists`
--
ALTER TABLE `artists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT a táblához `bands`
--
ALTER TABLE `bands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `band_memberships`
--
ALTER TABLE `band_memberships`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT a táblához `instruments`
--
ALTER TABLE `instruments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `tracks`
--
ALTER TABLE `tracks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=329;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `albums`
--
ALTER TABLE `albums`
  ADD CONSTRAINT `albums_ibfk_1` FOREIGN KEY (`band_id`) REFERENCES `bands` (`id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `artist_instruments`
--
ALTER TABLE `artist_instruments`
  ADD CONSTRAINT `artist_instruments_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `artist_instruments_ibfk_2` FOREIGN KEY (`instrument_id`) REFERENCES `instruments` (`id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `band_memberships`
--
ALTER TABLE `band_memberships`
  ADD CONSTRAINT `band_memberships_ibfk_1` FOREIGN KEY (`band_id`) REFERENCES `bands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `band_memberships_ibfk_2` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `tracks`
--
ALTER TABLE `tracks`
  ADD CONSTRAINT `tracks_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
