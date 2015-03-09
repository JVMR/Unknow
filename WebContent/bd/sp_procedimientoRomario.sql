USE proyectolpii;

############################################# REGISTRAR UNIDAD ORGANICA ########################################################

DROP PROCEDURE IF EXISTS SP_REGISTRA_UNIDADORGANICA;
DELIMITER $$
CREATE PROCEDURE SP_REGISTRA_UNIDADORGANICA(
descripcionUnidad varchar(45), 
nombreUnidad varchar(45),
nombreCargo varchar(45), 
sueldo double,
gestionarLES01 tinyint(1),
gestionarRES01 tinyint(1), 
verificarLES01 tinyint(1) ,
verificarRES01 tinyint(1) ,
visarRES01 tinyint(1) ,
listarLES01 tinyint(1) ,
listarRES01 tinyint(1) ,
mantenimiento01 tinyint(1) ,
reporte01 tinyint(1)
)
BEGIN
	declare idRo char (5);
    declare num03 int unsigned default 0;
    
	declare idCar char (6);
    declare num01 int unsigned default 0;
    
    declare idUni char (5);
    declare num02 int unsigned default 0;
    
    ###### VERIFICAR SI EXISTE ROL
    
	if exists(
	select * from rol where gestionarLES=gestionarLES01 and gestionarRES=gestionarRES01 and verificarLES=verificarLES01 and 
	verificarRES=verificarRES01 and visarRES=visarRES01 and listarLES=listarLES01 and listarRES=listarRES01 and mantenimiento=mantenimiento01 and reporte=reporte01) then

	select idRol into idRo from rol where gestionarLES=gestionarLES01 and gestionarRES=gestionarRES01 and verificarLES=verificarLES01 and 
	verificarRES=verificarRES01 and visarRES=visarRES01 and listarLES=listarLES01 and listarRES=listarRES01 and mantenimiento=mantenimiento01 and reporte=reporte01;

	else  
	 
		  ##### REGISTRO ROL
		
		SELECT idRol into idRo FROM rol order by idRol desc limit 1;
		select cast((substring(idRo,3,3)) as unsigned) + 1 into num03;
		
		if num03<10 then
			select concat('RL00',num03) into idRo;
		elseif num03<100 then
			select concat('RL0',num03) into idRo;
		elseif num03<1000 then
			select concat('RL',num03) into idRo;
		end if;
		
		INSERT INTO `Rol`(`idRol`,`gestionarLES`,`gestionarRES`,`verificarLES`,`verificarRES`,`visarRES`,`listarLES`,`listarRES`,`mantenimiento`,`reporte`) 
							 VALUES (idRo,gestionarLES01,gestionarRES01,verificarLES01,verificarRES01,visarRES01,listarLES01,listarRES01,mantenimiento01,reporte01);
     
	end if;
    
    ##### REGISTRO CARGO DE DIRECTOR
    
    SELECT idCargo into idCar FROM CARGO order by idCargo desc limit 1;
    select cast((substring(idCar,2,5)) as unsigned) + 1 into num01;
    
    if num01<10 then
		select concat('C0000',num01) into idCar;
	elseif num01<100 then
		select concat('C000',num01) into idCar;
	elseif num01<1000 then
		select concat('C00',num01) into idCar;
	elseif num01<10000 then
		select concat('C0',num01) into idCar;
	elseif num01<100000 then
		select concat('C',num01) into idCar;
    end if;
    
    INSERT INTO `Cargo`(`idCargo`,`descripcion`,`sueldo`,`idRol`) 
    VALUES (idCar, nombreCargo, sueldo,idRo);
    
    ## REGISTRO UNIDAD ORGANICA##
    
    SELECT idUnidadOrganica into idUni FROM unidadorganica order by idUnidadOrganica desc limit 1;
    select cast((substring(idUni,2,4)) as unsigned) + 1 into num02;
    
    if num02<10 then
		select concat('U000',num02) into idUni;
	elseif num02<100 then
		select concat('U00',num02) into idUni;
	elseif num02<1000 then
		select concat('U0',num02) into idUni;
	elseif num02<10000 then
		select concat('U',num02) into idUni;
    end if;
    
    INSERT INTO `UnidadOrganica`(`idUnidadOrganica`,`descripcion`,`idCargo`,`nombreUnidad`) 
    VALUES (idUni,descripcionUnidad,idCar,nombreUnidad);
    
END$$ 
DELIMITER ;
# CALL SP_REGISTRA_UNIDADORGANICA('descripcion de mi oficina','Oficina de Romario','Director Romario',5000,'RL001')


