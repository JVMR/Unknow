SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `Proyecto` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `Proyecto` ;

-- -----------------------------------------------------
-- Table `Proyecto`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Proyecto`.`usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `logUsu` VARCHAR(45) NULL,
  `pasUsu` VARCHAR(45) NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idusuario`))
ENGINE = InnoDB;

INSERT INTO usuario
VALUES (
null, 'micky', '1234', 'Micky Llamoca');

INSERT INTO usuario
VALUES (
null, 'javier', '1234', 'Javier Huaman');

INSERT INTO usuario
VALUES (
null, 'romario', '1234', 'Romario Vargas');

INSERT INTO usuario
VALUES (
null, 'juan', '1234', 'Juan Antón');


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
