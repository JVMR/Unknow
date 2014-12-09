DELIMITER $$
CREATE PROCEDURE `validarUsuario`(lu varchar(45),pss varchar(45))
BEGIN
 select * from usuario where logusu = lu and pasusu =pss;
END$$
DELIMITER ;