############################################# MODIFICAR UNIDAD ORGANICA ########################################################
DROP PROCEDURE IF EXISTS SP_MODIFICA_UNIDADORGANICA;
DELIMITER $$
CREATE PROCEDURE SP_MODIFICA_UNIDADORGANICA(
idUnidad char(5),
descripcionUnidad varchar(45), 
nombreUni varchar(45),
idCar char(6),
nombreCargo varchar(45), 
sueldo double ,
gestionarLES01 tinyint(1),
gestionarRES01 tinyint(1), 
verificarLES01 tinyint(1) ,
verificarRES01 tinyint(1) ,
visarRES01 tinyint(1) ,
listarLES01 tinyint(1) ,
listarRES01 tinyint(1) ,
mantenimiento01 tinyint(1) ,
reporte01 tinyint(1)
)
BEGIN

declare idRo char (5);
declare num03 int unsigned default 0;

	if exists(
	select * from rol where gestionarLES=gestionarLES01 and gestionarRES=gestionarRES01 and verificarLES=verificarLES01 and 
	verificarRES=verificarRES01 and visarRES=visarRES01 and listarLES=listarLES01 and listarRES=listarRES01 and mantenimiento=mantenimiento01 and reporte=reporte01) then

	select idRol into idRo from rol where gestionarLES=gestionarLES01 and gestionarRES=gestionarRES01 and verificarLES=verificarLES01 and 
	verificarRES=verificarRES01 and visarRES=visarRES01 and listarLES=listarLES01 and listarRES=listarRES01 and mantenimiento=mantenimiento01 and reporte=reporte01;

	else  
	 
		  ##### REGISTRO ROL
		
		SELECT idRol into idRo FROM rol order by idRol desc limit 1;
		select cast((substring(idRo,3,3)) as unsigned) + 1 into num03;
		
		if num03<10 then
			select concat('RL00',num03) into idRo;
		elseif num03<100 then
			select concat('RL0',num03) into idRo;
		elseif num03<1000 then
			select concat('RL',num03) into idRo;
		end if;
		
		INSERT INTO `Rol`(`idRol`,`gestionarLES`,`gestionarRES`,`verificarLES`,`verificarRES`,`visarRES`,`listarLES`,`listarRES`,`mantenimiento`,`reporte`) 
							 VALUES (idRo,gestionarLES01,gestionarRES01,verificarLES01,verificarRES01,visarRES01,listarLES01,listarRES01,mantenimiento01,reporte01);
     
	end if;


UPDATE cargo
SET
descripcion = nombreCargo,
sueldo = sueldo,
idRol = idRo
WHERE idCargo= idCar;

UPDATE unidadorganica
SET
descripcion = descripcionUnidad,
nombreUnidad = nombreUni
WHERE idUnidadOrganica = idUnidad;
END$$ 
DELIMITER ;


############################################# ELIMINAR UNIDAD ORGANICA ########################################################
DROP FUNCTION IF EXISTS F_ELIMINAUNIDAORGANICA;
DELIMITER $$
CREATE FUNCTION F_ELIMINAUNIDAORGANICA(
idUnidad char(5),
idCar char(6)
)
RETURNS text(200)
BEGIN

	declare mensaje text(200);

if exists(select * from empleado where idCargo=idCar ) or  exists(select * from equipo where idUnidadOrganica=idUnidad) then

	set mensaje='No se puede eliminar/ Esta unidad tiene empleados o equipos';
else
		
	DELETE FROM unidadorganica
	WHERE idUnidadOrganica=idUnidad;

	DELETE FROM cargo
	WHERE idCargo=idCar;
		set mensaje = 'Se elimino correctamente';

end if;
	return mensaje;
END$$ 
DELIMITER ;

############################## LISTA-EMPLEADO  ##############################################
DROP PROCEDURE IF exists SP_LISTA_UNIDADORGANICA;
DELIMITER $$
CREATE PROCEDURE SP_LISTA_UNIDADORGANICA()	
begin
SELECT u.idUnidadOrganica 'idUnidadOrganica',u.nombreUnidad 'nombreUnidad',u.descripcion 'descripcion',u.idCargo 'idCargo' , c.descripcion 'descripcion',
r.idRol 'idRol',count(e.idEquipo) 'num' FROM unidadorganica u left join equipo e
on u.idUnidadOrganica=e.idUnidadOrganica inner join cargo c on u.idCargo=c.idCargo inner join rol r on c.idRol=r.idRol
group by u.idUnidadOrganica,u.nombreUnidad,u.descripcion,u.idCargo , c.descripcion,r.idRol;
END$$ 
DELIMITER ;
#CALL SP_LISTA_UNIDADORGANICA();

