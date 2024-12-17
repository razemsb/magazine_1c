-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Дек 17 2024 г., 14:05
-- Версия сервера: 5.7.24
-- Версия PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `magazine_1c`
--

-- --------------------------------------------------------

--
-- Структура таблицы `adds_tovar`
--

CREATE TABLE `adds_tovar` (
  `ID` int(5) NOT NULL,
  `tovar_id` int(5) NOT NULL,
  `Count` int(5) NOT NULL,
  `user_id` int(5) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `adds_tovar`
--

INSERT INTO `adds_tovar` (`ID`, `tovar_id`, `Count`, `user_id`, `date`) VALUES
(1, 1, 10, 1, '2024-11-28 15:47:58'),
(2, 11, 9, 1, '2024-12-02 11:39:05'),
(3, 11, 1, 1, '2024-12-11 05:43:47');

-- --------------------------------------------------------

--
-- Структура таблицы `admin`
--

CREATE TABLE `admin` (
  `ID` int(11) NOT NULL,
  `Login` varchar(30) NOT NULL,
  `user_id` int(3) NOT NULL,
  `admin_password` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `admin`
--

INSERT INTO `admin` (`ID`, `Login`, `user_id`, `admin_password`) VALUES
(1, 'razemsb', 1, 'roman_yeban');

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` enum('active','no_active') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `is_active`) VALUES
(1, '1С:Предприятие', 'Основные конфигурации 1С:Предприятие', '2024-11-25 19:17:15', 'active'),
(2, 'Отраслевые решения', 'Специализированные решения для различных отраслей', '2024-11-25 19:17:15', 'active'),
(3, 'Курсы и обучение', 'Обучающие материалы и курсы по 1С', '2024-11-25 19:17:15', 'active'),
(4, 'Сопровождение', 'Услуги поддержки и сопровождения', '2024-11-25 19:17:15', 'no_active'),
(5, 'Дополнительные лицензии', 'Клиентские лицензии и расширения', '2024-11-25 19:17:15', 'active'),
(6, 'CMS', 'CMS (Content Management System) — это программное обеспечение для создания, управления и публикации контента на веб-сайтах без необходимости написания кода. CMS позволяет пользователям добавлять тексты, изображения, видео и другие материалы, управлять страницами и структурой сайта через удобный интерфейс.', '2024-11-26 15:12:19', 'active');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(2) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `product_id` varchar(30) NOT NULL,
  `order_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `phone`, `email`, `product_id`, `order_date`) VALUES
(888, 1, 'Ковалев Максим Сергеевич', '79777066492', 'maxim1xxx363@gmail.com', '2', '2024-12-03 00:54:50'),
(889, 1, 'razemsb', '79777066492', 'maxim1xxx363@gmail.com', '2', '2024-12-11 02:51:52'),
(890, 1, 'Ковалев Максим Сергеевич', '79777066492', 'maxim1xxx363@gmail.com', '1', '2024-12-12 11:37:16'),
(891, 1, 'razemsb', '79777066492', 'maxim1xxx363@gmail.com', '3,1', '2024-12-15 20:02:29'),
(892, 1, 'razemsb', '79777066492', 'maxim1xxx363@gmail.com', '11', '2024-12-16 10:02:05');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `category` varchar(100) NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `license_type` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` enum('active','no_active') NOT NULL,
  `quantity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `title`, `description`, `price`, `image_path`, `category`, `version`, `license_type`, `created_at`, `is_active`, `quantity`) VALUES
