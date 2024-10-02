-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Okt 02. 08:06
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `chatapp`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `chat`
--

CREATE TABLE `chat` (
  `id` int(11) NOT NULL,
  `content` varchar(200) NOT NULL,
  `created_at` datetime(3) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `chat`
--

INSERT INTO `chat` (`id`, `content`, `created_at`, `sender_id`, `to_id`) VALUES
(4, 'Gere vasgyok xd', '2024-09-30 12:40:05.000', 25, 1),
(5, 'Janikavagyok', '2024-09-30 12:56:39.000', 1, 25),
(7, 'Janikavagyokawdawd', '2024-09-30 13:33:31.000', 1, 25),
(8, 'Janikavagyokawdawd', '2024-09-30 13:47:53.000', 1, 25),
(9, 'Janikavagyokawdawd', '2024-09-30 13:48:57.000', 1, 25);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `birth_date` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `birth_date`, `created_at`, `updated_at`) VALUES
(1, 'Valid', 'kacsarandom', 'janipatrik138@gmail.com', '2024-09-11 12:11:35.000', '2024-09-26 12:11:35.000', '2024-09-30 12:11:35.000'),
(3, 'ag', 'ssgsg', 'drhdrh', '2024-09-06 12:42:22.000', '2024-09-12 12:42:22.000', '2024-09-20 12:42:22.000'),
(5, 'asd', 'adawga', 'sehsehs', '2024-09-06 12:42:22.000', '2024-09-12 12:42:22.000', '2024-09-20 12:42:22.000'),
(7, 'undefined', 'undefined', 'undefined', '2024-09-06 12:42:22.000', '2024-09-12 12:42:22.000', '2024-09-20 12:42:22.000'),
(24, ' aawga', ' kacsarasgsegndom', ' janipatrik138@gmail.com', '2024-09-06 12:42:22.000', '2024-09-12 12:42:22.000', '2024-09-20 12:42:22.000'),
(25, 'Gere Csanád', 'buika', 'gerecsanika@gmail.com', '2024-09-06 12:42:22.000', '2024-09-12 12:42:22.000', '2024-09-20 12:42:22.000'),
(27, 'Gere Csanádawdwa', 'buikaawdaw', 'awdawd@gmail.com', '2024-09-06 12:42:22.000', '2024-09-12 12:42:22.000', '2024-09-20 12:42:22.000'),
(28, 'Gere Csanádawdwaawdawdawdaawd', 'buikaawdawawdawddawdawd', 'awdawd@gmail.comawdawdawdawdawd', '2024-09-06 12:42:22.000', '2024-09-12 12:42:22.000', '2024-09-20 12:42:22.000'),
(29, 'Gere Csanádawdwaawdawdawdaawdwd', 'buikaawdawawdawddawdawdawd', 'awdawd@gmail.comawdawdawdawdawdawdad', '2024-09-06 12:42:22.000', '2024-09-12 12:42:22.000', '2024-09-20 12:42:22.000'),
(30, 'Gere sgs', 'seg', 'awdawd@segseg.comawdawdawdawdawdawdadsg', '2024-09-06 12:42:22.000', '2024-09-12 12:42:22.000', '2024-09-20 12:42:22.000'),
(31, 'Gere sgswdad', 'segawdawdawd', 'awdawd@segseg.comawdawdawdawdawdawdadsgawda', '2024-09-06 12:42:22.000', '2024-09-12 12:42:22.000', '2024-09-20 12:42:22.000'),
(34, 'kakadawd', 'naulgnawgagag', 'anlafn@aanowldsegsg', '2024-09-06 12:42:22.000', '2024-09-12 12:42:22.000', '0000-00-00 00:00:00.000'),
(36, 'Validadawdad', 'japsjaoeg ', 'anljwbnaflv@amiwpfna', '2024-09-06 12:42:22.000', '2024-09-12 12:42:22.000', '0000-00-00 00:00:00.000'),
(37, 'Validadawdadawda', 'japsjaoeg awd', 'anljwbnaflv@amiwpfnaawd', '2024-09-06 12:42:22.000', '2024-09-12 12:42:22.000', '2024-09-30 09:51:01.000'),
(38, 'Validadawdadawdaawdawd', 'japsjaoeg awdawdawdwd', 'anljwbnaflv@amiwpfnaawdadawdwd', '2024-09-06 12:42:22.000', '2024-09-12 12:42:22.000', '0000-00-00 00:00:00.000'),
(40, 'alma', 'japsjaoeg awdawdawdwdad', 'anljwbnaflv@amiwpfnaawdadawdwdawd', '2024-09-06 12:42:22.000', '2024-09-30 12:03:05.000', '2024-09-30 12:14:20.000'),
(41, 'Validadawdadawdaawdawdawyscc', 'japsjaoeg awdawdawdwdadysc', 'anljwbnaflv@amiwpfnaawdadawdwdawdysc', '2005-06-25 12:00:00.000', '2024-09-30 12:11:05.000', '2024-09-30 12:11:05.000'),
(42, 'Gere vasgyok ', ' anguoééasbneghls', 'abiugbésoegnéiosgnipsgnjái@', '2005-06-25 12:00:00.000', '2024-09-30 12:49:03.000', '2024-09-30 12:49:03.000'),
(43, 'valikaaa', 'almavagyok2005', 'janipatrik@gmail.com', '2005-06-25 12:00:00.000', '2024-09-30 13:02:54.000', '2024-09-30 13:03:13.000'),
(47, 'Jani Patrik Gereaaadad', 'ezajelszoawda', 'gerecsanad@gmail.comaawdad', '2005-06-25 12:00:00.000', '2024-09-30 13:46:43.000', '2024-09-30 13:46:43.000');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `_prisma_migrations`
--

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) NOT NULL,
  `checksum` varchar(64) NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) NOT NULL,
  `logs` text DEFAULT NULL,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `applied_steps_count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `_prisma_migrations`
--

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('f0163c8f-dc42-47cc-b848-23c3085677f2', '07302c5f9f7cfc16da572e3ceb07fc2817638f0646fe93528809a269ac89e0c5', '2024-09-26 09:59:53.866', '20240926095953_init', NULL, NULL, '2024-09-26 09:59:53.835', 1);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_sender_id_fkey` (`sender_id`),
  ADD KEY `chat_to_id_fkey` (`to_id`);

--
-- A tábla indexei `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_username_key` (`username`),
  ADD UNIQUE KEY `user_email_key` (`email`);

--
-- A tábla indexei `_prisma_migrations`
--
ALTER TABLE `_prisma_migrations`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT a táblához `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `chat_sender_id_fkey` FOREIGN KEY (`sender_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `chat_to_id_fkey` FOREIGN KEY (`to_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
