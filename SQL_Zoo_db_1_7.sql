USE db_zoo1

/* All information from the habitat table.*/

SELECT * FROM tbl_habitat;

/* Retrieve all names from the species_name column that have a species_order value of 3.*/

SELECT * FROM tbl_species WHERE species_order = 3;

/* Retrieve only the nutrition_type from the nutrition table that have a nutrition_cost of 600.00 or less.*/

SELECT * FROM tbl_nutrition WHERE nutrition_cost <= 600;

/* Retrieve all species_names with the nutrition_id between 2202 and 2206 from the nutrition table.*/

SELECT * FROM tbl_species WHERE species_nutrition BETWEEN 2202 AND 2206;

/* Retrieve all names within the species_name column using the "Species Name" from the species table and their corresponding nutrition_type under the "Nutrition Type" from the nutrition table.*/

SELECT tbl_species.species_name AS 'SPECIES NAME', tbl_nutrition.nutrition_id AS 'NUTRITION TYPE' FROM tbl_species
JOIN tbl_nutrition ON tbl_species.species_nutrition = tbl_nutrition.nutrition_id;

/* From the specialist table, retrieve the first and last name and contact number of those that provide care for the penguins from the species table.*/

SELECT tbl_specialist.specialist_fname, tbl_specialist.specialist_lname, tbl_specialist.specialist_contact 
FROM tbl_specialist
INNER JOIN tbl_care ON care_specialist = specialist_id
INNER JOIN tbl_species ON species_care = care_id
WHERE tbl_species.species_name ='penguin';

/* Create a database with two tables. Assign a foreign key constraint on one table that shares related data with the primary key on the second table. Finally, create a statement that queries data from both tables. */
CREATE DATABASE car_drivers;

CREATE TABLE tbl_driver (
	driver_id int primary key NOT NULL identity (1,1),
	driver_fname varchar(50) NOT NULL,
	driver_lname varchar(50) NOT NULL
);

INSERT INTO tbl_driver (driver_fname, driver_lname)
	VALUES
	('Elizabeth', 'Windsor'),
	('Ye-Long', 'Ma'),
	('Jeffrey', 'Bozos'),
	('Joe', 'Byron'),
	('Ned', 'Flanders')
;

SELECT * FROM tbl_driver;

CREATE TABLE tbl_car (
	car_id int primary key NOT NULL identity (1,1),
	car_make varchar(50) NOT NULL,
	car_model varchar(50) NOT NULL,
	car_driver_id int NOT NULL constraint fk_driver_id foreign key references tbl_driver(driver_id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO tbl_car (car_make, car_model, car_driver_id)
	VALUES
	('Bugatti', 'Chiron', 1),
	('Tesla', 'Model S', 2),
	('Hyundai', 'N Vision 74', 3),
	('Toyota', 'Yaris GR', 4),
	('Hyundai', 'Grandeur EV', 5)
;

SELECT * FROM tbl_car;

SELECT tbl_driver.driver_fname, tbl_driver.driver_lname, tbl_car.car_make, tbl_car.car_model
FROM tbl_driver
INNER JOIN tbl_car ON car_driver_id = driver_id;