USE `proyectoLPII` ;
#datos de rol
INSERT INTO `proyectoLPII`.`Rol`(`idRol`,`gestionarLES`,`gestionarRES`,`verficarLES`,`verificarRES`,`mantenimiento`,`reporte`) 
						 VALUES ('RL001', '1', '1', '1', '1', '1', '1');

#Datos ESTADO
INSERT INTO `proyectoLPII`.`estado` (`idEstado`, `descripcion`) VALUES ('1', 'Activo');
INSERT INTO `proyectoLPII`.`estado` (`idEstado`, `descripcion`) VALUES ('2', 'Inactivo');
INSERT INTO `proyectoLPII`.`estado` (`idEstado`, `descripcion`) VALUES ('3', 'Generado');
INSERT INTO `proyectoLPII`.`estado` (`idEstado`, `descripcion`) VALUES ('4', 'Conforme');
INSERT INTO `proyectoLPII`.`estado` (`idEstado`, `descripcion`) VALUES ('5', 'Disconforme');
INSERT INTO `proyectoLPII`.`estado` (`idEstado`, `descripcion`) VALUES ('6', 'Actualizado');
INSERT INTO `proyectoLPII`.`estado` (`idEstado`, `descripcion`) VALUES ('7', 'Desaprobado');
INSERT INTO `proyectoLPII`.`estado` (`idEstado`, `descripcion`) VALUES ('8', 'Aprobado');



#datos de Cargo
INSERT INTO `proyectoLPII`.`Cargo`(`idCargo`,`descripcion`,`sueldo`,`idRol`) VALUES ('CA001', 'Director de Ejecutivo', '5000.6','RL001');
INSERT INTO `proyectoLPII`.`Cargo`(`idCargo`,`descripcion`,`sueldo`,`idRol`) VALUES ('CA002', 'Director de Personal', '5000.6','RL001');
INSERT INTO `proyectoLPII`.`Cargo`(`idCargo`,`descripcion`,`sueldo`,`idRol`) VALUES ('CA003', 'Director de Economia', '5000.6','RL001');
INSERT INTO `proyectoLPII`.`Cargo`(`idCargo`,`descripcion`,`sueldo`,`idRol`) VALUES ('CA004', 'Director de Logistica', '5000.6','RL001');
INSERT INTO `proyectoLPII`.`Cargo`(`idCargo`,`descripcion`,`sueldo`,`idRol`) VALUES ('CA005', 'Jefe ECA', '5000.6','RL001');
INSERT INTO `proyectoLPII`.`Cargo`(`idCargo`,`descripcion`,`sueldo`,`idRol`) VALUES ('CA006', 'Jefe Presupuesto', '5000.6','RL001');
INSERT INTO `proyectoLPII`.`Cargo`(`idCargo`,`descripcion`,`sueldo`,`idRol`) VALUES ('CA007', 'Jefe Pensiones', '5000.6','RL001');
INSERT INTO `proyectoLPII`.`Cargo`(`idCargo`,`descripcion`,`sueldo`,`idRol`) VALUES ('CA008', 'Jefe Remuneracion', '5000.6','RL001');
INSERT INTO `proyectoLPII`.`Cargo`(`idCargo`,`descripcion`,`sueldo`,`idRol`) VALUES ('CA009', 'Jefe Selección', '5000.6','RL001');
INSERT INTO `proyectoLPII`.`Cargo`(`idCargo`,`descripcion`,`sueldo`,`idRol`) VALUES ('CA010', 'Jefe Bienestar Per.', '5000.6','RL001');
INSERT INTO `proyectoLPII`.`Cargo`(`idCargo`,`descripcion`,`sueldo`,`idRol`) VALUES ('CA011', 'Encargado Eq Remuneración', '5000.6','RL001');
INSERT INTO `proyectoLPII`.`Cargo`(`idCargo`,`descripcion`,`sueldo`,`idRol`) VALUES ('CA012', 'Encargado Eq Asistencia', '5000.6','RL001');
INSERT INTO `proyectoLPII`.`Cargo`(`idCargo`,`descripcion`,`sueldo`,`idRol`) VALUES ('CA013', 'Asalariado', '5000.6','RL001');


#datos de unidad Orgánica
INSERT INTO `proyectoLPII`.`UnidadOrganica`(`idUnidadOrganica`,`descripcion`,`idCargo`) VALUES ('U0001', 'Oficina de Personal','CA002');
INSERT INTO `proyectoLPII`.`UnidadOrganica`(`idUnidadOrganica`,`descripcion`,`idCargo`) VALUES ('U0002', 'Oficina de Economia','CA003');
INSERT INTO `proyectoLPII`.`UnidadOrganica`(`idUnidadOrganica`,`descripcion`,`idCargo`) VALUES ('U0003', 'Oficina de Logistica','CA004');
INSERT INTO `proyectoLPII`.`UnidadOrganica`(`idUnidadOrganica`,`descripcion`,`idCargo`) VALUES ('U0004', 'Oficina Ejecutiva de Administración','CA001');


