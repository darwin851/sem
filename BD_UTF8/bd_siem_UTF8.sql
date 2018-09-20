-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-09-2018 a las 16:18:10
-- Versión del servidor: 10.1.25-MariaDB
-- Versión de PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_siem`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad`
--

CREATE TABLE `actividad` (
  `ID_ACTIVIDAD` int(11) NOT NULL,
  `COD_ACTIVIDAD` varchar(10) CHARACTER SET latin1 NOT NULL,
  `NBR_ACTIVIDAD` varchar(100) CHARACTER SET latin1 NOT NULL,
  `DESCRIPCION_ACTIVIDAD` varchar(300) CHARACTER SET latin1 NOT NULL,
  `ID_COMPONENTE` int(11) NOT NULL,
  `ACTIVO` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `actividad`
--

INSERT INTO `actividad` (`ID_ACTIVIDAD`, `COD_ACTIVIDAD`, `NBR_ACTIVIDAD`, `DESCRIPCION_ACTIVIDAD`, `ID_COMPONENTE`, `ACTIVO`) VALUES
(1, '1.1', 'Formación a docentes de tercer ciclo y bachillerato ', 'Formación a docentes', 1, 1),
(3, '1.2', 'Formación para docentes de primaria', 'Formación a docentes primaria', 1, 1),
(4, '1.3', 'Formación general para el 100% de docentes de los SI EITP', 'Formación a docentes SI EITP', 1, 1),
(5, '1.4', 'Formación para directores y subdirectores ', 'Formación a directores/sub-directores', 1, 1),
(6, '1.5', 'Formación inicial a docentes en educación y género ', 'Formación inicial a docentes', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `ID_ASIGNATURA` int(11) NOT NULL,
  `COD_ASIGNATURA` varchar(3) CHARACTER SET latin1 NOT NULL,
  `NBR_ASIGNATURA` varchar(100) CHARACTER SET latin1 NOT NULL,
  `ACTIVO` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`ID_ASIGNATURA`, `COD_ASIGNATURA`, `NBR_ASIGNATURA`, `ACTIVO`) VALUES
(1, 'LEN', 'LENGUAJE', 1),
(2, 'SOC', 'SOCIALES', 1),
(3, 'BIO', 'BIOLOGÍA', 1),
(4, 'QUI', 'QUÍMICA', 1),
(5, 'FIS', 'FÍSICA', 1),
(6, 'MAT', 'MATEMÁTICAS', 1),
(7, 'NAT', 'CIENCIAS NATURALES', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura_x_grado_x_recurso_humano`
--

CREATE TABLE `asignatura_x_grado_x_recurso_humano` (
  `ID_ASIGNATURA_X_GRADO_X_RECURSO_HUMANO` int(11) NOT NULL,
  `ID_GRADO` int(11) NOT NULL,
  `ID_ASIGNATURA` int(11) NOT NULL,
  `ID_RECURSO_HUMANO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo_rol`
--

CREATE TABLE `cargo_rol` (
  `ID_CARGO_ROL` int(11) NOT NULL,
  `COD_CARGO_ROL` varchar(3) NOT NULL,
  `NBR_CARGO_ROL` varchar(100) NOT NULL,
  `ACTIVO` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cargo_rol`
--

INSERT INTO `cargo_rol` (`ID_CARGO_ROL`, `COD_CARGO_ROL`, `NBR_CARGO_ROL`, `ACTIVO`) VALUES
(1, 'DIR', 'DIRECTOR', 1),
(2, 'SDR', 'SUB-DIRECTOR', 1),
(3, 'ALM', 'ALUMNO O ALUMNA', 1),
(4, 'DOC', 'DOCENTE', 1),
(5, 'INS', 'INSTITUCIÓN U ORGNIZACIÓN DE APOYO A LA ESCUELA', 1),
(6, 'PAD', 'MADRE/PADRE DE FAMILIA', 1),
(7, 'FOM', 'FOMILENIO II', 1),
(8, 'OFI', 'OFICIAL DEL MINISTERIO DE EDUCACIÓN', 1),
(9, 'COM', 'COMITÉS DEL CENTRO ESCOLAR', 1),
(10, 'ESP', 'ESPECIALISTAS', 1),
(11, 'OTR', 'OTROS', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo_rol_x_recurso_humano`
--

CREATE TABLE `cargo_rol_x_recurso_humano` (
  `ID_CARGO_ROL_X_RECURSO_HUMANO` int(11) NOT NULL,
  `ID_RECURSO_HUMANO` int(11) NOT NULL,
  `ID_CARGO_ROL` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cargo_rol_x_recurso_humano`
--

INSERT INTO `cargo_rol_x_recurso_humano` (`ID_CARGO_ROL_X_RECURSO_HUMANO`, `ID_RECURSO_HUMANO`, `ID_CARGO_ROL`) VALUES
(10, 37, 1),
(11, 39, 1),
(12, 39, 2),
(13, 39, 3),
(14, 39, 4),
(15, 40, 7),
(16, 40, 8),
(17, 40, 9),
(18, 40, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centro_educativo`
--

CREATE TABLE `centro_educativo` (
  `ID_CENTRO_EDUCATIVO` int(11) NOT NULL,
  `COD_CENTRO_EDUCATIVO` varchar(10) NOT NULL,
  `NBR_CENTRO_EDUCATIVO` varchar(200) NOT NULL,
  `DIRECCION` varchar(200) NOT NULL,
  `NOMBRE_DIRECTOR` varchar(100) NOT NULL,
  `TELEFONO` varchar(20) NOT NULL,
  `CELULAR` varchar(20) NOT NULL,
  `CORREO_ELECTRONICO` varchar(50) NOT NULL,
  `NOMBRE_CONTACTO` varchar(100) NOT NULL,
  `CARGO_CONTACTO` varchar(40) NOT NULL,
  `TELEFONO_CONTACTO` varchar(20) NOT NULL,
  `LATITUD` varchar(50) DEFAULT NULL,
  `LONGITUD` varchar(50) DEFAULT NULL,
  `ID_MUNICIPIO` int(11) NOT NULL,
  `ID_SISTEMA_INTEGRADO` int(11) NOT NULL,
  `ACTIVO` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `centro_educativo`
--

INSERT INTO `centro_educativo` (`ID_CENTRO_EDUCATIVO`, `COD_CENTRO_EDUCATIVO`, `NBR_CENTRO_EDUCATIVO`, `DIRECCION`, `NOMBRE_DIRECTOR`, `TELEFONO`, `CELULAR`, `CORREO_ELECTRONICO`, `NOMBRE_CONTACTO`, `CARGO_CONTACTO`, `TELEFONO_CONTACTO`, `LATITUD`, `LONGITUD`, `ID_MUNICIPIO`, `ID_SISTEMA_INTEGRADO`, `ACTIVO`) VALUES
(1, '10156', 'Complejo Educativo Profesor Pablo Soriano Urquilla', '19Av. Sur y 6ª calle ote 13 el centr', 'Jose Carlos Barraza Guinea ', 'NA', '74354175', 'barraza.josecarlos@gmail.com', 'José Carlos Barraza', 'NA', '24201018', '294426  13  46', '13.7  89  48', 144, 1, 1),
(2, '10157', 'Centro Escolar Cantón El Cortez', 'A 3km de San Pedro Puxtla de carretera hacia guaymango', 'Edwin Nestor González Araujo', '78858288', '78858288', 'edwinnestrg@gmail.com', 'Edwin Nestor González Araujo', 'Director', '78858288', '291324  13  44', '32.7  89  48', 144, 1, 1),
(3, '10159', 'Centro Escolar Cantón La Concepcion', 'San Pedro Puxtla, Ahuachapan', 'Jose Balmore Ortiz Flores', 'NA', '77933840', 'jb_1001@hotmail.es', 'Jose Balmore Ortiz Flores', 'Director', '77933840', '299059  13  48', '44.6  89  47', 144, 1, 1),
(4, '60049', 'Centro Escolar Cantón La Esperanza.', 'NA', 'Carlos Alfonso Garcia Gomez.', 'NA', '78523330', 'caralfgarcia@hotmail.com', 'Carlos Alfonso Garcia Gomez.', 'Director', '78523330', '296398  13  47', '17.7  89  49', 140, 1, 1),
(5, '60079', 'Centro Escolar Cantón Pululapa', 'NA', 'Abel Zelada Solis -', '24155413', 'NA', 'NA', 'Abel Zelada Solís', 'NA', '24155413', '294146  13  46', '4.5  89  49', 144, 1, 1),
(6, '60081', 'Centro Escolar Cantón El Durazno', 'San Pedro Puxtla Canton El Durazno', 'José Isaias Marquez Cáceres', '70632329', '70632329', 'NA', 'José Isaias Marquez Cáceres', 'Director', '70632329', '296936  13  47', '35.4  89  48', 144, 1, 1),
(7, '60082', 'Centro Escolar Cantón Texispulco', 'Canton texispulco', 'Ana Elizabeth Santillana de Cuellar', 'NA', '77446712', 'santicuellar805@gmail.cm', 'Ana Elizabeth Santillana de Cuellar', 'Directora', '77446712', '293186  13  45', '33.5  89  47', 144, 1, 1),
(8, '60107', 'Centro Escolar Cantón Guachipilin', 'Cton Guachipilincas Los Pérez', 'Roberto Antonio De León', '76862602', '76862602', 'NA', 'Roberto Antonio De León', 'Director', '76862602', '295052  13  46', '34.3  89  47', 144, 1, 1),
(9, '86342', 'Centro Escolar Caserio Los Altuve', 'NA', 'Lidia Esperanza Quintanilla', 'NA', '78551157', 'NA', 'Lidia Esperanza Quintanilla', 'Directora', 'NA', '296268  13  47', '13.8  89  47', 144, 1, 1),
(10, '10099', 'Complejo Educativo de Guaymango', 'Calle principal, barrio el centro, Guaymango', 'Noel Lopez', 'NA', '70689465', 'NA', 'Oscar Remberto Valdez', 'Sub diretor', '2420 0413', '292003  13  44', '54.5  89  50', 140, 2, 1),
(11, '60039', 'Centro Escolar Cantón El Escalon', 'NA', 'Jose Daniel Santos Machado', 'NA', '78627199', 'ds46661@gmail.com', 'NA', 'NA', 'NA', '290307  13  43', '59.5  89  49', 140, 2, 1),
(12, '60048', 'Centro Escolar Cantón los puentecitos', 'Km 12 1/2 Canton los puentecitos carretra a Guaymango', 'Rina Consuelo Orellana', 'NA', '70528856 70920684', 'rinaconsuelo.76@gmail.com', 'Evelin del carmen Rivera', 'Maestra', 'NA', '294036  13  46', '0.5  89  50', 140, 2, 1),
(13, '60050', 'Centro Escoar Cantón la Paz', 'km 6 Hacia el Norte desvio del centro escolar canton el escalon', '-', 'NA', '78581606', 'oscarhino.om @gmail.com', 'Oscar Ernesto Castaneda Moran', 'NA', 'NA', '293634  13  45', '47.7  89  49', 140, 2, 1),
(14, '60051', 'Centro Escolar Cantón El Carmen', 'Canton el carmen', 'Raul Armando Casoverde', 'NA', '77363071', 'casoverderaul008@gmail.com', 'Raul Armando Casoverde Menendez', 'NA', 'NA', '295604  13  46', '51.7  89  49', 140, 2, 1),
(15, '60052', 'Centro Escolar Cantón San Andres', 'Canton San Andres, Guaymango, Ahuachapan', 'Elmer Mauricio Mendez Chavez', 'NA', '70076023', 'elmermendezw@gmail.com', 'Elmer Mauricio Mendez Chavez', 'NA', 'NA', '290670  13  44', '11  89  51', 140, 2, 1),
(16, '10616', 'Instituto Nacional de Guaymango', 'parque metancingo, canton alejo, Guaymango', '-', 'NA', '76000961', 'iuguay@outlook.es', 'Rolando Gonzales', 'NA', 'NA', '0', '0', 140, 2, 1),
(17, '10110', 'Complejo Educativo Colonia Nueva', 'Km 10/2 carretera hacia la hachadura', 'Saúl Antonio Dominguez', '24209015', '76645604', 'cecn.2013@hotmail.com', 'Saúl Antonio Dominguez', 'Director', '24209015', '288241  13  42', '50.4  89  58', 141, 3, 1),
(18, '10111', 'Centro Escolar Hacienda Hoja de Sal', '9 1/2 km. Nrte de C.E Guayapa abajo', 'Nidia Cecilia Gutierrez de Rodriguez', 'NA', '79967224', 'nidiaderodriguez61@gmail.com', 'Nidia Cecilia Gutierrez de Rodriguez', 'Directora', '79967224', '293908  13  45', '54.9  89  57', 141, 3, 1),
(19, '10113', 'Centro Escolar Caserío Cuilapa Canton Guayapa Arriba Jujutla Ahuchapan', 'km 10 carretera  a la hachadura', 'Héctor Owaldo Calzadilla', 'NA', '70420382', 'owaldo.cuilapa@gmail.com', 'Héctor Owaldo Calzadilla', 'Director', '70420382', '290112  13  43', '51.5  89  57', 141, 3, 1),
(20, '10118', 'Centro Escolar Caserío EL Mango', 'km101 carretera a la hachadura', 'Ana Victoria Nerio de Perla', '24517364', '61808422', 'vickydeperla@hotmail.com', 'Ana Victoria Nerio de Perla', 'Directora', '24517364', '287659  13  42', '31.6  89  57', 141, 3, 1),
(21, '10707', 'Complejo Educativo Barra de Santiago', 'Calle a la bocana el zapote, contiguo unidad de salud barra de santiago', 'Oscar Orlando Córtez Escobar', '24201824', '71495433', 'oscarolando2010@hotmail.com', 'Oscar Orlando Córtez Escobar', 'Director', '24201824', '285633  13  41', '25.1  90  0', 141, 3, 1),
(22, '14861', 'Centro Escolar Colonia El Cocalito Canton San Antonio', 'Km 99 carretera a la hachadura', 'Carmen Rosibel Orellana', 'NA', '71401152', 'gotita.princesa@hotmail.com', 'Carmen Rosibel Orellana', 'Directora', '71401152', '286369  13  41', '49.8  89  56', 141, 3, 1),
(23, '60259', 'Centro Escolar Guayapa Arriba Canton Guayapa Arriba', 'Desvio El capulin 6km1/2 canton guayapa arriba', 'Glenda Margatita Montejo de Vega', 'NA', '76810770', 'glendamontejodevega01@gmail.com', 'Glenda Margatita Montejo de Vega', 'Directora', '76810770', '293042  13  45', '26.6  89  57', 141, 3, 1),
(24, '10755', 'CENTRO ESCOLAR JUJUTLA / APERTURA EN EL 2019', 'NA', '-', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', '0', '0', 141, 3, 1),
(25, '11059', 'Centro Escolar Cantón El Zonte.', 'NA', 'Ysrael Antonio Urbina.', 'NA', '70548041', 'ysraelantoniourbina@gmail.com', 'Ysrael Antonio Urbina.', 'Director', '79864647', '264094  13  29', '50  89  26', 79, 4, 1),
(26, '11061', 'Complejo Educativo Jose Simeón Cañas.', 'Carretera Elitoral Desvio a Chiltiupan km 2 Cantón Julupe.', 'María Aracely Alas de Ramos.', 'NA', '78464918', 'Aracelyalas@hotmail.com', 'María Aracely Alas de Ramos.', 'Directora', '78464918', '266144  13  30', '57  89  27', 79, 4, 1),
(27, '68038', 'Centro Escolar Cantón Siberia.', 'Carretera el litoras km 53 desvio el zonte  km 7 1/2 norte.', 'Blanca Lilian Argueta Tobar.', 'NA', '74812865', 'Blankyargueta2012@gmail.com', 'Blanca Lilian Argueta Tobar.', 'Docente/Directora', 'NA', '270591  13  33', '21  89  27', 79, 4, 1),
(28, '68042', 'Centro Escolar Cantón El Regadio.', 'Carretera del litoral km 53 1/2 desvio al zonte km 5 al cantón El Regadio.', 'Estela Herrera de Alarcón.', 'NA', '77211229', 'estelalopez2010@hotmail.com', 'Estela Herrera de Alarcón.', 'Directora', '77211229', '268411  13  32', '11  89  26', 79, 4, 1),
(29, '68045', 'Centro Escolar Caserío Hacienda Shutia.', 'km 59 1/2 carretera el litoral a Sonsonate.', 'Karla Jeanete Burgos Fuentes.', 'NA', '61249615', 'kjburgosf93yahoo.es', 'Karla Jeanete Burgos Fuentes.', 'NA', 'NA', '265232  13  30', '27  89  28', 79, 4, 1),
(30, '11263', 'Complejo Educativo Cantón El Zunzal', 'Km 44 1/2 Carretera Litoral canton el Zunzal, Tamanique', 'Claudia Virginia Escalante de Iraheta', '23896063', '74459244', 'itaescalante@hotmail.com', 'Claudia Virginia Escalante de Iraheta', 'Directora', '23896063/ 74459244', '264003  13  29', '47  89  23', 96, 5, 1),
(31, '11265', 'Centro Escolar Cantón San Alfonso', 'Km 42 1/2 C. Litoral desvio al Tunco, Km 2.5', 'Roberto Antonio Gonzalez Bermudez', 'NA', '77868756', 'NA', 'Juan Miguel Flores Blanco', 'Subdirector y Docente', '76011293', '265981  13  30', '52  89  23', 96, 5, 1),
(32, '11267', 'Centro Escolar Lic Walter Beneke', 'Carretera Litoral km 50', 'Jorge Humberto Lopez', 'NA', '75859151/ 75859151', 'jorgelopez11267@hotmail.com', 'Jorge Humberto Lopez', 'Director', '75859151', '264175  13  29', '53  89  25', 96, 5, 1),
(33, '60116', 'Centro Escolar Caserío el Progreso Cnton San Alfonso', 'Km. 42 1/2 carretera Litoral desvio al tunco Caserio el Progreso', 'Carlos Roberto Carpio', 'NA', '70506782 /', 'carloscarpio1979@yahoo.com', 'Carlos Roberto Carpio', 'Director', '70506782', '265158  13  30', '25  89  23', 96, 5, 1),
(34, '68160', 'Centro Escolar Caserío Lotificacion San Alfonso Canton San Alfonso', 'Carretera el Litoral km 43 San Alfonso', 'Edgar Geonani Bustillo', '23896029', '75719081', 'geovanibustillo@yahoo.es', 'Edgar Geonani Bustillo', 'Director', '23896029', '264132  13  29', '52  89  23', 96, 5, 1),
(35, '68162', 'Centro Escolar Caserío Acahuaspan Canton el Palmar', 'NA', 'Candelaria Emératriz Gomez', '23746303', '77040805', 'NA', 'Candelaria Emératriz Gomez', 'Directora', '23746303', '288616  13  32', '17  89  25', 96, 5, 1),
(36, '68163', 'Centro Escolar Caserío el Izcanal Canton El Palmar', 'NA', 'Norma Guadalupe  Martinez Rivera', 'NA', '73308145', 'caserioelizcanal@hotmail.com', 'NA', 'NA', 'NA', '265876  13  30', '48  89  24', 96, 5, 1),
(37, '68164', 'Centro Escolar Caserío Corral de Piedra', 'Km 49 1/2 Carretera Litoral Desvio San Isidro', 'Tito Alberto Vanegas Hernandez', 'NA', '72027597', 'titovanegas@yahoo.com', 'Tito Alberto Vanegas Hernandez', 'Director', '72027597', '268921  13  32', '27  89  24', 96, 5, 1),
(38, '68165', 'Centro Escolar Caserío Lima Canton el Palmar', 'K 49 1/2 Carretera Litoral Desvio el Palmarcito.', 'Herbert Jose Roberto Jovel Novellin', '78112817', '61094798', 'Novellino78@hotmail.com', 'Herbert Jose Roberto Jovel Novellino', 'Director', '78112817', '267727  13  31', '48  89  25', 96, 5, 1),
(39, '68166', 'Centro Escolar Caserío el Ranchon Canton el Zunzal', 'Carretera Litoral, km 44 1/2', 'Juan Carlos Alfaro Palacios.', '72652310', 'NA', 'juancarlosalfaro04@yahoo.es', 'Juan Carlos Alfaro Palacios', 'Director', '72652310', '264853  13  30', '15  89  24', 96, 5, 1),
(40, '68167', 'Centro Escolar Caserío El Centro Canton San Isidro.', 'Km 49 1/2 Carretera Litoral, Desvio del Palmarcito', 'Ana Cecilia Parada de Molina', 'NA', '75008686', 'pachita.ana48@ gmail.com', 'Ana Cecilia Parada de Molina', 'Directora', '75008686', '273829  13  35', '7  89  26', 96, 5, 1),
(41, '68168', 'Centro Escolar Caserío el Salamo', 'Crretera Litoral Desvio El Palmarcito', 'Claudia Veronica Campos  de Cruz', '79293754', 'NA', 'bebitacruz74@hotmail.com', 'Claudia Veronica Campos  de Cruz', 'Directora', '79293754', '271096  13  33', '38  89  25', 96, 5, 1),
(42, '11277', 'Centro Escolar CantónSihuapilapa Arriba', 'km 87 1/2 carretera Litoral 8km al norte del puente Sihuapilapa canton Sihuapilapa arriba', 'Rafael Alberto Aguirre Martinez', '72846075', '72846075', 'roalguimart@gmail.com', 'Rafael Alberto Aguirre Martinez', 'director', 'NA', '272027  13  34', '7  89  34', 97, 6, 1),
(43, '11279', 'Centro Escolar Cantón Lomas De Texicio.', 'Km. 82 1/2 carretera litoral Teotepeque La Libertad', 'Gladis Reyes De Escalante', '73108800', '73826504', 'gladisreyes17gmail.com', 'Gladis Reyes De Escalante', 'Directora', '73108800', '266096  13  30', '54  89  34', 97, 6, 1),
(44, '11280', 'Complejo Educativo Profesor Mardoque Orellana Lone', 'Km 90 1/2 carrtera litoral limite la libertad Sonsonate', 'Angel Vitelio Mendes Rugamas', '78335046', 'NA', 'c.e.mardoqueo.orellana.lone@hotmail.com', 'Angel Vitelio Mendez  Rugamas', 'director', '24424066', '267079  13  31', '26  89  37', 97, 6, 1),
(45, '11288', 'Centro Escolar Cantòn El Pital', 'km 87 1/2 carretera litoral Teotepeque La Libertad', 'Olga Morales', 'NA', 'NA', 'moraleslipeolga@yahoo.es', 'Olga Morales', 'Directora', '77125684', '266097  13  30', '54  89  36', 97, 6, 1),
(46, '60157', 'Centro Escolar Cantón Mizata', 'canton Mizata km 85, carretera litoral, 1km al norte', 'Olga Maribel Cruz de Alvarez', '77429208', 'NA', 'olgadealvarez@hotmail.com', 'Olga Maribel Cruz de Alvarez', 'Directora', '77429208', '267488  13  31', '39  89  35', 97, 6, 1),
(47, '68182', 'Centro Escolar Caserío Canoas Canton Mizata', 'NA', 'Blanca Romelia Umaña', '76766001', 'NA', 'NA', 'Blanca Romelia Umaña', 'Directora', '76766001', '269303  13  32', '39  89  34', 97, 6, 1),
(48, '68186', 'Centro Escolar Cantón Sihuapilapa Centro', 'km 88 carretera al litoral 5km al norte del puente de Sihuapilapa', 'Lidia Araceli Solorzano Sosa', '76061406', '76021406', 'NA', 'Jose Will Ayala Lòpez', 'docente', '76684623', '270052  13  33', '3  89  35', 97, 6, 1),
(49, '68187', 'Centro Escolar Cantòn Mizata Arriba', 'km 84 1/2 carret litoral, 4kms 1/2 al norte puente Mizote', 'Patricia Janeth Cabrera Garcia', '79886974', 'NA', 'patja7hotmail.com', 'Patricia Janeth Cabrera Garcia', 'Directora', 'NA', '268800  13  32', '22  89  34', 97, 6, 1),
(50, '68188', 'Centro Escolar Cantón Aguacayo', 'kmt 78 carretera litoral 200 mts al norte', 'Carlos Rafael Clemente Giron', '76772857', '76664573', '68188.aguacayogmail.com', 'Carlos Rafael Clemente Giròn', 'director', '76664573', '266684  13  31', '13  89  33', 97, 6, 1),
(51, '68206', 'Centro Escolar Caserio Cacho De Oro Canton Sihuapilapa', 'NA', 'Esperanza Angelica Rodrìguez', 'NA', '76592124', 'esperanza.rodriguez.debautista@mined.edu.sv', 'Esperanza Angèlica Rodrìguez de Bautista', 'Directora', 'NA', '268146  13  32', '1  89  26', 97, 6, 1),
(52, '86173', 'Centro Escolar Caserio Chiquileca', 'carretera El Litoral,km 87 1/2 desvio de puente sihualapa al norte 17 km', 'Sonia Antonia Ruiz', 'NA', '73910003', 'toniitaruiz@hotmail.com', 'Sonia Antonia Ruiz', 'Directora', 'NA', '274048  13  35', '13  89  33', 97, 6, 1),
(53, '11086', 'Centro Escolar Canton Santa Lucia Orcoyo.', 'Km 43 1/2 carretera litoral entre La Paz y La Libertad.', 'Marlene Arely Sanchez Alvarado.', 'NA', '77105259', 'marelysanz@gmail.com', 'Marlene Arely Sanchez Alvarado.', 'Directora', 'NA', '261419  13  28', '24  89  9', 86, 7, 1),
(54, '11096', 'Centro Escolar Cantón la Cangrejera.', 'Carretera al litoral, km 48 1/2', 'Juana Antonia Ayala de Portillo.', 'NA', '76601150', 'juanitaayalap@hotmail.com', 'Juana Antonia Ayala de Portillo.', 'Directora', '76601150', '260359  13  27', '50  89  10', 86, 7, 1),
(55, '11097', 'Centro Escolar Canton Santa Cruz.', 'Km 4 1/2 Carretera litoral desvio al rosario de mora.', 'Davd Ortíz Rivera', 'NA', '70987965', 'NA', 'David Ortíz Rivera.', 'Director', '70987965', '262318  13  28', '53  89  12', 86, 7, 1),
(56, '11104', 'Complejo Educativo San Arturo.', 'Km 48 1/2 carretera el litoral cantón cangrejera.', 'Norma Azucena Martínez', '23163047', '74595001', 'turcios_26@hotmail.com', 'Norma Azucena Martínez.', 'Directora', '74595001', '261506  13  28', '27  89  10', 86, 7, 1),
(57, '11108', 'Centro Escolar La Libertad \"La Alianza\".', 'Final calle el calvario #39S', 'Elmer Alcides Gómez Molina.', '23462119', '72910762', 'ce_delalibertad@yahoo.es', 'Elmer Alcides Gónez Molina.', 'Director', '72910762', '263021  13  29', '16  89  19', 86, 7, 1),
(58, '86440', 'Cooperativa Los Pinos Cantón Granjera.', 'Playa Los Pinos Cantón Cangrejera.', 'Tatiana Jazmín Perez Rodríguez.', 'NA', '72893147', 'tatiyperez1164hotmail.com', 'Tatiana Jazmín Pérez Rodriguez', 'Directora', '72893147', '257515  13  26', '17  89  11', 86, 7, 1),
(59, '11091', 'Escuela De Educación Parvularia Cantón El Jute.', 'Nueva lotificación las flores entreda a tepeagua.', 'Norma Luna de Rodríguez.', 'NA', '75757666', 'normaluna58@hormail.com', 'Norma Luna de Rodríguez.', 'Directora', '75757666', '263047  13  29', '17  89  18', 86, 8, 1),
(60, '11103', 'Escuela De Educación Parvularia De La Libertad.', 'Avenida luz el centro #225.', 'Frescia Pineda.', '23460510', '79265580', 'fresipineda@gmail.com', 'Frescia Pineda.', 'Directora', '79265580', '263000  13  29', '15  89  19', 86, 8, 1),
(61, '11105', 'Centro Escolar Caserío El Jute Cantón Tepeagua..', 'Calle el litoral, kilometro 14.1/2 carretera Comalapa, La Libertad.', 'Marielos de Castro.', 'NA', '74970494', 'msaitorio2014@hotmail.com', 'NA', 'NA', '71509313', '263248  13  29', '23  89  18', 86, 8, 1),
(62, '11107', 'Centro Escolar Luz de Sotomayor', '2° y 4° Calle barrio San Jose.', 'Miguel Angel Gómez.', 'NA', 'NA', 'NA', 'Miguel Angel Gómez.', 'Director', 'NA', '262966  13  29', '14  89  18', 86, 8, 1),
(63, '68074', 'Centro Escolar cantón Las Mesas.', 'Km 27 carretera de Santa Tecla al puerto La Liertad.', 'Santos Raymundo Alvarado Roque.', 'NA', '71569783', 'raymundoalvarado29@gmail.com', 'Santos Raymundo Alvarado Roque.', 'Director', '61243822', '266542  13  31', '11  89  16', 86, 8, 1),
(64, '11988', 'IN San Luis Talpa', 'Calle pral. Luis Rivas Vides Barrio el Centro', 'Rene Orlando Avalos Coto', '23348162', '61444319/76767420', 'administracioninsal@gmail.com', 'Rene Orlando Avalos Coto', 'Director', '23348162', '261747  13  28', '35  89  5', 113, 9, 1),
(65, '11991', 'CE Caserio el Salamar', 'Caserio Salamar Calle La Hacienda Zoria, Cantón Nuevo Edén', 'Lisania Lemus de Torres', '71137630', '61230080', 'NA', 'Lisania Lemus de Torres', 'NA', '61230080', '261108  13  28', '14  89  3', 113, 9, 1),
(66, '11992', 'CE Canton Nuevo Eden', 'KM 41 1/2 Carret. De empalme entre autopista a Comalapa y carretera Litoral', 'Ana Mercedes Mira de Martinez', 'NA', '70528467', 'menchumira@gmail.com', 'Ana Mercedes Mira de Martinez', 'Directora', '70528467', '261507  13  28', '27  89  4', 113, 9, 1),
(67, '11998', 'CE San Luis Talpa', 'Barrio el centro final calle al cementerio.', 'Carlos Alberto Martinez Osorio', '23348128', 'NA', 'cesalt11998@hotmail.com', 'Carlos Alberto Martinez Osorio', 'Director', '72032671', '261632  13  28', '31  89  5', 113, 9, 1),
(68, '60230', 'CE Belen Villa Palestina', 'NA', 'Edis Elvira Hernández', '76464176', '76464176', 'edih61436', 'Edis Elvira Hernández', 'NA', 'NA', '260900  13  28', '7  89  2', 113, 9, 1),
(69, '74027', 'CE Lotif. Comalapa', 'Carretera Contigua a Zacatecoluca KM 33 1/2 Desvio a Tapalhuaca, Lotif. Comalapa', 'Rosa Delfi Díaz de Nieto', 'NA', '61579552', 'rosadelfi@yahoo.es', 'Rosa Delfi Díaz de Nieto', 'Directora', '61579552', '264286  13  29', '58  89  4', 113, 9, 1),
(70, '74030', 'CE Lotif. Santa Cristina', 'KM41 desvio a San Luis Talpa', 'Virginia Alcyra Lara', 'NA', '78627636', 'NA', 'Virginia Lara', 'Directora', '78627636', '262316  13  28', '53  89  4', 113, 9, 1),
(71, '86446', 'CE Lotif. Miraflores III', 'KM 37 1/2 Carret. Autopista a Comalapa', 'Juana Griselda Lopez', 'NA', '71761748', 'jlopezdesanchez14@gmail.com', 'Juana Griselda Lopez de Sanchez', 'Directora', '71761748', '262328  13  28', '54  89  3', 113, 9, 1),
(72, '10137', 'Instituto Nacional de San Miguel Tepezonte', 'Desvío Cruz Calle a San Antonio Masahuat, Barrio El Transito', 'José Palacios', '23138227', '77442073', 'jpguite@hotmail.com', 'José Palacios', 'Director', '23138227', '272682  13  34', '30.9  89  5', 114, 10, 1),
(73, '12000', 'Centro Escolar Cantón San Bartolo', 'Carretera Panamericana a Cojutepeque 14 1/2 desvío El Aguacate', 'Anabel García', '76821902', 'NA', 'c.e.saubartolo@hotmail.com', 'NA', 'NA', 'NA', '277473  13  37', '6.8  89  1', 114, 10, 1),
(74, '12001', 'Centro Escolar La Paz', 'Final Barrio el Transito Calle Principal', 'Gloria Elizabeth Garcia Moreno', '78446470', 'NA', 'glorigarcia23@hotmail.com', 'NA', 'NA', 'NA', '277924  13  37', '21.5  89  1', 114, 10, 1),
(75, '12002', 'Escuela de Educación Parvularia de San Miguel Tepezontes', 'Final calle Arce Barrio El Carmen, San Miguel Tepezontes', 'Marlene Maricela Beltran de López', '78445235', 'NA', 'marla_70@hotmail.com', 'Marlene Maricela Beltran de López', 'Directora', '78445235', '277511  13  37', '8.1  88  55', 114, 10, 1),
(76, '74032', 'Centro Escolar Cantón Soledad Las Flores', 'km 22 carretera Panamericana', 'Ada Ruth', '77468208', 'NA', 'ruthgonzalez96@outlook.com', 'NA', 'NA', 'NA', '278944  13  37', '54.7  88  59', 114, 10, 1),
(77, '12031', 'IN Prof Francisco Guerrero', 'Av Alberto Masferrer sur, y 2º calle poniente, barrio el centro', 'Maria Magdalena Rivas', '23300905', '77454034', 'insro@yahoo.es', 'Maria Magdalena Rivas de Ceren', 'Director', '77454034', '264538  13  30', '5.9  88  55', 117, 11, 1),
(78, '12032', 'CE Prof. Jose Ricardo Cativo', 'Canton San Pedro Martir, 2km al norte de San Rafael Obrajuelo', 'Nixon Abner Vazquez Gomez', 'NA', '71931218', 'nic.hurtado2011@hotmail.com', 'Nixon Abner Vazquez Gomez', 'Director', '71931218', '265856  13  30', '48.8  88  54', 117, 11, 1),
(79, '12033', 'CE Prof. Rafael Osorio Hijo', 'Calle Francisco Menendez  nº 1 Barrio el Centro', 'Noe Antonio Ayala', '23300200', '77421538', 'noe_ayala08@hotmail.com', 'Noe Antonio Ayala', 'Director', '77421538', '264612  13  30', '8.3  88  55', 117, 11, 1),
(80, '12034', 'Escuela de Educaciòn Parvularia San Rafael Obrajuela', 'Barrio el centro', 'Dora Vilma Amaya de Morales', 'NA', '61446397', 'fch08112005@hotmail.es', 'Dora Vilma Amaya de Morales', 'NA', '61446397', '264539  13  30', '5.9  88  55', 117, 11, 1),
(81, '14870', 'CE Santa Maria', 'Carret. Litoral km51 Cantòn el Carao', 'Ruth Sosa de Rivas', 'NA', '73860274', 'ruth_sosa9@hotmail.com', 'Ruth Sosa de Rivas', 'Directora', '73860274', '264391  13  30', '1.1  88  54', 117, 11, 1),
(82, '60149', 'CE Cantón Tehuiste Abajo', 'Canton Tehuiste abajo Juris. De San Juan Nonualco La Paz', 'Josè Adilio Fernandez', 'NA', '77044207', 'NA', 'Josè Adilio Fernandez', 'Director', '77044207', '268565  13  32', '16.9  88  54', 109, 11, 1),
(83, '74023', 'CE Cantón Tehuiste arriba', 'Canton Tehuiste Arriba, 9Km al norte de San Rafael Obrajuel', 'Manuel Augusto Corea', 'NA', '78972978', 'corea05@hotmail.com', 'Manuel Augusto Corea', 'Director', 'NA', '270033  13  33', '4.7  88  53', 109, 11, 1),
(84, '86241', 'CE Canton San Jeronimo', 'Calle Pral. Canton San Jeronimo, San Rafael Obrajuela', 'Nuria del Carmen Morales', 'NA', '70813279', 'carmen_morales47@yahoo.es', 'Nuria del Carmen Morales', 'Directora', '70813279', '267810  13  31', '52.3  88  54', 117, 11, 1),
(85, '12049', 'Instituto Naional Jose Ingenieros.', 'Final avenida Anastacio Aquino barrio San Juan, Santiago Nonualco.', 'Director.', '23304004', '23690602', 'licenmoralesv@gmail.com', 'Luis Enrique Morales Ventura.', 'Director', '79878045', '265181  13  30', '26.8  88  56', 119, 12, 1),
(86, '12072', 'Centro Escolar Dr. Joaquin Jule Galvez.', 'Final calle Francisco Gavidia barrio San Juan, Santiago Nonualco.', 'Ana Silvia Espiniza.', 'NA', '77434157', 'nonualcoos@hotmail.com', 'Ana Silvia Espiniza.', 'Directora', '77434157', '265168  13  30', '26.4  88  56', 119, 12, 1),
(87, '12074', 'Educación de Educación Parvularia.', 'Avenida Alberto Masferrer barrio El Angel Continuo a iglesia catolica.', 'Blanca Lidia Brizuela.', 'NA', '78448404', 'blancalidia_1964@hotmail.com', 'Blanca Lidia Brizuela.', 'Directora', '78448404', '265339  13  30', '32  88  56', 119, 12, 1),
(88, '12076', 'Centro Escolar Dr.Hermojenes Alvarado.', 'Avenida el progreso barrio San Juan, Santiago nonualco.', 'Leonardo Bonilla Alvarado.', '23304037', '78420070', 'lbonillaalvarado@yahoo.es', 'Leonardo Bonilla Alvarado.', 'Director', '78420070', '281067  13  39', '3.7  88  53', 119, 12, 1),
(89, '12047', 'Centro Escolar de Suecia', 'Km 57 1/2 carretera San Luis La Herradura, desvío El Porfiado', 'José Angeln Córdova', '73235342', '71078208 (subdirecto', 'josecordova90@hotmail.com', 'José Angel Córdova', 'Director', '73235342', '263874  13  29', '44.3  88  56', 119, 13, 1),
(90, '12048', 'Centro Escolar Colonia Santa Ines', 'Col. San Antonio km 1 1/2 calle Hacienda Hoja Rural', 'Janeth Elizabeth Ramo Dúran', '74361990', '77248465', 'csantaines2048@gmail.com', 'Janeth Elizabeth Ramos Dúran', 'Directora', '74361990', '263067  13  29', '18  88  56', 119, 13, 1),
(91, '12050', 'Centro Escolar Cantón Concepción Jalponga', 'Caserío Los Obrajes, Cantón concepción Jalaponga Mº Esperanza Delgado', 'María Esperanza Degado de Cerón', '73837383', 'NA', 'NA', 'María Esperanza Delgado de Cerón', 'Directora', '73837383', '267962  13  31', '57.3  88  55', 119, 13, 1),
(92, '12052', 'Centro Escolar Caserío San Cristobal', 'Km 58 carretera a San Luis La Herradura', 'José Ernesto Orellana Serrano', '61663614', '70840944  (Docente R', 'xtoneneto49@gmail.com', 'José Ernesto Orellana Serrano', 'Director', '61663614', '248603  13  21', '27.4  88  58', 119, 13, 1),
(93, '12055', 'Complejo Educativo Soldedad Melara de Argueta', 'Caserío Hoja de Sal, Cantón El Sauce Santiago Nonualco, La Paz', 'Santos Rodríguez de Alvarez', '64308543', '71578353', 'santy.rodri017@gmail.com', 'Santos Rodríguez de Alvarez', 'Directora', '71578353', '257566  13  26', '19.1  88  57', 119, 13, 1),
(94, '12058', 'Centro Escolar Cantón El Sauce', 'CE Cantón El Sauce, Caserío El Pacum, Santiago Nonualco', 'Mario Indalecio Iraheta', '78745128', 'NA', 'mario.indalecio@hotmail.com', 'Mario Indalecio Iraheta', 'Director', '78745128', '270078  13  33', '6.2  88  54', 119, 13, 1),
(95, '12059', 'Centro Escolar Caserío La Flecha', 'Caserío La Fecha, Cantón San José', 'Juana Evelyn Palacios Zepeda', '77417379', 'NA', 'evelynpalacios2010@yahoo.es', 'Oscar Almilcar Barahona Tenori', 'Subdirector', '77412312', '263493  13  29', '32  88  59', 119, 13, 1),
(96, '12067', 'Centro Escolar Morelia', 'Desvío de 3 tres puertas, Caserío Tihuilocoyo, Cantón Las Guarumas', 'Ginny Elaine Jimenez de A.', '78623115', 'NA', 'centroescolarmorelia@gmail.com', 'Blanca Leticia Rivera', 'Docente', '70222266', '266306  13  31', '3.4  88  56', 119, 13, 1),
(97, '74055', 'Centro Escolar Caserío El Pito Cantón Las Guarumas', 'Caserío El Pito Col. Las Guarumas km 2 al sur de cooperativa hoja de Sal', 'Juan Antonio Vasquez', '71194603', '75876799 (Julisa Car', 'juanfaustino15@hotmail.com', 'Juan Antonio Vasquez', 'Director', '71194603', '253001  13  23', '50.5  88  57', 119, 13, 1),
(98, '86242', 'Centro Escolar Caserío Santa Rita', 'Carretera a la Herradura Desvío 3 puertas km 4 1/2 Cooperativa', 'Elías Josué Díaz Zepeda', '23054253', '70090675', 'josue.zaidandroid@gmail.com', 'Elías Josué Diáz Zepda', 'Director', '23054253', '257551  13  26', '18.6  88  58', 119, 13, 1),
(99, '12051', 'Centro Escolar America', 'Km49 1/2 Carretera a Santiago Nonualco', 'Marta Gomez Flores', 'NA', '77722326, 72903814', 'mg.flores@outlook.com', 'Marta Gomez Flores', 'Directora Interina', '77722326', '267711  13  31', '49  88  58', 119, 14, 1),
(100, '12057', 'Centro Escolar Santa Cruz Chacastal', 'NA', 'Mario Augusto Cerrano Piche', '23170592', '78139815', 'masp1967@yahoo.com', 'Mario Augusto Cerrano Piche', 'Director', '23170592', '271888  13  34', '5.1  88  58', 119, 14, 1),
(101, '12060', 'Centro Escolar Cantón San Sebastian Arriba', 'NA', 'Jorge Alberto Moreno', '73421780', 'NA', 'NA', 'Jorge Alberto Moreno', 'Director', '73421780', '270615  13  33', '23  88  57', 119, 14, 1),
(102, '12061', 'Centro Escolar 14 de abril', 'Calle Principal. Canton San Jose Arriba', 'Rosa Ediltrudis Clara Campos', 'NA', '71921155', 'rosaeclara@outlook.es', 'Rosa Ediltrudis Clara Campos', 'Directora', 'NA', '265902  13  30', '50  88  58', 119, 14, 1),
(103, '12065', 'Centro Escolar Cantón Amulunco', 'Km 53 1/2 Canton Amulunco, San Pedro Nonualco', 'Jorge Alberto Martinez Ortiz', 'NA', 'NA', 'Jorgealbertomartinezortiz@gmail.com', 'Jorge Alberto Martinez Ortiz', 'Director', 'NA', '271038  13  33', '37  88  57', 119, 14, 1),
(104, '12066', 'Centro Escolar Cantón San Jose Obrajito', 'Canton San Jose Obrajito, desvio de nahualapa, km 43 1/2 via tejera Santiago Nonualco', 'Juan Zacarias Surio Campos', 'NA', '71514991', 'juansuriocampos@gmail.com', 'Juan Zacarias Surio Campos', 'Director', '71514991', '264344  13  29', '59  88  59', 119, 14, 1),
(105, '12068', 'Centro Escolar Cantón San Jose Abajo', 'NA', 'Carlos Antonio barrera Manzanares', '23055879', '70819823', 'cabmanzanares@gmail.com', 'Carlos Antonio barrera Manzanares', 'Director', '23055879', '265422  13  30', '34.7  88  58', 119, 14, 1),
(106, '74057', 'Centro Escolar Cantón San Francisco Hacienda', 'Km 5 1/2 carr. Sant. Nocualco', 'Jaime Ernesto Santos Hernandez', '77462761', 'NA', 'NA', 'Jaime Ernesto Santos Hernandez', 'Director', '77462761', '269475  13  32', '46.6  88  58', 119, 14, 1),
(107, '74058', 'Centro Escolar Cantón San Jose La Loma', 'NA', 'Digna Guadalupe Cornejo', 'NA', 'NA', 'NA', 'Diana Guadaupe Fuentes Cornejo', 'Directora', 'NA', '266043  13  30', '55  88  58', 119, 14, 1),
(108, '86376', 'Centro Escolar Cantón Santa Rita Almendro', 'Km. 52 Desvio san francisco. Hacienda hacia San Pedro Nonualco c/ Santa Rita', 'Mercedes Lopez', '79465727', 'NA', 'mercedes.tolentino@mined.edu.sv', 'Mercedes Arcadia  Lopez Tolentino', 'Directora', '79465727', '272004  13  34', '8.9  88  58', 119, 14, 1),
(109, '11921', 'Instituto Nacional El Rosario', 'KM 37 1/2 desvio a El Rosario Puente Huaxala', 'Francisco Orlando', 'NA', '78788894', 'francisco.fuentes@iner.edu.sv', 'Francisco Orlando Fuentes Flores', 'Director', '78788894', '263514  13  29', '54  89  1', 182, 15, 1),
(110, '11922', 'CE Cantón El Pedregal', 'Desvio tres puertas, carret Litoral hacia La Herradura', 'Alba Rosalina Amaya', '71942036', '79898013', 'alvaamaya66@gmail.com', 'Alba Rosalina Amaya vda de Hernandez', 'Directora', '71942036', '258058  13  26', '34  89  1', 182, 15, 1),
(111, '11924', 'CE Caserio Nahualapa', 'NA', 'Ruth Rosaria Lara', 'NA', '75120782', 'cnahualapa@gmail.com', 'NA', 'NA', 'NA', '260911  13  28', '7  88  59', 182, 15, 1),
(112, '11925', 'CE Col. El Pedregal', 'Lotif. San Francisco, Contiguo a Zona Franca, El Pedregal', 'Rosa Edelmira Rodriguez', 'NA', '78684067', 'NA', 'Rosa Edelmira Rodriguez', 'Directora', '78684067', '259849  13  27', '33  89  0', 182, 15, 1),
(113, '12054', 'CE Caserio Ojo de Agua', 'Caserio Ojo de Agua, Cantòn el Pedregal, Jurisdicciòn El Rosario', 'Lorena Margarita Rodriguez Grande', '23750884', '76156480', 'profmargarita28@gmail.com', 'Lorena Margaita Rodriguez Grande', 'Directora Interina', '23750884', '261723  13  28', '34  88  58', 182, 15, 1),
(114, '14877', 'CE Juan Pablo Rodriguez Alfaro', '8ª av norte y 1ª calle pte Lotif San Francisco', 'Jenny Guadalupe Erazo Muñoz', 'NA', '70553659', 'NA', 'Jenny Guadalupe Erazo Muñoz', 'Directora interina', 'NA', '0', '0', 182, 15, 1),
(115, '11527', 'Centro Escolar Lotificación La Mayra', 'Carretera litoral km 70, lotificación la mayra, cantón la lucha', 'Cecilia Emperatriz Valladares', '74803036', 'NA', 'cecitovalladares@hotmail.com', 'Cecilia Emperatriz Valladares', 'Directora', '74803036', '259960  13  27', '36.7  88  49', 121, 16, 1),
(116, '12082', 'Centro Escolar Lotificación Campo Verde', 'Km 71 carretera hacia Usulutan, cantón la lucha, caserío la pedrera, zacatecoluca', 'Ana Mercedez Monterroza de Mijango', '72100585', 'NA', 'amercymm2009@hotmail.com', 'Ana Mercedez Monterroza de Mijango', 'Directora', '72100585', '259520  13  27', '22.4  88  49', 121, 16, 1),
(117, '12087', 'Centro Escolar Caserío La Luchita', 'km69, carretera litoral, jurisdicción de zacatecoluca', 'Jesús Arturo Orellana Campos', '23343689', '70398641', 'arturo orellana1961@hotmail.com', 'Jesús Arturo Orellana Campos', 'Director', '70398641', '261197  13  28', '17  88  50', 121, 16, 1),
(118, '12093', 'Centro Escolar Lotificación Las Brisas', 'Carretera Litoral, desvío río blanco, 4 km al sur cantón san faustino', 'Gilma Carmen Alfaro de Mena', '70964253', 'NA', 'NA', 'Gilma Carmen Alfaro de Mena', 'Directora', '70964253', '258841  13  27', '0.4  88  50', 121, 16, 1),
(119, '12101', 'Centro Escolar Profesor Juan Oscar Salomón', 'Cantón el socorro', 'Mario Joel Carranza Alvarez', '76131730', '79893223', 'yoelus@hotmail.com', 'Mario Joel Carranza Alvarez', 'Director', '76131730', '262142  13  28', '47.8  88  51', 121, 16, 1),
(120, '12104', 'Centro Escolar Cantón La Lucha', 'NA', 'Francisco Antonio Cañas Ramos', '77452891', 'NA', 'crfranciscoantonio@hotmail.com', 'Francisco Antonio Cañas Ramos', 'Director', '77452891', '260734  13  28', '2  88  50', 121, 16, 1),
(121, '12112', 'Centro Escolar Cantón San Francisco Los Reyes', 'Cantón, 6km al sur de  carretera litoral, entrando por desvío río blanco', 'Salomón Antonio Pérez', '70356531', 'NA', 'NA', 'Salomón Antonio Pérez', 'Director', '70356531', '257113  13  26', '4.2  88  50', 121, 16, 1),
(122, '74068', 'Centro Escolar Caserío Paredes', 'Cantón la lucha, caserío paredes', 'Raúl Amado Cerón Cortez', '74420405', 'NA', 'craul8627@gmail.com', 'Raúl Amado Cerón Cortez', 'Director', '74420405', '259065  13  27', '7.6  88  49', 121, 16, 1),
(123, '11933', 'Centro Esclar Caserio Valle Nuevo', 'Carretera de comalapa al puerto de la libertad', 'Rafael Ernesto Estrada García', 'NA', '71817341', 'rafa_251070@hotmail.com', 'Rafael Ernesto Estrada García', 'Director', '71817341', '261886  13  28', '39  89  9', 104, 17, 1),
(124, '11934', 'Centro Escolar Cantón EL Chilamate', 'El Cimarron canton el chilamate', 'Teresa de Jesús Avalos de Escobar', 'NA', '79898827', 'avalter95@hotmail.com', 'Teresa de Jesús Avalos de Escobar', 'Directora', '79898827', '270920  13  33', '33  89  7', 104, 17, 1),
(125, '11938', 'Centro Escolar Cantón Jayuca', 'Carretera litoral k59 1/2 Calle que dirige al puerto de la libertad', 'Nicolás Carranza', 'NA', '77767098', 'cecantonjuayuca11938@gmail.com', 'Nicolás Carranza', 'Director', '77767098', '264060  13  29', '50  89  7', 104, 17, 1),
(126, '11941', 'Centro Escolar Profesora Rosa Mirian Abrego de Hernández', 'Canton planes de las delicias juridicas olocuilta.', 'Eden Humberto Hernández Romero', 'NA', '76504316', 'eden.hernandez@gmail.com', 'Eden Humberto Hernández Romero', 'Director', '76504316', '264534  13  30', '54  89  8', 104, 17, 1),
(127, '11944', 'Centro Escolar Cantón San Sebastian', 'Calle principal canton san sebastian', 'Adis Azucena Cañas', 'NA', '77436845', '110luna@hotmail.es', 'Adis Azucena Cañas', 'Directora', '77436845', '268873  13  32', '24``  89  7', 104, 17, 1),
(128, '74008', 'Centro Escolar Cantón Santa Fe', 'Calle principal, canton santa fe', 'Fanny Cabrera', 'NA', '78853506', 'cv_castellanos@hotmail.com', 'Fanny Cabrera', 'Directora', '78853506', '266148  13  30', '57  89  7', 104, 17, 1),
(129, '10084', 'Centro Escolar Urbanizaciòn Montelimar', 'final ave. Norte linor entre block b y c urb monte limer Olocuilta', 'Lorena Virginia Maldonado Sibrian', '70085612', 'NA', 'ceurbmontelimergmail.com', 'Lorena Virginia Maldonado Sibrian', 'Directora', '23060001', '275210  13  35', '53  89  7', 104, 18, 1),
(130, '11935', 'Instituto Nacional de Olocuilta.', 'Km 22 Carrete antigua hacia Zacatecoluca.', 'Wilfredo Funes.', '23557331', '78505954', 'ino11935@gmail.com', 'Wilfredo Funes.', 'Director', '78505954', '272797  13  34', '34  89  6', 104, 18, 1),
(131, '11937', 'Centro Escolar Profesora Maria Evangelina Alvarez', 'col. San Juan de Dios km. 21 autopista a comalapa canton la esperanza', 'Amilcar Enrique Huezo', '23734230', '77412234', 'cepmea11937gmail.com', 'Amilcar Enrique Huezo', 'director', '23734230', '276902  13  36', '48  89  7', 104, 18, 1),
(132, '11939', 'Centro Escolar Cantón La Esperanza.', 'Km 19 1/2 carretera antigua a Zacatecoluca.', 'Hugo Ernesto Romero Hidalgo.', 'NA', 'NA', 'erenstrhommer10@yahoo.com', 'Hugo Ernesto Romero Hidalgo.', 'Director', 'NA', '274368  13  35', '25  89  7', 104, 18, 1),
(133, '11943', 'Centro Escolar Alberto Masferrer.', 'Calle alberto Masferrer barrio San José.', 'Roxana Deneese Serrano de Bolaños.', '23306107', '78157073', 'cealmas@gmail.com', 'Roxana Deneese Serrano de Bolaños.', 'Directora', '78157073', '272350  13  34', '20  89  7', 104, 18, 1),
(134, '74005', 'Complejo Educativo Cantón Joyas De Giron', 'c, plp, Cton, Joyas de C. cd. Ote iglesia catolica', 'Jose Napoleon', '23671354', '79911071', 'josenapoleon.mejia@gmail.com', 'Jose Napoleon Mejia Parada', 'director', '23671354', '276071  13  36', '21  89  8', 104, 18, 1),
(135, '13360', 'Centro Escolar Hacienda San Ramon', 'Calle litoral desv{io al tamarindo', 'Flor Maria Medrano', 'NA', '77303334', 'flormedrano_70yahoo.com', 'Flor Maria Medrano', 'Directora', '77303334', '231404  13  12', '0.2  87  58', 225, 19, 1),
(136, '13361', 'Centro Escolar Canton Las Tunas', 'Canton Las Tunas', 'Ana Ruth Garcia', 'NA', '77979363', 'NA', 'Ana Ruth Garcia', 'Directora', '77979363', '227136  13  9', '41.4  87  58', 225, 19, 1),
(137, '13365', 'Complejo Educativo Canton el Jaguey', 'Calle principal, contiguo a fuerza aerea el jaguey', 'Jorge Antonio Arana Martinez', 'NA', 'NA', 'NA', 'Jorge Antonio Arana Martinez', 'Director', 'NA', '227429  13  9', '50  87  54', 225, 19, 1),
(138, '13366', 'Centro Escolar Cantón Playas Negras', 'NA', '-', 'NA', 'NA', 'NA', 'Cesareo Reyes Ramirez', 'Director', 'NA', '227893  13  10', '5.7  87  56', 225, 19, 1),
(139, '13373', 'Centro Escolar Cantón Los patos', 'NA', 'Antonia Isabel Gonzalez Alvarenga', 'NA', 'NA', 'NA', 'Anatonia Isabel Gonzalez Alvarenga', 'Directora', 'NA', '228705  13  10', '32.5  87  58', 225, 19, 1),
(140, '13376', 'Complejo Educativo Cantón El Tamarindo', 'NA', 'Julio Antonio Quintanilla Serpas', 'NA', '78860234', 'ccelta@hotmail.es', 'Julio Antonio Quintanilla Serpas', 'Director', '78860234', '230227  13  11', '21.2  87  55', 225, 19, 1),
(141, '86028', 'Centro Escolar Caserio El Maculis Canton El Jaguey', 'caserio maculi, canton el jaguey, Conchagua la Union', 'Elsy Lorena Benitez', 'NA', '61983752', 'NA', 'Elsi Lorena Benitez', 'Directora', 'NA', '227184  13  9', '42.4  87  55', 225, 19, 1),
(142, '13414', 'Centro Escolar Caserio Playitas Canton Isla Zacatillo', 'Caserio Playitas Canton El Zacatillo', 'Victoria del CarmenBlanco Pacheco', '26803846', '75896472', 'NA', 'Victoria del CarmenBlanco Pacheco', 'Directora', '26803846', '244343  13  18', '58  87  45', 229, 20, 1),
(143, '13425', 'C.E. Caserio la playona,  cantón Isla Zacatillo', 'Caserio la playona, cantón Isla Zacatillo', 'Béder Remberto Serpas', '72251373', 'NA', 'bederserpas1961@gmail.com', 'Béder Remberto Serpas', 'Director', '72251373', '243159  13  18', '19  87  45', 229, 20, 1),
(144, '13428', 'Centro Escolar Caserio El Cahuano Cantón Isla Zacatillo', 'Caserio el Cahuno, cantón Isla Zacatillo', 'Nelcis Leticia Vásquez', '74889292', 'NA', 'NA', 'Nelcis Leticia Vásquez', 'Directora', '74889292', '244419  13  19', '0 0  87  44', 229, 20, 1),
(145, '13434', 'Centro Escolar Caserio la Estufa Canton Isla Zacatillo', 'Caserio la Estufa Canton Isla el Zacatillo', 'Rubidia Maribel Lazo Hernandez', '26803832', '9248418/74979291', 'maribellazo1501@hotmail.com', 'Rubidia Maribel Lazo Hernandez', 'Directora', '26803832', '244396  13  18', '59  87  45', 229, 20, 1),
(146, '13477', 'Centro Escolar Caserio El Amatillo.', 'Seis cuadras  al sur de aduana terrestre El Amatillo.', 'Alma Patricia Turcios.', '26499610', '75583256', 'NA', 'Alma Patricia Turcios.', 'Directora', '75583256', '275795  13  36', '1.2  87  45', 233, 21, 1),
(147, '13478', 'Centro Escolar Caserío Las Flores Cantón Cerro Pelón.', 'Carretera ruta militar, desvio el Jicaro km 2 al sur Pasaquina.', 'Rita Ruth Alvarado.', 'NA', '75000781', 'rut66alvarado@gmail.com', 'Rita Ruth Alvarado.', 'Directora', '75000781', '276191  13  36', '15.7  87  51', 233, 21, 1),
(148, '13479', 'Centro Escolar Ruben Dario Velasquez Caserio Santa Clarita.', 'NA', 'Juan Alexander Turcios Villatoro.', 'NA', '77299665', 'abogadoamigo@hotmai.com', 'Juan Alexander Turcios Villatoro.', 'Director', '77299665', '274328  13  35', '13.8  87  46', 233, 21, 1),
(149, '13488', 'Centro Escolar Los Portillos.', 'Caserío Los Portillos, Cantón Los Horcones.', 'Doris Isabel Medrano.', 'NA', '75289106', 'NA', 'Doris Isabel Medrano.', 'Directora', '75289106', '272566  13  34', '17.1  87  49', 233, 21, 1),
(150, '13490', 'Centro Escolar Cantón San Carlos.', 'Cantón San Carlos , frente a gasolinera Puma.', 'Reyna de la Paz Fuentes Granillo.', 'NA', '79408415', 'pazfugra@hotmail.com', 'Reyna de la Paz Fuentes Granillo.', 'Directora', '79408415', '273471  13  34', '46.6  87  49', 233, 21, 1),
(151, '13493', 'Centro Escolar Cantón Los Horcones.', 'Cantón Los Horcones.', 'Telma Gloribel Laínez.', 'NA', '72928444', 'NA', 'NA', 'NA', '72928444', '270873  13  33', '21.5  87  47', 233, 21, 1),
(152, '13495', 'Centro Escolar Cantón San José.', 'NA', 'Nilsan Abigail Martinez Cruz.', 'NA', '75344155', 'NA', 'Nilsan Abigail Martinez Cruz.', 'Director', '75344155', '275804  13  36', '2.1  87  48', 233, 21, 1),
(153, '13499', 'CE Caserio El Picacho', 'Caserio El Picacho Canton El Picacho', 'Maria Otilia Benitez de Lopez', 'NA', '76782084', 'otiliabenitez25@gmail.com', 'Marta Otilia Benitez de Lopez', 'Directora', '76782084', '275697  13  35', '59.3  87  50', 233, 21, 1),
(154, '14775', 'Complejo Educativo Canton Santa Clara.', 'Cantón Santa Clara.', 'Benedicto Artega Vega.', 'NA', '77325084', 'NA', 'Benedicto Artega Vega.', 'Director', '77325084', '274644  13  35', '23.9  87  46', 233, 21, 1),
(155, '86085', 'CE Cantòn Cerro Pelon', 'NA', '-', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', '278136  13  37', '18.7  87  50', 233, 21, 1),
(156, '86086', 'Centro Escolar Caserio Quebrada Honda Cantón Cerro Pelón.', 'Caserio Quebrada Honda Cantón Cerro Pelón.', 'Nidia Patricia Reyes.', 'NA', '71529373', 'NA', 'Nidia Patricia Reyes.', 'Directora', '70529373', '275948  13  36', '7.3  87  49', 233, 21, 1),
(157, '86240', 'Centro Escolar Caserio Los Carcamos Cantón Los Horcones.', 'Caserío Los Carcamos dos cuadras antes de casa comunal entreda del oregano.', 'Maria Abelina Escobar.', '26497609', '7289522', 'NA', 'Maria Abelina Escobar.', 'Directora', '7289522', '272796  13  34', '24.3  87  48', 233, 21, 1),
(158, '13475', 'Instituto Nacional Daniel Arias.', '1° Calle oriente y 4° avenida sur, B el centro.', 'Juan Francisco López Sorto.', '26497125', 'NA', 'NA', 'Juan Francisco López Sorto.', 'Director', '26497125', '273906  13  35', '1  87  50', 233, 21, 1),
(159, '13559', 'Centro Escolar Caserío Quebrada Honda El Algodón', 'Caserío Quebrada Honda, Desvío de María Pura, Quebrada Honda 200 mts al norte', 'Milagro del Carmen Perla Flores', '73931844', '70957353', 'NA', 'Milagro del Carmen Perla Flores', 'Directora', '70957353', '281795  13  39', '17.8  87  50', 237, 22, 1),
(160, '13561', 'Centro Escolar Cantón El Algodón', 'Cantón El Algodón', 'Iris Yessenia Alvarez', '79860103', 'NA', 'yesseniniri197@hotmail.com', 'Iris Yessenia Alvarez', 'Directora', '79860103', '278849  13  37', '42.1  87  51', 237, 22, 1),
(161, '13568', 'Centro Escolar José Tiburcio Guzman Argueta', 'Caserío Corogual, Cantón El Algodón', 'José Manuel Quintanilla Granado', '26227276', '74110024', 'NA', 'José Manuel Quintanilla Granado', 'Director', '26227276', '279401  13  37', '59.9  87  50', 237, 22, 1),
(162, '13569', 'Centro Escolar Cantón Los Mojones', 'Cantón Los Mojones, jurisdicción de Santa Rosa de Lima', 'Nelson de Jesus Salmeron Ventura', '75610526', 'NA', 'NA', 'Nelson de Jesus Salmeron Ventura', 'Director', '75610526', '282153  13  39', '29.9  87  52', 237, 22, 1),
(163, '13570', 'Centro Escolar Caserío Los Villatoros', 'Caserío Los Villatoros Cantón Los Mojones', 'Rosa del Carmen Ventura', '78878484', 'NA', 'rosaventura1010@gmail.com', 'Rosa del Carmen Ventura', 'Directora', '78878484', '283555  13  40', '15.3  87  51', 237, 22, 1),
(164, '86124', 'Centro Escolar Caserío Los Umaña', 'Caserio Los Umaña, Cantón El Algodón, Sta Rosa de Lima', 'Jimy Josué Reyes', '79147082', 'NA', 'jimmy.reyes.10@hotmail.com', 'Jimy Josué Reyes', 'Director', '79147082', '279298  13  37', '57.2  87  52', 237, 22, 1),
(165, '86125', 'Centro Escolar Caserío La Fabulosa', 'NA', 'Rosa Margarita Maravilla', '26412607', '75960460', 'rosa.margarita.gomez@mined.edu.sv', 'Rosa Margarita Maravilla', 'Directora', '75960460', '279127  13  37', '51.5  87  52', 237, 22, 1),
(166, '86127', 'Centro Escolar Caserío Los Picachos Cantón Los Mojones', 'Caserío Los Picachos, Cantón Los Mojones', 'Sandra  Aracely Sorto de Alvarez', '76782104', 'NA', 'NA', 'Sandra Aracely Sorto de Alvarez', 'Directora y docente', '76782104', '283794  13  40', '23.5  87  53', 237, 22, 1),
(167, '86128', 'Centro Escolar Caserío La Ceiba', 'Carretera a Anamos 8km al norte de Santa Rosa de Lima, Caserío La Ceiba Cantón Mojones', 'Wilson Alexander Benitez', '78754120', 'NA', 'wilson.benitezbenitez@mined.edu.sv', 'Wilson Alexander Benitez', 'Director', '78754120', '283435  13  40', '11.6  87  52', 237, 22, 1),
(168, '13550', 'Instituto Nacional Profesor Francisco Ventura Zelaya/Instituto Puro', 'Bº La Esperanza, Salida a San Miguel carretera Ruta Militar, Santa Rosa de Lima', 'Esteban Antonio Bonilla Fuentes', '26412025', '77462036', 'estebabf65@hotmail.com', 'Esteban Antonio Bonilla Fuentes', 'Director', '77462036', '278175  13  37', '20.8  87  53', 237, 22, 1),
(169, '13355', 'CE Col. San Francisco', 'NA', 'Marìa del Socorro Guevara', '26043169', '78852899', 'NA', 'Maria del Socorro Guevara', 'Directora', '78852899', '244313  13  18', '59.2  87  54', 225, 23, 1),
(170, '13364', 'CE Hac. La Cañada', 'Col. Bella Vista', 'Dimas Bilan Garcia', '26835395', '78777881', 'dimasgarcia197@gmail.com', 'Yanira Claribel Fuentes', 'Directora', '77308691', '243486  13  18', '32.1  87  53', 225, 23, 1),
(171, '13367', 'CE Cantón Maquigue', 'NA', 'Pablo Rios Rios', 'NA', '72258137', 'pjr2011@hotmail.com', 'Pablo Rios Rios', 'Director', 'NA', '240041  13  16', '40.7  87  55', 225, 23, 1),
(172, '13372', 'CE Cantón El Pilon', 'Canton El Pilon, Conchagua.', 'Ilsia Patricia Flores de Rios', 'NA', '76167854', 'maldonado_1314@hotmail.com', 'Ilsia Patricia Flores de Rios', 'Directora', 'NA', '243696  13  18', '39.5  87  55', 225, 23, 1),
(173, '60243', 'CE Cantòn Los Angeles', 'Hac. El Retiro Cantòn Los Angeles', 'Blanca Elizabeth Umanzor', 'NA', '75807460', 'elizabeth_umanzor@hotmail.com', 'Juan Fernando Lopez Martinez', 'Docente', '75838938', '238178  13  15', '39.4  87  53', 225, 23, 1),
(174, '86450', 'CE Caserio El Melonal Canton Piedras Blancas', 'Caserio El Melonal, Cantòn Piedras Blancas', 'Suyapa del Rosario Alvarado', '26041802', '71492104', 'rosireyes_12@hotmail.com', 'Suyapa Alvarado', 'Directora', '71492104', '244204  13  18', '55.5  87  53', 225, 23, 1),
(175, '13363', 'Centro Escolar cantón el farito', 'Calle principal hacía el volcán de conchagua', 'Cristela del Carmen Reyes', '79352666', 'NA', 'crismen.reyes@gmail.com', 'Cristela del Carmen Reyes', 'Directora', '79352666', '242655  13  18', '4.2  87  50', 225, 24, 1),
(176, '13370', 'Centro Escolar Caserio La Poza Cantón Yologual', 'carret. A playita 9km al sur, 1 km antes de comunidad La Poza', 'Marjorie Carolina Molina', '26060413', '75887634', 'NA', 'Marjorie Carolina Molina', 'Directora', '26061413', '240489  13  16', '53.2  87  48', 225, 24, 1),
(177, '13411', 'Instituto Nacional Cantón Amapalita', 'Calle principal, salida a cantón agua escondida', 'Ricardo Alfonso Jimenez', '74056463', 'NA', 'jorge.pacheco80@yahoo.com', 'Jorge Humberto Pacheco', 'Director', '74056463', '243227  13  18', '22.8  87  49', 229, 24, 1),
(178, '13435', 'Centro Escolar Ducado De Luxemburgo', 'cton. Agua Escondida La Unión', 'Ramon de Jesus Arriola', '26060351', '75692841', 'ramon_arriola@live.com', 'Ramon de Jesus Arriola', 'director', '26060351', '242342  13  17', '53.7  87  48', 229, 24, 1),
(179, '13441', 'Centro Escolar Gregorio Alvarez Nuñez', 'Cantón Amapalita', 'Ricardo Alfonso Jimenez', '72734086', '72734086', 'NA', 'Ricardo Alfonso Jimenez', 'director', '72734086', '243527  13  18', '32.5  87  49', 229, 24, 1),
(180, '60241', 'Centro Escolar Cantón Yologual', 'Cantón yologual, conchagua, la unión', 'José Isaac Bonilla Loza', '78786248', '75760581', 'NA', 'José Isaac Bonilla Loza', 'Director', '75760581', '241779  13  17', '35.4  87  48', 225, 24, 1),
(181, '86025', 'Centro Escolar Cantón Conchaguita', 'Cton conchaguita', 'Mayra Marilene Zelayandia', '71603966', 'NA', 'NA', 'Mayra Marilene Zelayandia', 'Directora', '71603966', '243381  13  18', '27.8  87  49', 225, 24, 1),
(182, '12884', 'Centro Escolar Cantón Primavera', 'CE Cantón Primavera km 127, ET Transito, San Miguel', 'Blanca Lidia Turcios', '26013550', '71211073', 'blanky_turcios@hotmail.com', 'Blanca Lidia Turcios', 'Directora', '26013550', '247494  13  20', '48.1  88  19', 208, 25, 1),
(183, '12885', 'Centro Escolar Cantón Moropala', 'Cantón Moropala, calle a plan El Espino, El transito, San Miguel', 'José Vicente Zavala', '78213914', 'NA', 'josevicentevillalobos1996@hotmail.com', 'José Vicente Zarala', 'Director', '61401430', '239003  13  16', '11.7  88  18', 208, 25, 1),
(184, '12890', 'Instituto Nacional El Transito', 'Primera avenida Sur Barrio Concepción el Transito San Miguel', 'Ramón Alfredo Velázquez', '26161021', '78296512', 'institutonacionaldet@gmail.com', 'Eunice Nohemy Parada Martínez', 'NA', 'NA', '247897  13  21', '1.4  88  20', 208, 25, 1),
(185, '12891', 'Centro Escolar 14 de Abril', 'Final Primera Avenida norte, Barrios San Francisco El Transito', 'Víctor Manuel Quintanilla', '26160923', '78743139', 'victormq_1000@hotmail.com', 'Víctor Manuel Quintanilla', 'Director', '26160923', '248818  13  21', '31.4  88  20', 208, 25, 1),
(186, '12892', 'Centro Escolar El Transito', '1º ave. Sur Bo concepción', 'José Baltazar Parada Aguilar', '26160008', '60168637', 'parada2704@hotmail.com', 'José Baltazar Parada Aguilar', 'Director', '26160008', '247981  13  21', '4.2  88  20', 208, 25, 1),
(187, '12893', 'Centro Escolar Monseñor Oscar Arnulfo Romero y Galdámez', '10º calle poniente Barrio San Francisco, El Transito, San Miguel', 'Yesenia Flores', '61621041', 'NA', 'yyasminats@gmail.com', 'Yesenia Yasmin Flores de Santos', 'Directora', '61621041', '248815  13  21', '31.3  88  20', 208, 25, 1);
INSERT INTO `centro_educativo` (`ID_CENTRO_EDUCATIVO`, `COD_CENTRO_EDUCATIVO`, `NBR_CENTRO_EDUCATIVO`, `DIRECCION`, `NOMBRE_DIRECTOR`, `TELEFONO`, `CELULAR`, `CORREO_ELECTRONICO`, `NOMBRE_CONTACTO`, `CARGO_CONTACTO`, `TELEFONO_CONTACTO`, `LATITUD`, `LONGITUD`, `ID_MUNICIPIO`, `ID_SISTEMA_INTEGRADO`, `ACTIVO`) VALUES
(188, '82051', 'Centro Escolar Caserío Vado Marín Cantón Moropala', 'Cantón Moropala, Caserío Vada Marín', 'Sandra Elizabeth Jandes de Joya', '71803400', 'NA', 'sandrajandes@hotmail.com', 'Sandra Elizabeth Jandes de Joya', 'Directora', '71803400', '242146  13  17', '53.8  88  18', 208, 25, 1),
(189, '82056', 'Centro Escolar cantón La Pradera', 'Etapa nº3 col. La Pradera continuo a ANDA', 'Teresa de Jesús Chicas Moraga', '78287042', 'NA', 'teresachicas010@hotmail.com', 'Teresa de Jesús Chicas Moraga', 'Directora', '78287042', '246916  13  20', '29.4  88  20', 208, 25, 1),
(190, '82057', 'Centro Escolar Cantón Primavera Dos', 'NA', 'Marta Antonieta Rivas', '26160296', '61040354', 'genesis011965@hotmail.com', 'Marta Antonieta Rivas de Martínez', 'Director', '26160296', '248039  13  21', '5.8  88  19', 208, 25, 1),
(191, '86301', 'Centro Escolar Cantón Pradera Dos', 'Col. La Pradera Etapa #5, El Transito, San Miguel', 'Emperatriz Elena Benavides', '71515579', 'NA', 'emperatriz.elena.benavides@gmail.com', 'Emperatriz Elena Benavides', 'Directora', '71315579', '247118  13  20', '35.9  88  20', 208, 25, 1),
(192, '12964', 'Centro Escolar Cantón Candelaria', 'Cantón Candelario, calle principal', 'Héctor Galvario González', '75646127', 'NA', 'hectorgr2014@outlook.com', 'Héctor Galvario González', 'Director', '75646127', '257939  13  26', '28.2  88  21', 216, 26, 1),
(193, '12965', 'Instituto Nacional de San Jorge', '3 ave. Nte Barrio concepción San Jorge', 'Manuel Rolando Paredes', '26194058', '70594052', 'insajo@hotmail.es', 'Manuel Rolando Paredes Flores', 'Director', '26194058', '255325  13  25', '3.1  88  20', 216, 26, 1),
(194, '12966', 'Centro Escolar Cantón Joya de Ventura', 'Cantón Joya de Ventura', 'Dinora Elizabeth Vargas', '77421556', 'NA', 'NA', 'Dinora Elizabeth Vargas', 'Directora', '77421556', '255644  13  25', '13.6  88  21', 216, 26, 1),
(195, '12970', 'Centro Escolar Cantón San Julián', 'Cantón San Julián', 'Carmen Julia Valencia de Flores', '77226557', 'NA', 'carmen.valencia.garciaguirre@mined.edu.sv', 'Carmen Julia Valencia de Flores', 'Directora', '77226557', '256932  13  25', '55.4  88  20', 216, 26, 1),
(196, '86551', 'Centro Escolar Caserío El Mogote', 'Cantón San Julián, Caserío El Mogote, San Jorge', 'Mirtala Lisseth Zelaya de Ávalos', '76037838', 'NA', 'NA', 'José Osmín Calmerón Tícas', 'Profesor auxiliar', '75310761', '255992  13  25', '24.8  88  20', 216, 26, 1),
(197, '12967', 'Centro Escolar Caserío Los Pocitos CantonJoya De Ventura.', 'Caserio Los Pocitos, Canton Joya De Ventura, San Jorge', 'Laura Estela Romero De Portillo', '79216401', '79216401', 'NA', 'Laura Estela Romero De Portillo.', 'Directora', 'NA', '253985  13  24', '19.6  88  21', 216, 27, 1),
(198, '12968', 'Centro Escolar Cantón La Morita', 'Canton La Morita San Jorge San Miguel', 'Moises Ricardo Quintanilla', 'NA', 'NA', 'NA', 'Moises Ricardo Quintanilla Cuadra', 'Director', '77446895', '255847  13  25', '19.8  88  19', 216, 27, 1),
(199, '12969', 'Centro Escolar Juan Pablo Espinoza', '3era av. Norte y3era calle pte. Barrio concepciòn, San Jorge', 'Jose Isaac Portillo Rivas', '72087219', 'NA', 'jipor@hotmail.com', 'Jose Isaac Portillo', 'director', '72087219', '255307  13  25', '2.5  88  20', 216, 27, 1),
(200, '86309', 'Centro Escolar Candelaria Emperatriz Moreno, Cantòn La Ceiba.', 'un kilometro y medio al sureste del puente salida a San Miguel', 'Julio Cesar Campos Campos', '78182280', 'NA', 'julio.campos.camposmined.edu.sv', 'Julio Cesar Campos Campos', 'Director', '78182280', '253542  13  24', '5  88  19', 216, 27, 1),
(201, '11457', 'Centro Escolar Cantón Santa Lucia Los Palones', 'Km 11 1/2, carretera a panchimalco, desv.  Después de monteliz', 'Xochilt Rodríguez de Vásquez', '70815241', 'NA', 'Xbrioso@yahoo.com', 'Xochilt Rodríguez de Vásquez', 'Directora', '70815241', '279239  13  38', '04.11  90  10', 30, 28, 1),
(202, '11468', 'Centro Escolar Cantón Mil Cumbres', 'Final calle a puerta del diablo, mil cumbre', 'Arcenia de Jesús Rodríguez', '22994075', '77424402', 'NA', 'Arcenia de Jesús Rodríguez', 'Directora', '77424402', '277425  13  37', '05.05  89  11', 30, 28, 1),
(203, '11495', 'Centro Escolar Goldtree Liebes', 'Costado norte, parque balboa, calle puerta del diablo', 'María Elbia Gónzales de Romero', '22808911', 'NA', 'cdegoldtreeliebes@gmail.com', 'María Elbia Gónzales de Romero', 'Directora', '22808911', '280013  13  38', '28.98  89  11', 2, 28, 1),
(204, '70047', 'Centro Escolar Cantón El Cedro', '4 1/2 km al sur, mirador puerta del diablo, cantón el cedro de panchimalco', 'José Daniel Rodríguez Gonzáles', '76830679', 'NA', 'jonielrogo@hotmail.com', 'José Daniel Rodríguez Gonzáles', 'Director', '76830679', '276525  13  36', '35.68  89  12', 30, 28, 1),
(205, '70048', 'Centro Escolar Cantón El Guayabo', 'Carretera a puerta del diablo, antiguo punto ruta 12, desvio cantón el guayabo', 'José Luis Aguirre Lima', '25414657', '79761277', 'joseluisaguirrelima1963@gmail.com', 'José Luis Aguirre Lima', 'Director', '25414657', '278823  13  37', '50.54  89  11', 30, 28, 1),
(206, '70055', 'Centro Escolar Cantón Quezalpa', '5 Km al sur del turicentro puerta del diablo', 'Elmer Antonio Cañenguez', '22016166', '77837991', 'c.e.cquezalapa@gmail.com', 'Elmer Antonio Cañenguez', 'Director', '77837991', '275905  13  36', '15.54  89  11', 30, 28, 1),
(207, '70095', 'Centro Escolar Cantón Amatitan', 'Km. 11 1/2 calle antigua a panchimalco', 'Tamara Aguirre', '63074140', 'NA', 'tamara_hilbea@hotmail.com', 'Tamara Aguirre', 'Directora', '63074140', '279155  13  38', '02.02  89  10', 30, 28, 1),
(208, '86398', 'Centro Escolar Caserío Las Joyitas', 'Caserío las joyitas sobre entrada principal', 'María  Isabel Gúzman', '77662010', 'NA', 'isabelitafunes@hotmail.com', 'María  Isabel Gúzman', 'Directora', '77662010', '278184  13  37', '29.77  89  10', 30, 28, 1),
(209, '86399', 'Centro Escolar Comunidad Monteliz', 'Carretera a panchimalco km 11.6, comunidad monteliz', 'Roxana Guadalupe Guzmán', '61339982', 'NA', 'roxym2027@gmail.com', 'Roxana Guadalupe Guzmán', 'Directora', '61339982', '279891  13  38', '25.30  89  10', 30, 28, 1),
(210, '11477', 'Centro Escolar Palo Grande ', 'Canton Palo Grande, cerca del punto de microbuses, ruta 117', 'Roxana Ventura de Ortiz ', '23990423', '61440069', 'NA', 'Roxana Ventura de Ortiz ', 'Directora', '61440069', '269415  13  32', '56.53  89  12', 31, 29, 1),
(211, '70041', 'Centro Escolar Canton El Amayon', 'Carretera litoral, km 46 desvio cachas, caserio las morenas', 'Griselda Xiomara Muñoz', 'NA', '73250902', 'xiomara201188@hotmail.com', 'NA', 'NA', 'NA', '266252  13  31', '01.53  89  10', 30, 29, 1),
(212, '70042', 'Centro Escolar Caserío Plan del Mango', 'Calle principal, cantón plan del mango', 'Nelson Agustin Gúzman', '74350995', 'NA', 'guzmannelsonagustin@gmail.com', 'Nelson Agustin Gúzman', 'Director', '74350995', '265081  13  30', '23.33  89  11', 30, 29, 1),
(213, '70043', 'Centro Escolar Caserios Las Morenas Canton El Amayon', 'Calle Principal Canton el Amayon.', 'Rafael Alberto Alvarado', 'NA', '73193740', 'rafaelalbrto2010@hotmail.com', 'Rafael Alberto Alvarado', 'Director', '73193740', '265119  13  30', '24.54  89  11', 30, 29, 1),
(214, '70044', 'Centro Escolar Caserios la Victorias', 'KM471/2desvio de Amayon', 'Jose Roberto Donado', 'NA', '75848850', 'donadoramos@gmail .com', 'Jose Roberto Donado', 'Director', '75848850', '263327  13  29', '26.32  89  10', 30, 29, 1),
(216, '10640', 'Centro Escolar Canton Los Cañales', 'Cantón Los Cañales, Juayua, Sonsonate', 'Daniel Humberto Martí Mnedez', '77923411', '77483442', 'danielmartirjuayua.@gmail.com', 'Daniel Humberto Martí Mendez', 'Director', '77923411', '301108  13  49', '52  89  43', 152, 30, 1),
(217, '10643', 'Centro Escolar De Juayua', '10 av. Sur, 6ta calle ote, Juayua', 'José Alfreedo Valdez', '24150576', '71992887', 'joseavaldess@hotmail.com', 'Jose Alfredo Valdés', 'Director', '24151576', '302270  13  50', '29.7  89  44', 152, 30, 1),
(218, '10647', 'Centro Escolar Cantón San Juan De Dios', 'Canton San Juan De Dios.', 'Salvador De Jesus Canizales.', '79200640', '79200640', 'sjcanizales61@hotmail.com', 'Salvador DeJesús Canizales.', 'Director', '79200640', '306980  13  52', '2.6  89  46', 152, 30, 1),
(219, '10653', 'Centro Escolar Cantón La Puente.', 'Juayua, cnton, San Juan De Dios.', 'Renato Eliseo Pacheco', '76709212', 'NA', 'renaupachequin@gmail.com', 'Renato Eliseo Pacheco', 'Director', '76709212', '304553  13  51', '43.8  89  45', 152, 30, 1),
(220, '10659', 'Centro Escolar Presbitero Jose Luis Martinez.', 'Juayua Centro, por la Iglesia.', 'Nelson Bladimir Rodriguez.', '24522020', '76322550', 'siemprepalante@hotmail.com', 'Nelson Bladimir Rodriguez Palma.', 'Director', '24522020', '302360  13  50', '32.6  89  44', 152, 30, 1),
(221, '60281', 'Centro Escolar Asentamiento Buena Vista, Canton La Unión.', 'Cantón La Unión Juayua, asentamiento Buena Vista.', 'Armando Antonio Albanez.', 'NA', '70072569', 'NA', 'Rosa Guadalupe Escobar.', 'Docente auxiliar', '70332765', '303185  13  50', '59.5  89  44', 152, 30, 1),
(222, '10642', 'Escuela de Educacion  Especial de Juayua', 'Final6ª C. y 10 AV Sur Col. Santa Elena Juayua', 'Directora', '72606179', '72606179', 'alba.alvarado.reina@mined.edu.sv', 'Alba Karenina Alvarado de Reina', 'Directora', '72606179', '0', '0', 152, 31, 1),
(223, '10644', 'Instituto Nacional De Juayua', 'NA', 'Lilian Umaña Hernandez', '24522073', '71108194', 'uma_lilian@hotmail.com', 'Lilian Umaña Hernandez', 'Directora', '24522073', '302294  13  50', '30.5  89  44', 152, 31, 1),
(224, '10645', 'Escuela de Educación Parvularia José Rolando Salaverria', '3º avenida sur Barrio El Calvario frente a Fray Bartolome de las casas', 'Ana Patricia Torres', '24522040', 'NA', 'patytorres2972@gmail.com', 'Ana Patricia Torres', 'Directora', '24522040', '302290  13  50', '30.3  89  44', 152, 31, 1),
(225, '10658', 'Complejo Educativo Fray Bartolome de Las Casas', '4Av. Sur entre calle Monseñor Arnulfo Romero y 6 calle Oriente.', 'Ramón Alberto Ramirez Herrera', '24522047', '61407800', 'rramonalberto72@gmail.com', 'Ramón Alberto Ramirez Herrera', 'Director', '24522047', '302284  13  50', '30.1  89  44', 152, 31, 1),
(226, '64051', 'Centro Escolar Cantòn Buenos Aires', 'Caserio Centenario Cantòn  Buenos Aires', '-', 'NA', 'NA', 'lfelipe@hotmail.com', 'Luis Felipe Vielman Tobar', 'NA', '76445059', '306873  13  52', '59.4  89  44', 152, 31, 1),
(227, '64052', 'Centro Escolar Caserio San Iluciones, Cantòn La Unión', 'Calle Principal Col. Las Ilusiones', 'Ana Maria del Carmen Lemus deVazquez', '76589221', '76589221', 'lemusmariaana@hotmail.com', 'Ana Maria del Carmen Lemus deVazquez', 'Directora', '76589221', '302452  13  50', '35.7  89  44', 152, 31, 1),
(228, '64053', 'Centro Escolar Caserio Monterrey Cantón Los Cañales', 'Col. Sta Rudecinda Block C Antigua zona verde, Col. El calvario', 'Carmen Elizabeth Garay de López', '76498226', '76498226', 'jajakeadri@hotmail.com', 'Carmen Elizabeth Garay de López', 'Directora', '76498226', '301936  13  50', '18.8  89  44', 152, 31, 1),
(229, '10660', 'Centro Escolar Cantón el cerrito', 'NA', 'Jimmy Edgar Rivera', '74789006', 'NA', 'NA', 'Jimmy Edgar Rivera', 'Director', '74789006', '293368  13  45', '40.1  89  44', 153, 32, 1),
(230, '10671', 'Centro Escolar Estado de Israel', '3a Av. Nte. #3, Bo. La trinidad, Nahuizalco', 'Alma Carolina Gómez', '77449705', 'NA', 'ceedo_israel@hotmail.com', 'Alma Carolina Gómez', 'Directora', '77449705', '295495  13  46', '49.3  89  44', 153, 32, 1),
(231, '10674', 'Escuela de Educación Párvularia Juan de Dios', 'Final calle el paraíso, Bo. San Juan contíguo a estadio municipal', 'Gloria Marisol Puente', '76621973', 'NA', 'NA', 'Gloria Marisol Puente', 'Directora', '76621973', '295324  13  46', '43.8  89  44', 153, 32, 1),
(232, '60287', 'Centro escolar lotificación la montañita número uno, cantón el cerrito', 'km. 69 carretera a sonsonate, Nahuizalco, lotificación la montañita #7. cantón el cerrito.', 'Griselda Guadalupe Marroquín Canales', '78525160', 'NA', 'NA', 'Griselda Guadalupe Marroquín Canales', 'Directora', '78525160', '291865  13  44', '51.2  89  44', 153, 32, 1),
(233, '64059', 'Centro Escolar Caserio Tatalpa Cantón Anal Abajo', 'Caserio Tatalpa, cantón Anal abajo', '-', 'NA', 'NA', 'NA', 'Gladis Leticia Doratt', 'Subdirectora', '71325658', '296316  13  47', '16.1  89  43', 153, 32, 1),
(234, '64060', 'Centro Escolar Cantón Anal Arriba', 'Calle primcipal, cantón anal arriba, Caserio la escuela', 'José María Martínez Zúniga', '77428104', '77294829', 'centroescolarcantonanalarriba@gmail.com', 'José María Martínez Zúniga', 'Director', '77294829', '297690  13  48', '0.8  89  43', 153, 32, 1),
(235, '86256', 'Centro Escolar Caserío Santa Isabel La Guacamaya', 'Col. Santa isabel, block 10, lote 14', 'Francisca Maribel Ayala de Ruíz', '72104990', 'NA', 'NA', 'Francisca Maribel Ayala de Ruíz', 'Directora', '72104990', '296235  13  47', '13.4  89  44', 153, 32, 1),
(236, '86401', 'Centro Escolar Caserio Los Olivos, Cantón El Cerrito', 'Caserio los olivos, cantón el cerrito', 'Cristobal de Jesús Calzadilla', '76173894', '76173894', 'c.ecaseriolosolivos@hotmail.com', 'Cristobal de Jesús Calzadilla', 'Director', '76173894', '291478  13  44', '38.6  89  44', 153, 32, 1),
(237, '10754', 'INSTITUTO NACIONAL DE NAHUIZALCO / APERTURA EN EL 2019', 'ASENTAMIENTO SAN FRANCISCO PELIGONO C LOTES 10 Y 18 A PROXIMADAMENTE 20 METROS DE CARRETRA SALCATITAN SONSONATE KM 80/81', '-', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', '0', '0', 153, 32, 1),
(238, '10683', 'Complejo Educativo Juan Enriques Pestalozzi', 'NA', 'Ronald Alberto Enrique Santos', '78609568', 'NA', 'salcoatitan1@hotmail.com', 'Ronald Alberto Enrique Santos', 'Director', '24692239', '300763  13  49', '40.5  89  45', 155, 33, 1),
(239, '60315', 'Centro Escolar Colonia el Progreso', 'Asentamiento San Francisco Pol C lotes 10 y 18', 'Héctor Oliverito López Baches', 'NA', '70420220', 'lópez.bachez@gmail.com', 'Héctor Oliverito López Baches', 'Director', '70420220', '299996  13  49', '15.5  89  45', 155, 33, 1),
(240, '64069', 'Centro Escolar Caserío Finca Santa Elena Cantón El Puente', 'Km 68 carretera a Sonsonate a Salcoatita', 'Beatriz Estela Doratt', '76402996', 'NA', 'esteladoratt68@gmail.com', 'Beatriz Estela Doratt', 'Directora', '76402992', '299494  13  48', '59.3  89  44', 155, 33, 1),
(241, '64070', 'Centro Escolar Cantón Los Anisales', 'Cantón Los Anisales Lotificación La Esperanza', 'Delmy Maribel Castaneda', '73171909', 'NA', 'NA', 'Delmy Maribel Castaneda', 'Directora', '73171909', '304139  13  51', '30.2  89  46', 155, 33, 1),
(242, '64071', 'Centro Escolar Caserío El Carrizal Cantón Los Anizales', 'Caserío El Carrizal, Cantón Los Anizales, Salcoatitan, Sonsonate', 'Margarita Sibirián', '78158913', 'NA', 'margarita.sibirian.benavides@mined.edu.sv', 'Margarita Sibirián', 'Directora', '78158913', '302188  13  50', '26.8  89  45', 155, 33, 1),
(243, '64089', 'Centro Escolar Caserío El Monarca Cantón Las Peñas', 'Caserío El Monarca Cantón Las Peñas, Santa Catarina Masahuat', 'Silvia Beltan', '76868981', 'NA', 'NA', 'Silvia Beltran', 'Directora', '76868981', '297833  13  48', '5.2  89  45', 158, 33, 1),
(244, '10687', 'CE Republica de Libano', '2a Avenida Sur B° Las Flores', 'Jesus Alirio Sintigo Labor', 'NA', '76282580', 'jsintigo1956@gmail.com', 'Jesus Alirio Sintigo Labor', 'Director', '76282580', '288736  13  43', '9.4  89  44', 156, 34, 1),
(245, '10688', 'Centro Escolar Victoria Teresa Menedez Viuda de Escalante', 'Canton Guyuapa abajo, Carret. A San Pedro Puxtla', 'Ana Disy Rugamas de Pérez', 'NA', '77010781', 'anadaisyrugamas@yahoo.com', 'Ana Daisy Rugamas de Pérez', 'Directora', '77010781', '288572  13  43', '3.7  89  46', 156, 34, 1),
(246, '10689', 'CE Canton Agua Santa', 'Canton Los Naranjos, Agua Santa, San Antonio del Monte', 'German Gregorio Linares Hernandez', 'NA', 'NA', 'yasmin.avalos25@hotmail.com', 'Yanira Yasmin Avalos Acosta', 'Directora Interina', 'NA', '287497  13  42', '28.9  89  44', 156, 34, 1),
(247, '10690', 'Centro Escolar Cantón San Ramon', 'NA', 'Walter Alonso Jimenez', '78121805', 'NA', 'NA', 'Walter Alonso Jimenez', 'Director', 'NA', '290986  13  44', '22.5  89  44', 156, 34, 1),
(248, '10691', 'CE Cantón Cuyuapa Arriba', 'Caserio Las Cruces, Canton Cuyuapa Arriba', 'Gloria Zañas Lopez', 'NA', '70490209', 'gloriazañas8999@hotmail.com', 'Gloria Zañas Lopez', 'Directora', '70490209', '290409  13  44', '3.6  89  45', 156, 34, 1),
(249, '10713', 'CE Jardines de Sonsonate', 'Final Calle pral. Col. Jardines de Sonsonate, San Antonio del Monte', 'Victo Manuel Pérez', '78249171', '71001523', 'malione.perez@gmail.com', 'Victor Manuel Pérez', 'Director', '71001523', '287707  13  42', '35.9  89  44', 156, 34, 1),
(250, '64072', 'CE Canton El Castaño', 'Lotificación El Castaño #2', 'José David Díaz Menendez', 'NA', '79236820', 'jose.ruiz.menendez@mined.edu.sv', 'José David Ruiz Menendez', 'Director', '79236820', '288947  13  43', '16.1  89  45', 156, 34, 1),
(251, '64073', 'Centro Escolar Cantón Las Hojas', 'Cantón Las Hojas, San Antonio del Monte, Sonsonate', 'Vilma Estela Hernandez Melgar', 'NA', '71744176', 'vilma_estela@hotmail.com', 'Vilma Estela Hernández Melgar', 'Directora', '71744176', '287402  13  42', '25.8  89  45', 156, 34, 1),
(252, '10516', 'Escuela de Educación Parvularia de San Julian.', 'Tercera calle oriente barrio El Calvario.', 'Mirna Ester Vega.', 'NA', '72509275', 'mirna.ester25@gmail.com', 'Mirna Ester Vega.', 'Directora', '72509275', '286158  13  41', '47.2  89  33', 157, 35, 1),
(253, '10693', 'Centro Escolar Doctor Eduardo Enrique Barrientos.', 'Final calle Simon Bolivar, San Julian.', 'Abigail Nohomy Paz de Alvarez.', 'NA', '77581973', 'abigail.paz.alvarez@mined.com.sv', 'Abigail Nohomy Paz de Alvarez.', 'Directora', '24560069', '286062  13  41', '44.1  89  33', 157, 35, 1),
(254, '10694', 'Centro Escolar Cantón el bebedero', 'Cantón el bebedero', 'Maritza Magdalena Ávalos de Tesorero', '76071890', 'NA', 'NA', 'Maritza Magdalena Ávalos de Tesorero', 'Directora', '76071890', '289874  13  43', '47.9  89  35', 157, 35, 1),
(255, '10696', 'Complejo Educativo Eugenio Aguilar Trigueros..', 'NA', 'Walter Antonio Alvarenga Hernadez.', '79539835', '78539835', 'NA', 'Walter Antonio Alvarenga Hernadez.', 'Director', '24834201', '290324  13  44', '2.7  89  33', 157, 35, 1),
(256, '10698', 'Instituto Nacional de San Julian', 'Final quinta calle oriente avenida la luma colonia Los Balsamares.', 'Carlos Alfredo Santillana Aguilar.', '24291973', '77495285', 'coralsantillana@gmail.com', 'Carlos Alfredo Santillana Aguilar.', 'Director', '24291973', '286207  13  41', '48.8  89  33', 157, 35, 1),
(257, '60282', 'Centro Escolar Colonia El Milagro Caserio Las Mercedes.', 'Colonia El Milagro Caserio Las Mercedes Cantón Los Lagartos.', 'Sonia Elizabeth Chacón.', 'NA', '65125830', 'sonia.chacon@mined.edu.sv', 'Sonia Elizabeth Chacón.', 'Directora', '63125830', '287669  13  42', '36.3  89  33', 157, 35, 1),
(258, '64074', 'Centro Escolar Caserio Casa Blanca, cantón los lagartos', 'Caserio csa blanca, cantón los lagartos, san julian', 'Karla Elizabeth Ramírez de Roman', '77485389', 'NA', 'karlitamia_123@hotmail.com', 'Karla Elizabeth Ramírez de Roman', 'Directora', '77485389', '290259  13  44', '0.7  89  32', 157, 35, 1),
(259, '64075', 'Caserio Los Angeles Cantón Los Lagartos.', 'Caserio Los Angeles Canton Los Lagartos, San Julian.', 'Francisca Concepción Luna.', 'NA', '70876665', 'francisca.luna.@mined.edu.sv', 'Francisca Concepción Luna.', 'Directora', '24419775', '288273  13  42', '55.9  89  34', 157, 35, 1),
(260, '64076', 'Centro Escolar Caserio El Sauce Canton Petacas.', 'Lotificación Praderis de San Julian.', 'Mayra Elizabeth Rojas Pineda.', 'NA', 'NA', 'c.e.caserioelsauce@gmail.com', 'Mayra Elizabeth Rojas Pineda.', 'Directora', '76632164', '286763  13  42', '6.9  89  33', 157, 35, 1),
(261, '64077', 'Centro Escolar Cantón Petacas.', 'Canton Las Petacas.', 'Ada Evelyn Sanchez Gómez', 'NA', '79887555', 'NA', 'Ada Evelyn Sanchez Gómez', 'Directora', '79887555', '286146  13  41', '47  89  32', 157, 35, 1),
(262, '64083', 'Centro Escolar Reino de España', 'NA', 'Nery Alexander López Rivera', '70930651', 'NA', 'NA', 'Nery Alexander López Rivera', 'Director', '70930651', '286534  13  41', '59.3  89  34', 157, 35, 1),
(263, '10700', 'CE Eduardo Salaverría', '1º Av. Sur y 16º C. P. Barrio El Calvario', 'Iván Arevalo Gutierrez', '24575010', '70402006', 'cescam10700@hotmail.com', 'Iván Arevalo Gutierrez', 'Director', '24575010', '296126  13  47', '9.5  89  46', 158, 36, 1),
(264, '64086', 'Centro Escolar Caserío Loma Larga Cantón El Matazano', 'Caserío Loma Larga Cantón Matazano', 'Blanca Mercedes Chávez de Ortiz', '75848762', 'NA', 'NA', 'Blanca Mercedes Chávez de Ortiz', 'Directora y docente', '75848762', '297880  13  48', '6.4  89  46', 158, 36, 1),
(265, '64087', 'Centro Escolar Regina de Langenegger', 'Caserío Santa Rosa, Cantón El Matazano', 'Felix Salvador Guevara Guerra', '70606323', 'NA', 'NA', 'Felix Salvador Guevara Guerra', 'Director', '70606323', '296818  13  47', '31.9  89  46', 158, 36, 1),
(266, '64088', 'Centro Escolar Caserío El Ciprés Cantón Las Peñas', 'Caserío El Ciprés, Cantón Las Peñas', 'Ericka Guadalupe Calvo de Arévalo', '76783810', 'NA', 'NA', 'NA', 'NA', 'NA', '297605  13  47', '57.7  89  45', 158, 36, 1),
(267, '86251', 'Centro Escolar Caserío Los Shull, Cantón Cuyuapa Arriba', 'Cas. Los Shull, Cantón Cuyuapa Arriba', 'María Yanira Ruiz', '61377805', 'NA', 'yaniraruiz212@hotmail.com', 'María Yanira Ruiz', 'Directora y docente', '61377805', '294930  13  46', '30.7  89  45', 158, 36, 1),
(268, '10602', 'CE Canton Atiluya', 'Carretera de San Julian a Santa Isabel, Ishuatan , Canton Atiluya', 'Irma Yolanda Gomez Mancía', 'NA', '78537823', 'irma.gomez.mancia@mined.edu.sv', 'Irma Yolanda Gomez Mancía', 'Directora', '78537823', '279670  13  38', '16  89  33', 159, 37, 1),
(269, '10608', 'CE Maria Mendoza de Baratta', 'Final Av. Felipe Soto, Barrio El Calvario, Santa Isabel Ishuatan', 'Alfonso Esteban Jimenez', '77420670', '77420670', 'coedbaratta@hotmail.com', 'Alfonso Esteban Jimenez/María de los Angeles', 'Director/Secretaria', '77420670/63043890', '276861  13  36', '44.5  89  35', 159, 37, 1),
(270, '60165', 'CE La Sabana Canton El Paraiso', 'Caserio La Sabana, Cantón El Paraíso', 'Ana Maria Salinas de Lima', 'NA', '76826713', 'salinasdelima@yahoo.es', 'Ana María de Lima', 'Directora', '76826713', '276967  13  36', '48.1  89  33', 159, 37, 1),
(271, '64030', 'CE Caserio Las Peñas Canton Acachapa', 'Caserio Las Peñas, Canton Acachapa', 'Humberto Gonzalez', 'NA', '78626146', 'NA', 'Carlos Jeovany Arevalo Mata', 'Subdirector', '78626146', '274636  13  35', '32.1  89  35', 159, 37, 1),
(272, '64031', 'CE Caserio Mirasol Canton Miramar', 'Caserio Mirasol, Canton Miramar', 'Marina Arias  Avalos', 'NA', '78090727', 'amarina82@hotmail.com', 'Marina Arias Avalo', 'Directora (Unidocente)', '78090727', '279033  13  37', '55.2  89  34', 159, 37, 1),
(273, '64033', 'CE Caserio Los Encuentros Cantón Acachapa', 'NA', 'Albert Iván Hernández Castillo', '79242435', '79242435', 'albert.hernandez.castillo@mined.edu.sv', 'Albert Iván Hernández Castillo', 'Director', '79242435', '274993  13  35', '43.8  89  34', 159, 37, 1),
(274, '64126', 'CE Caserio Colonia La Sabana Canton Apancoyo Arriba', 'Caserio Colonia La Sabana Cantón Apancoyo Arriba', 'Morelia Judith Asucena de Ramirez', '73829635', '73829635', 'moreliajderamirez@hotmail.com', 'Morelia Judith Asucena de Ramirez', 'Directora', '73829635', '278252  13  37', '29.7  89  35', 159, 37, 1),
(275, '80085', 'Centro Escolar Caserio El Tempiscal', 'caserio el tempiscal canton el Zapote', 'Angel Maria Machado', '72261307', 'NA', 'NA', 'Jaquelin Marisol Jurado', 'subdirectora', '71306449', '229040  13  10', '45.5  88  7', 282, 38, 1),
(276, '80086', 'Complejo Educativo Alicia Cisneros De Zelayandia C/ El Majague', '7km al poniente de playa el cuco Jucuaran U.S', 'Francisco De Jesus Galvez', 'NA', 'NA', 'NA', 'Galileo Mendoza Alvarenga', 'sub director', '76973199', '228060  13  10', '13.8  88  8', 282, 38, 1),
(277, '80087', 'Centro Escolar Caserio Las Huateras, Canton El Zapote', 'playa el cuco km 11.5 nt de caserio el carrisal', 'Dina Elizabeth Mesia Rivas', 'NA', '71746069', 'NA', 'Iris Del Carmen Muñoz', 'sub directora', 'NA', '229731  13  11', '8.4  88  10', 282, 38, 1),
(278, '80088', 'Centro Escolar Caserio El Carrizal, Canton El Zapote', 'NA', 'Herson Abdiel Salmeròn Paz', '26809209', '79314097', 'hersonsalmeron90hotmail.com', 'Herson Abdiel Salmeròn Paz', 'director', '26809209', '228391  13  10', '24.8  88  10', 282, 38, 1),
(279, '80089', 'Centro escolar caserío Guaycume cantón El Zapote', 'Caserio Guaycume, Canton el Zapote, Jucuaran ', 'Rosa Ana Arevalo ', 'NA', 'NA', 'NA', 'Rosa Ana Arevalo ', 'Director', '73866564', '234809  13  13', '53.8  88  10', 282, 38, 1),
(280, '80180', 'Centro Escolar Caserio Agua Fria, Canton El Zapote', '13 km y medio de norponiete de playa el cuco', 'Francisca Aida Osorio', '26809209', '79443233', 'NA', 'Francisca Aida Osorio', 'Directora', '79314097', '227917  13  10', '9.7  88  11', 282, 38, 1),
(281, '86199', 'Centro escolar caserío el Alambre cantón el Zapote', 'Caserio el Alambre, Canton El Zapote, Jucuaran ', 'Fredy Walter Gomez Palacios', 'NA', '74665355', 'NA', 'Fredy Walter Gomez', 'Director interino', 'NA', '234732  13  13', '51.4  88  11', 282, 38, 1),
(282, '86506', 'Centro Escolar Caserio El Bajio Canton El Zapote', 'San Rafael Oriente depto San Miguel', 'Jorge Alberto Sanchez', '78329827', '60089702 75257799', 'oscaritorivera100hotmail.com', 'Jorge Alberto Sanchez', 'director', '78329827', '230418  13  11', '30.3  88  7', 282, 38, 1),
(283, '12606', 'Centro Escolar Caserio El Planon, Cantón Samuria', 'Caserío el planon, cantón simuria', 'Sandra Parada', '73192104', 'NA', 'oscarcito14kgmail.com', 'Petrona de Jesús Vásquez', 'Directora en funciones', '73192104', '236027  13  14', '34.7  88  18', 282, 39, 1),
(284, '12617', 'Complejo Educativo El Samuria', 'NA', 'Rosa Armidia Vasquez', 'NA', '72804240', 'NA', 'Rosa Armidia VASQUEZ', 'Directora', '72804240', '236161  13  14', '38.8  88  16', 282, 39, 1),
(285, '12621', 'Centro Escolar Cantón el Llano', 'Calle yano', 'Olinda Aracelis Valencia', '78744813', '78615306', 'NA', 'Josefa Elizabeth Aparicio', 'Sub directora', '78615306', '234836  13  13', '55.4  88  15', 282, 39, 1),
(286, '80090', 'Centro Escolar Caserío Las Flores Cantón Samuria', 'Caserío Las Flores, Cantón Samuria a Usulután', 'José Pablo Franco Mejía', '75092133', 'NA', 'NA', 'José Pablo Franco Mejía', 'Director', '75902133', '234374  13  13', '40.9  88  17', 282, 39, 1),
(287, '80091', 'Centro Escolar Caserio Valle Seco, cantón samuria', 'Caserio valle seco, cantón samuria, jucuaran', 'María Estela Franco Solís', '75399181', 'NA', 'Estelafranco@gmail.com', 'María Estela Franco Solís', 'Directora', '75399181', '236300  13  14', '43.5  88  17', 282, 39, 1),
(288, '80092', 'Centro Escolar Caserio Los Conventos, Cantón Samuria', 'Cantón Samuria, caserio los conventos, jucuaran', 'Marlene Arely Contreras Torres', '26270105', '71883566', 'Rosacastro837@yahoo.es', 'Rosa Emila Castro de Pacheco', 'NA', '71883566', '234411  13  13', '42.2  88  18', 282, 39, 1),
(289, '86198', 'Centro Escolar Caserio el Quebracho Cantón Samuria', 'Carretera a playa el espino, 3km al sur de desvio las playa', 'María Irma Solís', '72293976', 'NA', 'irmasolisfco@gmail.com', 'María Irma Solís', 'Directora', '72293976', '233233  13  13', '3.9  88  18', 282, 39, 1),
(290, '86200', 'Centro Escolar Caserio Santa Lucia Cantón El Llano', '2 km al sur poniente de cartel Unidad de salud, caserio Santa Lucia', 'Rosa Elsy Osegueda Parada', '78513387', 'NA', 'NA', 'Rosa Elsy Osegueda Parada', 'Directora', '78513387', '235628  13  14', '21.1  88  14', 282, 39, 1),
(291, '86505', 'Centro Escolar Caserio El Escondido Cantón Samuria', 'Caserio el escondido, cantón Samuria', 'Evelyn Yanet Rosales', '73944394', 'NA', 'evelinmg@gmail.com', 'Evelyn Yanet Rosales', 'Directora', '73944394', '236785  13  15', '5.3  88  17', 282, 39, 1),
(292, '12655', 'Centro Escolar Fe Y Alegria.', 'NA', 'Mannuel Enriquez Rivas.', '26636879', '70652506', 'NA', 'Mannuel Enriquez Rivas.', 'Director', '70652506', '239138  13  16', '18  88  32', 286, 40, 1),
(293, '12656', 'Escuela de Educación Parvularia de El Puerto La Libertad.', 'Final segunda avenida norte contiguo a unidad de salud.', 'Mariana de Jesús Fernádez.', 'NA', '71033181', 'mariana.jesus64@hotmail.com', 'Mariana de Jesús Fernádez.', 'Director', 'Mariana de Jesús Fer', '239334  13  16', '24  88  32', 286, 40, 1),
(294, '12659', 'Instituto Nacional De Puerto El Triunfo.', 'Salida a Jiquilisco frente al bulevar Rafael Arquimides Romero Colonia El Pibe.', 'Rigoberto Morales Mata.', '26636288', '74690878', 'rigoberto.morales@hotmail.es', 'Rigoberto Morales Mata.', 'Director', '74960878', '239828  13  16', '40  88  32', 286, 40, 1),
(295, '12660', 'Centro Escolar Puerto El Triunfo.', 'Cuarta calle oriente y 30 venida norte puerto el triunfo.', 'Oscar Armando Diaz.', '26337378', '78409729', 'armandodiaz03@yahoo.com', 'Oscar Armando Diaz.', 'Director', '78409729', '239535  13  16', '31  88  32', 286, 40, 1),
(296, '14860', 'Centro Escolar Caserio Lotificación El Sitio.', 'Lotificación el sitio lote #1 poligono 66.', 'Saul Obidio Hernández Melgar.', 'NA', '74623851', 'melgarsaul48@gmail.com', 'Saul Obidio Hernández Melgar.', 'Director', '74623851', '241579  13  17', '37  88  32', 286, 40, 1),
(297, '80051', 'Centro Escolar Hacienda Chaguandique', 'Caserío Hacienda Chaguandique, Cantón Cejas negras', 'Jorge Alberto', '77139390', 'NA', 'NA', 'Jorge Alberto Amaya', 'Director', 'NA', '241581  13  17', '37  88  33', 280, 40, 1),
(298, '80112', 'Centro Escolar Caserio  Hacienda El Jobal Cantón El Espiritu Santo.', 'NA', 'Juan Manuel Jandres.', 'NA', '74944258', 'juanmanueljandreshenriquez@mined.com', 'Juan Manuel Jandres.', 'Director', '74944258', '236015   13  14', '36  88  35', 286, 40, 1),
(299, '80116', 'Centro Escolar Caserio Lotificaión El Sitio Cantón Santa Lucia.', 'NA', 'Carolina Gonzales de Sanchez.', 'NA', '75091828', 'NA', 'Carolina Gonzales de Sanchez.', 'Directora', '75091828', '241894  13  17', '47  88  33', 286, 40, 1),
(300, '86412', 'Centro Escolar Caserio Las Pampas Cantón El Sitio.', 'Final colona Holanda, caserio Las Pampas cantón El Sitio.', 'Victor Alcides Hernández Morales.', 'NA', '64200713', 'vhernandezmorales@yahoo.es', 'Victor Alcides Hernández Morales.', 'Director', '64200713', '240995  13  17', '18  88  32', 286, 40, 1),
(301, '12509', 'Centro Escolar el Paraisal', 'Canton el Paraisal Km 125, Carretera litoral', 'Vicente de Jesus Mijango Ramos', 'NA', '73230848', 'elparaisal1250@hotmail.com', 'Julio Hector Aparicio', 'Docente', '79089907', '247478  13  20', '47.9  88  21', 276, 41, 1),
(302, '12511', 'Instituto Nacional de Concepcion Batres', '5 avenida sur pasaje, Lic; Vicente Reyes Concepcion Batres', 'Sara Catalina Argueta', '61217184', 'NA', 'catalina12511@gmail.com', 'Sara Catalina Argueta', 'Directora', '61217184', '246626  13  20', '20.3  88  22', 276, 41, 1),
(303, '12512', 'Complejo Educativo Hacienda Monte Fresco', 'Calle Principal Caserio Montefresco, Concepcion Batres.', 'Julio Hector Aparicio Escobar', 'NA', '74029145', 'hefara12685@gmal.com', 'Julio Hector Aparicio Escobar', 'Director', '79089917', '244321  13  19', '4.7  88  18', 276, 41, 1),
(304, '12513', 'Centro Ecolar Canton Ildelfonso', 'Canton San Ildelfonso, Concepcion Batres, 5Km al sur del Transito.', 'Celso Panameño', 'NA', '72697005', 'celsovasquez5558@gmail.com', 'Celso Panameño', 'Director', '72697005', '245468  13  19', '42.3  88  20', 276, 41, 1),
(305, '12518', 'Centro Escolar Hacienda Nueva', 'Canton Hacienda Nueva Concepcion Batres.', 'Rosa Elena Mejia', '26817412', '7100868', 'rosita_mejia@hotmail.es', 'Rosa Elena Mejia', 'Directora', '26817412', '243366  13  18', '34  88  21', 276, 41, 1),
(306, '12519', 'Centro Escolar Cantón el Porvenir', 'NA', 'Omar David Tejada Amaya', 'NA', '77688103', 'omarsito1976@hotmail.com', 'Omar David Tejada Amaya', 'Director', '77688103', '246497  13  20', '15.7  88  19', 276, 41, 1),
(307, '12521', 'Centro Escolar Santiago Orellana Zelaya.', '6ta Avenida, Norte Barrio La Parroquia, Parroquia Concepcion Batres Usulutan.', 'Oscar Armando Saravia Chicas.', 'NA', '74586898', 'oscarsaravia1963@gmail.com', 'Oscar Armando Saravia Chicas.', 'Director', '74586898', '247194  13  20', '38.7  88  22', 276, 41, 1),
(308, '12522', 'Centro Escolar San Antonio', '1° avenida sur 4ta calle poniente Barrio San Antonio.', 'Rene Ovidio Osorio Reyes', 'NA', '78525086', 'cesarantonio@hotmail.es, edithdelao@hotmail .com', 'Rene Ovidio Osorio Reyes', 'Director', '78525086', '246793  13  20', '25.7  88  22', 276, 41, 1),
(309, '60187', 'Centro Escolar Caserio Paso Hondo Canton La Danta', 'Caserio el Pason, Canton La Danta, Concepcion Batres, Usulutan', 'Matilde Quintanilla', 'NA', '78231738', 'NA', 'Matilde Quintanilla', 'Directora', '78231738', '242693  13  18', '12.3  88  22', 276, 41, 1),
(310, '80036', 'Centro Escolar Caserio La Pancha Canton Hacienda Nueva', 'Caserio La Pancha Canton Hacienda Nueva.', 'Sandra del Carmen Castro de Ramirez', 'NA', '78389286', 'NA', 'Sandra del Carmen Castro de Ramirez', 'Directora', '78389286', '241764  13  17', '41.9  88  21', 276, 41, 1),
(311, '12736', 'Centro Escolar Colonia Vista Hermosa Canton La Peña', '2 km 1/2 al norte del ISSS sobre calle a cantón Las Peñas Usulután', 'José Omar Cortez', '77490275', 'NA', 'omarcortez321@gmail.com', 'José Omar', 'Director', '77490275', '248475  13  21', '21.1  88  27', 295, 42, 1),
(312, '12749', 'Escuela de Educación Parvularia Barrio El Calvario', 'Final Prolongación de la 3º calle oriente Barrio El Calvario', 'Nadine Astrid Claros Ventura', '72251844', 'NA', 'NA', 'Nadine Astrid Claros Ventura', 'Directora', '72251844', '247046  13  20', '34.5  88  26', 295, 42, 1),
(313, '12761', 'Centro Escolar Cantón El Ojuste', 'Final Prolongación Ave Guendique 500 mts al norte', 'René Ferrufino Ramírez', '76294901', 'NA', 'ferrufino_59@hotmail.com', 'NA', 'NA', 'NA', '249312  13  21', '48.2  88  26', 295, 42, 1),
(314, '12765', 'Centro Escolar Cantón El Cerrito', 'Cantón El Cerrito', 'Orsi Axdir Gaiten Tirana', 'NA', 'NA', 'NA', 'Santiago Alberto de Paz Santamaria', 'Subdirector', '74352293', '251471  13  22', '58.6  88  27', 295, 42, 1),
(315, '12767', 'Escuela de Educación Parvularia de Usulután', 'Final 12 Avenida norte Col. Tropicana, Usulután', 'María Antonia Morales Funes', '72179248', 'NA', 'maria.morales.funes@mined.edu.sv', 'María Antonia Morales Funes', 'Directora', '26246468', '247641  13  20', '53.8  88  26', 295, 42, 1),
(316, '12778', 'Centro Escolar Alberto Masferrer', 'Final 3º avenida norte Barrio La Mercedes, Usulután', 'Juan Bautista Pineda', '78627306', 'NA', 'jbpinedacalderon@hotmail.com', 'Juan Baustista Pineda', 'Director', '78627306', '247761  13  20', '57.8  88  26', 295, 42, 1),
(317, '60309', 'Centro Escolar Colonia Usuluteca', 'Col. La Usuluteca, Cantón La Peña, Usulután', 'Israel Rivas', '26246821', '70942933', 'israel_rivas205@hotmail.com', 'Israel Rivas', 'Director', '70942933', '249001  13  21', '38.2  88  26', 295, 42, 1),
(318, '80162', 'Centro Escolar Cantón La Peña', '10 km al norte de Usulután', 'Ana Silvia Medrano', '61808750', 'NA', 'NA', 'Ana Silvia Medrano', 'Directora', '61808750', '251274  13  22', '52.3  88  27', 295, 42, 1),
(319, '12633', 'Centro Escolar Concepción Alemán Córdova/ 3º cliclo y bachillerato', 'Final 12 avenida norte Col. Tropicano', 'Salvador Penado Romero', '2623295', '71037282', 'persa.06@hotmail.com', 'Salvador Penado Romero', 'Director', '26623295', '247667  13  20', '54.7  88  26', 295, 42, 1),
(320, '10104', 'Centro Escolar Colonia Santa Cristiana', 'Tercer pje colonia santa cristiana', 'Juan Francisco Cerrano', 'NA', '76953940', 'serrano1000@live.com', 'Juan Francisco Cerrano', 'Director', '76953940', '246686  13  20', '23  88  27', 295, 43, 1),
(321, '12748', 'Centro Escolar Colonia El Local', 'Colonia Espiritu Santo costado sur hospital san pedro', 'José Rivera Orellana Elena', '26622740', '70895588', 'cecoloniaelcocal@gmail.com', 'José Rivera Orellana Elena', 'Director', '26622740', '246994  13  20', '32.9  88  26', 295, 43, 1),
(322, '12750', 'Centro Escolar Colonia El Naranjo', 'Final pje Juana colonia el naranjo', 'Margarita Perdomo Castro', 'NA', '76292231', 'margaritaperdomo74@gmail.com', 'Margarita Perdomo Castro', 'Directora', '76292231', '245814  13  19', '54.4  88  26', 295, 43, 1),
(323, '12770', 'Centro Escolar Cantón El Trillo', '2 km al sur sobre calle a san dionisio usulutan', 'Blanca Estela Vasquez de Flores', 'NA', '78369073', 'blancaestelatrillo@hotmail.com', 'Blanca Estela Vasquez de Flores', 'Directora', '78369073', '245531  13  19', '45.3  88  27', 295, 43, 1),
(324, '12774', 'Centro Escolar Manuela Edelmira Cordova', '1ª avenida Sur Nº 8 Usulutan', 'Gloria Aminda Zuniga de Guzman', '26620240', 'NA', 'deguzmanzuniga@gmail.com', 'Gloria Aminda Zuniga de Guzman', 'Directora', '26620240', '247128  13  20', '37.2  88  26', 295, 43, 1),
(325, '12775', 'Centro Escolar profesora Blanca Ramirez de Aviles', 'Colonia guevara salida a San Salvador Usulutan', 'Willians Humberto Córdova', '22662146', '71482137', 'billy2015cor@gmail.com', 'Willians Humberto Córdova', 'Director', '22662146', '247341  13  20', '44.2  88  27', 295, 43, 1),
(326, '12776', 'Centro Escolar Gregorio Melara', '2 sur y 1ª calle oriente', 'Milagro Hendina Santos de Murillo', '26267213', '77438394', 'mihondy05@yahoo.com.mx', 'Milagro Hendina Santos de Murillo', 'Directora', '26267213', '247155  13  20', '38.1  88  26', 295, 43, 1),
(327, '60178', 'Centro Escolar Colonia San Juan Bosco Numero Uno', 'Colonia Venecia , Canton El Trillo', 'Blanca Nelly Zelaya', 'NA', '75408008', 'nelly0166_zelaya@hotmail.com', 'Blanca Nelly Zelaya', 'Directora', '75408008', '244636  13  19', '16.2  88  27', 295, 43, 1),
(328, '80160', 'Centro Escolar Licenciada Yessica Yanira Sanchez Contreras', 'Final 4to Pasaje colonia San Juan Bosco #2', 'Laura del Rosario Trejo', 'NA', '78940470', 'NA', 'Laura del Rosario Trejo', 'Directora', '78940470', '245213  13  19', '34.9  88  26', 295, 43, 1),
(329, '12646', 'Centro Esolar Cantón la Poza', '200 mtrs Desvio la poza', 'Jose Antonio Palomo Torres', 'NA', '74842535', 'jose.palomo.torres@mined.edu.sv', 'Jose Antonio Palomo Torres', 'Director', '74842535', '246864  13  20', '24.44  88  29', 285, 44, 1),
(330, '12681', 'Complejo Educativo de San Dionicio', 'Final calle oriente  Barrio el centro , san Dionisio Usulutan', 'Carlos Alberto Murillo Cortez', 'NA', '78822518', 'complejosandionisio@hotmail.com', 'Carlos Alberto Murillo Cortez', 'Director', '77899071', '240514  13  17', '2.1  88  27', 280, 44, 1),
(331, '12754', 'Centro Escolar Jose Roberto WRIGHT', 'Canton Hacienda la Carrera', 'Angel Maria Jovel de Duran', '78778640', 'NA', 'angel_arias.09@hotmail.com', 'Angel Maria Jovel de Duran', 'Directora', '78778640', '243043  13  18', '24.7  88  30', 295, 44, 1),
(332, '12760', 'Centro Escolar Cantón Ojos de Agua', 'Canton Ojos de Agua Usulutan', 'Andres Elizabeth Duanes de Silva', 'NA', '72947417', 'andrea1duanes@gmail.com', 'Andres Elizabeth Duanes de Silva', 'Directora', '72947417', '247432  13  20', '78.9  88  28', 295, 44, 1),
(333, '12762', 'Centro Escolar Profesora Josefa Parada de Guandique', 'Canton la Presa Municipio de Usulutan', 'Ramon Aristides Torres Carranza', '76826128', '72417841', 'dorila.mira64@gmail.com', 'Ramon Aristides Torres Carranza', 'Director interino', '76826128', '245767  13  19', '53  88  28', 295, 44, 1),
(334, '12769', 'Centro Escolar Cantón el Talpetate', 'Canton el Talpetate', 'Carlos Humberto Aguilar Ovando', 'NA', '77302516', 'cha02658@autlook.es', 'Carlos Humberto Aguilar Ovando', 'Director', '77302516', '249991  13  22', '10.7  88  29', 295, 44, 1),
(335, '14847', 'Centro Escolar Caserio las Pozas Numero Dos', '200 mtrs del punto de pickup comunidad la poza # 2', 'Jose Oswaldo Romero Interiano', 'NA', '63090002', 'jromerointeriano@gmail.com', 'Jose Oswaldo Romero Interiano', 'Director', '63090002', '247414  13  20', '46.7  88  28', 295, 44, 1),
(336, '60177', 'Centro Escolar Caserio Continental Canton Ojos de agua', 'Caserio Continental  canton ojos de agua, Usulutan', 'Karina Elizabeth Mendez de Lemus', 'NA', '75991299', 'karinamendez78@hotmail.com', 'Karina Elizabeth Mendez de Lemus', 'Directora', '75991299', '248057  13  21', '7.6  88  27', 295, 44, 1),
(337, '80156', 'Centro Escolar Profesora Sandra Esperanza Rodriguez de Rodriguez', 'Calle principal, Canton ojos de agua', 'Maria del Carmen Melara de Perdomo', '26622292', '76124923', 'gloriperdomo2010@gamil.com', 'Maria del Carmen Melara de Perdomo', 'Directora', '26622292', '247561  13  20', '50.7  88  28', 295, 44, 1),
(338, '80157', 'Centro Escolar Caserio San Jaime', 'Caserio San jaime Canton ojo de agua', 'Jose fredys Hernandez', '26278393', '79533008', 'fredyshernandez017@gmail.com', 'Jose fredys Hernandez', 'Director', '26278393', '249362  13  21', '50.1  88  27', 295, 44, 1),
(339, '80159', 'Centro Escolar Pedro Ginjaume', 'Carretera litoral km113, al sur del restaurante tierra mar', 'Yessica Yanira Contreras', '26638142', '76838881', 'yessamaya2010@hotmail.com', 'Yessica Yanira Contreras', 'Directora', '26638142', '247550  13  20', '51.2  88  28', 295, 44, 1),
(340, '12530', 'Centro Escolar Cantón El Maculis', '1 km al norte de la loma el macho, km 124 cantón el maculis', 'Sonia Maribel Lózano Castillo', '79179414', 'NA', 'sonia.lozano.castillo@mined.edu.sv', 'Sonia Maribel Lózano Castillo', 'Directora', '79179414', '248088  13  21', '7.7  88  21', 278, 45, 1),
(341, '12531', 'Centro Escolar Piedra Ancha', 'Cantón piedra ancha', 'Israel Arquimides Ramírez Lozano', '26634620', '71338917', 'NA', 'Israel Arquimides Ramírez Lozano', 'Director', '71338917', '249352  13  21', '49.2  88  23', 278, 45, 1),
(342, '12532', 'Centro Escolar Profesor Romulo Vásquez Portillo', 'Cantón analco', 'Eva Dolores Vásquez de Bermudez', '70880569', 'NA', 'NA', 'Eva Dolores Vásquez de Bermudez', 'Directora', '70880569', '249212  13  21', '44.5  88  22', 278, 45, 1),
(343, '12534', 'Centro Escolar de Ereguayquin', 'Final quinta calle, Av. Norte bo. La parroquia', 'María Ester Sura', '26276064', '73150409', 'juan.leonel.bonilla.sanchez@mined.edu.sv', 'María Ester Sura', 'Directora', '73150409', '247270  13  20', '41.4  88  23', 278, 45, 1),
(344, '12745', 'Centro Escolar El Obrajuelo', 'Cantón el obrajuelo, usulutan', 'Rosa Mirian Osorio Castillo', '71407632', '70941830', 'mirian.osorio@mined.edu.sv', 'Rosa Mirian Osorio Castillo', 'Directora', '71407632', '243711  13  18', '45.6  88  23', 295, 45, 1),
(345, '12758', 'Centro Escolar Cantón Palo Galán', 'Cantón palo galán, minucipio de Ereguayquin, usulutan', 'Sergio Antonio Huezo Castillo', '26264122', '79900095', 'sergio.antonio.huezo@mined.edu.sv', 'Sergio Antonio Huezo Castillo', 'Director', '79900095', '245082  13  19', '30.4  88  24', 278, 45, 1),
(346, '13611', 'Instituto Nacional de Ereguayquin', 'col. La constancia 4', 'David Antonio Turcios Santos', '26276774', '78774716', 'davidturciossantos@hotmail.com', 'David Antonio Turcios Santos', 'Director', '78774716', '247182  13  20', '38.5  88  23', 278, 45, 1),
(347, '80039', 'Centro Escolar Caserío Pueblo Nuevo Cantón el Maculís', 'Caserio pueblo nuevo, canton el Maculis ', 'Maria de los Angeles Sanchez ', 'NA', '77833358', 'marielossanchez1973@gmail.com', 'NA', 'NA', 'NA', '248493  13  21', '20.8  88  21', 278, 45, 1),
(348, '80040', 'Centro Escolar Caserio Santa Lucia, Cantón Los Encuentros', 'Km. 122 carretera litoral, entrada principal, lotificación parcelquin', 'Rosa Clementina Márquez', '78392979', '71067417', 'NA', 'Rosa Clementina Márquez', 'Directora', '71067417', '244330  13  19', '5.7  88  23', 278, 45, 1),
(349, '80041', 'Centro Escolar caserio Los Naranjos, Canton los encuentros', 'Caserio lso naranjos, Ereguayquin, Usulutan', 'Patricia de Jesus Mendez', 'NA', '79012137', 'NA', 'Patricia de Jesus Mendez de Carcamo', 'Directora', '79012137', '248169  13  21', '10.5  88  22', 278, 45, 1),
(350, '86381', 'Centro Escolar Canton Cerco de Piedra', 'Calle Principal Cerca Oriente.', 'Sandra Isabel Lopez', 'NA', '76825554', 'sandrasiabuto@hotmail.com', 'Sandra Isabel Lopez', 'Directora', '76825554', '262807  13  29', '09.30  89  12', 31, 29, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `componente`
--

CREATE TABLE `componente` (
  `ID_COMPONENTE` int(11) NOT NULL,
  `COD_COMPONENTE` varchar(3) NOT NULL,
  `NBR_COMPONENTE` varchar(100) NOT NULL,
  `DESCRIPCION_COMPONENTE` varchar(300) NOT NULL,
  `ACTIVO` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `componente`
--

INSERT INTO `componente` (`ID_COMPONENTE`, `COD_COMPONENTE`, `NBR_COMPONENTE`, `DESCRIPCION_COMPONENTE`, `ACTIVO`) VALUES
(1, '1', 'Formación continua Docente', 'Parte fundamental del plan PNDF', 1),
(2, '2', 'Asistencia Técnica', 'Asistencia a los docentes. ', 1),
(3, '3', 'Gobernanza y participación', 'N/A', 1),
(4, '4', 'Nueva oferta técnica vocacional', 'N/A', 1),
(5, '5', 'Socio Emocional', 'N/A', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `ID_DEPARTAMENTO` int(11) NOT NULL,
  `COD_DEPARTAMENTO` varchar(2) NOT NULL,
  `NBR_DEPARTAMENTO` varchar(100) NOT NULL,
  `ID_ZONA_GEOGRAFICA` int(11) NOT NULL,
  `ACTIVO` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`ID_DEPARTAMENTO`, `COD_DEPARTAMENTO`, `NBR_DEPARTAMENTO`, `ID_ZONA_GEOGRAFICA`, `ACTIVO`) VALUES
(1, '06', 'SAN SALVADOR', 1, 1),
(2, '09', 'CABAÑAS', 1, 1),
(3, '07', 'CUSCATLÁN', 1, 1),
(4, '05', 'LA LIBERTAD', 1, 1),
(5, '08', 'LA PAZ', 1, 1),
(6, '10', 'SAN VICENTE', 1, 1),
(7, '01', 'AHUACHAPÁN', 2, 1),
(8, '03', 'SONSONATE', 2, 1),
(9, '02', 'SANTA ANA', 2, 1),
(10, '13', 'MORAZÁN', 3, 1),
(11, '12', 'SAN MIGUEL', 3, 1),
(12, '14', 'LA UNIÓN', 3, 1),
(13, '04', 'CHALATENANGO', 1, 1),
(14, '11', 'USULUTAN', 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad_x_recurso_humano`
--

CREATE TABLE `especialidad_x_recurso_humano` (
  `ID_ESPECIALIDAD_X_RECURSO_HUMANO` int(11) NOT NULL,
  `TITULO_ACADEMICO` varchar(200) NOT NULL,
  `ID_ASIGNATURA` int(11) NOT NULL,
  `ID_RECURSO_HUMANO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grado`
--

CREATE TABLE `grado` (
  `ID_GRADO` int(11) NOT NULL,
  `COD_GRADO` varchar(3) NOT NULL,
  `NBR_GRADO` varchar(100) NOT NULL,
  `ACTIVO` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `grado`
--

INSERT INTO `grado` (`ID_GRADO`, `COD_GRADO`, `NBR_GRADO`, `ACTIVO`) VALUES
(1, 'PAR', 'PARVULARIA', 1),
(2, 'PRI', '1ro', 1),
(3, 'SEG', '2do', 1),
(4, 'TER', '3ro', 1),
(5, 'CUA', '4to', 1),
(6, 'QUI', '5to', 1),
(7, 'SEX', '6to', 1),
(8, 'SEP', '7mo', 1),
(9, 'OCT', '8vo', 1),
(10, 'NOV', '9no', 1),
(11, 'BGE', 'BACHTO GRAL', 1),
(12, 'BTE', 'BACHTO TÉCNICO', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `indicador`
--

CREATE TABLE `indicador` (
  `ID_INDICADOR` int(11) NOT NULL,
  `COD_INDICADOR` varchar(10) NOT NULL,
  `NBR_INDICADOR` varchar(200) NOT NULL,
  `DESCRIPCION_INDICADOR` varchar(300) NOT NULL,
  `META_GLOBAL` float NOT NULL,
  `META_REAL` float DEFAULT NULL,
  `PORCENTAJE_REAL` float DEFAULT NULL,
  `ID_COMPONENTE` int(11) NOT NULL,
  `ID_ACTIVIDAD` int(11) NOT NULL,
  `ID_TIPO_INDICADOR` int(11) NOT NULL,
  `ID_RECURSO_HUMANO_RESPONSABLE` int(11) NOT NULL,
  `ID_UNIDAD_MEDIDA_INDICADOR` int(11) NOT NULL,
  `ACTIVO` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `indicador`
--

INSERT INTO `indicador` (`ID_INDICADOR`, `COD_INDICADOR`, `NBR_INDICADOR`, `DESCRIPCION_INDICADOR`, `META_GLOBAL`, `META_REAL`, `PORCENTAJE_REAL`, `ID_COMPONENTE`, `ID_ACTIVIDAD`, `ID_TIPO_INDICADOR`, `ID_RECURSO_HUMANO_RESPONSABLE`, `ID_UNIDAD_MEDIDA_INDICADOR`, `ACTIVO`) VALUES
(1, 'C1A1.1.A', 'Número de docentes especialistas recibiendo inducción del PNFD', 'N/A', 120, NULL, NULL, 1, 1, 2, 1, 1, 1),
(2, 'C1A1.1.B', 'Número de docentes especialistas recibiendo el módulo de integración metodológica', 'N/A', 120, NULL, NULL, 1, 1, 2, 1, 1, 1),
(3, 'C1A1.1.C', 'Número de docentes especialistas recibiendo el módulo de la integración de la evaluación de los apre', 'N/A', 120, NULL, NULL, 1, 1, 2, 1, 1, 1),
(4, 'C1A1.1.D', 'Número de docentes de tercer ciclo y bachillerato formados por especialidad ', 'N/A', 708, NULL, NULL, 1, 1, 2, 1, 1, 1),
(5, 'C1A1.2.A', 'Número de docentes recibiendo formación metodológica en matemática y lenguaje', 'N/A', 1948, NULL, NULL, 1, 1, 2, 1, 1, 1),
(6, 'C1A1.2.B', 'Número de docentes recibiendo formación metodológica de aulas multigrado', 'N/A', 468, NULL, NULL, 1, 3, 2, 1, 1, 1),
(7, 'C1A1.3.A', 'Número de docentes del SI-EITP recibiendo talleres de habilidades socioemocionales', 'N/A', 2763, NULL, NULL, 1, 3, 2, 1, 1, 1),
(8, 'C1A1.3.B', 'Número de docentes recibiendo talleres de práctica de habilidades tecnológicas', 'N/A', 2763, NULL, NULL, 1, 3, 2, 1, 1, 1),
(9, 'C1A1.4.A', 'Número de directoras, directores y subdirectoras, subdirectores recibiendo asistencia técnica y coaching en desarrollo de capacidades directivas ', 'N/A', 190, NULL, NULL, 1, 4, 2, 1, 1, 1),
(10, 'C1A1.5.A', 'Número de docentes que reciben módulo introductorio sobre educación y género', 'N/A', 2763, NULL, NULL, 1, 5, 2, 1, 1, 1),
(11, 'C1A1.6.A', 'Número de profesionales contratados que reciben sesibilización sobre educación inclusiva no sexista', 'N/A', 40, NULL, NULL, 1, 6, 2, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jornada`
--

CREATE TABLE `jornada` (
  `ID_JORNADA` int(11) NOT NULL,
  `COD_JORNADA` varchar(10) NOT NULL,
  `FECHA` date NOT NULL,
  `CUPO_MAXIMO` smallint(6) NOT NULL,
  `ID_TALLER_CURSO` int(11) NOT NULL,
  `ID_TIPO_JORNADA` int(11) NOT NULL,
  `ACTIVO` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipio`
--

CREATE TABLE `municipio` (
  `ID_MUNICIPIO` int(11) NOT NULL,
  `COD_MUNICIPIO` varchar(4) NOT NULL,
  `NBR_MUNICIPIO` varchar(100) NOT NULL,
  `ID_DEPARTAMENTO` int(11) NOT NULL,
  `ACTIVO` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `municipio`
--

INSERT INTO `municipio` (`ID_MUNICIPIO`, `COD_MUNICIPIO`, `NBR_MUNICIPIO`, `ID_DEPARTAMENTO`, `ACTIVO`) VALUES
(1, '0614', 'SAN SALVADOR', 1, 1),
(2, '0612', 'SAN MARCOS', 1, 1),
(20, '0601', 'AGUILARES', 1, 1),
(21, '0602', 'APOPA', 1, 1),
(22, '0603', 'AYUTUXTEPEQUE', 1, 1),
(23, '0619', 'DELGADO', 1, 1),
(24, '0604', 'CUSCATANCINGO', 1, 1),
(25, '0605', 'EL PAISNAL', 1, 1),
(26, '0606', 'GUAZAPA', 1, 1),
(27, '0607', 'ILOPANGO', 1, 1),
(28, '0608', 'MEJICANOS', 1, 1),
(29, '0609', 'NEJAPA', 1, 1),
(30, '0610', 'PANCHIMALCO', 1, 1),
(31, '0611', 'ROSARIO DE MORA', 1, 1),
(32, '0613', 'SAN MARTÍN', 1, 1),
(33, '0615', 'SANTIAGO TEXACUANGOS', 1, 1),
(34, '0616', 'SANTO TOMÁS', 1, 1),
(35, '0617', 'SOYAPANGO', 1, 1),
(36, '0618', 'TONACATEPEQUE', 1, 1),
(37, '0901', 'CINQUERA', 2, 1),
(38, '0909', 'DOLORES/VILLA DOLORES', 2, 1),
(39, '0902', 'GUACOTECTI', 2, 1),
(40, '0903', 'ILOBASCO', 2, 1),
(41, '0904', 'JUTIAPA', 2, 1),
(42, '0905', 'SAN ISIDRO', 2, 1),
(43, '0906', 'SENSUNTEPEQUE', 2, 1),
(44, '0908', 'VICTORIA', 2, 1),
(45, '0701', 'CANDELARIA', 3, 1),
(46, '0702', 'COJUTEPEQUE', 3, 1),
(47, '0703', 'EL CARMEN', 3, 1),
(48, '0704', 'EL ROSARIO', 3, 1),
(49, '0705', 'MONTE SAN JUAN', 3, 1),
(50, '0706', 'ORATORIO DE CONCEPCIÓN', 3, 1),
(51, '0707', 'SAN BARTOLOMÉ PERULAPÍA', 3, 1),
(52, '0708', 'SAN CRISTÓBAL', 3, 1),
(53, '0709', 'SAN JOSÉ GUAYABAL', 3, 1),
(54, '0710', 'SAN PEDRO PERULAPÁN', 3, 1),
(55, '0711', 'SAN RAFAEL CEDROS', 3, 1),
(56, '0712', 'SAN RAMÓN', 3, 1),
(57, '0713', 'SANTA CRUZ ANALQUITO', 3, 1),
(58, '0714', 'SANTA CRUZ MICHAPA', 3, 1),
(59, '0715', 'SUCHITOTO', 3, 1),
(60, '0716', 'TENANCINGO', 3, 1),
(78, '0501', 'ANTIGUO CUSCATLÁN', 4, 1),
(79, '0505', 'CHILTIUPÁN', 4, 1),
(80, '0502', 'CIUDAD ARCE', 4, 1),
(81, '0503', 'COLÓN', 4, 1),
(82, '0504', 'COMASAGUA', 4, 1),
(83, '0506', 'HUIZÚCAR', 4, 1),
(84, '0507', 'JAYAQUE', 4, 1),
(85, '0508', 'JICALAPA', 4, 1),
(86, '0509', 'LA LIBERTAD', 4, 1),
(87, '0511', 'SANTA TECLA', 4, 1),
(88, '0510', 'NUEVO CUSCATLÁN', 4, 1),
(89, '0515', 'SAN JUAN OPICO', 4, 1),
(90, '0512', 'QUEZALTEPEQUE', 4, 1),
(91, '0513', 'SACACOYO', 4, 1),
(92, '0514', 'SAN JOSÉ VILLANUEVA', 4, 1),
(93, '0516', 'SAN MATÍAS', 4, 1),
(94, '0517', 'SAN PABLO TACACHICO', 4, 1),
(95, '0519', 'TALNIQUE', 4, 1),
(96, '0518', 'TAMANIQUE', 4, 1),
(97, '0520', 'TEOTEPEQUE', 4, 1),
(98, '0521', 'TEPECOYO', 4, 1),
(99, '0522', 'ZARAGOZA', 4, 1),
(100, '0801', 'CUYULTITÁN', 5, 1),
(101, '0802', 'EL ROSARIO / ROSARIO DE LA PAZ', 5, 1),
(102, '0803', 'JERUSALÉN', 5, 1),
(103, '0804', 'MERCEDES LA CEIBA', 5, 1),
(104, '0805', 'OLOCUILTA', 5, 1),
(105, '0806', 'PARAÍSO DE OSORIO', 5, 1),
(106, '0807', 'SAN ANTONIO MASAHUAT', 5, 1),
(107, '0808', 'SAN EMIGDIO', 5, 1),
(108, '0809', 'SAN FRANCISCO CHINAMECA', 5, 1),
(109, '0810', 'SAN JUAN NONUALCO', 5, 1),
(110, '0811', 'SAN JUAN TALPA', 5, 1),
(111, '0812', 'SAN JUAN TEPEZONTES', 5, 1),
(112, '0822', 'SAN LUIS LA HERRADURA', 5, 1),
(113, '0813', 'SAN LUIS TALPA', 5, 1),
(114, '0814', 'SAN MIGUEL TEPEZONTES', 5, 1),
(115, '0815', 'SAN PEDRO MASAHUAT', 5, 1),
(116, '0816', 'SAN PEDRO NONUALCO', 5, 1),
(117, '0817', 'SAN RAFAEL OBRAJUELO', 5, 1),
(118, '0818', 'SANTA MARÍA OSTUMA', 5, 1),
(119, '0819', 'SANTIAGO NONUALCO', 5, 1),
(120, '0820', 'TAPALHUACA', 5, 1),
(121, '0821', 'ZACATECOLUCA', 5, 1),
(122, '1001', 'APASTEPEQUE', 6, 1),
(123, '1002', 'GUADALUPE', 6, 1),
(124, '1003', 'SAN CAYETANO ISTEPEQUE', 6, 1),
(125, '1006', 'SAN ESTEBAN CATARINA', 6, 1),
(126, '1007', 'SAN ILDEFONSO', 6, 1),
(127, '1008', 'SAN LORENZO', 6, 1),
(128, '1009', 'SAN SEBASTIÁN', 6, 1),
(129, '1010', 'SAN VICENTE', 6, 1),
(130, '1004', 'SANTA CLARA', 6, 1),
(131, '1005', 'SANTO DOMINGO', 6, 1),
(132, '1011', 'TECOLUCA', 6, 1),
(133, '1012', 'TEPETITÁN', 6, 1),
(134, '1013', 'VERAPAZ', 6, 1),
(135, '0101', 'AHUACHAPÁN', 7, 1),
(136, '0102', 'APANECA', 7, 1),
(137, '0103', 'ATIQUIZAYA', 7, 1),
(138, '0104', 'CONCEPCIÓN DE ATACO', 7, 1),
(139, '0105', 'EL REFUGIO', 7, 1),
(140, '0106', 'GUAYMANGO', 7, 1),
(141, '0107', 'JUJUTLA', 7, 1),
(142, '0108', 'SAN FRANCISCO MENÉNDEZ', 7, 1),
(143, '0109', 'SAN LORENZO', 7, 1),
(144, '0110', 'SAN PEDRO PUXTLA', 7, 1),
(145, '0111', 'TACUBA', 7, 1),
(146, '0112', 'TURÍN', 7, 1),
(147, '0301', 'ACAJUTLA', 8, 1),
(148, '0302', 'ARMENIA', 8, 1),
(149, '0303', 'CALUCO', 8, 1),
(150, '0304', 'CUISNAHUAT', 8, 1),
(151, '0306', 'IZALCO', 8, 1),
(152, '0307', 'JUAYÚA', 8, 1),
(153, '0308', 'NAHUIZALCO', 8, 1),
(154, '0309', 'NAHULINGO', 8, 1),
(155, '0310', 'SALCOATITÁN', 8, 1),
(156, '0311', 'SAN ANTONIO DEL MONTE', 8, 1),
(157, '0312', 'SAN JULIÁN', 8, 1),
(158, '0313', 'SANTA CATARINA MASAHUAT', 8, 1),
(159, '0305', 'SANTA ISABEL ISHUATÁN', 8, 1),
(160, '0314', 'SANTO DOMINGO DE GUZMÁN', 8, 1),
(161, '0315', 'SONSONATE', 8, 1),
(162, '0316', 'SONZACATE', 8, 1),
(163, '0201', 'CANDELARIA DE LA FRONTERA', 9, 1),
(164, '0203', 'CHALCHUAPA', 9, 1),
(165, '0202', 'COATEPEQUE', 9, 1),
(166, '0204', 'EL CONGO', 9, 1),
(167, '0205', 'EL PORVENIR', 9, 1),
(168, '0206', 'MASAHUAT', 9, 1),
(169, '0207', 'METAPÁN', 9, 1),
(170, '0208', 'SAN ANTONIO PAJONAL', 9, 1),
(171, '0209', 'SAN SEBASTIÁN SALITRILLO', 9, 1),
(172, '0210', 'SANTA ANA', 9, 1),
(173, '0211', 'SANTA ROSA GUACHIPILÍN', 9, 1),
(174, '0212', 'SANTIAGO DE LA FRONTERA', 9, 1),
(175, '0213', 'TEXISTEPEQUE', 9, 1),
(176, '1301', 'ARAMBALA', 10, 1),
(177, '1302', 'CACAOPERA', 10, 1),
(178, '1304', 'CHILANGA', 10, 1),
(179, '1303', 'CORINTO', 10, 1),
(180, '1305', 'DELICIAS DE CONCEPCIÓN', 10, 1),
(181, '1306', 'EL DIVISADERO', 10, 1),
(182, '1307', 'EL ROSARIO', 10, 1),
(183, '1308', 'GUALOCOCTI', 10, 1),
(184, '1309', 'GUATAJIAGUA', 10, 1),
(185, '1310', 'JOATECA', 10, 1),
(186, '1311', 'JOCOAITIQUE', 10, 1),
(187, '1312', 'JOCORO', 10, 1),
(188, '1313', 'LOLOTIQUILLO', 10, 1),
(189, '1314', 'MEANGUERA', 10, 1),
(190, '1315', 'OSICALA', 10, 1),
(191, '1316', 'PERQUÍN', 10, 1),
(192, '1317', 'SAN CARLOS', 10, 1),
(193, '1318', 'SAN FERNANDO', 10, 1),
(194, '1319', 'SAN FRANCISCO GOTERA', 10, 1),
(195, '1320', 'SAN ISIDRO', 10, 1),
(196, '1321', 'SAN SIMÓN', 10, 1),
(197, '1322', 'SENSEMBRA', 10, 1),
(198, '1323', 'SOCIEDAD', 10, 1),
(199, '1324', 'TOROLA', 10, 1),
(200, '1325', 'YAMABAL', 10, 1),
(201, '1326', 'YOLOAIQUÍN', 10, 1),
(202, '1201', 'CAROLINA', 11, 1),
(203, '1204', 'CHAPELTIQUE', 11, 1),
(204, '1205', 'CHINAMECA', 11, 1),
(205, '1206', 'CHIRILAGUA', 11, 1),
(206, '1202', 'CIUDAD BARRIOS', 11, 1),
(207, '1203', 'COMACARÁN', 11, 1),
(208, '1207', 'EL TRÁNSITO', 11, 1),
(209, '1208', 'LOLOTIQUE', 11, 1),
(210, '1209', 'MONCAGUA', 11, 1),
(211, '1210', 'NUEVA GUADALUPE', 11, 1),
(212, '1211', 'NUEVO EDÉN DE SAN JUAN', 11, 1),
(213, '1212', 'QUELEPA', 11, 1),
(214, '1213', 'SAN ANTONIO DEL MOSCO', 11, 1),
(215, '1214', 'SAN GERARDO', 11, 1),
(216, '1215', 'SAN JORGE', 11, 1),
(217, '1216', 'SAN LUIS DE LA REINA', 11, 1),
(218, '1217', 'SAN MIGUEL', 11, 1),
(219, '1218', 'SAN RAFAEL ORIENTE', 11, 1),
(220, '1219', 'SESORI', 11, 1),
(221, '1220', 'ULUAZAPA', 11, 1),
(222, '1401', 'ANAMORÓS', 12, 1),
(223, '1402', 'BOLÍVAR', 12, 1),
(224, '1403', 'CONCEPCIÓN DE ORIENTE', 12, 1),
(225, '1404', 'CONCHAGUA', 12, 1),
(226, '1405', 'EL CARMEN', 12, 1),
(227, '1406', 'EL SAUCE', 12, 1),
(228, '1407', 'INTIPUCÁ', 12, 1),
(229, '1408', 'LA UNIÓN', 12, 1),
(230, '1409', 'LISLIQUE', 12, 1),
(231, '1410', 'MEANGUERA DEL GOLFO', 12, 1),
(232, '1411', 'NUEVA ESPARTA', 12, 1),
(233, '1412', 'PASAQUINA', 12, 1),
(234, '1413', 'POLORÓS', 12, 1),
(235, '1414', 'SAN ALEJO', 12, 1),
(236, '1415', 'SAN JOSÉ', 12, 1),
(237, '1416', 'SANTA ROSA DE LIMA', 12, 1),
(238, '1417', 'YAYANTIQUE', 12, 1),
(239, '1418', 'YUCUAIQUÍN', 12, 1),
(240, '0401', 'AGUA CALIENTE', 13, 1),
(241, '0402', 'ARCATAO', 13, 1),
(242, '0403', 'AZACUALPA', 13, 1),
(243, '0407', 'CHALATENANGO', 13, 1),
(244, '0404', 'CITALÁ', 13, 1),
(245, '0405', 'COMALAPA', 13, 1),
(246, '0406', 'CONCEPCIÓN QUEZALTEPEQUE', 13, 1),
(247, '0408', 'DULCE NOMBRE DE MARÍA', 13, 1),
(248, '0409', 'EL CARRIZAL', 13, 1),
(249, '0410', 'EL PARAÍSO', 13, 1),
(250, '0411', 'LA LAGUNA', 13, 1),
(251, '0412', 'LA PALMA', 13, 1),
(252, '0413', 'LA REINA', 13, 1),
(253, '0414', 'LAS VUELTAS', 13, 1),
(254, '0415', 'NOMBRE DE JESÚS', 13, 1),
(255, '0416', 'NUEVA CONCEPCIÓN', 13, 1),
(256, '0417', 'NUEVA TRINIDAD', 13, 1),
(257, '0418', 'OJOS DE AGUA', 13, 1),
(258, '0419', 'POTONICO', 13, 1),
(259, '0420', 'SAN ANTONIO DE LA CRUZ', 13, 1),
(260, '0421', 'SAN ANTONIO LOS RANCHOS', 13, 1),
(261, '0422', 'SAN FERNANDO', 13, 1),
(262, '0423', 'SAN FRANCISCO LEMPA', 13, 1),
(263, '0424', 'SAN FRANCISCO MORAZÁN', 13, 1),
(264, '0425', 'SAN IGNACIO', 13, 1),
(265, '0426', 'SAN ISIDRO LABRADOR', 13, 1),
(266, '0427', 'SAN JOSÉ CANCASQUE / CANCASQUE', 13, 1),
(267, '0428', 'SAN JOSÉ LAS FLORES / LAS FLORES', 13, 1),
(268, '0429', 'SAN LUIS DEL CARMEN', 13, 1),
(269, '0430', 'SAN MIGUEL DE MERCEDES', 13, 1),
(270, '0431', 'SAN RAFAEL', 13, 1),
(271, '0432', 'SANTA RITA', 13, 1),
(272, '0433', 'TEJUTLA', 13, 1),
(273, '1101', 'ALEGRÍA', 14, 1),
(274, '1102', 'BERLÍN', 14, 1),
(275, '1103', 'CALIFORNIA', 14, 1),
(276, '1104', 'CONCEPCIÓN BATRES', 14, 1),
(277, '1105', 'EL TRIUNFO', 14, 1),
(278, '1106', 'EREGUAYQUÍN', 14, 1),
(279, '1107', 'ESTANZUELAS', 14, 1),
(280, '1108', 'JIQUILISCO', 14, 1),
(281, '1109', 'JUCUAPA', 14, 1),
(282, '1110', 'JUCUARÁN', 14, 1),
(283, '1111', 'MERCEDES UMAÑA', 14, 1),
(284, '1112', 'NUEVA GRANADA', 14, 1),
(285, '1113', 'OZATLÁN', 14, 1),
(286, '1114', 'PUERTO EL TRIUNFO', 14, 1),
(287, '1115', 'SAN AGUSTÍN', 14, 1),
(288, '1116', 'SAN BUENAVENTURA', 14, 1),
(289, '1117', 'SAN DIONISIO', 14, 1),
(290, '1119', 'SAN FRANCISCO JAVIER', 14, 1),
(291, '1118', 'SANTA ELENA', 14, 1),
(292, '1120', 'SANTA MARÍA', 14, 1),
(293, '1121', 'SANTIAGO DE MARÍA', 14, 1),
(294, '1122', 'TECAPÁN', 14, 1),
(295, '1123', 'USULUTÁN', 14, 1),
(296, '0907', 'TEJUTEPEQUE', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programa_formacion`
--

CREATE TABLE `programa_formacion` (
  `ID_PROGRAMA_FORMACION` int(11) NOT NULL,
  `COD_PROGRAMA_FORMACION` varchar(3) NOT NULL,
  `NBR_PROGRAMA_FORMACION` varchar(100) NOT NULL,
  `DESCRIPCION_PROGRAMA_FORMACION` varchar(300) NOT NULL,
  `ID_PROGRAMA_FORMACION_PADRE` int(11) NOT NULL,
  `ACTIVO` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recurso_humano`
--

CREATE TABLE `recurso_humano` (
  `ID_RECURSO_HUMANO` int(11) NOT NULL,
  `DOCUMENTO_IDENTIFICACION` varchar(20) NOT NULL,
  `NOMBRES` varchar(30) NOT NULL,
  `APELLIDOS` varchar(30) NOT NULL,
  `FECHA_HORA_CREACION` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ID_CENTRO_EDUCATIVO` int(11) DEFAULT NULL,
  `DIRECCION_RESIDENCIA` varchar(200) NOT NULL,
  `TELEFONO` varchar(20) NOT NULL,
  `CELULAR` varchar(20) NOT NULL,
  `CORREO_ELECTRONICO` varchar(50) NOT NULL,
  `GENERO` char(1) NOT NULL,
  `TITULO_ACADEMICO` varchar(200) NOT NULL,
  `ID_MUNICIPIO_RESIDENCIA` int(11) NOT NULL,
  `ACTIVO` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `recurso_humano`
--

INSERT INTO `recurso_humano` (`ID_RECURSO_HUMANO`, `DOCUMENTO_IDENTIFICACION`, `NOMBRES`, `APELLIDOS`, `FECHA_HORA_CREACION`, `ID_CENTRO_EDUCATIVO`, `DIRECCION_RESIDENCIA`, `TELEFONO`, `CELULAR`, `CORREO_ELECTRONICO`, `GENERO`, `TITULO_ACADEMICO`, `ID_MUNICIPIO_RESIDENCIA`, `ACTIVO`) VALUES
(1, '00379068-8', 'MANUEL', 'MENJIVAR', '2018-09-15 10:13:21', NULL, '', '', '', '', '1', 'LICENCIADO', 1, 1),
(2, '9282871', 'JENNIFER', 'MORAN', '2018-09-15 10:20:25', NULL, '', '', '', '', '2', 'LICENCIADA', 1, 1),
(4, '00379906-8', 'Darwin', 'Gonzalez', '2018-09-15 00:00:00', 205, '4785-7550', '4785-7550', '1225 Ocean Parkway 1', 'darwin851@gmail.com', '1', 'Licenciado', 1, 1),
(5, '03383738-0', 'DARWIN', 'GONZALEZ', '2018-09-19 00:00:00', 204, 'Colonia monte blanco, Colonia La Mascota', '7322-5010', '4785-7550', 'darwin851@gmail.com', '1', 'Licenciado', 1, 1),
(6, '02928191-8', 'Darwin', 'Gonzalez', '2018-09-19 00:00:00', 205, '1225 Ocean Parkway 1L', '4785-7550', '4785-7550', 'darwin851@gmail.com', '1', 'Licenciado', 1, 1),
(7, '92828292-8', 'DARWIN', 'Gonzalez', '2018-09-19 00:00:00', 205, '1225 Ocean Parkway 1L', '4785-7550', '4785-7550', 'darwin851@gmail.com', '1', 'Licenciado', 1, 1),
(8, '00379906-1', 'Darwin', 'Gonzalez', '2018-09-20 00:00:00', 202, '1225 Ocean Parkway 1L', '4785-7550', '4785-7550', 'darwin851@gmail.com', '1', 'Licenciado', 1, 1),
(9, '01292828-2', 'Darwin', 'Gonzalez', '2018-09-19 00:00:00', 350, '1225 Ocean Parkway 1L', '4785-7550', '4785-7550', 'darwin851@gmail.com', '1', 'Licenciado', 1, 1),
(10, '10191272-7', 'Darwin', 'Gonzalez', '2018-09-19 00:00:00', 205, '1225 Ocean Parkway 1L', '4785-7550', '4785-7550', 'darwin851@gmail.com', '1', 'Licenciado', 1, 1),
(13, '98348138-4', 'DARWIN', 'Gonzalez', '2018-09-19 00:00:00', 211, '1225 Ocean Parkway 1L', '4785-7550', '4785-7550', 'darwin851@gmail.com', '1', 'Licenciado', 21, 1),
(14, '13412349-2', 'Darwin', 'Gonzalez', '2018-09-20 00:00:00', 202, '1225 Ocean Parkway 1L', '4785-7550', '4785-7550', 'darwin851@gmail.com', '1', 'Licenciado', 20, 1),
(15, '02928191-9', 'DARWIN', 'GONZALEZ', '2018-09-19 00:00:00', 204, 'Colonia ciudad credisa pasaje jiboa 176, , San Salvador', '4785-7550', '7322-5010', 'darwin851@gmail.com', '1', 'INGENIERO', 1, 1),
(16, '38081408-1', 'Anthony', 'Soriano', '2018-09-20 00:00:00', 204, 'Colonia monte blanco, Colonia La Mascota', '7322-5010', '4785-7550', 'darwin851@gmail.com', '1', 'INGENIERO', 1, 1),
(17, '91727198-2', 'DARWIN', 'GONZALEZ', '2018-09-20 00:00:00', 206, 'Colonia monte blanco, Colonia La Mascota', '7322-5010', '4785-7550', 'darwin851@gmail.com', '1', 'INGENIERO', 1, 1),
(18, '01927837-3', 'Darwin', 'Gonzalez', '2018-09-20 00:00:00', 205, '1225 Ocean Parkway 1L', '4785-7550', '7322-5010', 'darwin851@gmail.com', '1', 'INGENIERO', 1, 1),
(19, '02928292-3', 'Darwin', 'Gonzalez', '2018-09-21 00:00:00', 204, '1225 Ocean Parkway 1L', '4785-7550', '73225010', 'darwin851@gmail.com', '1', 'INGENIERO', 1, 1),
(20, '03824018-4', 'DARWIN', 'GONZALZ', '2018-09-20 00:00:00', 207, '1225 Ocean Parkway 1L', '4785-7550', '4785-7550', 'darwin851@gmail.com', '1', 'INGENIERO', 1, 1),
(21, '90380812-0', 'DLAJFLJALFJALFAF', 'FAFAFASFADSF', '2018-09-20 00:00:00', 205, '1225 Ocean Parkway 1L', '4785-7550', '4785-7550', 'darwin851@gmail.com', '1', 'INGENIERO', 2, 1),
(22, '90830989-1', 'DARWIN', 'Gonzalez', '2018-09-19 00:00:00', 205, '1225 Ocean Parkway 1L', '4785-7550', '4785-7550', 'darwin851@gmail.com', '1', 'INGENIERO', 2, 1),
(23, '90809418-2', 'Darwin', 'Gonzalez', '2018-09-20 00:00:00', 204, '1225 Ocean Parkway 1L', '4785-7550', '4785-7550', 'darwin851@gmail.com', '1', 'INGENIERO', 1, 1),
(24, '23141242-4', 'Darwin', 'Gonzalez', '2018-09-20 00:00:00', 214, '1225 Ocean Parkway 1L', '4785-7550', '4785-7550', 'darwin851@gmail.com', '1', 'INGENIERO', 1, 1),
(26, '009282872-9', 'Gonzalez', 'Petro', '2018-09-19 15:04:00', NULL, '', '', '', '', '', '', 2, 1),
(28, '009282872-0', 'Gonzalez', 'Petro', '2018-09-19 15:11:29', NULL, '', '', '', '', '', '', 2, 1),
(31, '009282872-8', 'Gonzalez', 'Petro', '2018-09-19 15:12:45', NULL, '', '', '', '', '', '', 2, 1),
(33, '009282872-3', 'Gonzalez', 'Petro', '2018-09-19 15:14:29', NULL, '', '', '', '', '', '', 2, 1),
(35, '009282871-0', 'Gonzalez', 'Petro', '2018-09-19 15:22:12', NULL, '', '', '', '', '', '', 2, 1),
(37, '009282871-4', 'Gonzalez', 'Petro', '2018-09-19 15:23:25', NULL, '', '', '', '', '', '', 2, 1),
(39, '81098401-2', 'DARWIN', 'GONZALEZ', '2018-09-20 00:00:00', 204, 'Colonia monte blanco, Colonia La Mascota', '7322-5010', '4785-7550', 'darwin851@gmail.com', '1', 'Licenciado', 2, 1),
(40, '98018401-2', 'Darwin', 'Gonzalez', '2018-09-20 00:00:00', 205, '1225 Ocean Parkway 1L', '4785-7550', '4785-7550', 'darwin851@gmail.com', '1', 'INGENIERO', 30, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recurso_humano_x_jornada`
--

CREATE TABLE `recurso_humano_x_jornada` (
  `ID_RECURSO_HUMANO_X_JORNADA` int(11) NOT NULL,
  `CARGO` varchar(50) NOT NULL,
  `TELEFONO` varchar(50) NOT NULL,
  `PARTICIPACION_MANNANA` tinyint(4) DEFAULT NULL,
  `PARTICIPACION_TARDE` tinyint(4) DEFAULT NULL,
  `ID_JORNADA` int(11) NOT NULL,
  `ID_RECURSO_HUMANO_PARTICIPANTE` int(11) NOT NULL,
  `FECHA_HORA_CREACION` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ACTIVO` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sede`
--

CREATE TABLE `sede` (
  `ID_SEDE` int(11) NOT NULL,
  `COD_SEDE` varchar(3) NOT NULL,
  `NBR_SEDE` varchar(100) NOT NULL,
  `ACTIVO` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sistema_integrado`
--

CREATE TABLE `sistema_integrado` (
  `ID_SISTEMA_INTEGRADO` int(11) NOT NULL,
  `COD_SISTEMA_INTEGRADO` varchar(10) NOT NULL,
  `NBR_SISTEMA_INTEGRADO` varchar(100) NOT NULL,
  `ACTIVO` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sistema_integrado`
--

INSERT INTO `sistema_integrado` (`ID_SISTEMA_INTEGRADO`, `COD_SISTEMA_INTEGRADO`, `NBR_SISTEMA_INTEGRADO`, `ACTIVO`) VALUES
(1, 'AHU15', 'AHU15', 1),
(2, 'AHU3', 'AHU3', 1),
(3, 'AHU7', 'AHU7', 1),
(4, 'LIB1', 'LIB1', 1),
(5, 'LIB12', 'LIB12', 1),
(6, 'LIB13', 'LIB13', 1),
(7, 'LIB6', 'LIB6', 1),
(8, 'LIB8', 'LIB8', 1),
(9, 'PAZ18', 'PAZ18', 1),
(10, 'PAZ20', 'PAZ20', 1),
(11, 'PAZ24', 'PAZ24', 1),
(12, 'PAZ26', 'PAZ26', 1),
(13, 'PAZ27', 'PAZ27', 1),
(14, 'PAZ28', 'PAZ28', 1),
(15, 'PAZ3', 'PAZ3', 1),
(16, 'PAZ33', 'PAZ33', 1),
(17, 'PAZ4', 'PAZ4', 1),
(18, 'PAZ5', 'PAZ5', 1),
(19, 'UNI1', 'UNI1', 1),
(20, 'UNI11', 'UNI11', 1),
(21, 'UNI20', 'UNI20', 1),
(22, 'UNI27', 'UNI27', 1),
(23, 'UNI3', 'UNI3', 1),
(24, 'UNI5', 'UNI5', 1),
(25, 'MIG6', 'MIG6', 1),
(26, 'MIG7', 'MIG7', 1),
(27, 'MIG8', 'MIG8', 1),
(28, 'SALV2', 'SALV2', 1),
(29, 'SALV8', 'SALV8', 1),
(30, 'SON14', 'SON14', 1),
(31, 'SON15', 'SON15', 1),
(32, 'SON17', 'SON17', 1),
(33, 'SON22', 'SON22', 1),
(34, 'SON23', 'SON23', 1),
(35, 'SON24', 'SON24', 1),
(36, 'SON27', 'SON27', 1),
(37, 'SON29', 'SON29', 1),
(38, 'USU14', 'USU14', 1),
(39, 'USU17', 'USU17', 1),
(40, 'USU20', 'USU20', 1),
(41, 'USU3', 'USU3', 1),
(42, 'USU31', 'USU31', 1),
(43, 'USU33', 'USU33', 1),
(44, 'USU34', 'USU34', 1),
(45, 'USU4', 'USU4', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `taller_curso`
--

CREATE TABLE `taller_curso` (
  `ID_TALLER_CURSO` int(11) NOT NULL,
  `COD_TALLER_CURSO` varchar(3) NOT NULL,
  `NBR_TALLER_CURSO` varchar(100) NOT NULL,
  `DESCRIPCION_TALLER_CURSO` varchar(300) NOT NULL,
  `ID_SEDE` int(11) NOT NULL,
  `ID_PROGRAMA_FORMACION` int(11) NOT NULL,
  `ID_TIPO_TALLER_CURSO` int(11) NOT NULL,
  `ID_RECURSO_HUMANO_FACILITADOR` int(11) NOT NULL,
  `ACTIVO` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `taller_curso_x_indicador`
--

CREATE TABLE `taller_curso_x_indicador` (
  `ID_TALLER_CURSO_X_INDICADOR` int(11) NOT NULL,
  `ID_INDICADOR` int(11) NOT NULL,
  `ID_TALLER_CURSO` int(11) NOT NULL,
  `ID_TIPO_TALLER_CURSO_X_INDICADOR` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_indicador`
--

CREATE TABLE `tipo_indicador` (
  `ID_TIPO_INDICADOR` int(11) NOT NULL,
  `COD_TIPO_INDICADOR` varchar(3) NOT NULL,
  `NBR_TIPO_INDICADOR` varchar(100) NOT NULL,
  `DESCRIPCION_TIPO_INDICADOR` varchar(300) NOT NULL,
  `ACTIVO` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_indicador`
--

INSERT INTO `tipo_indicador` (`ID_TIPO_INDICADOR`, `COD_TIPO_INDICADOR`, `NBR_TIPO_INDICADOR`, `DESCRIPCION_TIPO_INDICADOR`, `ACTIVO`) VALUES
(1, 'RES', 'INDICADORES RESULTADOS', 'INDICADORES DE RESULTADOS', 1),
(2, 'PRO', 'INDICADORES DE PRODUCTOS', 'INDICADORES DE PRODUCTOS', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_jornada`
--

CREATE TABLE `tipo_jornada` (
  `ID_TIPO_JORNADA` int(11) NOT NULL,
  `COD_TIPO_JORNADA` varchar(3) NOT NULL,
  `NBR_TIPO_JORNADA` varchar(100) NOT NULL,
  `HORA_INICIO` time NOT NULL,
  `HORA_FIN` time NOT NULL,
  `CANTIDAD_HORAS_MANNANA` float NOT NULL,
  `CANTIDAD_HORAS_TARDE` float NOT NULL,
  `ACTIVO` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_meta_taller_curso_x_indicador`
--

CREATE TABLE `tipo_meta_taller_curso_x_indicador` (
  `ID_TIPO_META_TALLER_CURSO_X_INDICADOR` int(11) NOT NULL,
  `COD_TIPO_META_TALLER_CURSO_X_INDICADOR` varchar(3) NOT NULL,
  `NBR_TIPO_META_TALLER_CURSO_X_INDICADOR` varchar(100) NOT NULL,
  `ACTIVO` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_taller_curso`
--

CREATE TABLE `tipo_taller_curso` (
  `ID_TIPO_TALLER_CURSO` int(11) NOT NULL,
  `COD_TIPO_TALLER_CURSO` varchar(3) NOT NULL,
  `NBR_TIPO_TALLER_CURSO` varchar(100) NOT NULL,
  `ACTIVO` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_medida_indicador`
--

CREATE TABLE `unidad_medida_indicador` (
  `ID_UNIDAD_MEDIDA_INDICADOR` int(11) NOT NULL,
  `COD_UNIDAD_MEDIDA_INDICADOR` varchar(3) NOT NULL,
  `NBR_UNIDAD_MEDIDA_INDICADOR` varchar(100) NOT NULL,
  `ACTIVO` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `unidad_medida_indicador`
--

INSERT INTO `unidad_medida_indicador` (`ID_UNIDAD_MEDIDA_INDICADOR`, `COD_UNIDAD_MEDIDA_INDICADOR`, `NBR_UNIDAD_MEDIDA_INDICADOR`, `ACTIVO`) VALUES
(1, '1', 'PARTICIPACIÓN/NUMERO', 1),
(2, '2', 'HORAS', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zona_geografica`
--

CREATE TABLE `zona_geografica` (
  `ID_ZONA_GEOGRAFICA` int(11) NOT NULL,
  `COD_ZONA_GEOGRAFICA` varchar(3) NOT NULL,
  `NBR_ZONA_GEOGRAFICA` varchar(100) NOT NULL,
  `ACTIVO` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `zona_geografica`
--

INSERT INTO `zona_geografica` (`ID_ZONA_GEOGRAFICA`, `COD_ZONA_GEOGRAFICA`, `NBR_ZONA_GEOGRAFICA`, `ACTIVO`) VALUES
(1, 'CEN', 'ZONA CENTRAL', 1),
(2, 'OCC', 'ZONA OCCIDENTAL', 1),
(3, 'ORI', 'ZONA ORIENTAL', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD PRIMARY KEY (`ID_ACTIVIDAD`),
  ADD UNIQUE KEY `UNQ_ACTIVIDAD` (`COD_ACTIVIDAD`),
  ADD KEY `FK_COMPONENTE_1` (`ID_COMPONENTE`);

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`ID_ASIGNATURA`),
  ADD UNIQUE KEY `UNQ_ASIGNATURA` (`COD_ASIGNATURA`);

--
-- Indices de la tabla `asignatura_x_grado_x_recurso_humano`
--
ALTER TABLE `asignatura_x_grado_x_recurso_humano`
  ADD PRIMARY KEY (`ID_ASIGNATURA_X_GRADO_X_RECURSO_HUMANO`),
  ADD KEY `FK_GRADO` (`ID_GRADO`),
  ADD KEY `FK_ASIGNATURA_1` (`ID_ASIGNATURA`),
  ADD KEY `FK_RECURSO_HUMANO_5` (`ID_RECURSO_HUMANO`);

--
-- Indices de la tabla `cargo_rol`
--
ALTER TABLE `cargo_rol`
  ADD PRIMARY KEY (`ID_CARGO_ROL`),
  ADD UNIQUE KEY `UNQ_CARGO_ROL` (`COD_CARGO_ROL`);

--
-- Indices de la tabla `cargo_rol_x_recurso_humano`
--
ALTER TABLE `cargo_rol_x_recurso_humano`
  ADD PRIMARY KEY (`ID_CARGO_ROL_X_RECURSO_HUMANO`),
  ADD KEY `FK_RECURSO_HUMANO_4` (`ID_RECURSO_HUMANO`),
  ADD KEY `FK_CARGO_ROL` (`ID_CARGO_ROL`);

--
-- Indices de la tabla `centro_educativo`
--
ALTER TABLE `centro_educativo`
  ADD PRIMARY KEY (`ID_CENTRO_EDUCATIVO`),
  ADD UNIQUE KEY `UNQ_CENTRO_EDUCATIVO` (`COD_CENTRO_EDUCATIVO`),
  ADD KEY `FK_MUNICIPIO_1` (`ID_MUNICIPIO`),
  ADD KEY `FK_SISTEMA_INTEGRADO` (`ID_SISTEMA_INTEGRADO`);

--
-- Indices de la tabla `componente`
--
ALTER TABLE `componente`
  ADD PRIMARY KEY (`ID_COMPONENTE`),
  ADD UNIQUE KEY `UNQ_COMPONENTE` (`COD_COMPONENTE`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`ID_DEPARTAMENTO`),
  ADD UNIQUE KEY `UNQ_DEPARTAMENTO` (`COD_DEPARTAMENTO`),
  ADD UNIQUE KEY `COD_DEPARTAMENTO` (`COD_DEPARTAMENTO`),
  ADD KEY `FK_ZONA_GEOGRAFICA` (`ID_ZONA_GEOGRAFICA`);

--
-- Indices de la tabla `especialidad_x_recurso_humano`
--
ALTER TABLE `especialidad_x_recurso_humano`
  ADD PRIMARY KEY (`ID_ESPECIALIDAD_X_RECURSO_HUMANO`),
  ADD KEY `FK_ASIGNATURA_2` (`ID_ASIGNATURA`),
  ADD KEY `FK_RECURSO_HUMANO_6` (`ID_RECURSO_HUMANO`);

--
-- Indices de la tabla `grado`
--
ALTER TABLE `grado`
  ADD PRIMARY KEY (`ID_GRADO`),
  ADD UNIQUE KEY `UNQ_GRADO` (`COD_GRADO`);

--
-- Indices de la tabla `indicador`
--
ALTER TABLE `indicador`
  ADD PRIMARY KEY (`ID_INDICADOR`),
  ADD UNIQUE KEY `UNQ_INDICADOR` (`COD_INDICADOR`),
  ADD KEY `FK_COMPONENTE_2` (`ID_COMPONENTE`),
  ADD KEY `FK_ACTIVIDAD` (`ID_ACTIVIDAD`),
  ADD KEY `FK_TIPO_INDICADOR` (`ID_TIPO_INDICADOR`),
  ADD KEY `FK_RECURSO_HUMANO_1` (`ID_RECURSO_HUMANO_RESPONSABLE`),
  ADD KEY `FK_UNIDAD_MEDIDA_INDICADOR` (`ID_UNIDAD_MEDIDA_INDICADOR`);

--
-- Indices de la tabla `jornada`
--
ALTER TABLE `jornada`
  ADD PRIMARY KEY (`ID_JORNADA`),
  ADD UNIQUE KEY `UNQ_JORNADA` (`COD_JORNADA`),
  ADD KEY `FK_TALLER_CURSO_2` (`ID_TALLER_CURSO`),
  ADD KEY `FK_TIPO_JORNADA` (`ID_TIPO_JORNADA`);

--
-- Indices de la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD PRIMARY KEY (`ID_MUNICIPIO`),
  ADD UNIQUE KEY `UNQ_MUNICIPIO` (`COD_MUNICIPIO`),
  ADD KEY `FK_DEPARTAMENTO` (`ID_DEPARTAMENTO`);

--
-- Indices de la tabla `programa_formacion`
--
ALTER TABLE `programa_formacion`
  ADD PRIMARY KEY (`ID_PROGRAMA_FORMACION`),
  ADD UNIQUE KEY `UNQ_PROGRAMA_FORMACION` (`COD_PROGRAMA_FORMACION`),
  ADD KEY `FK_PROGRAMA_FORMACION_PADRE` (`ID_PROGRAMA_FORMACION_PADRE`);

--
-- Indices de la tabla `recurso_humano`
--
ALTER TABLE `recurso_humano`
  ADD PRIMARY KEY (`ID_RECURSO_HUMANO`),
  ADD UNIQUE KEY `DOCUMENTO_IDENTIFICACION` (`DOCUMENTO_IDENTIFICACION`),
  ADD KEY `FK_CENTRO_EDUCATIVO` (`ID_CENTRO_EDUCATIVO`),
  ADD KEY `FK_MUNICIPIO_2` (`ID_MUNICIPIO_RESIDENCIA`);

--
-- Indices de la tabla `recurso_humano_x_jornada`
--
ALTER TABLE `recurso_humano_x_jornada`
  ADD PRIMARY KEY (`ID_RECURSO_HUMANO_X_JORNADA`),
  ADD KEY `FK_JORNADA` (`ID_JORNADA`),
  ADD KEY `FK_RECURSO_HUMANO_3` (`ID_RECURSO_HUMANO_PARTICIPANTE`);

--
-- Indices de la tabla `sede`
--
ALTER TABLE `sede`
  ADD PRIMARY KEY (`ID_SEDE`),
  ADD UNIQUE KEY `UNQ_SEDE` (`COD_SEDE`);

--
-- Indices de la tabla `sistema_integrado`
--
ALTER TABLE `sistema_integrado`
  ADD PRIMARY KEY (`ID_SISTEMA_INTEGRADO`),
  ADD UNIQUE KEY `UNQ_SISTEMA_INTEGRADO` (`COD_SISTEMA_INTEGRADO`),
  ADD UNIQUE KEY `COD_SISTEMA_INTEGRADO` (`COD_SISTEMA_INTEGRADO`);

--
-- Indices de la tabla `taller_curso`
--
ALTER TABLE `taller_curso`
  ADD PRIMARY KEY (`ID_TALLER_CURSO`),
  ADD UNIQUE KEY `UNQ_TALLER_CURSO` (`COD_TALLER_CURSO`),
  ADD KEY `FK_SEDE` (`ID_SEDE`),
  ADD KEY `FK_PROGRAMA_FORMACION` (`ID_PROGRAMA_FORMACION`),
  ADD KEY `FK_TIPO_TALLER_CURSO` (`ID_TIPO_TALLER_CURSO`),
  ADD KEY `FK_RECURSO_HUMANO_2` (`ID_RECURSO_HUMANO_FACILITADOR`);

--
-- Indices de la tabla `taller_curso_x_indicador`
--
ALTER TABLE `taller_curso_x_indicador`
  ADD PRIMARY KEY (`ID_TALLER_CURSO_X_INDICADOR`),
  ADD KEY `FK_INDICADOR` (`ID_INDICADOR`),
  ADD KEY `FK_TALLER_CURSO_1` (`ID_TALLER_CURSO`),
  ADD KEY `FK_TIPO_TALLER_CURSO_X_INDICADOR` (`ID_TIPO_TALLER_CURSO_X_INDICADOR`);

--
-- Indices de la tabla `tipo_indicador`
--
ALTER TABLE `tipo_indicador`
  ADD PRIMARY KEY (`ID_TIPO_INDICADOR`),
  ADD UNIQUE KEY `UNQ_TIPO_INDICADOR` (`COD_TIPO_INDICADOR`);

--
-- Indices de la tabla `tipo_jornada`
--
ALTER TABLE `tipo_jornada`
  ADD PRIMARY KEY (`ID_TIPO_JORNADA`),
  ADD UNIQUE KEY `UNQ_TIPO_JORNADA` (`COD_TIPO_JORNADA`);

--
-- Indices de la tabla `tipo_meta_taller_curso_x_indicador`
--
ALTER TABLE `tipo_meta_taller_curso_x_indicador`
  ADD PRIMARY KEY (`ID_TIPO_META_TALLER_CURSO_X_INDICADOR`),
  ADD UNIQUE KEY `COD_TIPO_META_TALLER_CURSO_X_INDICADOR` (`COD_TIPO_META_TALLER_CURSO_X_INDICADOR`);

--
-- Indices de la tabla `tipo_taller_curso`
--
ALTER TABLE `tipo_taller_curso`
  ADD PRIMARY KEY (`ID_TIPO_TALLER_CURSO`),
  ADD UNIQUE KEY `UNQ_TIPO_TALLER_CURSO` (`COD_TIPO_TALLER_CURSO`);

--
-- Indices de la tabla `unidad_medida_indicador`
--
ALTER TABLE `unidad_medida_indicador`
  ADD PRIMARY KEY (`ID_UNIDAD_MEDIDA_INDICADOR`),
  ADD UNIQUE KEY `UNQ_UNIDAD_MEDIDA_INDICADOR` (`COD_UNIDAD_MEDIDA_INDICADOR`);

--
-- Indices de la tabla `zona_geografica`
--
ALTER TABLE `zona_geografica`
  ADD PRIMARY KEY (`ID_ZONA_GEOGRAFICA`),
  ADD UNIQUE KEY `UNQ_ZONA_GEOGRAFICA` (`COD_ZONA_GEOGRAFICA`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividad`
--
ALTER TABLE `actividad`
  MODIFY `ID_ACTIVIDAD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  MODIFY `ID_ASIGNATURA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `asignatura_x_grado_x_recurso_humano`
--
ALTER TABLE `asignatura_x_grado_x_recurso_humano`
  MODIFY `ID_ASIGNATURA_X_GRADO_X_RECURSO_HUMANO` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cargo_rol`
--
ALTER TABLE `cargo_rol`
  MODIFY `ID_CARGO_ROL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `cargo_rol_x_recurso_humano`
--
ALTER TABLE `cargo_rol_x_recurso_humano`
  MODIFY `ID_CARGO_ROL_X_RECURSO_HUMANO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de la tabla `centro_educativo`
--
ALTER TABLE `centro_educativo`
  MODIFY `ID_CENTRO_EDUCATIVO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=351;
--
-- AUTO_INCREMENT de la tabla `componente`
--
ALTER TABLE `componente`
  MODIFY `ID_COMPONENTE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `ID_DEPARTAMENTO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `especialidad_x_recurso_humano`
--
ALTER TABLE `especialidad_x_recurso_humano`
  MODIFY `ID_ESPECIALIDAD_X_RECURSO_HUMANO` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `grado`
--
ALTER TABLE `grado`
  MODIFY `ID_GRADO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `indicador`
--
ALTER TABLE `indicador`
  MODIFY `ID_INDICADOR` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `jornada`
--
ALTER TABLE `jornada`
  MODIFY `ID_JORNADA` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `municipio`
--
ALTER TABLE `municipio`
  MODIFY `ID_MUNICIPIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=297;
--
-- AUTO_INCREMENT de la tabla `programa_formacion`
--
ALTER TABLE `programa_formacion`
  MODIFY `ID_PROGRAMA_FORMACION` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `recurso_humano`
--
ALTER TABLE `recurso_humano`
  MODIFY `ID_RECURSO_HUMANO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT de la tabla `recurso_humano_x_jornada`
--
ALTER TABLE `recurso_humano_x_jornada`
  MODIFY `ID_RECURSO_HUMANO_X_JORNADA` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `sede`
--
ALTER TABLE `sede`
  MODIFY `ID_SEDE` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `sistema_integrado`
--
ALTER TABLE `sistema_integrado`
  MODIFY `ID_SISTEMA_INTEGRADO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT de la tabla `taller_curso`
--
ALTER TABLE `taller_curso`
  MODIFY `ID_TALLER_CURSO` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `taller_curso_x_indicador`
--
ALTER TABLE `taller_curso_x_indicador`
  MODIFY `ID_TALLER_CURSO_X_INDICADOR` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipo_indicador`
--
ALTER TABLE `tipo_indicador`
  MODIFY `ID_TIPO_INDICADOR` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tipo_jornada`
--
ALTER TABLE `tipo_jornada`
  MODIFY `ID_TIPO_JORNADA` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipo_meta_taller_curso_x_indicador`
--
ALTER TABLE `tipo_meta_taller_curso_x_indicador`
  MODIFY `ID_TIPO_META_TALLER_CURSO_X_INDICADOR` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipo_taller_curso`
--
ALTER TABLE `tipo_taller_curso`
  MODIFY `ID_TIPO_TALLER_CURSO` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `unidad_medida_indicador`
--
ALTER TABLE `unidad_medida_indicador`
  MODIFY `ID_UNIDAD_MEDIDA_INDICADOR` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `zona_geografica`
--
ALTER TABLE `zona_geografica`
  MODIFY `ID_ZONA_GEOGRAFICA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD CONSTRAINT `FK_COMPONENTE_1` FOREIGN KEY (`ID_COMPONENTE`) REFERENCES `componente` (`ID_COMPONENTE`);

--
-- Filtros para la tabla `asignatura_x_grado_x_recurso_humano`
--
ALTER TABLE `asignatura_x_grado_x_recurso_humano`
  ADD CONSTRAINT `FK_ASIGNATURA_1` FOREIGN KEY (`ID_ASIGNATURA`) REFERENCES `asignatura` (`ID_ASIGNATURA`),
  ADD CONSTRAINT `FK_GRADO` FOREIGN KEY (`ID_GRADO`) REFERENCES `grado` (`ID_GRADO`),
  ADD CONSTRAINT `FK_RECURSO_HUMANO_5` FOREIGN KEY (`ID_RECURSO_HUMANO`) REFERENCES `recurso_humano` (`ID_RECURSO_HUMANO`);

--
-- Filtros para la tabla `cargo_rol_x_recurso_humano`
--
ALTER TABLE `cargo_rol_x_recurso_humano`
  ADD CONSTRAINT `FK_CARGO_ROL` FOREIGN KEY (`ID_CARGO_ROL`) REFERENCES `cargo_rol` (`ID_CARGO_ROL`),
  ADD CONSTRAINT `FK_RECURSO_HUMANO_4` FOREIGN KEY (`ID_RECURSO_HUMANO`) REFERENCES `recurso_humano` (`ID_RECURSO_HUMANO`);

--
-- Filtros para la tabla `centro_educativo`
--
ALTER TABLE `centro_educativo`
  ADD CONSTRAINT `FK_MUNICIPIO_1` FOREIGN KEY (`ID_MUNICIPIO`) REFERENCES `municipio` (`ID_MUNICIPIO`),
  ADD CONSTRAINT `FK_SISTEMA_INTEGRADO` FOREIGN KEY (`ID_SISTEMA_INTEGRADO`) REFERENCES `sistema_integrado` (`ID_SISTEMA_INTEGRADO`);

--
-- Filtros para la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD CONSTRAINT `FK_ZONA_GEOGRAFICA` FOREIGN KEY (`ID_ZONA_GEOGRAFICA`) REFERENCES `zona_geografica` (`ID_ZONA_GEOGRAFICA`);

--
-- Filtros para la tabla `especialidad_x_recurso_humano`
--
ALTER TABLE `especialidad_x_recurso_humano`
  ADD CONSTRAINT `FK_ASIGNATURA_2` FOREIGN KEY (`ID_ASIGNATURA`) REFERENCES `asignatura` (`ID_ASIGNATURA`),
  ADD CONSTRAINT `FK_RECURSO_HUMANO_6` FOREIGN KEY (`ID_RECURSO_HUMANO`) REFERENCES `recurso_humano` (`ID_RECURSO_HUMANO`);

--
-- Filtros para la tabla `indicador`
--
ALTER TABLE `indicador`
  ADD CONSTRAINT `FK_ACTIVIDAD` FOREIGN KEY (`ID_ACTIVIDAD`) REFERENCES `actividad` (`ID_ACTIVIDAD`),
  ADD CONSTRAINT `FK_COMPONENTE_2` FOREIGN KEY (`ID_COMPONENTE`) REFERENCES `componente` (`ID_COMPONENTE`),
  ADD CONSTRAINT `FK_RECURSO_HUMANO_1` FOREIGN KEY (`ID_RECURSO_HUMANO_RESPONSABLE`) REFERENCES `recurso_humano` (`ID_RECURSO_HUMANO`),
  ADD CONSTRAINT `FK_TIPO_INDICADOR` FOREIGN KEY (`ID_TIPO_INDICADOR`) REFERENCES `tipo_indicador` (`ID_TIPO_INDICADOR`),
  ADD CONSTRAINT `FK_UNIDAD_MEDIDA_INDICADOR` FOREIGN KEY (`ID_UNIDAD_MEDIDA_INDICADOR`) REFERENCES `unidad_medida_indicador` (`ID_UNIDAD_MEDIDA_INDICADOR`);

--
-- Filtros para la tabla `jornada`
--
ALTER TABLE `jornada`
  ADD CONSTRAINT `FK_TALLER_CURSO_2` FOREIGN KEY (`ID_TALLER_CURSO`) REFERENCES `taller_curso` (`ID_TALLER_CURSO`),
  ADD CONSTRAINT `FK_TIPO_JORNADA` FOREIGN KEY (`ID_TIPO_JORNADA`) REFERENCES `tipo_jornada` (`ID_TIPO_JORNADA`);

--
-- Filtros para la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD CONSTRAINT `FK_DEPARTAMENTO` FOREIGN KEY (`ID_DEPARTAMENTO`) REFERENCES `departamento` (`ID_DEPARTAMENTO`);

--
-- Filtros para la tabla `programa_formacion`
--
ALTER TABLE `programa_formacion`
  ADD CONSTRAINT `FK_PROGRAMA_FORMACION_PADRE` FOREIGN KEY (`ID_PROGRAMA_FORMACION_PADRE`) REFERENCES `programa_formacion` (`ID_PROGRAMA_FORMACION`);

--
-- Filtros para la tabla `recurso_humano`
--
ALTER TABLE `recurso_humano`
  ADD CONSTRAINT `FK_CENTRO_EDUCATIVO` FOREIGN KEY (`ID_CENTRO_EDUCATIVO`) REFERENCES `centro_educativo` (`ID_CENTRO_EDUCATIVO`),
  ADD CONSTRAINT `FK_MUNICIPIO_2` FOREIGN KEY (`ID_MUNICIPIO_RESIDENCIA`) REFERENCES `municipio` (`ID_MUNICIPIO`);

--
-- Filtros para la tabla `recurso_humano_x_jornada`
--
ALTER TABLE `recurso_humano_x_jornada`
  ADD CONSTRAINT `FK_JORNADA` FOREIGN KEY (`ID_JORNADA`) REFERENCES `jornada` (`ID_JORNADA`),
  ADD CONSTRAINT `FK_RECURSO_HUMANO_3` FOREIGN KEY (`ID_RECURSO_HUMANO_PARTICIPANTE`) REFERENCES `recurso_humano` (`ID_RECURSO_HUMANO`);

--
-- Filtros para la tabla `taller_curso`
--
ALTER TABLE `taller_curso`
  ADD CONSTRAINT `FK_PROGRAMA_FORMACION` FOREIGN KEY (`ID_PROGRAMA_FORMACION`) REFERENCES `programa_formacion` (`ID_PROGRAMA_FORMACION`),
  ADD CONSTRAINT `FK_RECURSO_HUMANO_2` FOREIGN KEY (`ID_RECURSO_HUMANO_FACILITADOR`) REFERENCES `recurso_humano` (`ID_RECURSO_HUMANO`),
  ADD CONSTRAINT `FK_SEDE` FOREIGN KEY (`ID_SEDE`) REFERENCES `sede` (`ID_SEDE`),
  ADD CONSTRAINT `FK_TIPO_TALLER_CURSO` FOREIGN KEY (`ID_TIPO_TALLER_CURSO`) REFERENCES `tipo_taller_curso` (`ID_TIPO_TALLER_CURSO`);

--
-- Filtros para la tabla `taller_curso_x_indicador`
--
ALTER TABLE `taller_curso_x_indicador`
  ADD CONSTRAINT `FK_INDICADOR` FOREIGN KEY (`ID_INDICADOR`) REFERENCES `indicador` (`ID_INDICADOR`),
  ADD CONSTRAINT `FK_TALLER_CURSO_1` FOREIGN KEY (`ID_TALLER_CURSO`) REFERENCES `taller_curso` (`ID_TALLER_CURSO`),
  ADD CONSTRAINT `FK_TIPO_TALLER_CURSO_X_INDICADOR` FOREIGN KEY (`ID_TIPO_TALLER_CURSO_X_INDICADOR`) REFERENCES `tipo_taller_curso_x_indicador` (`ID_TIPO_TALLER_CURSO_X_INDICADOR`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
