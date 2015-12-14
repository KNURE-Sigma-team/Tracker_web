-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema db_wimk
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_wimk
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_wimk` DEFAULT CHARACTER SET utf8 ;
USE `db_wimk` ;

-- -----------------------------------------------------
-- Table `db_wimk`.`parent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_wimk`.`Parent` (
  `idParent` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `name` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `login` VARCHAR(45) NOT NULL COMMENT '',
  `password` VARCHAR(128) NULL DEFAULT NULL COMMENT '',
  `removingFrequency` INT(11) NULL DEFAULT '7' COMMENT '',
  `hash` VARCHAR(20) NULL DEFAULT NULL COMMENT '',
  `activated` TINYINT(1) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`idParent`)  COMMENT '',
  UNIQUE INDEX `login_UNIQUE` (`login` ASC)  COMMENT '')
ENGINE = InnoDB
AUTO_INCREMENT = 28
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `db_wimk`.`child`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_wimk`.`Child` (
  `idChild` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `idParent` INT(11) NOT NULL COMMENT '',
  `login` VARCHAR(45) NOT NULL COMMENT '',
  `sendingFrequency` INT(11) NULL DEFAULT NULL COMMENT '',
  `avatar` VARCHAR(100) NULL DEFAULT NULL COMMENT '',
  `authorizatedNumber` INT(11) NULL DEFAULT NULL COMMENT '',
  `googleToken` VARCHAR(512) NULL DEFAULT NULL COMMENT '',
  `checked` TINYINT(1) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`idChild`)  COMMENT '',
  INDEX `idParent_idx` (`idParent` ASC)  COMMENT '',
  CONSTRAINT `idParent`
    FOREIGN KEY (`idParent`)
    REFERENCES `db_wimk`.`parent` (`idParent`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 35
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `db_wimk`.`area`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_wimk`.`Area` (
  `idArea` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `idChild` INT(11) NOT NULL COMMENT '',
  `x` DOUBLE NULL DEFAULT NULL COMMENT '',
  `y` DOUBLE NULL DEFAULT NULL COMMENT '',
  `radius` DOUBLE NULL DEFAULT NULL COMMENT '',
  `allowed` TINYINT(1) NULL DEFAULT NULL COMMENT '',
  `name` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`idArea`)  COMMENT '',
  INDEX `idChild_idx` (`idChild` ASC)  COMMENT '',
  CONSTRAINT `idChildArea`
    FOREIGN KEY (`idChild`)
    REFERENCES `db_wimk`.`child` (`idChild`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 22
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `db_wimk`.`pointtype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_wimk`.`PointType` (
  `idType` INT(11) NOT NULL DEFAULT '0' COMMENT '',
  `name` VARCHAR(10) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`idType`)  COMMENT '',
  UNIQUE INDEX `name` (`name` ASC)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `db_wimk`.`point`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_wimk`.`Point` (
  `idpoint` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `idChild` INT(11) NOT NULL COMMENT '',
  `x` DOUBLE NULL DEFAULT NULL COMMENT '',
  `y` DOUBLE NULL DEFAULT NULL COMMENT '',
  `time` DATETIME NULL DEFAULT NULL COMMENT '',
  `batteryStatus` INT(11) NULL DEFAULT NULL COMMENT '',
  `idType` INT(11) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`idpoint`)  COMMENT '',
  INDEX `idChild_idx` (`idChild` ASC)  COMMENT '',
  INDEX `fk_point_type` (`idType` ASC)  COMMENT '',
  CONSTRAINT `fk_point_type`
    FOREIGN KEY (`idType`)
    REFERENCES `db_wimk`.`pointtype` (`idType`),
  CONSTRAINT `idChildPoint`
    FOREIGN KEY (`idChild`)
    REFERENCES `db_wimk`.`child` (`idChild`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

insert into PointType values(1, 'common');
insert into PointType values(2, 'sos');
Insert into PointType values(3, 'on_demand');
Insert into PointType values(4, 'storaged');