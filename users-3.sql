-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Янв 21 2016 г., 04:02
-- Версия сервера: 10.1.9-MariaDB
-- Версия PHP: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `users`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `staff_id` int(5) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `name`, `staff_id`) VALUES
(1, 'Графический дизайн', 1),
(2, 'Менеджмент и экономика', 1),
(3, 'Космические исследования', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `event`
--

CREATE TABLE `event` (
  `id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(9999) NOT NULL,
  `task` varchar(9999) NOT NULL,
  `group_id` int(5) NOT NULL,
  `staff_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `event`
--

INSERT INTO `event` (`id`, `name`, `date`, `description`, `task`, `group_id`, `staff_id`) VALUES
(1, 'Программирование на C++', '2015-12-29', 'Занятие по программированию на языке C++', 'Написать программу складывающую два простых числа на языке С++', 1, 1),
(35, 'Новый год', '2015-12-31', 'Праздник', 'Праздник', 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `info`
--

CREATE TABLE `info` (
  `user_login` varchar(30) NOT NULL,
  `name` varchar(100) NOT NULL,
  `family_name` varchar(30) NOT NULL,
  `middle_name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone_number` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `info`
--

INSERT INTO `info` (`user_login`, `name`, `family_name`, `middle_name`, `email`, `phone_number`) VALUES
('mashnev', 'Михаил', 'Машнев', '', 'mashn@gmail.com', '89502878412'),
('migdalskiy', 'Артур', 'Мигдальский', '', 'a.migdalskiy@gmail.com', '89502878411'),
('sushkova', 'Дарья', 'Сушкова', '', 'sush@mail.ru', '890875623482'),
('cirkunova', 'Юлия', 'Циркунова', '', 'cirk@uno.va', '89502878411'),
('makeev', 'Александр', 'Макеев', 'Григорьевич', 'mak@ee.v', '293489283498239'),
('shlandakov', 'Алексей', 'Шландаков', 'Алексеевич', 'shl@and.akov', '8950287124'),
('koltunov', 'Марк', 'Колтунов', 'Игоревич', 'mrak@mk.com', '89502996500'),
('klenina', 'Надежда', 'Кленина', 'Викторовна', 'klenina@dsf', '894859234'),
('shmorgun', 'Кирилл', 'Шморгун', 'Кириллович', 'kirill@sh.ru', '896834982342'),
('isaenkov', 'Егор', 'Исаенков', 'Егорович', 'isaenkov@egor.fefu', '893842903480923'),
('magomedov', 'Руслан', 'Магомедов', 'Магомедович', 'magomedov@dada.ru', '89523492341'),
('kharchenko', 'Екатерина ', 'Харченко', 'Владимировна', 'khar@khar.khar', '89238478121');

-- --------------------------------------------------------

--
-- Структура таблицы `marks`
--

CREATE TABLE `marks` (
  `id` int(5) NOT NULL,
  `user_id` int(5) NOT NULL,
  `event_id` int(5) NOT NULL,
  `mark` int(2) NOT NULL,
  `visited` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `marks`
--

INSERT INTO `marks` (`id`, `user_id`, `event_id`, `mark`, `visited`) VALUES
(1, 58, 1, 4, 1),
(2, 62, 1, 0, 0),
(3, 59, 1, 0, 0),
(4, 65, 1, 10, 1),
(116, 58, 35, 0, 0),
(117, 69, 35, 0, 0),
(118, 62, 35, 0, 0),
(119, 65, 35, 0, 0),
(120, 59, 35, 0, 0),
(121, 71, 35, 0, 0),
(122, 74, 35, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `staff`
--

CREATE TABLE `staff` (
  `user_id` int(5) NOT NULL,
  `user_login` varchar(30) NOT NULL,
  `user_password` varchar(32) NOT NULL,
  `name` varchar(100) NOT NULL,
  `family_name` varchar(30) NOT NULL,
  `category_id` int(5) NOT NULL,
  `user_status` tinyint(1) NOT NULL,
  `user_hash` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `staff`
--

INSERT INTO `staff` (`user_id`, `user_login`, `user_password`, `name`, `family_name`, `category_id`, `user_status`, `user_hash`) VALUES
(1, 'klenina', '7b0c03c12b8c148affc13c0e596f4971', 'Надежда Викторовна', 'Кленина', 1, 1, 'd5a553d00ac15ba679e1a5d888cb9f97');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `user_id` int(11) UNSIGNED NOT NULL,
  `user_status` tinyint(1) NOT NULL DEFAULT '0',
  `user_login` varchar(30) NOT NULL,
  `user_password` varchar(32) NOT NULL,
  `user_hash` varchar(32) NOT NULL,
  `group_id` int(11) NOT NULL,
  `user_rating` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`user_id`, `user_status`, `user_login`, `user_password`, `user_hash`, `group_id`, `user_rating`) VALUES
(58, 1, 'migdalskiy', 'bde509190e9a85f7739939d094640c81', 'dc9ae98f701f913d93499af82207b7f5', 1, 4),
(69, 0, 'shmorgun', 'b7db3998bc0721a45707bb429f5844cb', 'd55cdcd95227dfef5c8334576c01b6ed', 1, 0),
(62, 1, 'cirkunova', 'd4150827195a690efb2a09549e7b75f0', 'f4c05b7460bc7f7af64fe8dc81c81f3f', 1, 0),
(63, 1, 'makeev', '0501269ba9ae92441fe7ef878b06b3ed', '28cea459e1152f0a6d2947adfbc6dae5', 2, 0),
(64, 1, 'shlandakov', '2b3bbf42bcbf168c1011ea5bd0548dff', '', 2, 0),
(65, 1, 'koltunov', '094a74c8d2fb78838e22c7291a6610a6', '1b0098685290acc6c254722f04af3e64', 0, 10),
(70, 0, 'isaenkov', '6eb46bb625890bf8592c47de9dbcb150', 'ea5ffd087c34004f98bef51679e5db20', 2, 0),
(55, 1, 'mashnev', 'eec0f58cea9de915be2a86aca55b3451', 'a17bf38ac6af57fa1dacf7d2845575d8', 2, 0),
(59, 1, 'sushkova', '9ababa0614a0968511d8a7ed07c0c598', 'd18cefa5bd8a1ebbc9c7e3d62e428598', 1, 0),
(66, 0, 'klenina', '7b0c03c12b8c148affc13c0e596f4971', 'd4c53456ed39c0a46371b42fea80cd12', 2, 0),
(71, 0, 'magomedov', 'ab51f432f54897406eb18e2262751ea7', '', 1, 0),
(72, 0, 'kharchenko', 'e876ff7816a2e2a19d3db1dacab67c1a', '', 2, 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`staff_id`);

--
-- Индексы таблицы `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`staff_id`);

--
-- Индексы таблицы `marks`
--
ALTER TABLE `marks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `event`
--
ALTER TABLE `event`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT для таблицы `marks`
--
ALTER TABLE `marks`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;
--
-- AUTO_INCREMENT для таблицы `staff`
--
ALTER TABLE `staff`
  MODIFY `user_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
