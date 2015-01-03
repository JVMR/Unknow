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
  idLES CHAR(6) ,
  idestado INT ,
  idAsalariado CHAR(6))
begin
declare id int;
declare num int;
select idRes into num from res  order by idRes desc limit 1;
select num + 1 into id;
INSERT INTO `res`(`idRES`,`referencia`,`descriptor`,`objetoConsulta`,`analisis`,`fechaGenerado`,`idLES`,`idestado`,`idAsalariado`)
VALUES
(id,referencia,descriptor,objetoConsulta,analisis,fechaGenerado,idLES,idestado,idAsalariado);
END$$ 
DELIMITER ;

#call SP_REGISTRARES('Juan','Juan','Objeto','Analisis','2015-01-03','LE0001',1,'EM0001');