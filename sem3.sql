-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Окт 24 2022 г., 17:05
-- Версия сервера: 5.7.24
-- Версия PHP: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `sem3`
--

-- --------------------------------------------------------

--
-- Структура таблицы `audience_place`
--

CREATE TABLE `audience_place` (
  `id_place` int(10) UNSIGNED NOT NULL,
  `id_distribution` int(10) NOT NULL,
  `id_student` int(10) NOT NULL,
  `row` int(3) NOT NULL,
  `tables` int(3) NOT NULL,
  `place` int(3) NOT NULL,
  `options` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `audience_place`
--

INSERT INTO `audience_place` (`id_place`, `id_distribution`, `id_student`, `row`, `tables`, `place`, `options`) VALUES
(1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `auditorium`
--

CREATE TABLE `auditorium` (
  `id_audit` int(10) UNSIGNED NOT NULL,
  `audit_№` int(3) NOT NULL,
  `number_of_seats` int(3) NOT NULL,
  `rows` int(3) NOT NULL,
  `part` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `auditorium`
--

INSERT INTO `auditorium` (`id_audit`, `audit_№`, `number_of_seats`, `rows`, `part`) VALUES
(1, 301, 30, 3, 15),
(2, 302, 30, 3, 15),
(3, 303, 30, 3, 15),
(4, 304, 30, 3, 15);

-- --------------------------------------------------------

--
-- Структура таблицы `country_codes`
--

CREATE TABLE `country_codes` (
  `id_country` int(10) UNSIGNED NOT NULL,
  `code_country` varchar(5) NOT NULL,
  `country` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `country_codes`
--

INSERT INTO `country_codes` (`id_country`, `code_country`, `country`) VALUES
(1, '+7', 'Россия');

-- --------------------------------------------------------

--
-- Структура таблицы `distribution_by_audience`
--

CREATE TABLE `distribution_by_audience` (
  `id_distribution` int(10) UNSIGNED NOT NULL,
  `id_audit` int(10) NOT NULL,
  `id_event` int(3) NOT NULL,
  `theme_event` varchar(250) NOT NULL,
  `beginning_event` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end_event` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `distribution_by_audience`
--

INSERT INTO `distribution_by_audience` (`id_distribution`, `id_audit`, `id_event`, `theme_event`, `beginning_event`, `end_event`) VALUES
(1, 1, 1, 'Основы программирования', '2022-10-24 15:00:00', '2022-10-24 17:00:00'),
(2, 2, 2, 'Верстка HTML', '2022-10-26 15:00:00', '2022-10-26 17:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `groups`
--

CREATE TABLE `groups` (
  `id_group` int(10) UNSIGNED NOT NULL,
  `specialization` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `groups`
--

INSERT INTO `groups` (`id_group`, `specialization`) VALUES
(1, 'Программист'),
(2, 'Тестировщик'),
(3, 'Проджект');

-- --------------------------------------------------------

--
-- Структура таблицы `localities`
--

CREATE TABLE `localities` (
  `id_localities` int(10) UNSIGNED NOT NULL,
  `localities` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `localities`
--

INSERT INTO `localities` (`id_localities`, `localities`) VALUES
(1, 'Москва'),
(2, 'Санкт-Петербург');

-- --------------------------------------------------------

--
-- Структура таблицы `materials`
--

CREATE TABLE `materials` (
  `id_materials` int(10) UNSIGNED NOT NULL,
  `id_distribution` int(10) NOT NULL,
  `id_tip_materials` int(3) NOT NULL,
  `description` text NOT NULL,
  `link` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `materials`
--

INSERT INTO `materials` (`id_materials`, `id_distribution`, `id_tip_materials`, `description`, `link`) VALUES
(1, 1, 1, 'Основы\r\nпрограммирования', 'https://gb.ru/courses/754?ysclid=l9mzljdplx402152621');

-- --------------------------------------------------------

--
-- Структура таблицы `students`
--

CREATE TABLE `students` (
  `id_student` int(10) UNSIGNED NOT NULL,
  `id_group` int(2) NOT NULL,
  `date_enrollment` date NOT NULL,
  `fio` varchar(100) NOT NULL,
  `country_code` int(5) NOT NULL,
  `telephone` int(10) NOT NULL,
  `city` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `students`
--

INSERT INTO `students` (`id_student`, `id_group`, `date_enrollment`, `fio`, `country_code`, `telephone`, `city`) VALUES
(1, 1, '2020-08-20', 'Иванов Иван Иванович', 0, 0, 0),
(2, 2, '2020-08-20', 'Петров Петр Петрович', 0, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `tasks`
--

CREATE TABLE `tasks` (
  `id_tasks` int(10) UNSIGNED NOT NULL,
  `id_distribution` int(10) NOT NULL,
  `id_task_type` int(3) NOT NULL,
  `task_description` varchar(250) NOT NULL,
  `time_complete_task` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tasks`
--

INSERT INTO `tasks` (`id_tasks`, `id_distribution`, `id_task_type`, `task_description`, `time_complete_task`) VALUES
(1, 1, 1, 'Задание 1', 15),
(2, 1, 1, 'Задание 2', 5),
(3, 1, 2, 'Задание 3', 30);

-- --------------------------------------------------------

--
-- Структура таблицы `task type`
--

CREATE TABLE `task type` (
  `id_task_type` int(3) UNSIGNED NOT NULL,
  `name_task_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `task type`
--

INSERT INTO `task type` (`id_task_type`, `name_task_type`) VALUES
(1, 'Тестовое'),
(2, 'Дополнительное');

-- --------------------------------------------------------

--
-- Структура таблицы `type_of_event`
--

CREATE TABLE `type_of_event` (
  `id_event` int(10) UNSIGNED NOT NULL,
  `event_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `type_of_event`
--

INSERT INTO `type_of_event` (`id_event`, `event_name`) VALUES
(1, 'Лекция'),
(2, 'Семинар'),
(3, 'Практика'),
(4, 'Конференция'),
(5, 'Хакатоны');

-- --------------------------------------------------------

--
-- Структура таблицы `type_of_material`
--

CREATE TABLE `type_of_material` (
  `id_tip_materials` int(10) UNSIGNED NOT NULL,
  `name_materials` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `type_of_material`
--

INSERT INTO `type_of_material` (`id_tip_materials`, `name_materials`) VALUES
(1, 'Электронная книга'),
(2, 'Аудио файл'),
(3, 'Видео файл');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `audience_place`
--
ALTER TABLE `audience_place`
  ADD PRIMARY KEY (`id_place`);

--
-- Индексы таблицы `auditorium`
--
ALTER TABLE `auditorium`
  ADD UNIQUE KEY `id_audit` (`id_audit`);

--
-- Индексы таблицы `country_codes`
--
ALTER TABLE `country_codes`
  ADD UNIQUE KEY `id_country` (`id_country`);

--
-- Индексы таблицы `distribution_by_audience`
--
ALTER TABLE `distribution_by_audience`
  ADD UNIQUE KEY `id_distribution` (`id_distribution`);

--
-- Индексы таблицы `groups`
--
ALTER TABLE `groups`
  ADD UNIQUE KEY `id_group` (`id_group`);

--
-- Индексы таблицы `localities`
--
ALTER TABLE `localities`
  ADD UNIQUE KEY `id_localities` (`id_localities`);

--
-- Индексы таблицы `materials`
--
ALTER TABLE `materials`
  ADD UNIQUE KEY `id_materials` (`id_materials`);

--
-- Индексы таблицы `students`
--
ALTER TABLE `students`
  ADD UNIQUE KEY `id_student` (`id_student`);

--
-- Индексы таблицы `tasks`
--
ALTER TABLE `tasks`
  ADD UNIQUE KEY `id_tasks` (`id_tasks`);

--
-- Индексы таблицы `task type`
--
ALTER TABLE `task type`
  ADD UNIQUE KEY `id_task_type` (`id_task_type`);

--
-- Индексы таблицы `type_of_event`
--
ALTER TABLE `type_of_event`
  ADD UNIQUE KEY `id_event` (`id_event`);

--
-- Индексы таблицы `type_of_material`
--
ALTER TABLE `type_of_material`
  ADD UNIQUE KEY `id_tip_materials` (`id_tip_materials`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `audience_place`
--
ALTER TABLE `audience_place`
  MODIFY `id_place` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `auditorium`
--
ALTER TABLE `auditorium`
  MODIFY `id_audit` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `country_codes`
--
ALTER TABLE `country_codes`
  MODIFY `id_country` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `distribution_by_audience`
--
ALTER TABLE `distribution_by_audience`
  MODIFY `id_distribution` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `groups`
--
ALTER TABLE `groups`
  MODIFY `id_group` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `localities`
--
ALTER TABLE `localities`
  MODIFY `id_localities` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `materials`
--
ALTER TABLE `materials`
  MODIFY `id_materials` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `students`
--
ALTER TABLE `students`
  MODIFY `id_student` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id_tasks` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `task type`
--
ALTER TABLE `task type`
  MODIFY `id_task_type` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `type_of_event`
--
ALTER TABLE `type_of_event`
  MODIFY `id_event` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `type_of_material`
--
ALTER TABLE `type_of_material`
  MODIFY `id_tip_materials` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
