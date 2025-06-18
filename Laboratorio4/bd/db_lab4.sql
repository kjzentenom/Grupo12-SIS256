-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 27-05-2025 a las 18:48:28
-- Versión del servidor: 8.3.0
-- Versión de PHP: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_lab4`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `correos`
--

DROP TABLE IF EXISTS `correos`;
CREATE TABLE IF NOT EXISTS `correos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_remitente` int NOT NULL,
  `id_destinatario` int NOT NULL,
  `asunto` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cuerpo` text COLLATE utf8mb4_general_ci,
  `fecha_envio` datetime DEFAULT CURRENT_TIMESTAMP,
  `estado` char(10) COLLATE utf8mb4_general_ci NOT NULL,
  `tipo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `correos`
--

INSERT INTO `correos` (`id`, `id_remitente`, `id_destinatario`, `asunto`, `cuerpo`, `fecha_envio`, `estado`, `tipo`) VALUES
(3, 2, 1, 'Nisi sit repellendu', 'Ducimus aliquip asp editado 2 6 7 9', '2025-05-24 01:08:13', 'abierto', 1),
(4, 2, 1, 'Architecto cupiditat', 'Nam rerum tenetur al', '2025-05-23 20:14:18', 'abierto', 1),
(5, 1, 2, 'Exercitation invento', 'Modi soluta atque ex', '2025-05-23 20:14:53', 'abierto', 0),
(7, 2, 1, 'Nostrud reprehenderi', 'Aut accusantium aute test 5 2 6', '2025-05-26 03:24:52', 'enviado', 1),
(10, 1, 10, 'Prueba', 'Mensaje de Notificacion Masiva', '2025-05-24 08:20:38', 'abierto', 0),
(11, 1, 2, 'Prueba 2', 'Segundo intento de notificacion masiva', '2025-05-24 08:25:47', 'abierto', 0),
(12, 1, 10, 'Prueba 2', 'Segundo intento de notificacion masiva', '2025-05-24 08:25:47', 'enviado', 1),
(13, 1, 2, 'bienvenida', 'Hola a todos', '2025-05-24 23:29:32', 'abierto', 0),
(14, 1, 10, 'bienvenida', 'Hola a todos', '2025-05-24 23:29:32', 'enviado', 1),
(15, 1, 2, 'Reunion Informativa', 'reunion informativa dia lunes 26 de Mayo\r\n', '2025-05-25 13:48:46', 'enviado', 1),
(16, 1, 10, 'Reunion Informativa', 'reunion informativa dia lunes 26 de Mayo\r\n', '2025-05-25 13:48:46', 'enviado', 1),
(17, 1, 2, 'Qui quibusdam error ', 'Iusto eligendi adipi', '2025-05-25 13:54:28', 'enviado', 1),
(18, 1, 10, 'Qui quibusdam error ', 'Iusto eligendi adipi', '2025-05-25 13:54:28', 'enviado', 1),
(19, 1, 2, 'Neque officia ut odi', 'Quidem ipsam quidem ', '2025-05-25 13:54:52', 'enviado', 1),
(20, 1, 10, 'Neque officia ut odi', 'Quidem ipsam quidem ', '2025-05-25 13:54:52', 'enviado', 1),
(21, 1, 2, 'Sint aute architecto', 'Sapiente molestias r', '2025-05-25 13:55:28', 'enviado', 1),
(22, 1, 10, 'Sint aute architecto', 'Sapiente molestias r', '2025-05-25 13:55:28', 'enviado', 1),
(23, 1, 2, 'Similique sint ad de', 'Nobis veniam quia d', '2025-05-25 22:03:04', 'enviado', 1),
(24, 1, 10, 'Veniam aliquid qui ', 'Ipsa sint voluptas ', '2025-05-25 14:00:38', 'enviado', 1),
(25, 1, 1, 'Aliquip a dolore qui', 'Ratione odit repelle', '2025-05-25 21:30:16', 'pendiente', 1),
(26, 1, 2, 'Distinctio Molestia', 'Ea ea vitae ut numqu', '2025-05-25 22:25:46', 'enviado', 1),
(27, 1, 10, 'Quibusdam adipisicin', 'Sed quis est lorem u', '2025-05-25 22:24:38', 'pendiente', 1),
(28, 1, 1, 'Consectetur omnis d', 'Nihil anim rerum eli', '2025-05-26 02:11:11', 'enviado', 1),
(29, 2, 15, 'Do tempor placeat s', 'Harum non nulla recu', '2025-05-26 03:11:09', 'enviado', 1),
(30, 2, 16, 'Vitae quo irure perf', 'Facere anim dolor qu', '2025-05-26 03:11:39', 'enviado', 1),
(31, 2, 14, 'Voluptates numquam e', 'Sint sunt aut illum', '2025-05-26 03:13:40', 'enviado', 1),
(32, 2, 14, 'Explicabo Quis Nam ', 'Omnis reiciendis qui', '2025-05-26 03:17:54', 'enviado', 1),
(33, 2, 16, 'Aliquid dicta quia q', 'Magni et quas est es 5', '2025-05-26 03:24:57', 'pendiente', 1),
(34, 2, 13, 'Eiusmod voluptatem e', 'Molestiae impedit p', '2025-05-26 03:22:58', 'enviado', 1),
(35, 2, 13, 'Ullam eu non aut asp', 'Rerum ratione necess', '2025-05-26 03:23:12', 'pendiente', 1),
(36, 2, 14, 'Aperiam est anim lab', 'In voluptate volupta', '2025-05-26 03:23:28', 'enviado', 1),
(37, 2, 2, 'Et nulla consectetur', 'Ipsam in dolore eos ', '2025-05-26 03:25:11', 'enviado', 1),
(38, 1, 14, 'Irure doloribus aute', 'Quae neque cum persp', '2025-05-26 03:27:07', 'enviado', 1),
(39, 1, 2, 'Aliqua Autem magni ', 'Quam quia laudantium', '2025-05-26 03:27:29', 'enviado', 1),
(40, 1, 10, 'Aliqua Autem magni ', 'Quam quia laudantium', '2025-05-26 03:27:29', 'enviado', 1),
(41, 1, 13, 'Aliqua Autem magni ', 'Quam quia laudantium', '2025-05-26 03:27:29', 'enviado', 1),
(42, 1, 14, 'Aliqua Autem magni ', 'Quam quia laudantium', '2025-05-26 03:27:29', 'enviado', 1),
(43, 1, 15, 'Aliqua Autem magni ', 'Quam quia laudantium', '2025-05-26 03:27:29', 'enviado', 1),
(44, 1, 16, 'Aliqua Autem magni ', 'Quam quia laudantium', '2025-05-26 03:27:29', 'enviado', 1),
(45, 1, 17, 'Aliqua Autem magni ', 'Quam quia laudantium', '2025-05-26 03:27:29', 'enviado', 1),
(46, 1, 18, 'Aliqua Autem magni ', 'Quam quia laudantium', '2025-05-26 03:27:29', 'enviado', 1),
(47, 1, 2, 'Dolore esse adipisic', 'Irure eos laborum ', '2025-05-26 03:29:49', 'enviado', 1),
(48, 1, 10, 'Dolore esse adipisic', 'Irure eos laborum ', '2025-05-26 03:29:49', 'enviado', 1),
(49, 1, 13, 'Dolore esse adipisic', 'Irure eos laborum ', '2025-05-26 03:29:49', 'enviado', 1),
(50, 1, 14, 'Dolore esse adipisic', 'Irure eos laborum ', '2025-05-26 03:29:49', 'enviado', 1),
(51, 1, 15, 'Dolore esse adipisic', 'Irure eos laborum ', '2025-05-26 03:29:49', 'enviado', 1),
(52, 1, 16, 'Dolore esse adipisic', 'Irure eos laborum ', '2025-05-26 03:29:49', 'enviado', 1),
(53, 1, 17, 'Dolore esse adipisic', 'Irure eos laborum ', '2025-05-26 03:29:49', 'enviado', 1),
(54, 1, 18, 'Dolore esse adipisic', 'Irure eos laborum ', '2025-05-26 03:29:49', 'enviado', 1),
(55, 10, 1, 'Exercitation aliquid', 'Mollit consequatur ', '2025-05-26 17:17:20', 'enviado', 1),
(56, 21, 2, 'Eu velit vel quis do', 'Explicabo Omnis nul', '2025-05-26 17:29:37', 'abierto', 1),
(57, 22, 23, 'Consulta sobre Proyecto A', 'Hola María, me gustaría discutir el proyecto A contigo. ¿Tienes un momento esta semana?', '2025-05-27 09:00:00', 'abierto', 1),
(58, 22, 24, 'Reunión de Equipo', 'Carlos, ¿confirmas tu asistencia a la reunión del lunes a las 10:00 AM?', '2025-05-27 10:15:00', 'enviado', 1),
(59, 22, 25, 'Documentos Adjuntos', 'Laura, te envío los documentos que solicitaste para la presentación.', '2025-05-27 11:30:00', 'abierto', 1),
(60, 23, 22, 'Re: Consulta sobre Proyecto A', 'Hola Juan, sí, tengo disponibilidad el martes por la tarde. Avísame.', '2025-05-27 10:05:00', 'abierto', 1),
(61, 23, 26, 'Actualización del Informe', 'David, ¿cómo va el progreso del informe mensual? Necesito una actualización.', '2025-05-27 12:00:00', 'pendiente', 1),
(62, 23, 27, 'Pregunta sobre la Nueva Política', 'Ana, tengo una duda sobre la implementación de la nueva política. ¿Podrías aclararme?', '2025-05-27 14:00:00', 'enviado', 1),
(63, 24, 22, 'Re: Reunión de Equipo', 'Confirmado, Juan. Estaré allí el lunes.', '2025-05-27 10:30:00', 'abierto', 1),
(64, 24, 28, 'Material para la Presentación', 'Sofía, ¿me puedes enviar el material que preparamos para la presentación de mañana?', '2025-05-27 15:00:00', 'enviado', 1),
(65, 24, 29, 'Propuesta de Colaboración', 'Pablo, quería proponerte una colaboración en el próximo proyecto.', '2025-05-27 16:30:00', 'abierto', 1),
(66, 25, 22, 'Re: Documentos Adjuntos', 'Gracias Juan, los revisaré pronto.', '2025-05-27 11:45:00', 'enviado', 1),
(67, 25, 30, 'Horarios de Disponibilidad', 'Elena, ¿podrías enviarme tus horarios de disponibilidad para la próxima semana?', '2025-05-27 13:00:00', 'abierto', 1),
(68, 25, 31, 'Seguimiento de Tarea', 'Miguel, ¿pudiste avanzar con la tarea que te asigné el viernes?', '2025-05-27 14:15:00', 'pendiente', 1),
(69, 26, 23, 'Re: Actualización del Informe', 'Hola María, el informe está casi listo. Te lo envío a final del día.', '2025-05-27 12:30:00', 'abierto', 1),
(70, 26, 32, 'Duda sobre el Presupuesto', 'Paula, necesito aclarar una duda sobre el nuevo presupuesto.', '2025-05-27 15:30:00', 'enviado', 1),
(71, 26, 33, 'Confirmación de Envío', 'Alejandro, ¿recibiste el paquete que te envié ayer?', '2025-05-27 16:45:00', 'abierto', 1),
(72, 27, 23, 'Re: Pregunta sobre la Nueva Política', 'Sí, María. Te explico los detalles en la llamada de mañana.', '2025-05-27 14:30:00', 'enviado', 1),
(73, 27, 34, 'Agenda para la Próxima Semana', 'Isabel, ¿podrías compartir la agenda para la próxima semana?', '2025-05-27 09:30:00', 'abierto', 1),
(74, 27, 35, 'Comentarios sobre el Borrador', 'Francisco, te envié mis comentarios sobre el borrador del documento.', '2025-05-27 11:00:00', 'pendiente', 1),
(78, 29, 24, 'Re: Propuesta de Colaboración', 'Pablo, me interesa mucho tu propuesta. Hablemos pronto.', '2025-05-27 16:40:00', 'abierto', 1),
(79, 29, 38, 'Fechas para el Curso', 'Rocío, ¿ya tenemos las fechas definitivas para el curso de capacitación?', '2025-05-27 09:10:00', 'enviado', 1),
(81, 30, 25, 'Re: Horarios de Disponibilidad', 'Hola Elena, te adjunto mi calendario de disponibilidad para la próxima semana.', '2025-05-27 13:10:00', 'enviado', 1),
(82, 30, 40, 'Invitación a Evento', 'Natalia, te invito a nuestro evento de lanzamiento el próximo mes.', '2025-05-27 15:40:00', 'abierto', 1),
(83, 30, 22, 'Asunto importante', 'Juan, necesito hablar contigo sobre un tema urgente. ¿Cuándo puedes?', '2025-05-27 17:00:00', 'abierto', 1),
(85, 31, 23, 'Confirmación de Envío de Archivo', 'María, te confirmo que he enviado el archivo de la presentación.', '2025-05-27 10:45:00', 'enviado', 1),
(86, 31, 24, 'Nuevas Ideas para el Proyecto', 'Carlos, he estado pensando en algunas ideas nuevas para el proyecto. ¿Podemos hablar?', '2025-05-27 12:15:00', 'abierto', 1),
(87, 32, 26, 'Re: Duda sobre el Presupuesto', 'Hola David, sí, dime tu duda y la resolvemos.', '2025-05-27 15:50:00', 'abierto', 1),
(90, 33, 26, 'Re: Confirmación de Envío', 'Sí Alejandro, recibí el paquete. Muchas gracias.', '2025-05-27 17:00:00', 'enviado', 1),
(91, 33, 29, 'Coordinación de Tareas', 'Sofía, coordinemos las tareas para la próxima semana.', '2025-05-27 10:30:00', 'abierto', 1),
(92, 33, 30, 'Aclaración de Requisitos', 'Pablo, necesito una aclaración sobre los requisitos del nuevo sistema.', '2025-05-27 11:45:00', 'pendiente', 1),
(93, 34, 27, 'Re: Agenda para la Próxima Semana', 'Hola Isabel, te adjunto la agenda. Cualquier cambio, me avisas.', '2025-05-27 09:45:00', 'abierto', 1),
(96, 35, 27, 'Re: Comentarios sobre el Borrador', 'Gracias Francisco, ya estoy revisando tus comentarios.', '2025-05-27 11:15:00', 'abierto', 1),
(97, 35, 33, 'Disponibilidad para Entrevista', 'Alejandro, ¿cuándo estarías disponible para una entrevista?', '2025-05-27 15:00:00', 'enviado', 1),
(99, 36, 28, 'Re: Recordatorio de Pago', 'Recibido, Carmen. Procederé con el pago.', '2025-05-27 14:00:00', 'enviado', 1),
(100, 36, 29, 'Pregunta sobre la Facturación', 'Sofía, tengo una pregunta sobre la última factura. ¿Podrías aclararme?', '2025-05-27 12:45:00', 'pendiente', 1),
(101, 36, 30, 'Coordinación de Entrega', 'Pablo, coordinemos la entrega de los materiales para el viernes.', '2025-05-27 09:00:00', 'abierto', 1),
(102, 37, 28, 'Re: Soporte Técnico', 'Hola Daniel, claro. ¿Cuál es el problema que tienes?', '2025-05-27 10:15:00', 'abierto', 1),
(103, 37, 34, 'Revisión de Contrato', 'Isabel, ¿pudiste revisar el contrato que te envié?', '2025-05-27 11:30:00', 'enviado', 1),
(104, 37, 35, 'Consulta de Disponibilidad', 'Francisco, estoy tratando de organizar una reunión. ¿Cuál es tu disponibilidad?', '2025-05-27 13:00:00', 'abierto', 1),
(105, 38, 29, 'Re: Fechas para el Curso', 'Sí Rocío, las fechas definitivas están confirmadas. Te las envío.', '2025-05-27 09:25:00', 'abierto', 1),
(106, 38, 36, 'Detalles de la Propuesta', 'Carmen, quería darte los detalles de la propuesta que discutimos.', '2025-05-27 14:00:00', 'enviado', 1),
(107, 38, 37, 'Aclaración de Punto', 'Sergio, me gustaría aclarar un punto sobre el último informe.', '2025-05-27 15:30:00', 'pendiente', 1),
(108, 39, 29, 'Re: Consulta de Mercado', 'Hola Sergio, sí, tengo algunos datos recientes. Te los adjunto.', '2025-05-27 11:35:00', 'abierto', 1),
(109, 39, 38, 'Respuesta a tu Consulta', 'Daniel, en respuesta a tu consulta sobre el curso...', '2025-05-27 10:00:00', 'enviado', 1),
(110, 39, 40, 'Coordinación de Proyecto', 'Natalia, hablemos sobre la coordinación de nuestro nuevo proyecto.', '2025-05-27 12:00:00', 'abierto', 1),
(111, 40, 30, 'Re: Invitación a Evento', 'Gracias Pablo, me gustaría asistir al evento. Confirmo mi asistencia.', '2025-05-27 15:55:00', 'abierto', 1),
(112, 40, 39, 'Re: Coordinación de Proyecto', 'Rocío, claro. ¿Cuándo te viene bien para una llamada?', '2025-05-27 12:15:00', 'enviado', 1),
(113, 40, 41, 'Próximos Pasos para la Colaboración', 'Natalia, quería discutir los próximos pasos para nuestra colaboración.', '2025-05-27 13:00:00', 'pendiente', 1),
(114, 41, 30, 'Pregunta sobre el Evento', 'Pablo, tengo una pregunta sobre el evento. ¿A qué hora es?', '2025-05-27 16:10:00', 'abierto', 1),
(115, 41, 22, 'Saludos y Actualización', 'Hola Juan, solo quería saludarte y darte una actualización rápida sobre el tema X.', '2025-05-27 17:30:00', 'enviado', 1),
(116, 41, 23, 'Consideraciones para el Futuro', 'María, he estado pensando en algunas consideraciones para el futuro del proyecto.', '2025-05-27 08:45:00', 'abierto', 1),
(117, 22, 38, 'Seguimiento de Ticket', 'Hola Daniel, ¿tienes alguna novedad sobre el ticket de soporte que abrí?', '2025-05-27 09:40:00', 'pendiente', 1),
(118, 22, 39, 'Felicitaciones por el Lanzamiento', 'Rocío, quería felicitarte por el éxito del lanzamiento de la campaña.', '2025-05-27 10:50:00', 'enviado', 0),
(119, 22, 40, 'Reunión de Sincronización', 'Sergio, propongo una reunión rápida para sincronizar el avance.', '2025-05-27 11:00:00', 'abierto', 1),
(120, 23, 37, 'Ajustes en la Estrategia', 'Carmen, he estado pensando en algunos ajustes para la estrategia del Q3.', '2025-05-27 13:10:00', 'abierto', 1),
(121, 23, 35, 'Pregunta Urgente', 'Isabel, ¿estás disponible para una llamada rápida? Tengo una pregunta urgente.', '2025-05-27 14:20:00', 'enviado', 0),
(122, 23, 36, 'Revisión de Informe Mensual', 'Francisco, por favor revisa el informe mensual y envíame tus comentarios.', '2025-05-27 15:30:00', 'pendiente', 1),
(123, 24, 34, 'Estado de la Campaña', 'Alejandro, ¿cuál es el estado actual de la campaña de marketing?', '2025-05-27 10:00:00', 'abierto', 1),
(124, 24, 33, 'Confirmación de Agenda', 'Paula, me gustaría confirmar la agenda de nuestra reunión del jueves.', '2025-05-27 11:10:00', 'enviado', 1),
(125, 24, 32, 'Ideas para Próximo Proyecto', 'Miguel, he tenido algunas ideas para el próximo proyecto. Hablemos.', '2025-05-27 12:20:00', 'pendiente', 0),
(126, 25, 31, 'Solicitud de Información', 'Elena, necesito cierta información para el reporte de ventas. ¿Podrías ayudarme?', '2025-05-27 13:30:00', 'abierto', 1),
(128, 25, 27, 'Cancelación de Cita', 'Ana, lamento informarte que tengo que cancelar nuestra cita para hoy.', '2025-05-27 15:50:00', 'enviado', 0),
(129, 26, 25, 'Re: Recordatorio de Entrega', 'Hola Laura, sí, lo tengo en mente. Te lo enviaré antes de la fecha límite.', '2025-05-27 14:55:00', 'abierto', 1),
(130, 26, 24, 'Actualización del Estado', 'Carlos, solo quería darte una actualización rápida sobre el estado del cliente X.', '2025-05-27 16:00:00', 'enviado', 1),
(132, 27, 25, 'Re: Cancelación de Cita', 'Entendido Laura, no te preocupes. Reprogramamos cuando puedas.', '2025-05-27 16:05:00', 'abierto', 1),
(134, 27, 22, 'Duda sobre la Integración', 'Juan, tengo una duda sobre la integración de los nuevos módulos.', '2025-05-27 11:30:00', 'pendiente', 0),
(138, 29, 28, 'Re: Confirmación de Reunión', 'Confirmado Javier. Gracias.', '2025-05-27 09:15:00', 'enviado', 1),
(140, 29, 32, 'Duda sobre el Cronograma', 'Miguel, tengo una duda sobre el cronograma de la fase 2. ¿Podemos revisarlo?', '2025-05-27 12:00:00', 'pendiente', 0),
(142, 30, 22, 'Discusión sobre el Proyecto X', 'Juan, hablemos sobre los avances y desafíos del Proyecto X.', '2025-05-27 13:00:00', 'enviado', 1),
(144, 31, 25, 'Re: Solicitud de Información', 'Claro Laura, te envío la información de ventas en un momento.', '2025-05-27 13:45:00', 'enviado', 1),
(146, 31, 24, 'Disponibilidad para Consulta', 'Carlos, ¿estás disponible para una consulta rápida sobre el software?', '2025-05-27 11:30:00', 'abierto', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nombre` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `correo` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `nivel` tinyint NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `user`, `password`, `nombre`, `correo`, `nivel`, `estado`) VALUES
(1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Administrador', 'admin@sis256.edu', 1, 1),
(2, 'user', '12dea96fec20593566ab75692c9949596833adc9', 'Usuario', 'user@sis256.edu', 0, 1),
(10, 'zeke', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'kevin', 'kevin@sis256.edu', 0, 0),
(22, 'juanperez', 'e22e5349e8a719d4352723c3b06385d3', 'Juan Pérez', 'juan.perez@email.com', 0, 1),
(23, 'mariagomez', '6f8c7b801a2f15e86d0b5c1c8f1e6b8c', 'María Gómez', 'maria.gomez@email.com', 0, 1),
(24, 'carlosrodriguez', 'a7d1e8c9f0b2a3d4e5f6a7b8c9d0e1f2', 'Carlos Rodríguez', 'carlos.r@email.com', 0, 1),
(25, 'laurasanchez', 'b3c4d5e6f7a8b9c0d1e2f3a4b5c6d7e8', 'Laura Sánchez', 'laura.s@email.com', 0, 0),
(26, 'davidmartinez', 'c9d0e1f2a3b4c5d6e7f8a9b0c1d2e3f4', 'David Martínez', 'david.m@email.com', 0, 1),
(27, 'anadelgado', 'd5e6f7a8b9c0d1e2f3a4b5c6d7e8f9a0', 'Ana Delgado', 'ana.d@email.com', 0, 1),
(28, 'javierfernandez', 'e1f2a3b4c5d6e7f8a9b0c1d2e3f4a5b6', 'Javier Fernández', 'javier.f@email.com', 0, 1),
(29, 'sofiahernandez', 'f7a8b9c0d1e2f3a4b5c6d7e8f9a0b1c2', 'Sofía Hernández', 'sofia.h@email.com', 0, 0),
(30, 'pablogarcia', 'a3b4c5d6e7f8a9b0c1d2e3f4a5b6c7d8', 'Pablo García', 'pablo.g@email.com', 0, 1),
(31, 'elenalopez', 'b9c0d1e2f3a4b5c6d7e8f9a0b1c2d3e4', 'Elena López', 'elena.l@email.com', 0, 1),
(32, 'miguelruiz', 'c5d6e7f8a9b0c1d2e3f4a5b6c7d8e9f0', 'Miguel Ruiz', 'miguel.r@email.com', 0, 1),
(33, 'paulavazquez', 'd1e2f3a4b5c6d7e8f9a0b1c2d3e4f5a6', 'Paula Vázquez', 'paula.v@email.com', 0, 0),
(34, 'alexjimenez', 'e7f8a9b0c1d2e3f4a5b6c7d8e9f0a1b2', 'Alejandro Jiménez', 'alex.j@email.com', 0, 1),
(35, 'isabeldiaz', 'f3a4b5c6d7e8f9a0b1c2d3e4f5a6b7c8', 'Isabel Díaz', 'isabel.d@email.com', 0, 1),
(36, 'franciscoserra', 'a9b0c1d2e3f4a5b6c7d8e9f0a1b2c3d4', 'Francisco Serra', 'franco.s@email.com', 0, 1),
(37, 'carmenmartin', 'b5c6d7e8f9a0b1c2d3e4f5a6b7c8d9e0', 'Carmen Martín', 'carmen.m@email.com', 0, 0),
(38, 'danieltorres', 'c1d2e3f4a5b6c7d8e9f0a1b2c3d4e5f6', 'Daniel Torres', 'daniel.t@email.com', 0, 1),
(39, 'rocioflores', 'd7e8f9a0b1c2d3e4f5a6b7c8d9e0f1a2', 'Rocío Flores', 'rocio.f@email.com', 0, 1),
(40, 'sergiomoreno', 'e3f4a5b6c7d8e9f0a1b2c3d4e5f6a7b8', 'Sergio Moreno', 'sergio.m@email.com', 0, 1),
(41, 'natalialuna', 'f9a0b1c2d3e4f5a6b7c8d9e0f1a2b3c4', 'Natalia Luna', 'natalia.l@email.com', 0, 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
