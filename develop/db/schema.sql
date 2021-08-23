/*Creating the database schema */
DROP DATABASE IF EXISTS employee_db;
CREATE DATABASE employee_db;

USE employee_db;

/*Creating table for departments*/
CREATE TABLE `departments` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`)
  
  );


/*Creating table for roles*/
CREATE TABLE `roles` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `salary` DECIMAL UNSIGNED NULL,
  `department_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
  
  );
ALTER TABLE `roles` 
ADD INDEX `dept_id_idx` (`department_id` ASC) VISIBLE;
ALTER TABLE `roles` 
ADD CONSTRAINT `dept_id`
  FOREIGN KEY (`department_id`)
  REFERENCES `departments` (`id`)
  ON DELETE CASCADE
  ON UPDATE NO ACTION;

    
/*Creating table for employees*/
/*manager_id is null if the employee has no manager */
CREATE TABLE `employee` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(255) NOT NULL,
  `last_name` VARCHAR(255) NOT NULL,
  `role_id` INT UNSIGNED NULL,
  `manager_id` INT UNSIGNED NULL,
  PRIMARY KEY (`id`)
  );

ALTER TABLE `employee` 
ADD INDEX `role_id_idx` (`role_id` ASC) VISIBLE,
ADD INDEX `manager_id_idx` (`manager_id` ASC) VISIBLE;

ALTER TABLE `employee` 
ADD CONSTRAINT `role_id`
  FOREIGN KEY (`role_id`)
  REFERENCES `roles` (`id`)
  ON DELETE CASCADE
  ON UPDATE NO ACTION,
  
ADD CONSTRAINT `manager_id`
  FOREIGN KEY (`manager_id`)
  REFERENCES `employee` (`id`)
  ON DELETE CASCADE
  ON UPDATE NO ACTION;

