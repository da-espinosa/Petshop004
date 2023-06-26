-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-06-2023 a las 01:50:48
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `petshop`
--
CREATE DATABASE IF NOT EXISTS `petshop` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `petshop`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `authentication_user`
--

CREATE TABLE `authentication_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `authentication_user`
--

INSERT INTO `authentication_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `email`, `first_name`, `last_name`, `is_active`, `is_staff`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$216000$yvjlF1Y9U4ni$2K+OXM/UU9+Kr9pHBMa3A0KJpfLbCOZ3yUz+Uprkfd4=', '2023-06-23 23:34:04.007927', 1, 'admin', 'da.espinosa@duocuc.cl', 'admin', 'admin', 1, 1, '2023-06-14 00:44:11.698477'),
(2, 'pbkdf2_sha256$216000$8plPymjFJYQH$yaEaT+fTqFOQpeXMr1BP1XEqkglt7apGrDNzPNBuw8c=', '2023-06-22 23:32:02.000000', 0, 'deivid', 'espinosadavidalexander@duocuc.cl', NULL, NULL, 1, 0, '2023-06-14 00:45:26.640879'),
(9, 'pbkdf2_sha256$216000$smTDmJKeoViv$8611t/9mqySbotaaI+WJ871EdTRtopfO9TOs8gi34MA=', '2023-06-23 23:33:45.976119', 0, 'vendedor', 'vendedor123@gmail.com', NULL, NULL, 1, 0, '2023-06-22 23:34:59.650973'),
(10, 'pbkdf2_sha256$216000$hKgEXzu3bXTe$KbPzbO5715QJN0ZRn5hPIvOVEDSrlkcAJSmT/OAcmqM=', '2023-06-23 23:32:54.774086', 0, 'bigboss', 'bigboss@gmail.com', NULL, NULL, 1, 0, '2023-06-22 23:42:59.846119'),
(11, 'pbkdf2_sha256$216000$2wACsB3kEqXj$OcxnZ/qSCklVV5IiNEHxtxoCBPnphjfV3bK4NpawOPM=', '2023-06-23 23:34:35.110519', 0, 'cliente', 'cliente@gmail.com', NULL, NULL, 1, 0, '2023-06-22 23:43:45.645783'),
(13, 'pbkdf2_sha256$216000$hjKSAJaCut0G$007Q8TAY6S2EustEFNcyJXIZl7aztH3oR+oJABVym4U=', '2023-06-23 23:10:41.629405', 0, 'cliente2', 'cliente2@gmail.com', NULL, NULL, 1, 0, '2023-06-23 23:09:59.420043');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `authentication_user_groups`
--

