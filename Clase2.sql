CREATE DATABASE EJEMPLO_2_db CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;

use EJEMPLO_2_db;

CREATE TABLE EMPLEADOS(
	emp_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    sexo VARCHAR(100),
    fecha_Nacimiento DATE NOT NULL
);

INSERT INTO EMPLEADOS(nombre, apellido, sexo, fecha_Nacimiento)
VALUES
	('Sahin','Tenar','M', DATE '1984-01-09'),
	('cali', 'Devi', 'M', DATE '1989-03-26'),
  	('Joel','Roota','F', DATE '1948-11-29'),
	('Moe', 'Alister', 'F', DATE '1959-04-16');

CREATE TABLE EMPLEADOS2(
	emp_id2 INT AUTO_INCREMENT PRIMARY KEY,
    nombre2 VARCHAR(100),
    apellido2 VARCHAR(100),
    sexo2 VARCHAR(100),
    fecha_Nacimiento2 DATE NOT NULL
);
    
INSERT INTO EMPLEADOS2(nombre2, apellido2, sexo2, fecha_Nacimiento2)
VALUES
	('A','Tenar','M', DATE '1984-01-09'),
	('B', 'Devi', 'M', DATE '1989-03-26'),
  	('C','Roota','F', DATE '1948-11-29'),
	('D', 'Alister', 'F', DATE '1959-04-16');
    
CREATE VIEW Alias as
	select nombre,nombre2,sexo
    from EMPLEADOS,EMPLEADOS2
    where sexo = 'M';
;

select * from alias;
drop view alias;
    SELECT * FROM EMPLEADOS;