-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Ápr 22. 18:19
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
-- Adatbázis: `szakdoga`
--
CREATE DATABASE IF NOT EXISTS `szakdoga` DEFAULT CHARACTER SET utf32 COLLATE utf32_hungarian_ci;
USE `szakdoga`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `account`
--

DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `accountID` int(11) NOT NULL COMMENT 'a felhasználó azonosítója',
  `username` varchar(255) NOT NULL COMMENT 'a felhasználónév',
  `email` varchar(255) NOT NULL COMMENT 'a felhasználó email címe',
  `pwd` varchar(255) NOT NULL COMMENT 'a felhasználó jelszava',
  `gender` varchar(255) NOT NULL COMMENT 'a felhasználó neme',
  `weight` int(11) NOT NULL COMMENT 'a felhasználó súlya',
  `height` int(11) NOT NULL COMMENT 'a felhasználó magassága',
  `role` tinyint(4) NOT NULL COMMENT 'a fehasználó szerepköre',
  `birthDate` date DEFAULT NULL COMMENT 'a felhasználó születési dátuma'
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_hungarian_ci;

--
-- A tábla adatainak kiíratása `account`
--

INSERT INTO `account` (`accountID`, `username`, `email`, `pwd`, `gender`, `weight`, `height`, `role`, `birthDate`) VALUES
(1, 'egy', 'egy@egy.hu', '$2b$10$G7t4aOUX.k8H3FRe3kcYhOE5j4086VlKOm.dRR0Um8z0.CLkgPvby', '1', 0, 0, 0, NULL),
(2, 'Admin', 'admin@admin.hu', '$2b$10$LVV8/v2jUDue52rWlbq35.6DjLn8q4Ajt4sDG5VaO6PVzSwISKSxW', '1', 80, 185, 1, '2004-09-29'),
(8, 'teszt', 'teszt@teszt.hu', '$2b$10$oACvCA3IAtfj7ObHXrj5juLhLQf5PjzAxfOMeeehW.8iE4xcgdyZG', '1', 70, 170, 0, '2024-02-16'),
(20, 'Salanki', 'salanki@gmail.com', '$2b$10$ffNh/Uce1qnNjRad0ULsa.tqcsc4n5tE0tAbAhbp3xbEQy3cR2xLK', '1', 80, 185, 0, '2004-09-29'),
(28, 'Bence', 'szbence@kutya.com', '$2b$10$Vlj9OllKRCaG8HJ.HMNoqOV8H7BKCbC3AKDgCLcMrKJwJnSZqtNQW', '1', 70, 190, 0, '2004-02-13');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `exercises`
--

