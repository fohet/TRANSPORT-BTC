-- MySQL Workbench Synchronization
-- Generated: 2016-08-31 14:03
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: fabian

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

ALTER TABLE `qx2`.`incidencias_x_grupo` 
DROP FOREIGN KEY `ncidencias_x_grupo_incidencias_mobile`,
DROP FOREIGN KEY `ncidencias_x_grupo_grupo_incidencias`;

ALTER TABLE `qx2`.`parametros_procesos` 
ADD COLUMN `descripcion` VARCHAR(200) NULL DEFAULT NULL AFTER `valor`;

ALTER TABLE `qx2`.`representante` 
ADD COLUMN `propio` TINYINT(1) NULL DEFAULT 0 AFTER `local`;

ALTER TABLE `qx2`.`status` 
CHANGE COLUMN `codigo_status` `codigo_status` VARCHAR(100) NULL DEFAULT NULL ;

ALTER TABLE `qx2`.`expreso` 
ADD COLUMN `propio` TINYINT(1) NULL DEFAULT 0 AFTER `longitud`;

ALTER TABLE `qx2`.`repositorio_pedido` 
CHANGE COLUMN `idpedido` `idpedido` INT(11) NOT NULL ,
ADD INDEX `repositorio_pedido_pedido_idx` (`idpedido` ASC);

CREATE TABLE IF NOT EXISTS `qx2`.`incidencia` (
  `idincidencia` INT(11) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(100) NOT NULL,
  `entidad` VARCHAR(100) NULL DEFAULT NULL,
  `genera_evento` TINYINT(1) NULL DEFAULT 0,
  `activo` TINYINT(1) NULL DEFAULT 1,
  PRIMARY KEY (`idincidencia`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

ALTER TABLE `qx2`.`incidencias_x_grupo` 
DROP COLUMN `idincidencias_mobile`,
ADD COLUMN `idincidencia` INT(11) NOT NULL AFTER `idgrupo_incidencias`,
DROP INDEX `ncidencias_x_grupo_incidencias_mobile_idx` ,
ADD INDEX `ncidencias_x_grupo_incidencias_mobile_idx` (`idincidencia` ASC);

CREATE TABLE IF NOT EXISTS `qx2`.`visitas_x_sucursal` (
  `idvisitas_x_sucursal` INT(11) NOT NULL AUTO_INCREMENT,
  `idsucursal` INT(11) NOT NULL,
  `idincidencia` INT(11) NOT NULL,
  `fecha_incidencia` DATETIME NOT NULL,
  `imagen_incidencia` VARCHAR(200) NULL DEFAULT NULL,
  `observaciones_incidencia` VARCHAR(2000) NULL DEFAULT NULL,
  PRIMARY KEY (`idvisitas_x_sucursal`),
  INDEX `visitas_x_sucursal_sucursal_idx` (`idsucursal` ASC),
  INDEX `visitas_x_sucursal_incidencias_idx` (`idincidencia` ASC),
  CONSTRAINT `visitas_x_sucursal_sucursal`
    FOREIGN KEY (`idsucursal`)
    REFERENCES `qx2`.`sucursal` (`idsucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `visitas_x_sucursal_incidencias`
    FOREIGN KEY (`idincidencia`)
    REFERENCES `qx2`.`incidencia` (`idincidencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `qx2`.`incidencia_pedido` (
  `idincidencia_pedido` INT(11) NOT NULL AUTO_INCREMENT,
  `idpedido` INT(11) NOT NULL,
  `idincidencia` INT(11) NOT NULL,
  `fecha_incidencia` DATETIME NULL DEFAULT NULL,
  `imagen_incidencia` VARCHAR(200) NULL DEFAULT NULL,
  `observaciones_incidencia` VARCHAR(2000) NULL DEFAULT NULL,
  PRIMARY KEY (`idincidencia_pedido`),
  INDEX `incidencia_pedido_pedido_idx` (`idpedido` ASC),
  INDEX `incidencia_pedido_incidencias_idx` (`idincidencia` ASC),
  CONSTRAINT `incidencia_pedido_pedido`
    FOREIGN KEY (`idpedido`)
    REFERENCES `qx2`.`pedido` (`idpedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `incidencia_pedido_incidencia`
    FOREIGN KEY (`idincidencia`)
    REFERENCES `qx2`.`incidencia` (`idincidencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

ALTER TABLE `qx2`.`repositorio_pedido` 
ADD CONSTRAINT `repositorio_pedido_pedido`
  FOREIGN KEY (`idpedido`)
  REFERENCES `qx2`.`pedido` (`idpedido`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `qx2`.`incidencias_x_grupo` 
ADD CONSTRAINT `incidencias_x_grupo_incidencia`
  FOREIGN KEY (`idincidencia`)
  REFERENCES `qx2`.`incidencia` (`idincidencia`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `incidencias_x_grupo_grupo_incidencias`
  FOREIGN KEY (`idgrupo_incidencias`)
  REFERENCES `qx2`.`grupo_incidencias` (`idgrupo_incidencias`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;