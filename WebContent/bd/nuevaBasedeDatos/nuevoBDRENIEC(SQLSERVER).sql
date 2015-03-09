if DB_ID('DSQ_RENIEC') is not null
	begin
	use master
	drop database DSQ_RENIEC
	end
go
create database DSQ_RENIEC
go
use DSQ_RENIEC
go

if object_id('DEPARTAMENTO') is not null
	drop table DEPARTAMENTO
go
create table DEPARTAMENTO
(
idDepa int primary key,
departamento varchar(50) not null,
)
go

INSERT INTO DEPARTAMENTO (idDepa, departamento) VALUES

(1, 'CALLAO'),
(2, 'CUSCO'),
(3, 'JUNIN'),
(4, 'LIMA')
go
if object_id('PROVINCIA') is not null
	drop table PROVINCIA
go
create table PROVINCIA
(
 idProv int primary key,
  provincia  varchar(50) not NULL,
  idDepa  int references DEPARTAMENTO
)
go
INSERT INTO   PROVINCIA   (  idProv  ,   provincia  ,   idDepa  ) VALUES

(66, 'CALLAO', 1),
(67, 'CUSCO', 2),
(68, 'ACOMAYO', 2),
(69, 'ANTA', 2),
(70, 'CALCA', 2),
(71, 'CANAS', 2),
(72, 'CANCHIS', 2),
(73, 'CHUMBIVILCAS', 2),
(74, 'ESPINAR', 2),
(75, 'LA CONVENCION', 2),
(76, 'PARURO', 2),
(77, 'PAUCARTAMBO', 2),
(78, 'QUISPICANCHI', 2),
(79, 'URUBAMBA', 2),
(103, 'HUANCAYO', 3),
(104, 'CONCEPCION', 3),
(105, 'CHANCHAMAYO', 3),
(106, 'JAUJA', 3),
(107, 'JUNIN', 3),
(108, 'SATIPO', 3),
(109, 'TARMA', 3),
(110, 'YAULI', 3),
(111, 'CHUPACA', 3),
(127, 'LIMA', 4),
(128, 'BARRANCA', 4),
(129, 'CAJATAMBO', 4),
(130, 'CANTA', 4),
(131, 'CA&Ntilde;ETE', 4),
(132, 'HUARAL', 4),
(133, 'HUAROCHIRI', 4),
(134, 'HUAURA', 4),
(135, 'OYON', 4),
(136, 'YAUYOS', 4)
go
if object_id('DISTRITO') is not null
	drop table DISTRITO
go
create table DISTRITO
(
  idDist   int primary key,
   distrito   varchar(50) not NULL,
   idProv   int REFERENCES PROVINCIA
   )
go
INSERT INTO   DISTRITO   (  idDist  ,   distrito  ,   idProv  ) VALUES