#datos de Equipo
INSERT INTO `proyectoLPII`.`Equipo`(`idEquipo`,`descripcion`,`cantidad`,`idUnidadOrganica`)VALUES('EQ001','Equipo de Control de Asistencia',10,'U0001');
INSERT INTO `proyectoLPII`.`Equipo`(`idEquipo`,`descripcion`,`cantidad`,`idUnidadOrganica`)VALUES('EQ002','Equipo de Presupuesto',10,'U0001');
INSERT INTO `proyectoLPII`.`Equipo`(`idEquipo`,`descripcion`,`cantidad`,`idUnidadOrganica`)VALUES('EQ003','Equipo de Pensiones y otros Beneficios',10,'U0001');
INSERT INTO `proyectoLPII`.`Equipo`(`idEquipo`,`descripcion`,`cantidad`,`idUnidadOrganica`)VALUES('EQ004','Equipo de Remuneraciones',10,'U0001');
INSERT INTO `proyectoLPII`.`Equipo`(`idEquipo`,`descripcion`,`cantidad`,`idUnidadOrganica`)VALUES('EQ005','Equipo de Seleccion, Legajo y Capacitación',10,'U0001');
INSERT INTO `proyectoLPII`.`Equipo`(`idEquipo`,`descripcion`,`cantidad`,`idUnidadOrganica`)VALUES('EQ006','Equipo de Bienestra de Personal',10,'U0001');

#datos de Cargos_Equipos
INSERT INTO `proyectoLPII`.`Cargo_Equipo`(`idCargo`,`idEquipo`)VALUES('CA005','EQ001');
INSERT INTO `proyectoLPII`.`Cargo_Equipo`(`idCargo`,`idEquipo`)VALUES('CA012','EQ001');
INSERT INTO `proyectoLPII`.`Cargo_Equipo`(`idCargo`,`idEquipo`)VALUES('CA006','EQ002');
INSERT INTO `proyectoLPII`.`Cargo_Equipo`(`idCargo`,`idEquipo`)VALUES('CA007','EQ003');
INSERT INTO `proyectoLPII`.`Cargo_Equipo`(`idCargo`,`idEquipo`)VALUES('CA008','EQ004');
INSERT INTO `proyectoLPII`.`Cargo_Equipo`(`idCargo`,`idEquipo`)VALUES('CA011','EQ004');
INSERT INTO `proyectoLPII`.`Cargo_Equipo`(`idCargo`,`idEquipo`)VALUES('CA009','EQ005');
INSERT INTO `proyectoLPII`.`Cargo_Equipo`(`idCargo`,`idEquipo`)VALUES('CA010','EQ006');
select * from `Cargo_Equipo`;

#datos de Empleado
INSERT INTO `proyectoLPII`.`Empleado`(`idEmpleado`,`nombre`,`apellidoP`,`apellidoM`,`fechaNacimiento`,`telefono`,`seguroSocial`,`idCargo`,`idestado`,`foto`,`fechaIngreso`,`usuario`,`password`) 
							  VALUES ('EM0001', 'Romario', 'Vargas', 'Jacinto', '1995/10/10', '55555', '11111111111', 'CA001','1',null,'2014/12/12', 'romario', '123');
INSERT INTO `proyectoLPII`.`Empleado`(`idEmpleado`,`nombre`,`apellidoP`,`apellidoM`,`fechaNacimiento`,`telefono`,`seguroSocial`,`idCargo`,`idestado`,`foto`,`fechaIngreso`,`usuario`,`password`) 
							  VALUES ('EM0002', 'Juan ', 'Anton', 'Santa Maria', '10/10/1993', '55555', '11111111111', 'CA001','1',null,'23/12/2014', 'anton', '123');
INSERT INTO `proyectoLPII`.`Empleado`(`idEmpleado`,`nombre`,`apellidoP`,`apellidoM`,`fechaNacimiento`,`telefono`,`seguroSocial`,`idCargo`,`idestado`,`foto`,`fechaIngreso`,`usuario`,`password`) 
							  VALUES ('EM0003', 'Javier', 'Huaman', 'Adama', '10/10/1993', '55555', '11111111111', 'CA001','1',null,'23/12/2014', 'javier', '123');
INSERT INTO `proyectoLPII`.`Empleado`(`idEmpleado`,`nombre`,`apellidoP`,`apellidoM`,`fechaNacimiento`,`telefono`,`seguroSocial`,`idCargo`,`idestado`,`foto`,`fechaIngreso`,`usuario`,`password`)
							  VALUES ('EM0004', 'Miguel', 'Llamoca', 'Llamoca', '10/10/1993', '55555', '11111111111', 'CA002','1',null,'23/12/2014', 'miguel', '123');
INSERT INTO `proyectoLPII`.`Empleado`(`idEmpleado`,`nombre`,`apellidoP`,`apellidoM`,`fechaNacimiento`,`telefono`,`seguroSocial`,`idCargo`,`idestado`,`foto`,`fechaIngreso`,`usuario`,`password`) 
							  VALUES ('EM0005', 'Maria', 'Casas', 'Casas', '10/10/1993', '55555', '11111111111', 'CA003','1',null,'23/12/2014', 'maria', '123');















