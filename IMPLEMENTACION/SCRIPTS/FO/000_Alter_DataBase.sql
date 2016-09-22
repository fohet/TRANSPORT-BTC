-- MySQL Workbench Synchronization
-- Generated: 2016-09-22 12:26
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: fabian

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE TABLE IF NOT EXISTS `qx2`.`personal` (
  `idpersonal` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(200) NULL DEFAULT NULL,
  `direccion` VARCHAR(200) NULL DEFAULT NULL,
  `numeracion_direccion` VARCHAR(100) NULL DEFAULT NULL,
  `idcodigo_postal` VARCHAR(100) NULL DEFAULT NULL,
  `idlocalidad` VARCHAR(100) NULL DEFAULT NULL,
  `idprovincia` VARCHAR(100) NULL DEFAULT NULL,
  `dni` VARCHAR(100) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `telefono_movil` VARCHAR(100) NULL DEFAULT NULL,
  `telefono_personal` VARCHAR(100) NULL DEFAULT NULL,
  `nro_cobertura` VARCHAR(100) NULL DEFAULT NULL,
  `empresa_cobertura` VARCHAR(100) NULL DEFAULT NULL,
  `vto_cobertura` DATE NULL DEFAULT NULL,
  `activo` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idpersonal`),
  INDEX `personal_codigo_postal_idx` (`idcodigo_postal` ASC),
  INDEX `personal_localidad_idx` (`idlocalidad` ASC),
  INDEX `personal_provincia_idx` (`idprovincia` ASC),
  CONSTRAINT `personal_codigo_postal0`
    FOREIGN KEY (`idcodigo_postal`)
    REFERENCES `qx2`.`codigo_postal` (`idcodigo_postal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `personal_localidad0`
    FOREIGN KEY (`idlocalidad`)
    REFERENCES `qx2`.`localidad` (`idlocalidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `personal_provincia0`
    FOREIGN KEY (`idprovincia`)
    REFERENCES `qx2`.`provincia` (`idprovincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
