USE proyectolpii;
##############################VALIDA_USUARIO#################################################
DROP PROCEDURE IF EXISTS SP_VALIDAUSUARIO;
DELIMITER $$
CREATE PROCEDURE SP_VALIDAUSUARIO(usu varchar(45),pass varchar(45))
BEGIN
	SELECT e.idEmpleado,e.nDNI,e.nombre,concat(e.apellidoP,' ',e.apellidoM) as 'Empleado',e.fechaNacimiento,e.telefono,e.seguroSocial,
	c.descripcion,e.foto,e.fechaIngreso,e.usuario,e.password FROM `empleado` e ,`cargo` c where e.idCargo=c.idCargo and e.usuario=usu and e.password=pass;
END$$ 
DELIMITER ;
############################## LISTAROL #################################################
DROP PROCEDURE IF EXISTS SP_LISTAROL;
DELIMITER $$
CREATE PROCEDURE SP_LISTAROL(idCar varchar(30))
BEGIN
	declare rol char(6);    
    declare gLES varchar(15);
    declare gRES varchar(15);
    declare eLES varchar(15);
    declare eRES varchar(15);
    declare lLES varchar(15);
    declare lRES varchar(15);
    declare mant varchar(15);
    declare rprt varchar(15);
    declare vsrRES varchar(15);
    select idRol into rol from cargo where descripcion=idCar;
    #GESTIONAR LES
    if(select gestionarLES from rol where idRol=rol)=1 then
		select 'display:block;' into gLES;
	else
		select 'display:none;' into gLES;
    END IF; 
    #GESTIONAR RES
    if(select gestionarRES from rol where idRol=rol)=1 then
		select 'display:block;' into gRES;
	else
		select 'display:none;' into gRES;
    END IF; 
    #VERIFICAR LES
    if(select verificarLES from rol where idRol=rol)=1 then
		select 'display:block;' into eLES;
	else
		select 'display:none;' into eLES;
    END IF; 
    #VERIFICAR RES
    if(select verificarRES from rol where idRol=rol)=1 then
		select 'display:block;' into eRES;
	else
		select 'display:none;' into eRES;
    END IF; 
    #VISAR RES
    if(select visarRES from rol where idRol=rol)=1 then
		select 'display:block;' into vsrRES;
	else
		select 'display:none;' into vsrRES;
    END IF; 
    #LISTAR LES
    if(select listarRES from rol where idRol=rol)=1 then
		select 'display:block;' into lLES;
	else
		select 'display:none;' into lLES;
    END IF;
    #LISTAR RES
    if(select listarRES from rol where idRol=rol)=1 then
		select 'display:block;' into lRES;
	else
		select 'display:none;' into lRES;
    END IF;
    #MANTENIMIENTO
    if(select mantenimiento from rol where idRol=rol)=1 then
		select 'display:block;' into mant;
	else
		select 'display:none;' into mant;
    END IF; 
    #REPORTE
    if(select reporte from rol where idRol=rol)=1 then
		select 'display:block;' into rprt;
	else
		select 'display:none;' into rprt;
    END IF; 
    # select gLES,gRES,eLES,eRES,lLES,lRES,mant,rprt,vsrRES from rol where idRol=rol;
    select gLES,gRES,eLES,eRES,vsrRES,lLES,lRES,mant,rprt from rol where idRol=rol;
END$$ 
DELIMITER ;
#call SP_LISTAROL('Encargado Eq Remuneración');
############################### EXISTE_LES ###################################################
DROP PROCEDURE IF EXISTS SP_EXISTE_LES;
DELIMITER $$
CREATE PROCEDURE SP_EXISTE_LES(id char(6))
BEGIN
declare estado char(13);
declare div_clase  varchar(50);
declare icono  varchar(50);
declare flag char(20);
if exists(select * from les where idEmpleado=id and idestado=3 ) then
     select 'display:none;' into flag;
     select e.descripcion into estado from les l,estado e where l.idestado=e.idestado and l.idEmpleado=id and e.idestado=3 ;
	 select 'errorHandler alert alert-danger no-display' into div_clase;
     select 'fa fa-times-circle-o' into icono;
     select div_clase,icono,'No puedes  generar LES  : ',estado,flag;
end if;
if exists(select * from les where idEmpleado=id and idestado=4 ) then
     select 'display:none;' into flag;
     select e.descripcion into estado from les l,estado e where l.idestado=e.idestado and l.idEmpleado=id and e.idestado=4 ;
	 select 'errorHandler alert alert-danger no-display' into div_clase;
     select 'fa fa-times-circle-o' into icono;
     select div_clase,icono,'Todavia no puedes generar una LES  : ',estado,flag;
