DROP TABLE assignments;
DROP TABLE animals;
DROP TABLE employees;
DROP TABLE enclosures;

CREATE TABLE enclosures (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    capacity INT,
    closed_for_maintenance BOOLEAN
);

CREATE TABLE animals(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    type VARCHAR(255),
    age INT,
    enclosure_id INT REFERENCES enclosures(id)
);

CREATE TABLE employees(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    employee_number INT
);

CREATE TABLE assignments (
    id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES employees(id),
    enclosure_id INT REFERENCES enclosures(id),
    day VARCHAR(255)

);

INSERT INTO enclosures (name, capacity, closed_for_maintenance) VALUES ('A', 150, FALSE);
INSERT INTO enclosures (name, capacity, closed_for_maintenance) VALUES ('B', 200, FALSE);
INSERT INTO enclosures (name, capacity, closed_for_maintenance) VALUES ('C', 250, TRUE);
INSERT INTO enclosures (name, capacity, closed_for_maintenance) VALUES ('D', 300, FALSE);
INSERT INTO enclosures (name, capacity, closed_for_maintenance) VALUES ('E', 350, TRUE);

INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Woof', 'Snake', 5, 2);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Betsy', 'Hippo', 25, 3);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Kozmo', 'Monkey', 6, 1);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Bob', 'Donkey', 25, 1);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Razor', 'Lion', 25, 4);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Mitsy', 'Giraffe', 7, 5);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Rory', 'Tiger', 7, 3);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Snape', 'Snake', 7, 2);

INSERT INTO employees (name, employee_number) VALUES ('Mani', 1234);
INSERT INTO employees (name, employee_number) VALUES ('Aisha', 1842);
INSERT INTO employees (name, employee_number) VALUES ('Jish', 5434);
INSERT INTO employees (name, employee_number) VALUES ('Bob', 2454);
INSERT INTO employees (name, employee_number) VALUES ('Richard', 6434);
INSERT INTO employees (name, employee_number) VALUES ('Anna', 6236);

INSERT INTO assignments (employee_id, enclosure_id, day) VALUES (1, 5, 'Monday');
INSERT INTO assignments (employee_id, enclosure_id, day) VALUES (2, 2, 'Tuesday');
INSERT INTO assignments (employee_id, enclosure_id, day) VALUES (3, 1, 'Wednesday');
INSERT INTO assignments (employee_id, enclosure_id, day) VALUES (4, 1, 'Wednesday');
INSERT INTO assignments (employee_id, enclosure_id, day) VALUES (4, 3, 'Thursday');
INSERT INTO assignments (employee_id, enclosure_id, day) VALUES (5, 4, 'Friday');

SELECT name FROM animals WHERE enclosure_id = 1;

SELECT name 
FROM employees
INNER JOIN assignments
ON assignments.employee_id = employees.id
WHERE enclosure_id = 1;    


-- EXTENSION!

SELECT employees.name
FROM employees
INNER JOIN assignments
ON employees.id = assignments.employee_id
INNER JOIN enclosures
ON assignments.enclosure_id = enclosures.id
WHERE closed_for_maintenance = TRUE;

SELECT enclosures.name
FROM enclosures
INNER JOIN animals
ON enclosures.id = animals.enclosure_id
WHERE animals.age = (select max(animals.age) from animals)
ORDER BY animals.name ASC;