############################## LISTA-EMPLEADO POR CODIGO  ##############################################
DROP PROCEDURE IF exists SP_LISTA_UNIDADORGANICAxCODIGO;
DELIMITER $$
CREATE PROCEDURE SP_LISTA_UNIDADORGANICAxCODIGO(id char(5))	
begin
SELECT u.idUnidadOrganica,u.nombreUnidad,u.descripcion,c.idCargo,c.descripcion,
c.sueldo, r.gestionarLES,r.gestionarRES,r.verificarLES,r.verificarRES,r.visarRES,r.listarLES,r.listarRES,r.mantenimiento,
r.reporte
 FROM unidadorganica u inner join cargo c
on u.idCargo=c.idCargo inner join rol r 
on c.idRol=r.idRol
where u.idUnidadOrganica=id;
END$$ 
DELIMITER ;

#call SP_LISTA_UNIDADORGANICAxCODIGO('U0020');

################################################################################################################################
################################################################################################################################
############################################## REGISTRA EQUIPOS ################################################################

DROP FUNCTION IF EXISTS F_REGISTRA_EQUIPO;
DELIMITER $$
CREATE FUNCTION F_REGISTRA_EQUIPO(
nomEqui varchar(45),
idUnidad char(5),
descEquipo varchar(45)
)
RETURNS char(6)
BEGIN

	declare idEqui char(6);
    declare num01 int unsigned default 0;
    
	SELECT idEquipo into idEqui FROM equipo order by idEquipo desc limit 1;
    select cast((substring(idEqui,3,4)) as unsigned) + 1 into num01;
    
    if num01<10 then
		select concat('EQ000',num01) into idEqui;
	elseif num01<100 then
		select concat('EQ00',num01) into idEqui;
	elseif num01<1000 then
		select concat('EQ0',num01) into idEqui;
	elseif num01<10000 then
		select concat('EQ',num01) into idEqui;
    end if;
    
    INSERT INTO equipo VALUES (idEqui, nomEqui, idUnidad,descEquipo);
    
    return idEqui;
    
END$$ 
DELIMITER ;

#select F_REGISTRA_EQUIPO('equipo prueba','U0018','para ultima unidad')

######################### REGISTRA CARGOS DE EQUIPOS CON ROLES ########
DROP FUNCTION IF EXISTS F_REGISTRA_CARGO_ROL_DE_EQUIPO;
DELIMITER $$
CREATE FUNCTION F_REGISTRA_CARGO_ROL_DE_EQUIPO(
nombreCargo varchar(45),
suel double,
gestionarLES01 tinyint(1),
gestionarRES01 tinyint(1), 
verificarLES01 tinyint(1) ,
verificarRES01 tinyint(1) ,
visarRES01 tinyint(1) ,
listarLES01 tinyint(1) ,
listarRES01 tinyint(1) ,
mantenimiento01 tinyint(1) ,
reporte01 tinyint(1)
)
RETURNS char(6)
BEGIN
	declare idRo char (5);
    declare num03 int unsigned default 0;
    
	declare idCar char (6);
    declare num01 int unsigned default 0;
    
    ###### VERIFICAR SI EXISTE ROL
    
	if exists(
	select * from rol where gestionarLES=gestionarLES01 and gestionarRES=gestionarRES01 and verificarLES=verificarLES01 and 
	verificarRES=verificarRES01 and visarRES=visarRES01 and listarLES=listarLES01 and listarRES=listarRES01 and mantenimiento=mantenimiento01 and reporte=reporte01) then

	select idRol into idRo from rol where gestionarLES=gestionarLES01 and gestionarRES=gestionarRES01 and verificarLES=verificarLES01 and 
	verificarRES=verificarRES01 and visarRES=visarRES01 and listarLES=listarLES01 and listarRES=listarRES01 and mantenimiento=mantenimiento01 and reporte=reporte01;

	else  
		  ##### REGISTRO ROL
		SELECT idRol into idRo FROM rol order by idRol desc limit 1;
		select cast((substring(idRo,3,3)) as unsigned) + 1 into num03;
		
		if num03<10 then
			select concat('RL00',num03) into idRo;
		elseif num03<100 then
			select concat('RL0',num03) into idRo;
		elseif num03<1000 then
			select concat('RL',num03) into idRo;
		end if;
		
		INSERT INTO `Rol`(`idRol`,`gestionarLES`,`gestionarRES`,`verificarLES`,`verificarRES`,`visarRES`,`listarLES`,`listarRES`,`mantenimiento`,`reporte`) 
							 VALUES (idRo,gestionarLES01,gestionarRES01,verificarLES01,verificarRES01,visarRES01,listarLES01,listarRES01,mantenimiento01,reporte01);
	end if;
    
    ##### REGISTRO CARGO DE EQUIPOS
    SELECT idCargo into idCar FROM CARGO order by idCargo desc limit 1;
    select cast((substring(idCar,2,5)) as unsigned) + 1 into num01;
    
    if num01<10 then
		select concat('C0000',num01) into idCar;
	elseif num01<100 then
		select concat('C000',num01) into idCar;
	elseif num01<1000 then
		select concat('C00',num01) into idCar;
	elseif num01<10000 then
		select concat('C0',num01) into idCar;
	elseif num01<100000 then
		select concat('C',num01) into idCar;
    end if;
    
    INSERT INTO `Cargo`(`idCargo`,`descripcion`,`sueldo`,`idRol`) 
    VALUES (idCar, nombreCargo, suel,idRo);
    
    RETURN idCar;
