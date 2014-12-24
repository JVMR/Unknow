#DATOS DE LA BASE DE DATOS

use proyecto_inr;

#datos de rol
INSERT INTO `proyecto_inr`.`rol` (`idRol`, `gestionarLES`, `gestionarRES`, `verificarLES`, `verificarRES`, `consultarLES`, `consultarRES`, `mantenimiento`, `reporte`, `manEmpleado`, `manUnidad`, `manCargo`, `manRol`, `manFirma`) VALUES ('R001', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1');

#datos de Cargo
INSERT INTO `proyecto_inr`.`cargo` (`idCargo`, `descripcion`, `sueldo`) VALUES ('CA001', 'Director', '5000.6');
INSERT INTO `proyecto_inr`.`cargo` (`idCargo`, `descripcion`, `sueldo`) VALUES ('CA002', 'Técnico', '3000.20');
INSERT INTO `proyecto_inr`.`cargo` (`idCargo`, `descripcion`, `sueldo`) VALUES ('CA003', 'Secretaria', '2000.02');
INSERT INTO `proyecto_inr`.`cargo` (`idCargo`, `descripcion`, `sueldo`) VALUES ('CA004', 'Sistema', '8000.00');


#datos de estado
INSERT INTO `proyecto_inr`.`estado` (`idEstado`, `descripcion`) VALUES ('1', 'Activo');
INSERT INTO `proyecto_inr`.`estado` (`idEstado`, `descripcion`) VALUES ('2', 'Inactivo');
INSERT INTO `proyecto_inr`.`estado` (`idEstado`, `descripcion`) VALUES ('3', 'Generado');
INSERT INTO `proyecto_inr`.`estado` (`idEstado`, `descripcion`) VALUES ('4', 'Conforme');
INSERT INTO `proyecto_inr`.`estado` (`idEstado`, `descripcion`) VALUES ('5', 'Disconforme');
INSERT INTO `proyecto_inr`.`estado` (`idEstado`, `descripcion`) VALUES ('6', 'Actualizado');
INSERT INTO `proyecto_inr`.`estado` (`idEstado`, `descripcion`) VALUES ('7', 'Desaprobado');
INSERT INTO `proyecto_inr`.`estado` (`idEstado`, `descripcion`) VALUES ('8', 'Aprobado');


#datos mantenimiento de Empleado
INSERT INTO `proyecto_inr`.`empleado` (`idEmpleado`, `idRol`, `idEstado`, `nombresEmpleado`, `apellidoPaterno`, `apellidoMaterno`, `fechaNacimiento`, `telefono`, `celular`, `numeroSeguroSocial`, `usuario`, `psswrd`, `idCargo`,`foto`,`fechaIngresoLaboral`) VALUES ('E-00001', 'R001', '1', 'Romario', 'Vargas', 'Jacinto', '14/10/1995', '55555', '999999999', '11111111111', 'romario', '123', 'CA004',null,'23/12/2014');
INSERT INTO `proyecto_inr`.`empleado` (`idEmpleado`, `idRol`, `idEstado`, `nombresEmpleado`, `apellidoPaterno`, `apellidoMaterno`, `fechaNacimiento`, `telefono`, `celular`, `numeroSeguroSocial`, `usuario`, `psswrd`, `idCargo`,`foto`,`fechaIngresoLaboral`) VALUES ('E-00002', 'R001', '1', 'Juan ', 'Anton', 'Santa Maria', '10/10/1993', '55555', '999999999', '11111111111', 'anton', '123', 'CA001',null,'23/12/2014');
INSERT INTO `proyecto_inr`.`empleado` (`idEmpleado`, `idRol`, `idEstado`, `nombresEmpleado`, `apellidoPaterno`, `apellidoMaterno`, `fechaNacimiento`, `telefono`, `celular`, `numeroSeguroSocial`, `usuario`, `psswrd`, `idCargo`,`foto`,`fechaIngresoLaboral`) VALUES ('E-00003', 'R001', '1', 'Javier', 'Huaman', 'Adama', '10/10/1993', '55555', '999999999', '11111111111', 'javier', '123', 'CA001',null,'23/12/2014');
INSERT INTO `proyecto_inr`.`empleado` (`idEmpleado`, `idRol`, `idEstado`, `nombresEmpleado`, `apellidoPaterno`, `apellidoMaterno`, `fechaNacimiento`, `telefono`, `celular`, `numeroSeguroSocial`, `usuario`, `psswrd`, `idCargo`,`foto`,`fechaIngresoLaboral`) VALUES ('E-00004', 'R001', '1', 'Miguel', 'Llamoca', 'Llamoca', '10/10/1993', '55555', '999999999', '11111111111', 'miguel', '123', 'CA002',null,'23/12/2014');
INSERT INTO `proyecto_inr`.`empleado` (`idEmpleado`, `idRol`, `idEstado`, `nombresEmpleado`, `apellidoPaterno`, `apellidoMaterno`, `fechaNacimiento`, `telefono`, `celular`, `numeroSeguroSocial`, `usuario`, `psswrd`, `idCargo`,`foto`,`fechaIngresoLaboral`) VALUES ('E-00005', 'R001', '1', 'Maria', 'Casas', 'Casas', '10/10/1993', '55555', '999999999', '11111111111', 'maria', '123', 'CA003',null,'23/12/2014');

#datos de Director
INSERT INTO `proyecto_inr`.`director` (`idDirector`, `añosExperiencia`) VALUES ('E-00002', '12');
INSERT INTO `proyecto_inr`.`director` (`idDirector`, `añosExperiencia`) VALUES ('E-00003', '24');

#datos de unidad Orgánica
INSERT INTO `proyecto_inr`.`unidadorganica` (`idUnidadOrganica`, `idDirector`, `nombreUnidadOrganica`, `direccion`) VALUES ('U-0001', 'E-00002', 'Oficina de Personal', 'Los Olivos');
INSERT INTO `proyecto_inr`.`unidadorganica` (`idUnidadOrganica`, `idDirector`, `nombreUnidadOrganica`, `direccion`) VALUES ('U-0002', 'E-00003', 'Oficina Ejecutiva', 'Los Olivos');

#datos de equipos
INSERT INTO `proyecto_inr`.`equipo` (`idEquipo`, `nombreEquipo`, `idUnidadOrganica`, `descripcion`) VALUES ('EQ0001', 'Control de Asistencia', 'U-0001', 'Dedicado a las asistencia de trabajadores y generacion de resoluciones de LES');
INSERT INTO `proyecto_inr`.`equipo` (`idEquipo`, `nombreEquipo`, `idUnidadOrganica`, `descripcion`) VALUES ('EQ0002', 'Administracion', 'U-0002', 'Para jefes ');


#datos de tecnico
INSERT INTO `proyecto_inr`.`tecnico` (`idTecnico`, `funcion`, `especialidad`, `idEquipo`, `idTecnico_Jefe`) VALUES ('E-00004', 'Asistente', 'Practicante', 'EQ0001', 'E-00004');