CREATE TABLE `authentication_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `authentication_user_groups`
--

INSERT INTO `authentication_user_groups` (`id`, `user_id`, `group_id`) VALUES
(6, 1, 3),
(7, 1, 4),
(5, 1, 5),
(12, 2, 5),
(11, 9, 3),
(13, 10, 5),
(14, 11, 4),
(16, 13, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `authentication_user_user_permissions`
--

CREATE TABLE `authentication_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(5, 'administradores'),
(4, 'cliente'),
(3, 'vendedor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(70, 3, 25),
(71, 3, 26),
(72, 3, 27),
(73, 3, 28),
(74, 3, 29),
(75, 3, 30),
(76, 3, 31),
(69, 3, 32),
(77, 4, 32),
(78, 4, 37),
(79, 4, 38),
(80, 4, 39),
(81, 4, 40),
(82, 4, 45),
(83, 4, 47),
(84, 4, 48),
(85, 5, 1),
(86, 5, 2),
(87, 5, 3),
(88, 5, 4),
(89, 5, 5),
(90, 5, 6),
(91, 5, 7),
(92, 5, 8),
(93, 5, 9),
(94, 5, 10),
(95, 5, 11),
(96, 5, 12),
(97, 5, 13),
(98, 5, 14),
(99, 5, 15),
(100, 5, 16),
(101, 5, 17),
(102, 5, 18),
(103, 5, 19),
(104, 5, 20),
(105, 5, 21),
(106, 5, 22),
(107, 5, 23),
(108, 5, 24),
(109, 5, 25),
(110, 5, 26),
(111, 5, 27),
(112, 5, 28),
(113, 5, 29),
(114, 5, 30),
(115, 5, 31),
(116, 5, 32),
(117, 5, 33),
(118, 5, 34),
(119, 5, 35),
(120, 5, 36),
(121, 5, 37),
(122, 5, 38),
(123, 5, 39),
(124, 5, 40),
(125, 5, 41),
(126, 5, 42),
(127, 5, 43),
(128, 5, 44),
(129, 5, 45),
(130, 5, 46),
(131, 5, 47),
(132, 5, 48);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add cliente', 6, 'add_cliente'),
(22, 'Can change cliente', 6, 'change_cliente'),
(23, 'Can delete cliente', 6, 'delete_cliente'),
(24, 'Can view cliente', 6, 'view_cliente'),
(25, 'Can add tipo producto', 7, 'add_tipoproducto'),
(26, 'Can change tipo producto', 7, 'change_tipoproducto'),
(27, 'Can delete tipo producto', 7, 'delete_tipoproducto'),
(28, 'Can view tipo producto', 7, 'view_tipoproducto'),
(29, 'Can add producto', 8, 'add_producto'),
(30, 'Can change producto', 8, 'change_producto'),
(31, 'Can delete producto', 8, 'delete_producto'),
(32, 'Can view producto', 8, 'view_producto'),
(33, 'Can add comentario', 9, 'add_comentario'),
(34, 'Can change comentario', 9, 'change_comentario'),
(35, 'Can delete comentario', 9, 'delete_comentario'),
(36, 'Can view comentario', 9, 'view_comentario'),
(37, 'Can add carrito', 10, 'add_carrito'),
(38, 'Can change carrito', 10, 'change_carrito'),
(39, 'Can delete carrito', 10, 'delete_carrito'),
(40, 'Can view carrito', 10, 'view_carrito'),
(41, 'Can add user', 11, 'add_user'),
(42, 'Can change user', 11, 'change_user'),
(43, 'Can delete user', 11, 'delete_user'),
(44, 'Can view user', 11, 'view_user'),
(45, 'Can add suscripcion', 12, 'add_suscripcion'),
(46, 'Can change suscripcion', 12, 'change_suscripcion'),
(47, 'Can delete suscripcion', 12, 'delete_suscripcion'),
(48, 'Can view suscripcion', 12, 'view_suscripcion'),
(49, 'Can add seguimiento', 13, 'add_seguimiento'),
(50, 'Can change seguimiento', 13, 'change_seguimiento'),
(51, 'Can delete seguimiento', 13, 'delete_seguimiento'),
(52, 'Can view seguimiento', 13, 'view_seguimiento'),
(53, 'Can add estado', 14, 'add_estado'),
(54, 'Can change estado', 14, 'change_estado'),
(55, 'Can delete estado', 14, 'delete_estado'),
(56, 'Can view estado', 14, 'view_estado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_carrito`
--

CREATE TABLE `core_carrito` (
  `id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `core_carrito`
--

INSERT INTO `core_carrito` (`id`, `cantidad`, `cliente_id`, `producto_id`) VALUES
(16, 5, 1, 1),
(17, 5, 1, 2),
(83, 2, 6, 1),
(85, 10, 7, 2),
(86, 6, 6, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_cliente`
--

CREATE TABLE `core_cliente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `apellido` varchar(40) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `core_cliente`
--

INSERT INTO `core_cliente` (`id`, `nombre`, `apellido`, `user_id`) VALUES
(1, 'david', 'espinosa', 2),
(4, 'homero', 'simpson', 9),
(5, 'rodrigo', 'neres', 10),
(6, 'kylian', 'mbappe', 11),
(7, 'Brianeitor', 'perez', 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_comentario`
--

CREATE TABLE `core_comentario` (
  `id` int(11) NOT NULL,
  `resena` varchar(60) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_estado`
--

CREATE TABLE `core_estado` (
  `id` int(11) NOT NULL,
  `nombreEstado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `core_estado`
--

INSERT INTO `core_estado` (`id`, `nombreEstado`) VALUES
(1, 'Validación'),
(2, 'Preparación'),
(3, 'Reparto'),
(4, 'Entrega');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_producto`
--

CREATE TABLE `core_producto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(60) NOT NULL,
  `precio` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `tipo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `core_producto`
--

INSERT INTO `core_producto` (`id`, `nombre`, `descripcion`, `precio`, `stock`, `imagen`, `tipo_id`) VALUES
(1, 'Bandana con diseño', 'Bandana con diseño perfecto para tu mascota.', 2670, 103, 'products-dog_bandana_front__RHuQ3Kc.png', 1),
(2, 'Bandana negra', 'Es una bandana negra de tela suave.', 2888, 30, '8309790cd3a52443bb85ddb20d6bd707_7qNhRYs.png', 1),
(4, 'Bandana con diseño', 'La bandana funciona como collar también.', 3450, 0, 'collar-para-perros-con-bandana-rosa-l.jpg', 1),
(9, 'Identificador negro', 'Identificador para tu mascota.', 6480, 799, 'identificador_sS2PYJX.png', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_seguimiento`
--

CREATE TABLE `core_seguimiento` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `estado_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `core_seguimiento`
--

INSERT INTO `core_seguimiento` (`id`, `nombre`, `estado_id`) VALUES
(2, 'lole', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_suscripcion`
--

CREATE TABLE `core_suscripcion` (
  `id` int(11) NOT NULL,
  `correo` varchar(60) NOT NULL,
  `cliente_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `core_suscripcion`
--

INSERT INTO `core_suscripcion` (`id`, `correo`, `cliente_id`) VALUES
(5, 'da.espinosa@duocuc.cl', 1),
(6, 'cliente2@gmail.com', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_tipoproducto`
--

CREATE TABLE `core_tipoproducto` (
  `id` int(11) NOT NULL,
  `nombreTipo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `core_tipoproducto`
--

INSERT INTO `core_tipoproducto` (`id`, `nombreTipo`) VALUES
(1, 'Bandana'),
(2, 'Identificador'),
(3, 'Correa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-06-14 00:46:36.779034', '1', 'bandana', 1, '[{\"added\": {}}]', 7, 1),
(2, '2023-06-14 00:46:39.248130', '1', 'bandana', 1, '[{\"added\": {}}]', 8, 1),
(3, '2023-06-14 01:04:06.743721', '3', 'deivid', 3, '', 10, 1),
(4, '2023-06-14 01:04:11.188771', '2', 'deivid', 3, '', 10, 1),
(5, '2023-06-14 01:04:33.769558', '1', 'deivid', 3, '', 10, 1),
(6, '2023-06-14 01:13:29.006260', '4', 'deivid', 3, '', 10, 1),
(7, '2023-06-20 14:01:58.753283', '3', 'alex', 3, '', 11, 1),
(8, '2023-06-21 18:15:25.254482', '1', 'deivid', 1, '[{\"added\": {}}]', 12, 1),
(9, '2023-06-21 18:15:49.427888', '1', 'deivid', 3, '', 12, 1),
(10, '2023-06-21 18:51:13.257282', '1', 'deivid', 1, '[{\"added\": {}}]', 12, 1),
(11, '2023-06-21 18:51:18.796618', '1', 'deivid', 3, '', 12, 1),
(12, '2023-06-21 18:58:30.743231', '2', 'deivid', 3, '', 12, 1),
(13, '2023-06-21 19:00:10.021764', '3', 'deivid', 3, '', 12, 1),
(14, '2023-06-21 19:17:37.042600', '4', 'deivid', 3, '', 12, 1),
(15, '2023-06-22 22:28:25.882177', '4', 'alex', 3, '', 11, 1),
(16, '2023-06-22 22:30:55.772992', '1', 'Vendedores', 1, '[{\"added\": {}}]', 3, 1),
(17, '2023-06-22 22:32:17.710051', '5', 'vendedor', 1, '[{\"added\": {}}]', 11, 1),
(18, '2023-06-22 22:35:13.691363', '5', 'vendedor', 2, '[{\"changed\": {\"fields\": [\"User permissions\"]}}]', 11, 1),
(19, '2023-06-22 22:36:17.517355', '1', 'Vendedores', 2, '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', 3, 1),
(20, '2023-06-22 22:36:34.982208', '5', 'vendedor', 2, '[{\"changed\": {\"fields\": [\"User permissions\"]}}]', 11, 1),
(21, '2023-06-22 22:37:25.893735', '5', 'vendedor', 3, '', 11, 1),
(22, '2023-06-22 22:37:52.194429', '1', 'Vendedores', 3, '', 3, 1),
(23, '2023-06-22 22:39:35.438328', '2', 'vendedores', 1, '[{\"added\": {}}]', 3, 1),
(24, '2023-06-22 22:42:38.441669', '2', 'vendedores', 3, '', 3, 1),
(25, '2023-06-22 22:45:04.112531', '3', 'vendedor', 1, '[{\"added\": {}}]', 3, 1),
(26, '2023-06-22 22:48:43.430146', '4', 'cliente', 1, '[{\"added\": {}}]', 3, 1),
(27, '2023-06-22 22:49:08.423921', '5', 'administradores', 1, '[{\"added\": {}}]', 3, 1),
(28, '2023-06-22 22:52:16.343455', '6', 'vendedor', 1, '[{\"added\": {}}]', 11, 1),
(29, '2023-06-22 22:53:46.158000', '7', 'cliente', 1, '[{\"added\": {}}]', 11, 1),
(30, '2023-06-22 22:56:39.167395', '8', 'bigBoss', 1, '[{\"added\": {}}]', 11, 1),
(31, '2023-06-22 22:56:59.244685', '7', 'cliente', 2, '[]', 11, 1),
(32, '2023-06-22 22:58:10.558984', '8', 'bigBoss', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 11, 1),
(33, '2023-06-22 23:12:39.941058', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Groups\", \"Email\"]}}]', 11, 1),
(34, '2023-06-22 23:13:18.714527', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 11, 1),
(35, '2023-06-22 23:28:37.001785', '2', 'deivid', 2, '[{\"changed\": {\"fields\": [\"Groups\", \"Email\"]}}]', 11, 1),
(36, '2023-06-22 23:30:03.926716', '2', 'deivid', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 11, 1),
(37, '2023-06-22 23:31:42.228212', '2', 'deivid', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 11, 1),
(38, '2023-06-22 23:34:00.004036', '6', 'vendedor', 3, '', 11, 1),
(39, '2023-06-22 23:35:36.174799', '9', 'vendedor', 2, '[{\"changed\": {\"fields\": [\"Groups\", \"Email\"]}}]', 11, 1),
(40, '2023-06-22 23:41:47.533374', '8', 'bigBoss', 3, '', 11, 1),
(41, '2023-06-22 23:42:00.898697', '7', 'cliente', 3, '', 11, 1),
(42, '2023-06-22 23:42:09.617290', '2', 'deivid', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 11, 1),
(43, '2023-06-22 23:44:11.161583', '10', 'bigboss', 2, '[{\"changed\": {\"fields\": [\"Groups\", \"Email\"]}}]', 11, 1),
(44, '2023-06-22 23:44:26.406704', '11', 'cliente', 2, '[{\"changed\": {\"fields\": [\"Groups\", \"Email\"]}}]', 11, 1),
(45, '2023-06-23 06:08:00.194285', '1', 'Validación', 1, '[{\"added\": {}}]', 14, 1),
(46, '2023-06-23 06:08:15.061360', '2', 'Preparación', 1, '[{\"added\": {}}]', 14, 1),
(47, '2023-06-23 06:08:23.912192', '3', 'Reparto', 1, '[{\"added\": {}}]', 14, 1),
(48, '2023-06-23 06:08:32.814566', '4', 'Entrega', 1, '[{\"added\": {}}]', 14, 1),
(49, '2023-06-23 06:08:38.456948', '1', 'bob', 1, '[{\"added\": {}}]', 13, 1),
(50, '2023-06-23 21:24:05.852076', '1', 'bob', 2, '[{\"changed\": {\"fields\": [\"Estado\"]}}]', 13, 1),
(51, '2023-06-23 21:25:04.247747', '1', 'bob', 2, '[{\"changed\": {\"fields\": [\"Estado\"]}}]', 13, 1),
(52, '2023-06-23 21:25:16.211113', '1', 'bob', 2, '[{\"changed\": {\"fields\": [\"Estado\"]}}]', 13, 1),
(53, '2023-06-23 21:28:00.409691', '1', 'bob', 2, '[{\"changed\": {\"fields\": [\"Estado\"]}}]', 13, 1),
(54, '2023-06-23 21:32:14.038854', '1', 'bob', 2, '[{\"changed\": {\"fields\": [\"Estado\"]}}]', 13, 1),
(55, '2023-06-23 21:32:33.813200', '1', 'bob', 3, '', 13, 1),
(56, '2023-06-23 21:33:01.569430', '2', 'lole', 2, '[{\"changed\": {\"fields\": [\"Estado\"]}}]', 13, 1),
(57, '2023-06-23 22:16:58.139112', '2', 'Identificadores', 1, '[{\"added\": {}}]', 7, 1),
(58, '2023-06-23 22:17:11.937156', '1', 'Bandana', 2, '[{\"changed\": {\"fields\": [\"NombreTipo\"]}}]', 7, 1),
(59, '2023-06-23 22:17:23.381336', '2', 'Identificador', 2, '[{\"changed\": {\"fields\": [\"NombreTipo\"]}}]', 7, 1),
(60, '2023-06-23 22:17:33.014348', '3', 'Correa', 1, '[{\"added\": {}}]', 7, 1),
(61, '2023-06-23 22:29:16.399693', '8', 'dknakdka', 3, '', 8, 1),
(62, '2023-06-23 23:08:09.294036', '12', 'cliente2', 1, '[{\"added\": {}}]', 11, 1),
(63, '2023-06-23 23:08:28.261129', '12', 'cliente2', 2, '[{\"changed\": {\"fields\": [\"Email\"]}}]', 11, 1),
(64, '2023-06-23 23:09:05.624639', '12', 'cliente2', 3, '', 11, 1),
(65, '2023-06-23 23:10:22.445837', '13', 'cliente2', 2, '[{\"changed\": {\"fields\": [\"Groups\", \"Email\"]}}]', 11, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(11, 'authentication', 'user'),
(4, 'contenttypes', 'contenttype'),
(10, 'core', 'carrito'),
(6, 'core', 'cliente'),
(9, 'core', 'comentario'),
(14, 'core', 'estado'),
(8, 'core', 'producto'),
(13, 'core', 'seguimiento'),
(12, 'core', 'suscripcion'),
(7, 'core', 'tipoproducto'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-06-14 00:42:45.560725'),
(2, 'contenttypes', '0002_remove_content_type_name', '2023-06-14 00:42:45.615799'),
(3, 'auth', '0001_initial', '2023-06-14 00:42:45.688436'),
(4, 'auth', '0002_alter_permission_name_max_length', '2023-06-14 00:42:45.844263'),
(5, 'auth', '0003_alter_user_email_max_length', '2023-06-14 00:42:45.851775'),
(6, 'auth', '0004_alter_user_username_opts', '2023-06-14 00:42:45.858022'),
(7, 'auth', '0005_alter_user_last_login_null', '2023-06-14 00:42:45.865841'),
(8, 'auth', '0006_require_contenttypes_0002', '2023-06-14 00:42:45.870159'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2023-06-14 00:42:45.876033'),
(10, 'auth', '0008_alter_user_username_max_length', '2023-06-14 00:42:45.882040'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2023-06-14 00:42:45.888595'),
(12, 'auth', '0010_alter_group_name_max_length', '2023-06-14 00:42:45.942065'),
(13, 'auth', '0011_update_proxy_permissions', '2023-06-14 00:42:45.948698'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2023-06-14 00:42:45.955701'),
(15, 'authentication', '0001_initial', '2023-06-14 00:42:46.036945'),
(16, 'admin', '0001_initial', '2023-06-14 00:42:46.177064'),
(17, 'admin', '0002_logentry_remove_auto_add', '2023-06-14 00:42:46.254293'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2023-06-14 00:42:46.260805'),
(19, 'core', '0001_initial', '2023-06-14 00:42:46.346049'),
(20, 'sessions', '0001_initial', '2023-06-14 00:42:46.496741'),
(21, 'core', '0002_suscripcion', '2023-06-21 17:57:20.065228'),
(22, 'core', '0003_remove_suscripcion_porcentaje', '2023-06-21 18:28:55.241715'),
(23, 'core', '0004_delete_suscripcion', '2023-06-21 18:41:05.029395'),
(24, 'core', '0005_suscripcion', '2023-06-21 18:42:14.291566'),
(25, 'core', '0006_estado_seguimiento', '2023-06-23 05:48:43.836486');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('5fxwlflijb5ox0ew852do0ohtt5hg33q', '.eJxVjDEOAiEQRe9CbQgIDGBp7xkIw4yyaiBZdivj3XWTLbT9773_EimvS03r4DlNJE7iKA6_G-by4LYBuud267L0tswTyk2ROx3y0omf5939O6h51G_NxoMlQ8V7BhcigMWrxuwCKixGUyiECNkbjoqD1eBZoXYMpiiHUbw_7M04Cw:1q9F59:56g0zD6Zam28pYnfhfzLyBbF_cTLnkFNrqug4Yvez4A', '2023-06-28 01:13:55.249003'),
('ck3zj7aeka85ybx84knwgr5o3yq5krcm', '.eJxVjDsOwjAQRO_iGlky_lPScwZrvbvGAWRLcVIh7k4ipYBy5r2Zt0iwLjWtg-c0kbgIJU6_XQZ8ctsBPaDdu8TelnnKclfkQYe8deLX9XD_DiqMuq0NW43aBE_B2hBcJjwXrZWJ2ThXLPqiKXoGQAJii6QDuC0ocNETis8X5xI42Q:1qC6wb:uTp_vgSlb98emYU0lj-ijSXUrBzRLTHu84EU6eibRqA', '2023-07-05 23:08:57.302742'),
('o7wh1ac06ajnlp0r2vsjjlm74thj336e', '.eJxVjEsOAiEQBe_C2hBapkdw6d4zkIZuZNRAMp-V8e5KMgvdVtV7LxVoW0vYFpnDxOqsANThF0ZKD6nd8J3qrenU6jpPUfdE73bR18byvOzt30GhpXzXjk7JZsvikTMCeBzQpyOwYR4HY8fsWCKgCDmbR9MhDx4BSZLJoN4fDOo4NQ:1qCqIV:Gb9tvB-uIPiw85Oo09IsTN3MAJVULiSux2V2YNRRbxM', '2023-07-07 23:34:35.113703'),
('wq1pz72cp6hgthd270zpbzzzwgd6dilv', '.eJxVjDsOwjAQRO_iGlky_lPScwZrvbvGAWRLcVIh7k4ipYBy5r2Zt0iwLjWtg-c0kbgIJU6_XQZ8ctsBPaDdu8TelnnKclfkQYe8deLX9XD_DiqMuq0NW43aBE_B2hBcJjwXrZWJ2ThXLPqiKXoGQAJii6QDuC0ocNETis8X5xI42Q:1qCZVG:9prvEct1voSAWuRdNgw8sqyy02vJbAKwobQQ9NB1tiE', '2023-07-07 05:38:38.968123');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `authentication_user`
--
ALTER TABLE `authentication_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `authentication_user_groups`
--
ALTER TABLE `authentication_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `authentication_user_groups_user_id_group_id_8af031ac_uniq` (`user_id`,`group_id`),
  ADD KEY `authentication_user_groups_group_id_6b5c44b7_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `authentication_user_user_permissions`
--
ALTER TABLE `authentication_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `authentication_user_user_user_id_permission_id_ec51b09f_uniq` (`user_id`,`permission_id`),
  ADD KEY `authentication_user__permission_id_ea6be19a_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `core_carrito`
--
ALTER TABLE `core_carrito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_carrito_cliente_id_8efb49fb_fk_core_cliente_id` (`cliente_id`),
  ADD KEY `core_carrito_producto_id_f9c36034_fk_core_producto_id` (`producto_id`);

--
-- Indices de la tabla `core_cliente`
--
ALTER TABLE `core_cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indices de la tabla `core_comentario`
--
ALTER TABLE `core_comentario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_comentario_user_id_e6908839_fk_core_cliente_id` (`user_id`);

--
-- Indices de la tabla `core_estado`
--
ALTER TABLE `core_estado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `core_producto`
--
ALTER TABLE `core_producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_producto_tipo_id_e0e92ad1_fk_core_tipoproducto_id` (`tipo_id`);

--
-- Indices de la tabla `core_seguimiento`
--
ALTER TABLE `core_seguimiento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_seguimiento_estado_id_2399bc69_fk_core_estado_id` (`estado_id`);

--
-- Indices de la tabla `core_suscripcion`
--
ALTER TABLE `core_suscripcion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_suscripcion_cliente_id_b012260a_fk_core_cliente_id` (`cliente_id`);

--
-- Indices de la tabla `core_tipoproducto`
--
ALTER TABLE `core_tipoproducto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_authentication_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `authentication_user`
--
ALTER TABLE `authentication_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `authentication_user_groups`
--
ALTER TABLE `authentication_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `authentication_user_user_permissions`
--
ALTER TABLE `authentication_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `core_carrito`
--
ALTER TABLE `core_carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT de la tabla `core_cliente`
--
ALTER TABLE `core_cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `core_comentario`
--
ALTER TABLE `core_comentario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_estado`
--
ALTER TABLE `core_estado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `core_producto`
--
ALTER TABLE `core_producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `core_seguimiento`
--
ALTER TABLE `core_seguimiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `core_suscripcion`
--
ALTER TABLE `core_suscripcion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `core_tipoproducto`
--
ALTER TABLE `core_tipoproducto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `authentication_user_groups`
--
ALTER TABLE `authentication_user_groups`
  ADD CONSTRAINT `authentication_user__user_id_30868577_fk_authentic` FOREIGN KEY (`user_id`) REFERENCES `authentication_user` (`id`),
  ADD CONSTRAINT `authentication_user_groups_group_id_6b5c44b7_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `authentication_user_user_permissions`
--
ALTER TABLE `authentication_user_user_permissions`
  ADD CONSTRAINT `authentication_user__permission_id_ea6be19a_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `authentication_user__user_id_736ebf7e_fk_authentic` FOREIGN KEY (`user_id`) REFERENCES `authentication_user` (`id`);

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `core_carrito`
--
ALTER TABLE `core_carrito`
  ADD CONSTRAINT `core_carrito_cliente_id_8efb49fb_fk_core_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `core_cliente` (`id`),
  ADD CONSTRAINT `core_carrito_producto_id_f9c36034_fk_core_producto_id` FOREIGN KEY (`producto_id`) REFERENCES `core_producto` (`id`);

--
-- Filtros para la tabla `core_cliente`
--
ALTER TABLE `core_cliente`
  ADD CONSTRAINT `core_cliente_user_id_d7896daf_fk_authentication_user_id` FOREIGN KEY (`user_id`) REFERENCES `authentication_user` (`id`);

--
-- Filtros para la tabla `core_comentario`
--
ALTER TABLE `core_comentario`
  ADD CONSTRAINT `core_comentario_user_id_e6908839_fk_core_cliente_id` FOREIGN KEY (`user_id`) REFERENCES `core_cliente` (`id`);

--
-- Filtros para la tabla `core_producto`
--
ALTER TABLE `core_producto`
  ADD CONSTRAINT `core_producto_tipo_id_e0e92ad1_fk_core_tipoproducto_id` FOREIGN KEY (`tipo_id`) REFERENCES `core_tipoproducto` (`id`);

--
-- Filtros para la tabla `core_seguimiento`
--
ALTER TABLE `core_seguimiento`
  ADD CONSTRAINT `core_seguimiento_estado_id_2399bc69_fk_core_estado_id` FOREIGN KEY (`estado_id`) REFERENCES `core_estado` (`id`);

--
-- Filtros para la tabla `core_suscripcion`
--
ALTER TABLE `core_suscripcion`
  ADD CONSTRAINT `core_suscripcion_cliente_id_b012260a_fk_core_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `core_cliente` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_authentication_user_id` FOREIGN KEY (`user_id`) REFERENCES `authentication_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
