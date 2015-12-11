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
CREATE TABLE IF NOT EXISTS `db_wimk`.`Parent` (  `idParent` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `login` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `removingFrequency` INT NULL DEFAULT 7,
  PRIMARY KEY (`idParent`) ,
  UNIQUE INDEX `login_UNIQUE` (`login` ASC) )ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_wimk`.`child`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_wimk`.`Child` (  `idChild` INT NOT NULL AUTO_INCREMENT,  `idParent` INT NOT NULL REFERENCES `db_wimk`.`Parent` (`idParent`),  `login` VARCHAR(45) NOT NULL,  `sendingFrequency` INT NULL,  PRIMARY KEY (`idChild`) ,  UNIQUE INDEX `login_UNIQUE` (`login` ASC) )ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_wimk`.`point`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_wimk`.`Point` (  `idPoint` INT NOT NULL AUTO_INCREMENT,  `idChild` INT NOT NULL REFERENCES `db_wimk`.`child` (`idChild`),  `x` DOUBLE NULL,  `y` DOUBLE NULL,  `time` DATETIME NULL,  `batteryStatus` INT NULL,  PRIMARY KEY (`idPoint`) ,  INDEX `idChild_idx` (`idChild` ASC) )ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_wimk`.`area`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_wimk`.`Area` (  `idArea` INT NOT NULL AUTO_INCREMENT,  `idChild` INT NOT NULL REFERENCES `db_wimk`.`child` (`idChild`),  `x` DOUBLE NULL,  `y` DOUBLE NULL,  `radius` INT NULL,  `allowed` TINYINT(1) NULL,  PRIMARY KEY (`idArea`) ,  INDEX `idChild_idx` (`idChild` ASC) )ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

alter table Point add pointType varchar(20);
alter table Area modify radius double;
alter table Area add column name varchar(20);


create table PointType(idType INT, name varchar(10), primary key(idType));
alter table PointType add unique index (name);
insert into PointType values(1, 'common');
insert into PointType values(2, 'sos');

alter table Point drop column pointType;
alter table Point add idType INT;
alter table Point add constraint fk_point_type foreign key (idType) references PointType(idType);
/*change password type because start use SHA-512*/
alter table Parent modify password varchar(128);

/*Changes related with activated account*/
alter table Parent add hash varchar(10);
alter table Parent add activated TINYINT(1);

/*Changes related with activated account*/
alter table Child add avatar varchar(100);

alter table Child add authorizatedNumber INT;
alter table Child add googleToken varchar(512);

/*New point type*/
Insert into PointType values(3, 'on_demand');
Insert into PointType values(4, 'storaged');

/*Checked connect of child*/
Alter table Child add checked TINYINT(1);