(1, '1С:Бухгалтерия 8 ПРОФ', 'Профессиональная версия для ведения бухгалтерского и налогового учета', '13000.00', 'icons/1c_buh.png', '1С:Предприятие', '3.0.121', '0', '2024-11-25 19:17:15', 'active', 29),
(2, '1С:Зарплата и управление персоналом 8', 'Комплексное решение для расчета зарплаты и кадрового учета', '22600.00', 'icons/1c_zp.jpg', '1С:Предприятие', '3.1.20', '0', '2024-11-25 19:17:15', 'active', 8),
(3, '1С:Управление торговлей', 'Система автоматизации торговых операций', '22600.00', 'icons/1c_ypr.jpg', '1С:Предприятие', '11.4.10', '0', '2024-11-25 19:17:15', 'active', 11),
(4, '1С:Розница 8', 'Решение для автоматизации розничных магазинов', '13000.00', 'icons/1c_roz.jpg', 'Отраслевые решения', '2.3.12', '0', '2024-11-25 19:17:15', 'active', 12),
(5, '1С:Общепит', 'Решение для автоматизации ресторанов и кафе', '15000.00', 'icons/1c_ob.jpg', 'Отраслевые решения', '3.0.121', '0', '2024-11-25 19:17:15', 'active', 33),
(6, 'Курс 1С:Бухгалтерия с нуля', 'Базовый курс для начинающих бухгалтеров', '8000.00', 'icons/1c_buh.png', 'Курсы и обучение', '2023', '0', '2024-11-25 19:17:15', 'active', 43),
(7, 'Сопровождение 1С:ИТС ПРОФ', 'Информационно-технологическое сопровождение', '3000.00', 'icons/1c_its.png', '1С:Предприятие', '2023', '0', '2024-11-25 19:17:15', 'active', 43),
(8, 'Клиентская лицензия на 5 рабочих мест', 'Дополнительные лицензии для пользователей', '21600.00', 'icons/1c_lic.jpg', 'Дополнительные лицензии', '8.3', '0', '2024-11-25 19:17:15', 'active', 42),
(9, '1С:Документооборот', 'Система электронного документооборота', '36000.00', 'icons/1c_dok.png', 'Отраслевые решения', '2.1.25', '0', '2024-11-25 19:17:15', 'active', 5),
(10, '1С:Комплексная автоматизация', 'Комплексное решение для автоматизации предприятия', '61700.00', 'icons/1c_auto.jpg', '1С:Предприятие', '2.4.13', '0', '2024-11-25 19:17:15', 'active', 4),
(11, '1С Битрикс', '1С-Битрикс: Управление сайтом — это система управления контентом (CMS) для создания сайтов, интернет-магазинов и корпоративных порталов. Она разработана совместно компаниями «1С» и «Битрикс» и впервые представлена в 2001 году. Платформа предназначена для бизнес-проектов различного масштаба, обеспечивая широкие возможности для управления контентом, безопасностью и производительностью сайтов', '35000.00', 'icons/1c_bitrix.jpg', 'CMS', '3.3.3', '0', '2024-11-26 15:02:36', 'active', 13),
(12, '1С для гостиничного бизнеса', '1С:Гостиница — специализированное программное решение для автоматизации управления гостиничными предприятиями. Оно подходит как для небольших отелей и хостелов, так и для крупных гостиничных комплексов.', '65000.00', 'icons/1c_hotel.png', '1С:Предприятие', '3.3.6', '0', '2024-11-26 17:03:29', 'active', 53),
(13, '1С:Бухгалтерия государственного учреждения', '1С:Бухгалтерия государственного учреждения 8 — это специализированная программа для бухгалтерского учета в государственных учреждениях. Она предназначена для автоматизации бухгалтерского учета, а также для ведения отчетности и выполнения различных обязательств по налогообложению и госфинансированию.', '19400.00', 'icons/1c_buhgos.png', '1С:Предприятие', '1.3.5', '0', '2024-11-26 17:06:08', 'active', 11),
(14, '1С:Склад', '1С:Склад — специализированное решение для автоматизации складского учета и логистики, предназначенное для оптимизации процессов управления товарными запасами. Это программное обеспечение помогает предприятиям вести точный учет движения товаров и контролировать складские операции на всех уровнях.', '6000.00', 'icons/1c_sklad.jpeg', '1С:Предприятие', '9.9.0', 'ПРОФ', '2024-11-26 17:11:16', 'active', 40);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `Login` varchar(20) NOT NULL,
  `Password` varchar(70) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `avatar` varchar(80) NOT NULL,
  `is_admin` tinyint(4) NOT NULL,
  `is_active` enum('active','no_active') NOT NULL,
  `date_reg` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`ID`, `Login`, `Password`, `Email`, `avatar`, `is_admin`, `is_active`, `date_reg`) VALUES
(1, 'razemsb', '$2y$10$3ifsrdiGL3RnbvH/KzpOPOQkeB6JEBhw7Q4RUzkw/JRvRjfXyC/X6', 'maxim1xxx363@gmail.com', 'Hero451-icon.jpg', 1, 'active', '2024-10-15 22:10:12'),
(2, 'zhaba mydak', '$2y$10$8QDbNERWkycA2OQHFKGewOvRGi5diDhmagCe4cmZ1n/KjSqqNPjYy', 'maxim1xxx363@gmail.com', 'basic_avatar.webp', 0, 'active', '2024-12-16 10:09:09'),
(3, 'qwopiguvk', '$2y$10$vnvTeO6Z86AFeUbWu4XRzu7PrISwZA9pq7wrSjMcU9LtuiGQtijyW', 'maxim1xxx363@gmail.com', 'basic_avatar.webp', 0, 'active', '2024-12-16 10:09:06'),
(4, 'raze', '$2y$10$7me/UE/gah0y.mJN6lFxC.AN3oiYxPXzyeMg8Gz2ukXpog9aSxzXe', 'maxim1xxx363@gmail.com', 'basic_avatar.webp', 0, 'active', '2024-12-16 10:09:11'),
(5, '67raze5675765', '$2y$10$gCgvsu1ZpLFZ4NF5cF6dwue7Mj5WPAHTjUAH0dxVR/PNAuIcdoyia', 'maxim1xxx363@gmail.com', 'basic_avatar.webp', 0, 'active', '2024-12-15 22:15:53'),
(6, 'raze09-9-090', '$2y$10$lyP1/4.dyR3WOtjhGXFvMuDAAVr929MKdo5zqOragLTsTaYTgO3DK', 'ADMIN@gmail.com', 'basic_avatar.webp', 0, 'active', '2024-12-15 22:16:23'),
(7, 'whatthehell', '$2y$10$tAwauk2VhSZ0kpCHa0FEZeN8nRuAfbsPLGmgPn.ZFXrRIMP5zIZG6', '1@gmail.com', '24d75665-45d7-45ee-ac14-20c230881457.jpeg', 1, 'active', '2024-12-17 13:41:02');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `adds_tovar`
--
ALTER TABLE `adds_tovar`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `adds_tovar`
--
ALTER TABLE `adds_tovar`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `admin`
--
ALTER TABLE `admin`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=893;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
