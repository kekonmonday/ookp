-- MySQL Script generated by MySQL Workbench
-- 10/21/18 19:38:35
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema exercise4
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `exercise4` ;

-- -----------------------------------------------------
-- Schema exercise4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `exercise4` DEFAULT CHARACTER SET utf8 ;
USE `exercise4` ;

-- -----------------------------------------------------
-- Table `exercise4`.`country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exercise4`.`country` ;

CREATE TABLE IF NOT EXISTS `exercise4`.`country` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercise4`.`city`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exercise4`.`city` ;

CREATE TABLE IF NOT EXISTS `exercise4`.`city` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `country_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_city_country`
    FOREIGN KEY (`country_id`)
    REFERENCES `exercise4`.`country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_city_country_idx` ON `exercise4`.`city` (`country_id` ASC);


-- -----------------------------------------------------
-- Table `exercise4`.`indicator`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exercise4`.`indicator` ;

CREATE TABLE IF NOT EXISTS `exercise4`.`indicator` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercise4`.`date`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exercise4`.`date` ;

CREATE TABLE IF NOT EXISTS `exercise4`.`date` (
  `id` INT NOT NULL,
  `date` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercise4`.`value`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exercise4`.`value` ;

CREATE TABLE IF NOT EXISTS `exercise4`.`value` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `value` DOUBLE NULL,
  `city_id` INT NOT NULL,
  `indicator_id` INT NOT NULL,
  `date_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_value_city1`
    FOREIGN KEY (`city_id`)
    REFERENCES `exercise4`.`city` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_value_indicator1`
    FOREIGN KEY (`indicator_id`)
    REFERENCES `exercise4`.`indicator` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_value_date1`
    FOREIGN KEY (`date_id`)
    REFERENCES `exercise4`.`date` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_value_city1_idx` ON `exercise4`.`value` (`city_id` ASC);

CREATE INDEX `fk_value_indicator1_idx` ON `exercise4`.`value` (`indicator_id` ASC);

CREATE INDEX `fk_value_date1_idx` ON `exercise4`.`value` (`date_id` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