end if;
if exists(select * from les where idEmpleado=id and idestado=5 ) then
     select 'display:none;' into flag;
     select e.descripcion into estado from les l,estado e where l.idestado=e.idestado and l.idEmpleado=id and e.idestado=5 ;
	 select 'successHandler alert alert-warning no-display' into div_clase;
     select 'fa fa-warning' into icono;
     select div_clase,icono,'Debes de modificar LES  : ',estado,flag;
end if;
if exists(select * from les where idEmpleado=id and idestado=7 ) then
     select 'display:block;' into flag;
     select e.descripcion into estado from les l,estado e where l.idestado=e.idestado and l.idEmpleado=id and e.idestado=7 ;	
     select 'errorHandler alert alert-danger no-display' into div_clase;
     select 'fa fa-times-circle-o' into icono;
     select div_clase,icono,'Puedes generar una LES ',estado,flag;
end if;
if exists(select * from les where idEmpleado=id and idestado=8 ) then
     select 'display:block;' into flag;
     select e.descripcion into estado from les l,estado e where l.idestado=e.idestado and l.idEmpleado=id and e.idestado=8 ;
	 select 'successHandler alert alert-success no-display' into div_clase;
     select 'fa fa-check' into icono;   
     select div_clase,icono,'Puedes generar una LES ',estado,flag;
end if;
if not exists(select * from les where idEmpleado=id ) then
	 select 'display:block;' into flag;
     select ' ' into estado;
     select 'successHandler alert alert-success no-display' into div_clase;
     select 'fa fa-check' into icono; 
     select div_clase,icono,'Puedes generar una LES ',estado,flag;
end if;
END$$ 
DELIMITER ;
#call SP_EXISTE_LES('EM0001');
############################### REGISTRAR-LES ###################################################
DROP PROCEDURE IF EXISTS SP_GENERAR_LES;
DELIMITER $$
CREATE PROCEDURE SP_GENERAR_LES(
	diagnostico VARCHAR(200) ,
  fechaInicioDes DATE ,
  fechaFinDes DATE ,
  cantidad int,
  documento BLOB ,
  motivoLicencia VARCHAR(45) ,
   desc_motivoLicencia VARCHAR(45) ,
  fechaHora datetime,
  idEmpleado CHAR(6))
begin
declare id char(6);
declare num char(4);
declare idEst int;
select idLES into id from les  order by idLES desc limit 1;
select cast((substring(id,4,3)) as unsigned) + 1 into num;

if (select count(*) from les where idLES=id)=0  then 
    select 'LES001' into id;	
elseif num < 10 
then 
	select concat('LES00',num) into id;	
elseif num <100 then
	select concat('LES0',num) into id;	
else 
 select concat('LES',num) into id;		
end if;
select idestado into idEst from estado where descripcion='Generado';
INSERT INTO `les`(`idLES`,`diagnostico`,`fechaInicioDes`,`fechaFinDes`,`cantDias`,`documento`,`motivoLicencia`,`descripcionMotivo`,`fechaHora`,`idEmpleado`,`idestado`)
VALUES (id,diagnostico,fechaInicioDes,fechaFinDes,cantidad,documento,motivoLicencia,desc_motivoLicencia,fechaHora,idEmpleado,idEst);
    
END$$ 
DELIMITER ;



############################### LISTA-CARGOXNOMBRE ###################################################
DROP PROCEDURE IF EXISTS SP_LISTACARGOXNOMBRE;
DELIMITER $$
CREATE PROCEDURE SP_LISTACARGOXNOMBRE(nombre varchar(45))
BEGIN
	declare id char(6);
    declare equipo varchar(20);
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
#CALL SP_LISTACARGOXNOMBRE('Director de Ejecutivo');
#CALL SP_LISTACARGOXNOMBRE('Jefe ECA');
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
#CALL SP_REGISTRAEMPLEADO('70236561','Javier','Javier', 'Javier', '1996/12/12', '123456789', '12345678912', 'C0000', 1, null, '1996/12/12','usu0','usu');

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
 #foto mediumblob,
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
#`foto` = foto,
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
############################## LISTA-LESXCODIGO  ##############################################
DROP PROCEDURE IF exists SP_LISTALESXCODIGO;
DELIMITER $$
CREATE PROCEDURE SP_LISTALESXCODIGO(id char(6))	
begin
SELECT l.idLes, l.diagnostico, l.fechaInicioDes, l.fechafindes, l.motivolicencia, l.descripcionmotivo,l.fechaHora, 
concat(e.nombre,' ',e.apellidoP,' ',e.apellidoM) as 'Empleado',et.descripcion 
FROM `les` l ,`empleado` e, `estado` et where l.idEmpleado = e.idEmpleado and l.idestado=et.idestado and e.idEmpleado=id;
END$$ 
DELIMITER ;
#call SP_LISTALESXCODIGO('EM0001');
