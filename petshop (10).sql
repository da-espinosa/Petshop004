-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-07-2023 a las 06:05:36
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
(1, 'pbkdf2_sha256$216000$yvjlF1Y9U4ni$2K+OXM/UU9+Kr9pHBMa3A0KJpfLbCOZ3yUz+Uprkfd4=', '2023-07-12 04:00:30.142506', 1, 'admin', 'da.espinosa@duocuc.cl', 'admin', 'admin', 1, 1, '2023-06-14 00:44:11.698477'),
(2, 'pbkdf2_sha256$216000$8plPymjFJYQH$yaEaT+fTqFOQpeXMr1BP1XEqkglt7apGrDNzPNBuw8c=', '2023-06-22 23:32:02.000000', 0, 'deivid', 'espinosadavidalexander@duocuc.cl', NULL, NULL, 1, 0, '2023-06-14 00:45:26.640879'),
(9, 'pbkdf2_sha256$216000$smTDmJKeoViv$8611t/9mqySbotaaI+WJ871EdTRtopfO9TOs8gi34MA=', '2023-07-11 20:48:05.667060', 0, 'vendedor', 'vendedor123@gmail.com', NULL, NULL, 1, 0, '2023-06-22 23:34:59.650973'),
(10, 'pbkdf2_sha256$216000$hKgEXzu3bXTe$KbPzbO5715QJN0ZRn5hPIvOVEDSrlkcAJSmT/OAcmqM=', '2023-07-12 03:28:11.690513', 0, 'bigboss', 'bigboss@gmail.com', NULL, NULL, 1, 0, '2023-06-22 23:42:59.846119'),
(11, 'pbkdf2_sha256$216000$2wACsB3kEqXj$OcxnZ/qSCklVV5IiNEHxtxoCBPnphjfV3bK4NpawOPM=', '2023-07-12 03:50:56.095453', 0, 'cliente', 'cliente@gmail.com', NULL, NULL, 1, 0, '2023-06-22 23:43:45.645783'),
(13, 'pbkdf2_sha256$216000$hjKSAJaCut0G$007Q8TAY6S2EustEFNcyJXIZl7aztH3oR+oJABVym4U=', '2023-07-12 03:48:18.267630', 0, 'cliente2', 'cliente2@gmail.com', NULL, NULL, 1, 0, '2023-06-23 23:09:59.420043'),
(23, 'pbkdf2_sha256$216000$bgoKMec500vb$J1VXgBFdDMu85No4H2dcoA+sgIKh3xNBV87ZYrYa6jw=', '2023-07-07 07:04:00.427196', 0, 'pailita', NULL, NULL, NULL, 1, 0, '2023-07-03 20:59:33.485468');

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
(16, 13, 4),
(18, 23, 4);

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
(56, 'Can view estado', 14, 'view_estado'),
(57, 'Can add compra', 15, 'add_compra'),
(58, 'Can change compra', 15, 'change_compra'),
(59, 'Can delete compra', 15, 'delete_compra'),
(60, 'Can view compra', 15, 'view_compra');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_carrito`
--

CREATE TABLE `core_carrito` (
  `id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `vigente` tinyint(1) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
(7, 'Brianeitor', 'perez', 13),
(14, 'Carlos', 'pailachenco', 23);

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
-- Estructura de tabla para la tabla `core_compra`
--

