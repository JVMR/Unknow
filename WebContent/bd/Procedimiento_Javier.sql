USE proyectolpii;

DROP PROCEDURE IF EXISTS SP_VALIDAUSUARIO;
DELIMITER $$
CREATE PROCEDURE SP_VALIDAUSUARIO(usu varchar(45),pass varchar(45))
BEGIN
	SELECT e.idEmpleado,e.nDNI,e.nombre,concat(e.apellidoP,' ',e.apellidoM) as 'Empleado',e.fechaNacimiento,e.telefono,e.seguroSocial,
	c.descripcion,e.foto,e.fechaIngreso,e.usuario,e.password FROM `empleado` e ,`cargo` c where e.idCargo=c.idCargo and e.usuario=usu and e.password=pass;
END$$ 
DELIMITER ;

############################### LISTA-CARGOXNOMBRE ###################################################
DROP PROCEDURE IF EXISTS SP_LISTACARGOXNOMBRE;
DELIMITER $$
CREATE PROCEDURE SP_LISTACARGOXNOMBRE(nombre varchar(45))
BEGIN
	declare id char(6);
    declare equipo varchar(10);
    select 'A fuera de Equipo' into equipo;
    select idCargo into id from cargo where descripcion=nombre;
	if exists(select  c.descripcion,c.sueldo,uo.nombreUnidad from cargo c, unidadorganica uo where c.idCargo=uo.idCargo and c.idCargo=id) then
	select  c.descripcion,c.sueldo,uo.nombreUnidad,equipo from cargo c, unidadorganica uo where c.idCargo=uo.idCargo and c.idCargo=id;
    end if;
	if exists(select c.descripcion,c.sueldo,e.nombreEquipo,uo.nombreUnidad from cargo c, cargo_equipo ce,equipo e, unidadorganica uo where ce.idCargo=c.idCargo and ce.idEquipo=e.idEquipo and e.idUnidadOrganica=uo.idUnidadOrganica and c.idCargo=id) then    
	select c.descripcion,c.sueldo,uo.nombreUnidad,e.nombreEquipo from cargo c, cargo_equipo ce,equipo e, unidadorganica uo where ce.idCargo=c.idCargo and ce.idEquipo=e.idEquipo 
    and e.idUnidadOrganica=uo.idUnidadOrganica and c.idCargo=id;
    end if;
    
END$$ 
DELIMITER ;
CALL SP_LISTACARGOXNOMBRE('Director de Ejecutivo');
CALL SP_LISTACARGOXNOMBRE('Jefe ECA');
############################## REGISTRA-EMPLEADO  ##############################################
DROP PROCEDURE IF exists SP_REGISTRAEMPLEADO;
DELIMITER $$
CREATE PROCEDURE SP_REGISTRAEMPLEADO( 
	dni char(8),
  nom varchar(45) ,
  apellidoP varchar(45) ,
  apellidoM varchar(45) ,
  fechaNacimiento date ,
  telefono char(11) ,
  seguroSocial char(11) ,
  idCargo char(6) ,
  idestado int(11) ,
  foto mediumblob,
  fechaIngreso date ,
  usuario varchar(45) ,
  password varchar(45))
begin
declare id char(6);
declare num char(4);
select idEmpleado into id from empleado  order by idEmpleado desc limit 1;
select cast((substring(id,3,4)) as unsigned) + 1 into num;
IF num < 10 
then 
	select concat('EM000',num) into id;	
elseif num <100 then
	select concat('EM00',num) into id;	
elseif num<1000 then
 select concat('EM0',num) into id;	
 else  select concat('EM',num) into id;	
end if;
INSERT INTO `empleado`(`idEmpleado`,`nDNI`,`nombre`,`apellidoP`,`apellidoM`,`fechaNacimiento`,`telefono`,`seguroSocial`,`idCargo`,`idestado`,`foto`,`fechaIngreso`,`usuario`,`password`)
VALUES
(id,dni,nom,apellidoP,apellidoM,  fechaNacimiento ,  telefono ,  seguroSocial ,  idCargo ,  idestado ,  foto ,  fechaIngreso ,  usuario ,  password );
END$$ 
DELIMITER ;
#CALL SP_REGISTRAEMPLEADO('70236561','Javier','Javier', 'Javier', '1996/12/12', '123456789', '12345678912', 'CA013', 1, null, '1996/12/12','usu0','usu');

############################## ACTUALIZA-EMPLEADO  ##############################################
DROP PROCEDURE IF exists SP_ACTUALIZAEMPLEADO;
DELIMITER $$
CREATE PROCEDURE SP_ACTUALIZAEMPLEADO( 
	id char(6),
    dni char(8),
  nom varchar(45) ,
  apellidoP varchar(45) ,
  apellidoM varchar(45) ,
  fechaNacimiento date ,
  telefono char(11) ,
  seguroSocial char(11) ,
  idCargo char(6) ,
  idestado int(11) ,
  foto mediumblob,
  fechaIngreso date ,
  usuario varchar(45) ,
  password varchar(45))
begin
UPDATE `empleado`
SET
`nDNI` = dni,
`nombre` = nom,
`apellidoP` = apellidoP,
`apellidoM` = apellidoM,
`fechaNacimiento` = fechaNacimiento,
`telefono` = telefono,
`seguroSocial` = seguroSocial,
`idCargo` =  idCargo,
`idestado` = idestado,
`foto` = foto,
`fechaIngreso` = fechaIngreso,
`usuario` = usuario,
`password` = password  
WHERE `idEmpleado` = id;
END$$ 
DELIMITER ;
############################## ELIMINA-EMPLEADO  ##############################################
DROP PROCEDURE IF exists SP_ELIMINAEMPLEADO;
DELIMITER $$
CREATE PROCEDURE SP_ELIMINAEMPLEADO( 
	id char(6)) 
begin
DELETE FROM `empleado`
WHERE `idEmpleado`=id;
END$$ 
DELIMITER ;
############################## LISTA-EMPLEADO  ##############################################
DROP PROCEDURE IF exists SP_LISTAEMPLEADO;
DELIMITER $$
CREATE PROCEDURE SP_LISTAEMPLEADO()	
begin
SELECT e.idEmpleado,e.nDNI,concat(e.nombre,' ',e.apellidoP,' ',e.apellidoM) as 'Empleado',e.fechaNacimiento,e.telefono,e.seguroSocial,
c.descripcion,et.descripcion,e.foto,e.fechaIngreso,e.usuario,e.password FROM `empleado` e ,`cargo` c, `estado` et where e.idCargo=c.idCargo and e.idestado=et.idestado;
END$$ 
DELIMITER ;
CALL SP_LISTAEMPLEADO();
############################## LISTA-EMPLEADO POR CODIGO  ##############################################
DROP PROCEDURE IF exists SP_LISTAEMPLEADOxCODIGO;
DELIMITER $$
CREATE PROCEDURE SP_LISTAEMPLEADOxCODIGO(id char(6))	
begin
SELECT idEmpleado,nDNI,nombre,apellidoP,apellidoM,fechaNacimiento,telefono,seguroSocial,idCargo,idestado,fechaIngreso,usuario,password FROM `empleado` where `idEmpleado`=id;
END$$ 
DELIMITER ;

