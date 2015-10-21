-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema db_wimk
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_wimk
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_wimk` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `db_wimk` ;

-- -----------------------------------------------------
-- Table `db_wimk`.`parent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_wimk`.`parent` (
  `idParent` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `name` VARCHAR(45) NULL COMMENT '',
  `login` VARCHAR(45) NOT NULL COMMENT '',
  `password` VARCHAR(45) NOT NULL COMMENT '',
  `removingFrequency` INT NULL DEFAULT 7 COMMENT '',
  PRIMARY KEY (`idParent`)  COMMENT '',
  UNIQUE INDEX `login_UNIQUE` (`login` ASC)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_wimk`.`child`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_wimk`.`child` (
  `idChild` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `idParent` INT NOT NULL COMMENT '',
  `login` VARCHAR(45) NOT NULL COMMENT '',
  `password` VARCHAR(45) NOT NULL COMMENT '',
  `sendingFrequency` INT NULL COMMENT '',
  PRIMARY KEY (`idChild`)  COMMENT '',
  UNIQUE INDEX `login_UNIQUE` (`login` ASC)  COMMENT '')
  INDEX `idParent_idx` (`idParent` ASC)  COMMENT '',
  CONSTRAINT `idParent`
    FOREIGN KEY (`idParent`)
    REFERENCES `db_wimk`.`parent` (`idParent`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_wimk`.`point`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_wimk`.`point` (
  `idpoint` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `idChild` INT NOT NULL COMMENT '',
  `x` DOUBLE NULL COMMENT '',
  `y` DOUBLE NULL COMMENT '',
  `time` DATETIME NULL COMMENT '',
  `batteryStatus` INT NULL COMMENT '',
  PRIMARY KEY (`idpoint`)  COMMENT '',
  INDEX `idChild_idx` (`idChild` ASC)  COMMENT '',
  CONSTRAINT `idChildPoint`
    FOREIGN KEY (`idChild`)
    REFERENCES `db_wimk`.`child` (`idChild`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_wimk`.`area`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_wimk`.`area` (
  `idArea` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `idChild` INT NOT NULL COMMENT '',
  `x` DOUBLE NULL COMMENT '',
  `y` DOUBLE NULL COMMENT '',
  `radius` INT NULL COMMENT '',
  `allowed` TINYINT(1) NULL COMMENT '',
  PRIMARY KEY (`idArea`)  COMMENT '',
  INDEX `idChild_idx` (`idChild` ASC)  COMMENT '',
  CONSTRAINT `idChildArea`
    FOREIGN KEY (`idChild`)
    REFERENCES `db_wimk`.`child` (`idChild`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
