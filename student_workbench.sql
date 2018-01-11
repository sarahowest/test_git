-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema student_workbench
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema student_workbench
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `student_workbench` DEFAULT CHARACTER SET utf8 ;
USE `student_workbench` ;

-- -----------------------------------------------------
-- Table `student_workbench`.`trajectories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_workbench`.`trajectories` (
  `ID` INT NOT NULL,
  `trajectory` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `student_workbench`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_workbench`.`students` (
  `student_number` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `Last_name` VARCHAR(45) NULL,
  `birthdate` DATE NULL,
  `sex` ENUM('male', 'female') NULL,
  `Trajectory_id` INT NULL,
  PRIMARY KEY (`student_number`),
  INDEX `trajectory_ID_idx` (`Trajectory_id` ASC),
  CONSTRAINT `trajectory_ID`
    FOREIGN KEY (`Trajectory_id`)
    REFERENCES `student_workbench`.`trajectories` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `student_workbench`.`Courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_workbench`.`Courses` (
  `ID` INT NOT NULL,
  `Course` VARCHAR(45) NULL,
  `Credits` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `student_workbench`.`Course_of_student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_workbench`.`Course_of_student` (
  `ID` INT NOT NULL,
  `Student_ID` INT NULL,
  `course_ID` INT NULL,
  PRIMARY KEY (`ID`),
  INDEX `student_number_idx` (`Student_ID` ASC),
  INDEX `coursd_ID_idx` (`course_ID` ASC),
  CONSTRAINT `student_number`
    FOREIGN KEY (`Student_ID`)
    REFERENCES `student_workbench`.`students` (`student_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `course_ID`
    FOREIGN KEY (`course_ID`)
    REFERENCES `student_workbench`.`Courses` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
