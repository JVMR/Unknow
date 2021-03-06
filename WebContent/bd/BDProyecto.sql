-- MySQL Script generated by MySQL Workbench

-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema proyectoLPII
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema proyectoLPII
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `proyectoLPII` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `proyectoLPII` ;

-- -----------------------------------------------------
-- Table `proyectoLPII`.`Rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoLPII`.`Rol` (
  `idRol` CHAR(5) NOT NULL,
  `gestionarLES` TINYINT(1) NULL,
  `gestionarRES` TINYINT(1) NULL,
  `verificarLES` TINYINT(1) NULL,
  `verificarRES` TINYINT(1) NULL,
  `mantenimiento` TINYINT(1) NULL,
  `reporte` TINYINT(1) NULL,
  PRIMARY KEY (`idRol`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoLPII`.`Cargo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoLPII`.`Cargo` (
  `idCargo` CHAR(6) NOT NULL,
  `descripcion` VARCHAR(45) NULL,
  `sueldo` DOUBLE NULL,
  `idRol` CHAR(5) NOT NULL,
  PRIMARY KEY (`idCargo`),
  INDEX `fk_Cargo_Rol1_idx` (`idRol` ASC),
  CONSTRAINT `fk_Cargo_Rol1`
    FOREIGN KEY (`idRol`)
    REFERENCES `proyectoLPII`.`Rol` (`idRol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoLPII`.`estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoLPII`.`estado` (
  `idestado` INT NOT NULL,
  `descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`idestado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoLPII`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoLPII`.`Empleado` (
  `idEmpleado` CHAR(6) NOT NULL,
  `nDNI` CHAR(8) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellidoP` VARCHAR(45) NOT NULL,
  `apellidoM` VARCHAR(45) NOT NULL,
  `fechaNacimiento` DATE NOT NULL,
  `telefono` CHAR(11) NOT NULL,
  `seguroSocial` CHAR(11) NOT NULL,
  `idCargo` CHAR(6) NOT NULL,
  `idestado` INT NOT NULL,
  `foto` MEDIUMBLOB NULL,
  `fechaIngreso` DATE NULL,
  `usuario` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`idEmpleado`),
  INDEX `fk_Asalariado_Cargo_idx` (`idCargo` ASC),
  INDEX `fk_Asalariado_estado1_idx` (`idestado` ASC),
  CONSTRAINT `fk_Asalariado_Cargo`
    FOREIGN KEY (`idCargo`)
    REFERENCES `proyectoLPII`.`Cargo` (`idCargo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Asalariado_estado1`
    FOREIGN KEY (`idestado`)
    REFERENCES `proyectoLPII`.`estado` (`idestado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoLPII`.`UnidadOrganica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoLPII`.`UnidadOrganica` (
  `idUnidadOrganica` CHAR(5) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `idCargo` CHAR(6) NOT NULL,
  `nombreUnidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUnidadOrganica`),
  INDEX `fk_UnidadOrganica_Cargo1_idx` (`idCargo` ASC),
  CONSTRAINT `fk_UnidadOrganica_Cargo1`
    FOREIGN KEY (`idCargo`)
    REFERENCES `proyectoLPII`.`Cargo` (`idCargo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoLPII`.`Equipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoLPII`.`Equipo` (
  `idEquipo` CHAR(6) NOT NULL,
  `nombreEquipo` VARCHAR(45) NOT NULL,
  `idUnidadOrganica` CHAR(5) NOT NULL,
  `descripcionEquipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEquipo`),
  INDEX `fk_Equipo_UnidadOrganica1_idx` (`idUnidadOrganica` ASC),
  CONSTRAINT `fk_Equipo_UnidadOrganica1`
    FOREIGN KEY (`idUnidadOrganica`)
    REFERENCES `proyectoLPII`.`UnidadOrganica` (`idUnidadOrganica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoLPII`.`Cargo_Equipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoLPII`.`Cargo_Equipo` (
  `idCargo` CHAR(6) NOT NULL,
  `idEquipo` CHAR(6) NOT NULL,
  `esJefe` TINYINT(1) NOT NULL,
  PRIMARY KEY (`idCargo`, `idEquipo`),
  INDEX `fk_Cargo_has_Equipo_Equipo1_idx` (`idEquipo` ASC),
  INDEX `fk_Cargo_has_Equipo_Cargo1_idx` (`idCargo` ASC),
  CONSTRAINT `fk_Cargo_has_Equipo_Cargo1`
    FOREIGN KEY (`idCargo`)
    REFERENCES `proyectoLPII`.`Cargo` (`idCargo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cargo_has_Equipo_Equipo1`
    FOREIGN KEY (`idEquipo`)
    REFERENCES `proyectoLPII`.`Equipo` (`idEquipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoLPII`.`LES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoLPII`.`LES` (
  `idLES` CHAR(6) NOT NULL,
  `diagnostico` VARCHAR(45) NULL,
  `fechaInicioDes` DATE NULL,
  `fechaFinDes` DATE NULL,
  `cantDias` INT NULL,
  `documento` LONGBLOB NULL,
  `motivoLicencia` VARCHAR(45) NULL,
  `descripcionMotivo` VARCHAR(45) NULL,
  `fechaHora` DATETIME NULL,
  `idEmpleado` CHAR(6) NOT NULL,
  `idestado` INT NOT NULL,
  PRIMARY KEY (`idLES`),
  INDEX `fk_LES_Asalariado1_idx` (`idEmpleado` ASC),
  INDEX `fk_LES_estado1_idx` (`idestado` ASC),
  CONSTRAINT `fk_LES_Asalariado1`
    FOREIGN KEY (`idEmpleado`)
    REFERENCES `proyectoLPII`.`Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_LES_estado1`
    FOREIGN KEY (`idestado`)
    REFERENCES `proyectoLPII`.`estado` (`idestado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoLPII`.`RES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoLPII`.`RES` (
  `idRES` INT NOT NULL,
  `referencia` VARCHAR(200) NULL,
  `descriptor` VARCHAR(200) NULL,
  `objetoConsulta` VARCHAR(500) NULL,
  `analisis` VARCHAR(500) NULL,
  `fechaGenerado` DATETIME NULL,
  `idLES` CHAR(6) NOT NULL,
  `idestado` INT NOT NULL,
  `idAsalariado` CHAR(6) NOT NULL,
  PRIMARY KEY (`idRES`),
  INDEX `fk_RES_LES1_idx` (`idLES` ASC),
  INDEX `fk_RES_estado1_idx` (`idestado` ASC),
  INDEX `fk_RES_Asalariado1_idx` (`idAsalariado` ASC),
  CONSTRAINT `fk_RES_LES1`
    FOREIGN KEY (`idLES`)
    REFERENCES `proyectoLPII`.`LES` (`idLES`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RES_estado1`
    FOREIGN KEY (`idestado`)
    REFERENCES `proyectoLPII`.`estado` (`idestado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RES_Asalariado1`
    FOREIGN KEY (`idAsalariado`)
    REFERENCES `proyectoLPII`.`Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoLPII`.`Asa_RES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoLPII`.`Asa_RES` (
  `idAsalariado` CHAR(6) NOT NULL,
  `idRES` INT NOT NULL,
  `fechaAprob` DATETIME NULL,
  `firma` BLOB NULL,
  PRIMARY KEY (`idAsalariado`, `idRES`),
  INDEX `fk_Asalariado_has_RES_RES1_idx` (`idRES` ASC),
  INDEX `fk_Asalariado_has_RES_Asalariado1_idx` (`idAsalariado` ASC),
  CONSTRAINT `fk_Asalariado_has_RES_Asalariado1`
    FOREIGN KEY (`idAsalariado`)
    REFERENCES `proyectoLPII`.`Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Asalariado_has_RES_RES1`
    FOREIGN KEY (`idRES`)
    REFERENCES `proyectoLPII`.`RES` (`idRES`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