DROP TABLE IF EXISTS `exercises`;
CREATE TABLE `exercises` (
  `exerciseID` int(11) NOT NULL,
  `exercise_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_hungarian_ci;

--
-- A tábla adatainak kiíratása `exercises`
--

INSERT INTO `exercises` (`exerciseID`, `exercise_name`) VALUES
(1, 'Ab Wheel(Core)'),
(2, 'Arnold Press(Shoulders)'),
(13, 'Around the World(Chest)'),
(14, 'Back Extension(Back)'),
(15, 'Ball Slams(Full body)'),
(16, 'Battle Ropes(Cardio)'),
(17, 'Bench Dip(Arms)'),
(18, 'Bench Press(Chest)'),
(19, 'Bent Over One Arm Row(Dumbbell)(Back)'),
(20, 'Bent Over Row(Back)'),
(21, 'Bicep Curl(Arms)'),
(22, 'Bicycle Crunch(Core)'),
(23, 'Box Jump(Legs)'),
(24, 'Box Squat(Legs)'),
(25, 'Bulgarian Split Squat(Legs)'),
(26, 'Burpee(Full body)'),
(27, 'Cable Crossover(Chest)'),
(28, 'Cable Crunch(Core)'),
(29, 'Cable Kickback(Arms)'),
(30, 'Cable Pull Through(Legs)'),
(31, 'Cable Twist(Core)'),
(32, 'Calf Press on Leg Press(Legs)'),
(33, 'Calf Press on Seated Leg Press(Legs)'),
(34, 'Chest Dip(Chest)'),
(35, 'Chest Fly(Chest)'),
(36, 'Chest Press(Chest)'),
(37, 'Chin Up(Back)'),
(38, 'Concentration Curl(Dumbbell)(Arms)'),
(39, 'Cross Body Crunch(Core)'),
(40, 'Crunch(Core)'),
(41, 'Cycling(Cardio)'),
(42, 'Deadlift(Legs/Back)'),
(43, 'Deadlift High Pull(Full body)'),
(44, 'Decline Bench Press(Chest)'),
(45, 'Decline Crunch(Chest)'),
(46, 'Deficit Deadlift(Legs)'),
(47, 'Elliptical Machine(Cardio)'),
(48, 'Face Pull(Shoulders)'),
(49, 'Flat Knee Raise(Core)'),
(50, 'Flat Leg Raise(Core)'),
(51, 'Front Raise(Shoulders)'),
(52, 'Front Squat(Legs)'),
(53, 'Goblet Squat(Legs)'),
(54, 'Good Morning(Barbell)(Back)'),
(55, 'Hack Squat(Legs)'),
(56, 'Hammer Curl(Arms)'),
(57, 'Handstand Pushup(Arms)'),
(58, 'Hanging Knee Raise(Core)'),
(59, 'Hanging Leg Raise(Core)'),
(60, 'High Knee Skips(Legs)'),
(61, 'Hip Abduktor(Legs)'),
(62, 'Hip Adduktor(Legs)'),
(113, 'Hip Thrust(Legs)'),
(114, 'Incline Bench Press(Chest)'),
(115, 'Incline Bench Fly(Chest)'),
(116, 'Incline Curl(Arms)'),
(117, 'Incline Row(Back)'),
(118, 'Inverted Row(Back)'),
(119, 'Iso-Lateral Chest Press(Chest)'),
(120, 'Iso-Lateral Row(Back)'),
(121, 'Jackknife Sit Up(Core)'),
(122, 'Jump Rope(Cardio)'),
(123, 'Jump Squat(Legs)'),
(124, 'Jumping Jack(Full body)'),
(125, 'Kettlebell Swing(Full body)'),
(126, 'Kettlebell Turkish Get Up(Full body)'),
(127, 'Knee Raise(Core)'),
(128, 'Kneeling Pulldown(Back)'),
(129, 'Knees to Elbows(Core)'),
(130, 'Lat Pulldown(Back)'),
(131, 'Lateral Box Jump(Legs)'),
(132, 'Lateral Raise(Shoulders)'),
(133, 'Leg Extension(Legs)'),
(134, 'Leg Press(Legs)'),
(135, 'Lunge(Legs)'),
(136, 'Lying Leg Curl(Legs)'),
(137, 'Mountain Climber(Legs)'),
(138, 'Muscle Up(Full body)'),
(139, 'Oblique Crunch(Core)'),
(140, 'Overhead Press(Shoulders)'),
(141, 'Overhead Squat(Olympic)'),
(142, 'Pec Deck(Chest)'),
(143, 'Pendlay Row(Back)'),
(144, 'Pistol Squat(Legs)'),
(145, 'Plank(Core)'),
(146, 'Power Clean(Olympic)'),
(147, 'Power Snatch(Olympic)'),
(148, 'Preacher Curl(Arms)'),
(149, 'Pull Up(Back)'),
(150, 'Pullover(Chest)'),
(151, 'Push Press(Shoulders)'),
(152, 'Push Up(Chest)'),
(153, 'Rack Pull(Back)'),
(154, 'Reverse Crunch(Core)'),
(155, 'Reverse Curl(Arms)'),
(156, 'Reverse Fly(Shoulders)'),
(157, 'Reverse Grip Concentration Curl(Arms)'),
(158, 'Reverse Plank(Core)'),
(159, 'Romanian Deadlift(Back/Legs)'),
(160, 'Rowing(Cardio)'),
(161, 'Running(Cardio)'),
(162, 'Russian Twist(Core)'),
(213, 'Seated Calf Raise(Legs)'),
(214, 'Seated Leg Curl(Legs)'),
(215, 'Seated Leg Press(Legs)'),
(216, 'Seated Overhead Press(Shoulders)'),
(217, 'Seated Palms Up Wrist Curl(Arms)'),
(218, 'Seated Row(Back)'),
(219, 'Seated Wide-Grip Row(Back)'),
(220, 'Shoulder Press(Shoulders)'),
(221, 'Shrug(Shoulders/Back)'),
(222, 'Side Bend(Core)'),
(223, 'Side Plank(Core)'),
(224, 'Single Leg Bridge(Legs)'),
(225, 'Sit Up(Core)'),
(226, 'Skullcrusher(Arms)'),
(227, 'Snatch(Olympic)'),
(228, 'Snatch Pull(Olympic)'),
(229, 'Split Jerk(Olympic)'),
(230, 'Squat(Legs)'),
(231, 'Squat Row(Full body)'),
(232, 'Standing Calf Raise(Legs)'),
(233, 'Step-Up(Legs)'),
(234, 'Stiff Leg Deadlift(Back/Legs)'),
(235, 'Straight Leg Deadlift(Legs)'),
(236, 'Stretching(Other)'),
(237, 'Strict Military Press(Shoulders)'),
(238, 'Sumo Deadlift(Back)'),
(239, 'Sumo Deadlift High Pull(Full body)'),
(240, 'Superman(Core)'),
(241, 'T Bar Row(Back)'),
(242, 'Thruster(Full body)'),
(243, 'Toes To Bar(Core)'),
(244, 'Trap Bar Deadlift(Legs)'),
(245, 'Triceps Dip(Arms)'),
(246, 'Triceps Extension(Arms)'),
(247, 'Triceps Pushdown(Arms)'),
(248, 'Upright Row(Back)'),
(249, 'V-Up(Core)'),
(250, 'Walking(Cardio)'),
(251, 'Wide Pull Up(Back)'),
(252, 'Wrist Roller(Arms)'),
(253, 'Zercher Squat(Legs)');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `measure`
--

DROP TABLE IF EXISTS `measure`;
CREATE TABLE `measure` (
  `measureID` int(11) NOT NULL COMMENT 'a mérés azonosítója',
  `accountID` int(11) NOT NULL COMMENT 'a felhasználó azonosítója',
  `weight` int(11) DEFAULT NULL COMMENT 'a méréskor megadott súly',
  `bodyFatPercentage` int(11) DEFAULT NULL COMMENT 'a méréskor kalkulált testzsír százalék',
  `caloricIntake` int(11) DEFAULT NULL COMMENT 'a napi kalóriabevitel',
  `neck` int(11) DEFAULT NULL COMMENT 'a nyak mérete',
  `shoulders` int(11) DEFAULT NULL COMMENT 'a váll mérete',
  `chest` int(11) DEFAULT NULL COMMENT 'a mellkas mérete',
  `leftBicep` int(11) DEFAULT NULL COMMENT 'a bal bicepsz mérete',
  `rightBicep` int(11) DEFAULT NULL COMMENT 'a jobb bicepsz mérete',
  `leftForeArm` int(11) DEFAULT NULL COMMENT 'a bal alkar mérete',
  `rightForeArm` int(11) DEFAULT NULL COMMENT 'a jobb alkar mérete',
  `upperAbs` int(11) DEFAULT NULL COMMENT 'a felső has kerülete',
  `waist` int(11) DEFAULT NULL COMMENT 'a derékmérete',
  `lowerAbs` int(11) DEFAULT NULL COMMENT 'alsó has kerülete',
  `hips` int(11) DEFAULT NULL COMMENT 'a csípő mérete',
  `leftThigh` int(11) DEFAULT NULL COMMENT 'a bal comb mérete',
  `rightThigh` int(11) DEFAULT NULL COMMENT 'a jobb comb mérete',
  `leftCalf` int(11) DEFAULT NULL COMMENT 'a bal vádli mérete',
  `rightCalf` int(11) DEFAULT NULL COMMENT 'a jobb vádli mérete',
  `measureDate` date NOT NULL COMMENT 'a mérés dátuma'
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_hungarian_ci;

--
-- A tábla adatainak kiíratása `measure`
--

INSERT INTO `measure` (`measureID`, `accountID`, `weight`, `bodyFatPercentage`, `caloricIntake`, `neck`, `shoulders`, `chest`, `leftBicep`, `rightBicep`, `leftForeArm`, `rightForeArm`, `upperAbs`, `waist`, `lowerAbs`, `hips`, `leftThigh`, `rightThigh`, `leftCalf`, `rightCalf`, `measureDate`) VALUES
(105, 2, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, '2024-04-16'),
(106, 20, 6, 6, 6, 6, 6, 6, 6, 66, 6, 6, 6, 66, 6, 6, 66, 6, 4, 4, '2024-04-16'),
(107, 20, 6, 6, 6, 6, 6, 6, 6, 6, 66, 6, 6, 6, 6, 66, 6, 6, 6, 5, '2024-04-16'),
(109, 2, 7, 7, 7, 7, 7, 77, 7, 7, 7, 7, 7, 7, 7, 77, 7, 7, 77, 7, '2024-04-16');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `workouts`
--

DROP TABLE IF EXISTS `workouts`;
CREATE TABLE `workouts` (
  `workoutID` int(11) NOT NULL,
  `wname` varchar(255) NOT NULL,
  `accountID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_hungarian_ci;

--
-- A tábla adatainak kiíratása `workouts`
--

INSERT INTO `workouts` (`workoutID`, `wname`, `accountID`) VALUES
(31, 'Chest', 2),
(32, 'Arms', 2),
(33, 'Legs', 2),
(34, 'Back', 2);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `w_exercises`
--

DROP TABLE IF EXISTS `w_exercises`;
CREATE TABLE `w_exercises` (
  `w_exerciseID` int(11) NOT NULL,
  `exerciseID` int(11) NOT NULL,
  `workoutID` int(11) NOT NULL,
  `sets` int(11) NOT NULL,
  `repetitions` int(11) NOT NULL,
  `weight` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_hungarian_ci;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`accountID`);

--
-- A tábla indexei `exercises`
--
ALTER TABLE `exercises`
  ADD PRIMARY KEY (`exerciseID`);

--
-- A tábla indexei `measure`
--
ALTER TABLE `measure`
  ADD PRIMARY KEY (`measureID`),
  ADD KEY `accountID` (`accountID`);

--
-- A tábla indexei `workouts`
--
ALTER TABLE `workouts`
  ADD PRIMARY KEY (`workoutID`),
  ADD KEY `accountID` (`accountID`);

--
-- A tábla indexei `w_exercises`
--
ALTER TABLE `w_exercises`
  ADD PRIMARY KEY (`w_exerciseID`),
  ADD KEY `w_exerciseID` (`exerciseID`),
  ADD KEY `workoutID` (`workoutID`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `account`
--
ALTER TABLE `account`
  MODIFY `accountID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'a felhasználó azonosítója', AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT a táblához `exercises`
--
ALTER TABLE `exercises`
  MODIFY `exerciseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=296;

--
-- AUTO_INCREMENT a táblához `measure`
--
ALTER TABLE `measure`
  MODIFY `measureID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'a mérés azonosítója', AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT a táblához `workouts`
--
ALTER TABLE `workouts`
  MODIFY `workoutID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT a táblához `w_exercises`
--
ALTER TABLE `w_exercises`
  MODIFY `w_exerciseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `measure`
--
ALTER TABLE `measure`
  ADD CONSTRAINT `measure_ibfk_1` FOREIGN KEY (`accountID`) REFERENCES `account` (`accountID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `workouts`
--
ALTER TABLE `workouts`
  ADD CONSTRAINT `workouts_ibfk_1` FOREIGN KEY (`accountID`) REFERENCES `account` (`accountID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `w_exercises`
--
ALTER TABLE `w_exercises`
  ADD CONSTRAINT `w_exercises_ibfk_1` FOREIGN KEY (`workoutID`) REFERENCES `workouts` (`workoutID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `w_exercises_ibfk_2` FOREIGN KEY (`exerciseID`) REFERENCES `exercises` (`exerciseID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