END$$ 
DELIMITER ;

#SELECT F_REGISTRA_CARGO_ROL_DE_EQUIPO('CARGO DE EQUIPO DE PRUEBA',1000,1,1,1,1,1,1)

####################### REGISTRO DE CARGO_EQUIPO #########################################

DROP PROCEDURE IF exists SP_REGISTRA_CARGO_EQUIPO;
DELIMITER $$
CREATE PROCEDURE SP_REGISTRA_CARGO_EQUIPO(
idCar char(6),
idEqui char(6)
)	
begin

	insert into cargo_equipo values(idCar,idEqui,0);
	
END$$ 
DELIMITER ;

#call SP_CARGO_EQUIPO('C00028','EQ0007');

############################################## LISTADO DE EQUIPOS ###########################################################
DROP PROCEDURE IF exists SP_LISTA_EQUIPOS;
DELIMITER $$
CREATE PROCEDURE SP_LISTA_EQUIPOS()	
begin

select e.idEquipo 'idEquipo',e.nombreEquipo 'nombreEquipo',e.descripcionEquipo 'descripcionEquipo',
e.idUnidadOrganica 'idUnidadOrganica', count(c.idCargo) 'cantidadCargo'
from equipo e inner join cargo_equipo c on e.idEquipo=c.idEquipo
group by idEquipo,nombreEquipo,descripcionEquipo,idUnidadOrganica;

END$$ 
DELIMITER ;

####################################### LISTADO DE EQUIPOS POR CODIGO ################################################################## 

DROP PROCEDURE IF exists SP_LISTA_EQUIPOSxCODIGO;
DELIMITER $$
CREATE PROCEDURE SP_LISTA_EQUIPOSxCODIGO(
id varchar(6)
)
begin

select idEquipo ,nombreEquipo,descripcionEquipo, idUnidadOrganica 
from equipo where idEquipo=id;


END$$ 
DELIMITER ;

#call SP_LISTA_EQUIPOSxCODIGO('EQ0001')

####################################### LISTADO DE CARGO POR EQUIPOS################################################################## 
DROP PROCEDURE IF exists SP_LISTA_CARGOxEQUIPOS;
DELIMITER $$
CREATE PROCEDURE SP_LISTA_CARGOxEQUIPOS(
idEqu varchar(6)
)	
begin

select d.idCargo 'idCargo', c.descripcion 'nomCargo',c.sueldo 'sueldo',r.gestionarLES 'gestionarLES',
r.gestionarRES 'gestionarRES', r.verificarLES 'verificarLES',r.verificarRES 'verificarRES',
r.visarRES 'visarRES',r.listarLES 'listarLES',r.listarRES 'listarRES',
r.mantenimiento 'mantenimiento',r.reporte 'reporte' from cargo_equipo d inner join cargo c
on d.idCargo=c.idCargo inner join rol r 
on c.idRol=r.idRol
where d.idEquipo=idEqu;

END$$ 
DELIMITER ;

######################################## ELIMINA CARGO ############################################

DROP PROCEDURE IF exists SP_ELIMINA_CARGO;
DELIMITER $$
CREATE PROCEDURE SP_ELIMINA_CARGO(
idCar varchar(6)
)	
begin

DELETE FROM cargo_equipo
WHERE idCargo=idCar;

DELETE FROM cargo
WHERE idCargo=idCar;


END$$ 
DELIMITER ;