CREATE TABLE `core_compra` (
  `id` int(11) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `contacto` varchar(50) NOT NULL,
  `fecha` date NOT NULL,
  `carrito_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `nombreEstado_id` int(11) NOT NULL
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
(2, 'Preparación'),
(3, 'Reparto'),
(4, 'Entregado'),
(5, 'validación');

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
(1, 'Bandana con diseño', 'Bandana con diseño perfecto para tu mascota.', 1000, 83, 'products-dog_bandana_front__RHuQ3Kc.png', 1),
(2, 'Bandana negra', 'Es una bandana negra de tela suave.', 2888, 3, '8309790cd3a52443bb85ddb20d6bd707_7qNhRYs.png', 1),
(9, 'Identificador negro', 'Identificador para tu mascota.', 6480, 777, 'identificador_sS2PYJX.png', 2),
(10, 'Bandana Tropical', 'Bandana con un diseño de verano', 1990, 50, 'bandana_amazonas_cNcl0x8.png', 1),
(11, 'Identificador rosa', 'Identificación de acero inoxidable', 1590, 100, '96dfbdc87c282fde3ac332e76b309790.png', 2),
(12, 'Correa morada', 'correa de genero', 4990, 80, 'R.png', 3),
(13, 'Identificador naranja', 'Identificador naranja de acero inoxidable', 1990, 100, 'id-bricka-katt-orange-1.png', 2),
(15, 'Correa Verde', 'Correa de cuero', 6990, 50, 'correa-verde.png', 3),
(16, 'Correa Bersase Gold and Black', 'Correa Bersace 100% real no fake', 250000, 0, 'Correa_Versace.png', 3),
(17, 'Bandana Azul Básica', 'Bandana de polar', 2990, 150, '38-382543_blue-bandana-png-scarf.png', 1),
(19, 'Bandana Bersase', 'Bandana 100$ real', 185000, 0, 'Bandana_Versace.png', 1),
(20, 'Arnés Bersase Pink', 'Arnés con precio razonable', 8630, 58, 'Arnés_versace.png', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_suscripcion`
--

CREATE TABLE `core_suscripcion` (
  `id` int(11) NOT NULL,
  `correo` varchar(60) NOT NULL,
  `fecha` date NOT NULL,
  `cliente_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
(65, '2023-06-23 23:10:22.445837', '13', 'cliente2', 2, '[{\"changed\": {\"fields\": [\"Groups\", \"Email\"]}}]', 11, 1),
(66, '2023-07-03 20:42:36.084083', '16', 'panchito', 3, '', 11, 1),
(67, '2023-07-03 20:42:48.580964', '14', 'pancho', 3, '', 11, 1),
(68, '2023-07-03 20:54:14.441293', '20', 'pet', 3, '', 11, 1),
(69, '2023-07-03 20:54:19.885010', '21', 'gato', 3, '', 11, 1),
(70, '2023-07-03 20:54:25.553745', '18', 'lol', 3, '', 11, 1),
(71, '2023-07-03 20:59:01.645038', '22', 'pailita', 3, '', 11, 1),
(72, '2023-07-04 00:31:19.796942', '1', '123', 1, '[{\"added\": {}}]', 15, 1),
(73, '2023-07-04 02:47:18.046802', '91', 'cliente', 3, '', 10, 1),
(74, '2023-07-04 18:07:34.189307', '94', 'cliente', 3, '', 10, 1),
(75, '2023-07-04 20:15:47.573012', '95', 'cliente', 3, '', 10, 1),
(76, '2023-07-04 20:16:11.119076', '96', 'cliente2', 3, '', 10, 1),
(77, '2023-07-04 20:32:41.800004', '98', 'cliente2', 3, '', 10, 1),
(78, '2023-07-04 23:17:39.978735', '1', 'cliente', 3, '', 12, 1),
(79, '2023-07-04 23:20:50.115464', '2', 'cliente', 3, '', 12, 1),
(80, '2023-07-06 21:29:48.164429', '3', 'cliente', 3, '', 12, 1),
(81, '2023-07-06 21:43:14.940340', '4', 'cliente', 3, '', 12, 1),
(82, '2023-07-06 22:48:49.894096', '5', 'cliente', 3, '', 12, 1),
(83, '2023-07-07 02:16:30.201229', '1', 'cliente', 3, '', 12, 1),
(84, '2023-07-07 02:32:43.923624', '4', 'cliente', 3, '', 12, 1),
(85, '2023-07-07 02:32:48.638534', '3', 'cliente', 3, '', 12, 1),
(86, '2023-07-07 02:32:54.175879', '2', 'cliente', 3, '', 12, 1),
(87, '2023-07-07 02:44:25.768456', '5', 'cliente', 3, '', 12, 1),
(88, '2023-07-07 02:53:56.853961', '6', 'cliente', 3, '', 12, 1),
(89, '2023-07-07 03:08:24.028800', '7', 'cliente', 3, '', 12, 1),
(90, '2023-07-07 06:04:55.320519', '1', '59d32', 3, '', 15, 1),
(91, '2023-07-07 06:05:00.037765', '2', '2198a', 3, '', 15, 1),
(92, '2023-07-07 06:08:23.616383', '3', '66545', 3, '', 15, 1),
(93, '2023-07-07 06:08:38.948892', '1', 'cliente', 3, '', 12, 1),
(94, '2023-07-07 06:31:52.451314', '7', '64d7e', 3, '', 15, 1),
(95, '2023-07-07 06:32:34.705416', '7', 'cliente', 3, '', 10, 1),
(96, '2023-07-07 06:35:27.485168', '25', 'validación', 3, '', 14, 1),
(97, '2023-07-07 06:35:31.508578', '24', 'validación', 3, '', 14, 1),
(98, '2023-07-07 06:35:36.061746', '23', 'validación', 3, '', 14, 1),
(99, '2023-07-07 06:35:40.159941', '22', 'validación', 3, '', 14, 1),
(100, '2023-07-07 06:35:43.883771', '21', 'validación', 3, '', 14, 1),
(101, '2023-07-07 06:35:47.647357', '20', 'validación', 3, '', 14, 1),
(102, '2023-07-07 06:35:52.078276', '19', 'validación', 3, '', 14, 1),
(103, '2023-07-07 06:35:56.143318', '18', 'validación', 3, '', 14, 1),
(104, '2023-07-07 06:36:00.200361', '16', 'validación', 3, '', 14, 1),
(105, '2023-07-07 06:36:03.946029', '17', 'validación', 3, '', 14, 1),
(106, '2023-07-07 06:36:08.497033', '15', 'validación', 3, '', 14, 1),
(107, '2023-07-07 06:36:12.070233', '14', 'validación', 3, '', 14, 1),
(108, '2023-07-07 06:36:16.435489', '13', 'validación', 3, '', 14, 1),
(109, '2023-07-07 06:36:20.034693', '12', 'validación', 3, '', 14, 1),
(110, '2023-07-07 06:36:24.218015', '11', 'validación', 3, '', 14, 1),
(111, '2023-07-07 06:36:27.908003', '10', 'validación', 3, '', 14, 1),
(112, '2023-07-07 06:36:32.506426', '9', 'validación', 3, '', 14, 1),
(113, '2023-07-07 06:36:36.474940', '8', 'validación', 3, '', 14, 1),
(114, '2023-07-07 06:36:40.566237', '7', 'validación', 3, '', 14, 1),
(115, '2023-07-07 06:36:46.181823', '6', 'validación', 3, '', 14, 1),
(116, '2023-07-07 06:36:54.395678', '1', 'Validación', 3, '', 14, 1),
(117, '2023-07-07 06:58:21.556428', '27', 'validación', 3, '', 14, 1),
(118, '2023-07-07 06:58:26.150299', '26', 'validación', 3, '', 14, 1),
(119, '2023-07-11 21:45:08.231383', '13', '6ab98', 3, '', 15, 1),
(120, '2023-07-11 21:45:12.555733', '12', '6ab98', 3, '', 15, 1),
(121, '2023-07-11 21:45:16.218856', '11', '6ab98', 3, '', 15, 1),
(122, '2023-07-11 21:53:02.677319', '14', 'cliente', 3, '', 10, 1),
(123, '2023-07-11 22:50:48.917343', '2', 'Preparación', 1, '[{\"added\": {}}]', 14, 1),
(124, '2023-07-11 22:51:01.149442', '3', 'Reparto', 1, '[{\"added\": {}}]', 14, 1),
(125, '2023-07-11 22:51:12.466685', '4', 'Entregado', 1, '[{\"added\": {}}]', 14, 1),
(126, '2023-07-11 23:03:48.672880', '1', 'c1578', 3, '', 15, 1),
(127, '2023-07-11 23:03:54.449760', '1', 'cliente', 3, '', 10, 1),
(128, '2023-07-11 23:11:26.060069', '6', 'cliente2', 3, '', 10, 1),
(129, '2023-07-11 23:11:29.999647', '2', 'cliente', 3, '', 10, 1),
(130, '2023-07-12 02:44:49.442198', '7', '7c7e5', 3, '', 15, 1),
(131, '2023-07-12 02:44:53.289172', '6', '7c7e5', 3, '', 15, 1),
(132, '2023-07-12 02:44:57.222538', '5', '9975c', 3, '', 15, 1),
(133, '2023-07-12 02:45:00.974580', '4', '8072a', 3, '', 15, 1),
(134, '2023-07-12 03:24:57.123561', '10', 'bigboss', 2, '[]', 11, 1),
(135, '2023-07-12 03:47:46.449118', '8', '429b3', 3, '', 15, 1),
(136, '2023-07-12 03:48:50.953385', '19', 'cliente', 3, '', 10, 1),
(137, '2023-07-12 03:48:54.820148', '11', 'cliente2', 3, '', 10, 1),
(138, '2023-07-12 03:48:59.122468', '10', 'cliente2', 3, '', 10, 1),
(139, '2023-07-12 03:49:02.780277', '9', 'cliente2', 3, '', 10, 1),
(140, '2023-07-12 03:49:06.270100', '7', 'cliente2', 3, '', 10, 1),
(141, '2023-07-12 03:49:17.218988', '11', 'validación', 3, '', 14, 1),
(142, '2023-07-12 03:49:20.920002', '10', 'validación', 3, '', 14, 1),
(143, '2023-07-12 03:49:25.100752', '9', 'validación', 3, '', 14, 1),
(144, '2023-07-12 03:49:29.037732', '8', 'validación', 3, '', 14, 1),
(145, '2023-07-12 03:49:33.205470', '7', 'validación', 3, '', 14, 1),
(146, '2023-07-12 03:49:36.687423', '6', 'validación', 3, '', 14, 1),
(147, '2023-07-12 03:49:45.185461', '1', 'validación', 3, '', 14, 1);

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
(15, 'core', 'compra'),
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
(25, 'core', '0006_estado_seguimiento', '2023-06-23 05:48:43.836486'),
(26, 'core', '0007_compra', '2023-07-03 23:29:11.779240'),
(27, 'core', '0008_delete_seguimiento', '2023-07-04 18:36:19.075825'),
(28, 'core', '0009_delete_suscripcion', '2023-07-04 21:48:02.091940'),
(29, 'core', '0010_suscripcion', '2023-07-04 21:51:07.066214'),
(30, 'core', '0011_remove_suscripcion_monto', '2023-07-07 00:04:01.588888'),
(31, 'core', '0012_delete_suscripcion', '2023-07-07 00:44:17.158913'),
(32, 'core', '0013_suscripcion', '2023-07-07 00:45:09.016840'),
(33, 'core', '0014_remove_suscripcion_monto', '2023-07-07 01:14:10.604838'),
(34, 'core', '0015_delete_suscripcion', '2023-07-07 02:03:55.927275'),
(35, 'core', '0016_suscripcion', '2023-07-07 02:04:34.004432'),
(36, 'core', '0017_auto_20230707_0106', '2023-07-07 05:24:15.570895'),
(37, 'core', '0018_auto_20230707_0138', '2023-07-07 05:39:09.111745'),
(38, 'core', '0019_suscripcion', '2023-07-07 05:40:07.640132'),
(39, 'core', '0020_compra', '2023-07-07 05:40:56.497583'),
(40, 'core', '0021_auto_20230711_1832', '2023-07-11 22:32:13.308765'),
(41, 'core', '0022_carrito_comentario_compra_estado_suscripcion', '2023-07-11 22:36:58.654872');

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
('mi5syu7uqs6z6j3xd6xh1dypt7e7gnp6', '.eJxVjEsOAiEQBe_C2hBapkdw6d4zkIZuZNRAMp-V8e5KMgvdVtV7LxVoW0vYFpnDxOqsANThF0ZKD6nd8J3qrenU6jpPUfdE73bR18byvOzt30GhpXzXjk7JZsvikTMCeBzQpyOwYR4HY8fsWCKgCDmbR9MhDx4BSZLJoN4fDOo4NQ:1qGo75:S0Eigx9x8l2JHTgYc5v4rj5ouWwZKUkkMRzodxYcPuo', '2023-07-18 22:03:11.357617'),
('o7wh1ac06ajnlp0r2vsjjlm74thj336e', '.eJxVjEsOAiEQBe_C2hBapkdw6d4zkIZuZNRAMp-V8e5KMgvdVtV7LxVoW0vYFpnDxOqsANThF0ZKD6nd8J3qrenU6jpPUfdE73bR18byvOzt30GhpXzXjk7JZsvikTMCeBzQpyOwYR4HY8fsWCKgCDmbR9MhDx4BSZLJoN4fDOo4NQ:1qCqIV:Gb9tvB-uIPiw85Oo09IsTN3MAJVULiSux2V2YNRRbxM', '2023-07-07 23:34:35.113703'),
('olrzakm46fpsoupv8hmkyns55tvtkxmo', '.eJxVjEsOAiEQBe_C2hBapkdw6d4zkIZuZNRAMp-V8e5KMgvdVtV7LxVoW0vYFpnDxOqsANThF0ZKD6nd8J3qrenU6jpPUfdE73bR18byvOzt30GhpXzXjk7JZsvikTMCeBzQpyOwYR4HY8fsWCKgCDmbR9MhDx4BSZLJoN4fDOo4NQ:1qGuLT:7LI2aR-9ENzsNBeY0LWybfgR0lmaATBvd3eQ6SHlVQs', '2023-07-19 04:42:27.190743'),
('yaxvc5s1qbvcia254xqvve2q5psun3oj', '.eJxVjEsOAiEQBe_C2hBapkdw6d4zkIZuZNRAMp-V8e5KMgvdVtV7LxVoW0vYFpnDxOqsANThF0ZKD6nd8J3qrenU6jpPUfdE73bR18byvOzt30GhpXzXjk7JZsvikTMCeBzQpyOwYR4HY8fsWCKgCDmbR9MhDx4BSZLJoN4fDOo4NQ:1qGRl0:FiaMxTDOSqufLp4QvR1KsXFkHhd0kKffEQQqjenlrww', '2023-07-17 22:10:54.278926');

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
-- Indices de la tabla `core_compra`
--
ALTER TABLE `core_compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_compra_carrito_id_852b20e6_fk_core_carrito_id` (`carrito_id`),
  ADD KEY `core_compra_cliente_id_dab1b96e_fk_core_cliente_id` (`cliente_id`),
  ADD KEY `core_compra_nombreEstado_id_a8cc64f6_fk_core_estado_id` (`nombreEstado_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `authentication_user_groups`
--
ALTER TABLE `authentication_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `core_carrito`
--
ALTER TABLE `core_carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `core_cliente`
--
ALTER TABLE `core_cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `core_comentario`
--
ALTER TABLE `core_comentario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_compra`
--
ALTER TABLE `core_compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `core_estado`
--
ALTER TABLE `core_estado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `core_producto`
--
ALTER TABLE `core_producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `core_suscripcion`
--
ALTER TABLE `core_suscripcion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `core_tipoproducto`
--
ALTER TABLE `core_tipoproducto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

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
-- Filtros para la tabla `core_compra`
--
ALTER TABLE `core_compra`
  ADD CONSTRAINT `core_compra_carrito_id_852b20e6_fk_core_carrito_id` FOREIGN KEY (`carrito_id`) REFERENCES `core_carrito` (`id`),
  ADD CONSTRAINT `core_compra_cliente_id_dab1b96e_fk_core_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `core_cliente` (`id`),
  ADD CONSTRAINT `core_compra_nombreEstado_id_a8cc64f6_fk_core_estado_id` FOREIGN KEY (`nombreEstado_id`) REFERENCES `core_estado` (`id`);

--
-- Filtros para la tabla `core_producto`
--
ALTER TABLE `core_producto`
  ADD CONSTRAINT `core_producto_tipo_id_e0e92ad1_fk_core_tipoproducto_id` FOREIGN KEY (`tipo_id`) REFERENCES `core_tipoproducto` (`id`);

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