(668, 'SANTA CRUZ', 66),
(669, 'ANDABAMBA', 66),
(670, 'CATACHE', 66),
(671, 'CHANCAYBA&Ntilde;OS', 66),
(672, 'LA ESPERANZA', 66),
(673, 'NINABAMBA', 66),
(674, 'PULAN', 66),
(675, 'SAUCEPAMPA', 66),
(676, 'SEXI', 66),
(677, 'UTICYACU', 66),
(678, 'YAUYUCAN', 66),
(679, 'CALLAO', 67),
(680, 'BELLAVISTA', 67),
(681, 'CARMEN DE LA LEGUA REYNOSO', 67),
(682, 'LA PERLA', 67),
(683, 'LA PUNTA', 67),
(684, 'VENTANILLA', 67),
(685, 'CUSCO', 67),
(686, 'CCORCA', 67),
(687, 'POROY', 67),
(688, 'SAN JERONIMO', 67),
(689, 'SAN SEBASTIAN', 67),
(690, 'SANTIAGO', 67),
(691, 'SAYLLA', 67),
(692, 'WANCHAQ', 67),
(693, 'ACOMAYO', 68),
(694, 'ACOPIA', 68),
(695, 'ACOS', 68),
(696, 'MOSOC LLACTA', 68),
(697, 'POMACANCHI', 68),
(698, 'RONDOCAN', 68),
(699, 'SANGARARA', 68),
(700, 'ANTA', 69),
(701, 'ANCAHUASI', 69),
(702, 'CACHIMAYO', 69),
(703, 'CHINCHAYPUJIO', 69),
(704, 'HUAROCONDO', 69),
(705, 'LIMATAMBO', 69),
(706, 'MOLLEPATA', 69),
(707, 'PUCYURA', 69),
(708, 'ZURITE', 69),
(709, 'CALCA', 70),
(710, 'COYA', 70),
(711, 'LAMAY', 70),
(712, 'LARES', 70),
(713, 'PISAC', 70),(714, 'SAN SALVADOR', 70),
(715, 'TARAY', 70),
(716, 'YANATILE', 70),
(717, 'YANAOCA', 71),
(718, 'CHECCA', 71),
(719, 'KUNTURKANKI', 71),
(720, 'LANGUI', 71),
(721, 'LAYO', 71),
(722, 'PAMPAMARCA', 71),
(723, 'QUEHUE', 71),
(724, 'TUPAC AMARU', 71),
(725, 'SICUANI', 72),
(726, 'CHECACUPE', 72),
(727, 'COMBAPATA', 72),
(728, 'MARANGANI', 72),
(729, 'PITUMARCA', 72),
(730, 'SAN PABLO', 72),
(731, 'SAN PEDRO', 72),
(732, 'TINTA', 72),
(733, 'SANTO TOMAS', 73),
(734, 'CAPACMARCA', 73),
(735, 'CHAMACA', 73),
(736, 'COLQUEMARCA', 73),
(737, 'LIVITACA', 73),
(738, 'LLUSCO', 73),
(739, 'QUI&Ntilde;OTA', 73),
(740, 'VELILLE', 73),
(741, 'ESPINAR', 74),
(742, 'CONDOROMA', 74),
(743, 'COPORAQUE', 74),
(744, 'OCORURO', 74),
(745, 'PALLPATA', 74),
(746, 'PICHIGUA', 74),
(747, 'SUYCKUTAMBO', 74),
(748, 'ALTO PICHIGUA', 74),
(749, 'SANTA ANA', 75),
(750, 'ECHARATE', 75),
(751, 'HUAYOPATA', 75),
(752, 'MARANURA', 75),
(753, 'OCOBAMBA', 75),
(754, 'QUELLOUNO', 75),
(755, 'KIMBIRI', 75),
(756, 'SANTA TERESA', 75),
(757, 'VILCABAMBA', 75),
(758, 'PICHARI', 75),
(759, 'PARURO', 76),
(760, 'ACCHA', 76),
(761, 'CCAPI', 76),
(762, 'COLCHA', 76),
(763, 'HUANOQUITE', 76),
(764, 'OMACHA', 76),
(765, 'PACCARITAMBO', 76),
(766, 'PILLPINTO', 76),
(767, 'YAURISQUE', 76),
(768, 'PAUCARTAMBO', 77),
(769, 'CAICAY', 77),
(770, 'CHALLABAMBA', 77),
(771, 'COLQUEPATA', 77),
(772, 'HUANCARANI', 77),
(773, 'KOS&Ntilde;IPATA', 77),(774, 'URCOS', 78),
(775, 'ANDAHUAYLILLAS', 78),
(776, 'CAMANTI', 78),
(777, 'CCARHUAYO', 78),
(778, 'CCATCA', 78),
(779, 'CUSIPATA', 78),
(780, 'HUARO', 78),
(781, 'LUCRE', 78),
(782, 'MARCAPATA', 78),
(783, 'OCONGATE', 78),
(784, 'OROPESA', 78),
(785, 'QUIQUIJANA', 78),
(786, 'URUBAMBA', 79),
(787, 'CHINCHERO', 79),
(788, 'HUAYLLABAMBA', 79),
(789, 'MACHUPICCHU', 79),
(790, 'MARAS', 79),
(791, 'OLLANTAYTAMBO', 79),
(792, 'YUCAY', 79),
(1006, 'HUANCAYO', 103),
(1007, 'CARHUACALLANGA', 103),
(1008, 'CHACAPAMPA', 103),
(1009, 'CHICCHE', 103),
(1010, 'CHILCA', 103),
(1011, 'CHONGOS ALTO', 103),
(1012, 'CHUPURO', 103),
(1013, 'COLCA', 103),(1014, 'CULLHUAS', 103),
(1015, 'EL TAMBO', 103),
(1016, 'HUACRAPUQUIO', 103),
(1017, 'HUALHUAS', 103),
(1018, 'HUANCAN', 103),
(1019, 'HUASICANCHA', 103),
(1020, 'HUAYUCACHI', 103),
(1021, 'INGENIO', 103),
(1022, 'PARIAHUANCA', 103),
(1023, 'PILCOMAYO', 103),
(1024, 'PUCARA', 103),
(1025, 'QUICHUAY', 103),
(1026, 'QUILCAS', 103),
(1027, 'SAN AGUSTIN', 103),
(1028, 'SAN JERONIMO DE TUNAN', 103),
(1029, 'SA&Ntilde;O', 103),
(1030, 'SAPALLANGA', 103),
(1031, 'SICAYA', 103),
(1032, 'SANTO DOMINGO DE ACOBAMBA', 103),
(1033, 'VIQUES', 103),
(1034, 'CONCEPCION', 104),
(1035, 'ACO', 104),
(1036, 'ANDAMARCA', 104),
(1037, 'CHAMBARA', 104),
(1038, 'COCHAS', 104),
(1039, 'COMAS', 104),
(1040, 'HEROINAS TOLEDO', 104),
(1041, 'MANZANARES', 104),
(1042, 'MARISCAL CASTILLA', 104),
(1043, 'MATAHUASI', 104),
(1044, 'MITO', 104),
(1045, 'NUEVE DE JULIO', 104),
(1046, 'ORCOTUNA', 104),
(1047, 'SAN JOSE DE QUERO', 104),
(1048, 'SANTA ROSA DE OCOPA', 104),
(1049, 'CHANCHAMAYO', 105),
(1050, 'PERENE', 105),
(1051, 'PICHANAQUI', 105),
(1052, 'SAN LUIS DE SHUARO', 105),
(1053, 'SAN RAMON', 105),
(1054, 'VITOC', 105),
(1055, 'JAUJA', 106),
(1056, 'ACOLLA', 106),
(1057, 'APATA', 106),
(1058, 'ATAURA', 106),
(1059, 'CANCHAYLLO', 106),
(1060, 'CURICACA', 106),
(1061, 'EL MANTARO', 106),
(1062, 'HUAMALI', 106),
(1063, 'HUARIPAMPA', 106),
(1064, 'HUERTAS', 106),
(1065, 'JANJAILLO', 106),
(1066, 'JULCAN', 106),
(1067, 'LEONOR ORDO&Ntilde;EZ', 106),
(1068, 'LLOCLLAPAMPA', 106),
(1069, 'MARCO', 106),
(1070, 'MASMA', 106),
(1071, 'MASMA CHICCHE', 106),
(1072, 'MOLINOS', 106),
(1073, 'MONOBAMBA', 106),(1074, 'MUQUI', 106),
(1075, 'MUQUIYAUYO', 106),
(1076, 'PACA', 106),
(1077, 'PACCHA', 106),
(1078, 'PANCAN', 106),
(1079, 'PARCO', 106),
(1080, 'POMACANCHA', 106),
(1081, 'RICRAN', 106),
(1082, 'SAN LORENZO', 106),
(1083, 'SAN PEDRO DE CHUNAN', 106),
(1084, 'SAUSA', 106),
(1085, 'SINCOS', 106),
(1086, 'TUNAN MARCA', 106),
(1087, 'YAULI', 106),
(1088, 'YAUYOS', 106),
(1089, 'JUNIN', 107),
(1090, 'CARHUAMAYO', 107),
(1091, 'ONDORES', 107),
(1092, 'ULCUMAYO', 107),
(1093, 'SATIPO', 108),
(1094, 'COVIRIALI', 108),
(1095, 'LLAYLLA', 108),
(1096, 'MAZAMARI', 108),
(1097, 'PAMPA HERMOSA', 108),
(1098, 'PANGOA', 108),
(1099, 'RIO NEGRO', 108),
(1100, 'RIO TAMBO', 108),
(1101, 'TARMA', 109),
(1102, 'ACOBAMBA', 109),
(1103, 'HUARICOLCA', 109),
(1104, 'HUASAHUASI', 109),
(1105, 'LA UNION', 109),
(1106, 'PALCA', 109),
(1107, 'PALCAMAYO', 109),
(1108, 'SAN PEDRO DE CAJAS', 109),
(1109, 'TAPO', 109),
(1110, 'LA OROYA', 110),
(1111, 'CHACAPALPA', 110),
(1112, 'HUAY-HUAY', 110),
(1113, 'MARCAPOMACOCHA', 110),
(1114, 'MOROCOCHA', 110),
(1115, 'PACCHA', 110),
(1116, 'SANTA BARBARA DE CARHUACAYAN', 110),
(1117, 'SANTA ROSA DE SACCO', 110),
(1118, 'SUITUCANCHA', 110),
(1119, 'YAULI', 110),
(1120, 'CHUPACA', 111),
(1121, 'AHUAC', 111),
(1122, 'CHONGOS BAJO', 111),
(1123, 'HUACHAC', 111),
(1124, 'HUAMANCACA CHICO', 111),
(1125, 'SAN JUAN DE ISCOS', 111),
(1126, 'SAN JUAN DE JARPA', 111),
(1127, 'TRES DE DICIEMBRE', 111),
(1128, 'YANACANCHA', 111),
(1251, 'LIMA', 127),
(1252, 'ANCON', 127),
(1253, 'ATE', 127),(1254, 'BARRANCO', 127),
(1255, 'BRE&Ntilde;A', 127),
(1256, 'CARABAYLLO', 127),
(1257, 'CHACLACAYO', 127),
(1258, 'CHORRILLOS', 127),
(1259, 'CIENEGUILLA', 127),
(1260, 'COMAS', 127),
(1261, 'EL AGUSTINO', 127),
(1262, 'INDEPENDENCIA', 127),
(1263, 'JESUS MARIA', 127),
(1264, 'LA MOLINA', 127),
(1265, 'LA VICTORIA', 127),
(1266, 'LINCE', 127),
(1267, 'LOS OLIVOS', 127),
(1268, 'LURIGANCHO', 127),
(1269, 'LURIN', 127),
(1270, 'MAGDALENA DEL MAR', 127),
(1271, 'MAGDALENA VIEJA', 127),
(1272, 'MIRAFLORES', 127),
(1273, 'PACHACAMAC', 127),
(1274, 'PUCUSANA', 127),
(1275, 'PUENTE PIEDRA', 127),
(1276, 'PUNTA HERMOSA', 127),
(1277, 'PUNTA NEGRA', 127),
(1278, 'RIMAC', 127),
(1279, 'SAN BARTOLO', 127),
(1280, 'SAN BORJA', 127),
(1281, 'SAN ISIDRO', 127),
(1282, 'SAN JUAN DE LURIGANCHO', 127),
(1283, 'SAN JUAN DE MIRAFLORES', 127),
(1284, 'SAN LUIS', 127),
(1285, 'SAN MARTIN DE PORRES', 127),
(1286, 'SAN MIGUEL', 127),
(1287, 'SANTA ANITA', 127),
(1288, 'SANTA MARIA DEL MAR', 127),
(1289, 'SANTA ROSA', 127),
(1290, 'SANTIAGO DE SURCO', 127),
(1291, 'SURQUILLO', 127),
(1292, 'VILLA EL SALVADOR', 127),
(1293, 'VILLA MARIA DEL TRIUNFO', 127)

if object_id('PERSONA') is not null
	drop table PERSONA
go
create table PERSONA
(
nDNI char(8) primary key,
nombre varchar(40) not null,
apellidoP varchar(40) not null,
apellidoM varchar(40) not null,
sexo varchar(40) not null,
fechaNac date not null,
telefono char(11) not null,
direccion varchar(45) not null,
email varchar(45) not null,
foto image null,
firma text null,
huella image null,
idDist   int REFERENCES DISTRITO,
contrase�a varchar(100)
)
go
set dateformat dmy


insert into persona values ('70236562','Juan','Anton','Santa Maria','Masculino','1996-12-12','123456789','Jr noseque','abc@gmail.com',NULL,'data:image/jpeg;base64,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',NULL,'1293','contrase�a') 