######################################## ACTUALIZA EQUIPO ############################################

DROP PROCEDURE IF exists SP_ACTUALIZA_EQUIPO;
DELIMITER $$
CREATE PROCEDURE SP_ACTUALIZA_EQUIPO(
idEq varchar(6),
nomEq varchar(45),
descr varchar(45)
)	
begin

UPDATE equipo
SET
nombreEquipo=nomEq,
descripcionEquipo=descr
WHERE idEquipo=idEq;

END$$ 
DELIMITER ;



#################################### VERIFICA ELIMINA EQUIPO #########################################################
DROP PROCEDURE IF EXISTS SP_VERIFICA_ELIMINA_EQUIPO;
DELIMITER $$
CREATE PROCEDURE SP_VERIFICA_ELIMINA_EQUIPO(
idEq char(6)
)
BEGIN

    
if exists(select * from empleado where idcargo in (select idcargo from cargo_equipo where idequipo=idEq))  then

	select 'NO' ;
else
		select idcargo from cargo_equipo where idequipo=idEq;

end if;
END$$ 
DELIMITER ;

#CALL SP_VERIFICA_ELIMINA_EQUIPO('EQ0004')


DROP PROCEDURE IF exists SP_ELIMINA_EQUIPO;
DELIMITER $$
CREATE PROCEDURE SP_ELIMINA_EQUIPO(
idEq varchar(6)
)	
begin
	DELETE FROM equipo
	WHERE idEquipo=idEq;
    
END$$ 
DELIMITER ;





#call SP_ELIMINA_EQUIPO('EQ0013');

###################################################### LISTA DE RES #################################################################

DROP PROCEDURE IF EXISTS SP_LISTA_VISAR_RES;
DELIMITER $$
CREATE PROCEDURE SP_LISTA_VISAR_RES(id int)
begin
	declare num01 int unsigned default 0;
    
		IF (select count(idRes) from asa_res where idRes=id)=1 then
			SELECT a.idRES,concat(e.nombre,' ',e.apellidoP,' ',e.apellidoM) as nombre,a.fechaAprob,es.descripcion FROM asa_res a inner join empleado e
			on a.idAsalariado=e.idEmpleado inner join res r on r.idRES=a.idRES inner join estado es on r.idestado=es.idestado
            where a.idRES=id;
		else
			select idAsalariado from asa_res where idRES=id;
        end if;
END$$
DELIMITER ;

#call SP_LISTA_VISAR_RES('1');

####################################################### VISAR RES POR CODIGO ###############################################################

DROP PROCEDURE IF EXISTS SP_RESxCODIGO;
DELIMITER $$
CREATE PROCEDURE SP_RESxCODIGO(codRES int)
BEGIN 
    SELECT idRES,referencia,descriptor,objetoConsulta,analisis,fechaGenerado,idLES,idAsalariado,pdf FROM Res where idRES=codRES;
END$$ 
DELIMITER ;

#call SP_RESxCODIGO(2);


####################################################  ACTUALIZA ESTADO DE RES EN EL VISADO ##############################################################


DROP PROCEDURE IF EXISTS  SP_ACTUALIZA_ESTADO_VISADO_RES;
DELIMITER $$
CREATE PROCEDURE SP_ACTUALIZA_ESTADO_VISADO_RES(codRES int , idAprobador varchar(6),codEstado int, pdf02 longblob,fecha varchar(19)) 
begin     
	if codEstado=9 then
    
		UPDATE res 
		set 
		idestado = codEstado,
		pdf=pdf02
		where idRES=codRES;
		
		insert into asa_res(`idAsalariado`,`idRES`,`fechaAprob`,`pdf`) values(idAprobador,codRES,fecha,pdf02);
 	
    else
		UPDATE res 
		set 
		idestado = codEstado
		where idRES=codRES;
    end if;

end$$
DELIMITER ;

############################### VERFICAR PERSONA EN MYSQL ####################################

DROP FUNCTION IF EXISTS FN_VERIFICAR_PERSONA
DELIMITER $$
CREATE FUNCTION FN_VERIFICAR_PERSONA(idUsuario char(6),dni char(8)
)
RETURNS char(2)
BEGIN
	
    declare respuesta char(2);
    
	IF EXISTS(SELECT * FROM empleado where idEmpleado=idUsuario and nDNI=dni) then
		set respuesta='SI';
    else
		set respuesta='NO';
    end if;
	return respuesta;
END$$
DELIMITER ;

#select FN_VERIFICAR_PERSONA('EM0001','12345678')

#############################################################################################
