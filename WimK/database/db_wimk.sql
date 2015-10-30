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
  `idParent` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `login` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `removingFrequency` INT NULL DEFAULT 7,
  PRIMARY KEY (`idParent`) ,
  UNIQUE INDEX `login_UNIQUE` (`login` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_wimk`.`child`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_wimk`.`child` (
  `idChild` INT NOT NULL AUTO_INCREMENT,
  `idParent` INT NOT NULL,
  `login` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `sendingFrequency` INT NULL,
  PRIMARY KEY (`idChild`) ,
  UNIQUE INDEX `login_UNIQUE` (`login` ASC) )
  INDEX `idParent_idx` (`idParent` ASC) ,
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
  `idPoint` INT NOT NULL AUTO_INCREMENT,
  `idChild` INT NOT NULL,
  `x` DOUBLE NULL,
  `y` DOUBLE NULL,
  `time` DATETIME NULL ,
  `batteryStatus` INT NULL,
  PRIMARY KEY (`idpoint`) ,
  INDEX `idChild_idx` (`idChild` ASC) ,
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
  `idArea` INT NOT NULL AUTO_INCREMENT,
  `idChild` INT NOT NULL,
  `x` DOUBLE NULL,
  `y` DOUBLE NULL,
  `radius` INT NULL,
  `allowed` TINYINT(1) NULL,
  PRIMARY KEY (`idArea`) ,
  INDEX `idChild_idx` (`idChild` ASC) ,
  CONSTRAINT `idChildArea`
    FOREIGN KEY (`idChild`)
    REFERENCES `db_wimk`.`child` (`idChild`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

alter table child drop column password;
alter table point add pointType varchar(20);
alter table child drop index login;
alter table area add column name varchar(45);