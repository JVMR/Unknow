USE proyectolpii;

############################## LISTA-LES  ##############################################
DROP PROCEDURE IF exists SP_LISTALES;
DELIMITER $$
CREATE PROCEDURE SP_LISTALES()	
begin
SELECT l.idLes, l.diagnostico, l.fechaInicioDes, l.fechafindes, l.motivolicencia, l.descripcionmotivo,l.fechaHora, concat(e.nombre,' ',e.apellidoP,' ',e.apellidoM) as 'Empleado',et.descripcion FROM `les` l ,`empleado` e, `estado` et where l.idEmpleado = e.idEmpleado and l.idestado=et.idestado;
END$$ 
DELIMITER ;
#CALL SP_LISTALES();

############################### REGISTA RES ##########################################

DROP PROCEDURE IF exists SP_REGISTRARES;
DELIMITER $$
CREATE PROCEDURE SP_REGISTRARES( 
  referencia VARCHAR(200) ,
  descriptor VARCHAR(200) ,
  objetoConsulta VARCHAR(500) ,
  analisis VARCHAR(500) ,
  fechaGenerado DATETIME ,
  idLES CHAR(6),
  idAsalariado char(6)
)
begin
declare id int;
declare num int;
declare idEst int;
select idRes into num from res  order by idRes desc limit 1;
if (select count(*) from res where idRes=num)=0 then
	select 1 into id;
else select num + 1 into id;
end if;

select idestado into idEst from estado where descripcion='Generado';
INSERT INTO `res`(`idRES`,`referencia`,`descriptor`,`objetoConsulta`,`analisis`,`fechaGenerado`,`idLES`,`idestado`,`idAsalariado`)
VALUES
(id,referencia,descriptor,objetoConsulta,analisis,fechaGenerado,idLES,idEst,idAsalariado);
END$$ 
DELIMITER ;

#call SP_REGISTRARES('Juan','Juan','Objeto','Analisis','2015-01-03','LES001','EM0002');

#################################### RES POR CODIGO #####################################
 
DROP PROCEDURE IF exists SP_LISTARESxCODIGO;
DELIMITER $$
CREATE PROCEDURE SP_LISTARESxCODIGO(id int)	
begin
SELECT idRes,referencia,descriptor,objetoConsulta,analisis,fechaGenerado,idLES,idAsalariado FROM `res` where `idRes`=id;
END$$ 
DELIMITER ;

# call SP_LISTARESxCODIGO('2')

############################## LES POR CODIGO ################################################## 

DROP PROCEDURE IF exists SP_LESxCODIGO;
DELIMITER $$
CREATE PROCEDURE SP_LESxCODIGO(id char(6))	
begin
SELECT l.idLes, l.diagnostico, l.fechaInicioDes, l.fechafindes, l.motivolicencia, l.descripcionmotivo,l.fechaHora,l.idEmpleado, concat(e.nombre,' ',e.apellidoP,' ',e.apellidoM),l.pdf,l.cantDias,l.corregir as 'Empleado'FROM `les` l join `empleado` e on l.idEmpleado = e.idEmpleado  where l.idLes=id;
END$$ 
DELIMITER ;
#CALL SP_LESxCODIGO('LE0001');

################################ LISTAR_RES POR RANGO DE FECHAS ######################################

DROP PROCEDURE IF exists SP_LISTARESxFECHAS;
DELIMITER $$
CREATE PROCEDURE SP_LISTARESxFECHAS(fecha1 datetime, fecha2 datetime, idEst int)
begin
SELECT r.idRes,r.referencia,r.descriptor,r.objetoConsulta,r.analisis,r.fechaGenerado,r.idLES,e.descripcion,r.idAsalariado FROM `res` r join `estado` e on r.idestado=e.idestado where r.idestado=idEst and  r.fechaGenerado between fecha1 and fecha2;
END$$ 
DELIMITER ;
#CALL SP_LISTARESxFECHAS('2015-01-03','2015-01-03','3');

################################### ACTUALIZAR ESTADO LES #############################################

DROP PROCEDURE IF exists SP_ACTUALIZARLES;
DELIMITER $$
CREATE PROCEDURE SP_ACTUALIZARLES(idL CHAR(6),IdEst int)
begin
UPDATE `les`
SET
`idestado` = IdEst
where 
`idLES` = idL;
END$$ 
DELIMITER ;

#call SP_ACTUALIZARLES('LE0001','8')

################################### ACTUALIZAR ERROR LES #############################################

DROP PROCEDURE IF exists SP_ERRORLES;
DELIMITER $$
CREATE PROCEDURE SP_ERRORLES(idL CHAR(6),corr varchar(100))
begin
UPDATE `les`
SET
`corregir` = corr
where 
`idLES` = idL;
END$$ 
DELIMITER ;

#call SP_ACTUALIZARLES('LE0001','8')

#################################### ACTUALIZAR RES ####################################################### 

DROP PROCEDURE IF exists SP_ACTUALIZARRES;
DELIMITER $$
CREATE PROCEDURE SP_ACTUALIZARRES(
idR int,
objetoConsulta varchar(500),
analisis varchar(500)
)
begin
declare idEst int;
select idestado into idEst from `estado` where descripcion='Actualizado';
UPDATE `res`
SET
`objetoConsulta` = objetoConsulta,
`analisis` = analisis,
`idestado` = IdEst
where `idRES` = idR;
END$$ 
DELIMITER ;

call SP_ACTUALIZARRES(13,'Mickaso','Llamcon')