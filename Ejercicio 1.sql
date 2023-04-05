#Crear tabla
CREATE DATABASE Biblioteca CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;

#Eliminar DB
drop database biblioteca;

use biblioteca;

#Crear tablas
CREATE TABLE Usuario (
	Codigo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	Nombre VARCHAR(10) NOT NULL,
	Direccion VARCHAR(10) NOT NULL,
    Telefono INT NOT NULL,
    Codigo_Libro INT NOT NULL
);

CREATE TABLE Libro (
	Codigo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	Titulo VARCHAR(10) NOT NULL,
	ISBN VARCHAR(10) NOT NULL,
    Editorial VARCHAR(10) NOT NULL,
    Numero_de_pagina INT NOT NULL,
    Codigo_Ejemplares INT NOT NULL,
	Codigo_Autores INT NOT NULL
);

CREATE TABLE Ejemplares (
	Codigo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	Localizacion VARCHAR(10) NOT NULL
);
DROP database EJEMPLO;
CREATE TABLE Autor (
	Codigo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	Nombre VARCHAR(10) NOT NULL
);

#Asignar FOREIGN KEY
ALTER TABLE Usuario ADD CONSTRAINT FK_Codigo_Libro FOREIGN KEY (Codigo_Libro)
REFERENCES Libro (Codigo) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Libro ADD CONSTRAINT FK_Codigo_Ejemplares FOREIGN KEY (Codigo_Ejemplares)
REFERENCES Ejemplares (Codigo) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Libro ADD CONSTRAINT FK_Codigo_Autores FOREIGN KEY (Codigo_Autores)
REFERENCES Autor (Codigo) ON DELETE CASCADE ON UPDATE CASCADE;

#Insertar resgistros a las tablas
INSERT INTO Ejemplares (Localizacion) VALUES ('AB-1'),('CD-2'),('EF-3'),('GH-4'),('IJ-5');

ALTER TABLE Autor CHANGE Nombre Nombre VARCHAR(100);

INSERT INTO Autor (Nombre) VALUES ('Miguel de Cervantes'),('Agatha Chistie'),('Charles Dickens'),('Federico García Lorca'),('Gabriel García Márquez');

ALTER TABLE Libro CHANGE Titulo Titulo VARCHAR(50);
ALTER TABLE Libro CHANGE ISBN ISBN VARCHAR(50);
ALTER TABLE Libro CHANGE Editorial Editorial VARCHAR(50);

INSERT INTO Libro (Titulo, ISBN, Editorial, Numero_de_pagina, Codigo_Ejemplares, Codigo_Autores) VALUES ('Don Quijote de la Mancha', '9788420479873', 'ALFAGUARA', 1424, 1,1),
	   ('Asesinato en el Orient Express', '9788420479873', 'ALFAGUARA', 248, 2,2), ('OLIVER TWIST', '9788466795210', 'ANAYA', 563, 3,3), 
       ('Romancero gitano', '9788466795210', 'Juan Régulo Pérez', 250, 4,4), ('Cien años de soledad', '9788497592208', 'Editorial Sudamericana', 471, 5, 5);


ALTER TABLE Usuario CHANGE Direccion Direccion VARCHAR(50);
ALTER TABLE Usuario CHANGE Telefono Telefono VARCHAR(50);

INSERT INTO Usuario (Nombre, Direccion, Telefono, Codigo_Libro) VALUES ('Juan', 'Calle 55# 2sur', 3154454525,4),
	   ('David', 'Av 68 - 52', 4554251, 2), ('Pepe', 'Cra 75 # 162-12', 777777,1), ('Pancho', 'Trasv 32 - Av 145', 222333, 3),('Messi', 'Cll 80 Sur', 10101010, 5);

#Visualizar registros
Select * from autor;
Select * from ejemplares;
Select * from libro;

UPDATE ejemplares
SET Codigo = 1
WHERE Codigo = 123456;
Select * from usuario;
