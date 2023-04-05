#Crear DB
CREATE DATABASE Giro_de_Italia CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;

use Giro_de_Italia;

#Crear tablas

DROP table EQUIPO;

#Crear tabla "EQUIPO"
CREATE TABLE EQUIPO(
	Codigo VARCHAR(100),
    Nombre_Equipo VARCHAR(100) PRIMARY KEY,
    Director VARCHAR(100)
);
TRUNCATE TABLE EQUIPO;

#Insertar en tabla "EQUIPO"
INSERT INTO EQUIPO (Codigo, Nombre_Equipo, Director) VALUES 
('ACT','AG2R Citroën Team','Stéphane Goubert'),
('AST','Astana-Premier Tech','Dimitri Fofonov'),
('TBV','Bahrain Victorious','Mario Chiesa'),
('BOH','Bora-Hansgrohe','Christian Pömer'),
('COF','Cofidis','Jean-Luc Jonrond'),
('SOQ','Soudal Quick-Step','Rik Van Slycke'),
('EFE','EF Education-Nippo','Charles Wegelius'),
('GFC','Groupama-FDJ','Yvon Madiot'),
('IGD','Ineos Grenadiers','Dan Hunt'),
('ICW','Intermarché-Circus-Wanty','Dimitri Claeys'),
('IPT','Israel-Premier Tech','Aviad Izrael'),
('TJV','Jumbo-Visma','Frans Maassen'),
('LTD','Lotto Soudal','Kurt Van De Wouwer'),
('MOV','Movistar Team','José Luis Jaimerena'),
('JAY','Team Jayco AlUla','Matthew Wilson'),
('DSM','Team DSM','Christian Guiberteau'),
('TQA','Team Qhubeka NextHash','Lars Michaelsen'),
('TFS','Trek-Segafredo','Dirk Demol'),
('UAD','UAE Team Emirates','Marco Marcato'),
('ADC','Alpecin-Deceuninck','Christoph Roodhooft'),
('EOK','Eolo-Kometa','Sean Yates');

#Visualizar registros
Select * from EQUIPO;

DROP table CICLISTA;

#Crear tabla "CICLISTA"
CREATE TABLE CICLISTA(
	Dorsal INT PRIMARY KEY,
    Nombre_Ciclista VARCHAR(100),
    Fecha_nacimiento DATE NOT NULL,
    Edad INT,
    Peso INT,
    Nombre_Equipo VARCHAR(100)
);

TRUNCATE TABLE CICLISTA;

#Insertar en tabla "CICLISTA"
INSERT INTO CICLISTA (Dorsal, Nombre_Ciclista, Fecha_nacimiento,Edad,Peso,Nombre_Equipo) VALUES 
(1,'Filippo Ganna',DATE '1996-07-25',26,82,'Ineos Grenadiers'),
(2,'Tim Merlier',DATE '1992-10-30',30,74,'Soudal Quick-Step'),
(3,'Taco van der Hoorn',DATE '1993-12-04',29,75,'Intermarché-Circus-Wanty'),
(4,'Joe Dombrowski',DATE '1991-05-12',31,68,'Astana-Premier Tech'),
(5,'Caleb Ewan',DATE '1994-07-11',28,69,'Lotto Soudal'),
(6,'Gino Mäder',DATE '1997-01-04',26,61,'Bahrain Victorious'),
(7,'Victor Lafay',DATE '1996-01-17',27,65,'Cofidis'),
(8,'Egan Bernal',DATE '1997-01-13',26,60,'Ineos Grenadiers'),
(9,'Peter Sagan',DATE '1990-01-16',33,78,'Bora-Hansgrohe'),
(10,'Mauro Schmid',DATE '1999-12-04',23,70,'Soudal Quick-Step'),
(11,'Andrea Vendrame',DATE '1994-07-20',28,60,'AG2R Citroën Team'),
(12,'Giacomo Nizzolo',DATE '1989-01-30',34,72,'Israel-Premier Tech'),
(13,'Lorenzo Fortunato',DATE '1996-05-09',26,59,'Eolo-Kometa'),
(14,'Victor Campenaerts',DATE '1991-10-28',31,72,'Lotto Soudal'),
(15,'Daniel Martin',DATE '1986-08-20',36,72,'Israel-Premier Tech'),
(16,'Alberto Bettiol',DATE '1993-12-29',29,69,'EF Education-Nippo'),
(17,'Simon Yates',DATE '1992-08-07',30,59,'Team Jayco AlUla'),
(18,'Damiano Caruso',DATE '1987-10-12',35,68,'Bahrain Victorious'),
(19,'Filippo Ganna',DATE '1986-07-25',26,82,'Ineos Grenadiers'),
(20,'Alessandro De Marchi',DATE '1986-05-19',36,66,'Team Jayco AlUla'),
(21,'Attila Valter',DATE '1998-06-12',24,65,'Groupama-FDJ');

#Asignar FOREIGN KEY 
ALTER TABLE CICLISTA ADD CONSTRAINT FK_Nombre_Equipo FOREIGN KEY (Nombre_Equipo)
REFERENCES EQUIPO (Nombre_Equipo) ON DELETE CASCADE ON UPDATE CASCADE;

DROP table CICLISTA;

#Crear tabla "ETAPA"
CREATE TABLE ETAPA(
	Numero_De_Etapa INT PRIMARY KEY,
    Km FLOAT,
    Salida VARCHAR(100),
	Llegada VARCHAR(100),
    Dorsal_Ciclista INT
);

TRUNCATE TABLE ETAPA;

#Insertar en tabla "ETAPA"
INSERT INTO ETAPA (Numero_De_Etapa, Km, Salida,Llegada,Dorsal_Ciclista) VALUES 
(1,8.6,'Turín','Turín',1),
(2,179,'Stupinigi','Novara',2),
(3,190,'Biella','Canale',3),
(4,189,'Plasencia','Sestola',4),
(5,177,'Módena','Cattolica',5),
(6,160,'Cuevas de Frasassi','San Giacomo',6),
(7,181,'Notaresco','Térmoli',7),
(8,170,'Foggia','Guardia Sanframondi',8),
(9,158,'Castel di Sangro','Campo Felice',9),
(10,139,'Laquila','Foligno',10),
(11,162,'Perugia','Montalcino',11),
(12,212,'Siena','Bagno di Romagna',12),
(13,198,'Ravena','Verona',13),
(14,205,'Cittadella','Monte Zoncolan',14),
(15,147,'Grado','Gorizia',9),
(16,153,'Sacile','Cortina dAmpezzo',16),
(17,193,'Canazei','Sega di Ala',17),
(18,231,'Rovereto','Stradella',18),
(19,166,'Abbiategrasso','Alpe di Mera',19),
(20,164,'Verbania','Alpe Motta',20),
(21,30.3,'Senago','Milán',21);

#Asignar FOREIGN KEY
ALTER TABLE ETAPA ADD CONSTRAINT FK_Dorsal_Ciclista FOREIGN KEY (Dorsal_Ciclista)
REFERENCES CICLISTA (Dorsal) ON DELETE CASCADE ON UPDATE CASCADE;

Select * from CICLISTA;

CREATE TABLE TRAMO(
	Codigo INT PRIMARY KEY,
    Nombre_Tramo VARCHAR(100),
    Altura INT,
	Categoria VARCHAR(100),
    Porcentaje INT,
    Numero_De_Etapa INT,
    Dorsal_Ciclista INT
);

#Insertar en tabla "TRAMO"
INSERT INTO TRAMO (Codigo, Nombre_Tramo, Altura,Categoria,Porcentaje,Numero_De_Etapa,Dorsal_Ciclista) VALUES 
(1,'Puertos de Primera categoría',3575,'Puertos de Primera categoría',14,1,1),
(2,'Puertos de Segunda categoría',3767,'Puertos de Segunda categoría',29,2,19),
(3,'Puertos de Tercera categoría',2379,'Puertos de Tercera categoría',20,3,20),
(4,'Puertos de Cuarta categoría',3567,'Puertos de Cuarta categoría',10,4,13),
(5,'Puertos de Categoría especial',3685,'Puertos de Categoría especial',23,5,13),
(6,'Sprint Final',1376,'Sprint Final',23,6,19),
(7,'Contrareloj individual',3007,'Contrareloj individual',19,7,16),
(8,'Contrareloj grupal',1135,'Contrareloj grupal',22,8,16),
(9,'Puertos de Primera categoría',4251,'Puertos de Primera categoría',32,9,20),
(10,'Puertos de Segunda categoría',2526,'Puertos de Segunda categoría',9,10,2),
(11,'Puertos de Tercera categoría',3988,'Puertos de Tercera categoría',32,11,15),
(12,'Puertos de Cuarta categoría',3827,'Puertos de Cuarta categoría',23,12,9),
(13,'Puertos de Categoría especial',2714,'Puertos de Categoría especial',30,13,16),
(14,'Sprint Final',4833,'Sprint Final',30,14,10),
(15,'Contrareloj individual',3643,'Contrareloj individual',15,15,6),
(16,'Contrareloj grupal',3415,'Contrareloj grupal',16,16,9),
(17,'Puertos de Primera categoría',3893,'Puertos de Primera categoría',35,17,2),
(18,'Puertos de Segunda categoría',4558,'Puertos de Segunda categoría',9,18,20),
(19,'Puertos de Tercera categoría',4306,'Puertos de Tercera categoría',21,19,8),
(20,'Puertos de Cuarta categoría',1843,'Puertos de Cuarta categoría',21,20,9);

#Asignar FOREIGN KEY
ALTER TABLE TRAMO ADD CONSTRAINT FK_Dorsal_Ciclista_TRAMO FOREIGN KEY (Dorsal_Ciclista)
REFERENCES CICLISTA (Dorsal) ON DELETE CASCADE ON UPDATE CASCADE;

Select * from LLEVA;

DROP table JERSEY;

#Crear tabla "JERSEY"
CREATE TABLE JERSEY(
	Codigo INT PRIMARY KEY,
    Tipo VARCHAR(100),
    Premio INT,
	Color VARCHAR(100)
);

TRUNCATE TABLE JERSEY;

#Visualizar registros
Select * from JERSEY;

#Insertar en tabla "JERSEY"
INSERT INTO JERSEY (Codigo, Tipo, Premio,Color) VALUES 
(1,'Clasificación general',150000,'rosa'),
(2,'Clasificación por puntos',95450,'malva'),
(3,'Intergiro',25000,'azul'),
(4,'Rey de la Montaña',139500,'verde'),
(5,'Joven',55000,'blanca'),
(6,'Amarilla',1,'Amarilla'),
(7,'Beige',2,'Beige'),
(8,'Café',3,'Café'),
(9,'Dorado',4,'Dorado'),
(10,'Esmeralda',5,'Esmeralda'),
(11,'Fucsia',6,'Fucsia'),
(12,'Gris',7,'Gris'),
(13,'Helecho',8,'Helecho'),
(14,'Indigo',9,'Indigo'),
(15,'Jade',10,'Jade'),
(16,'Kobi',11,'Kobi'),
(17,'Lacre',12,'Lacre'),
(18,'Marron',13,'Marron'),
(19,'Naranja',14,'Naranja'),
(20,'Oro',15,'Oro');


#Crear tabla "LLEVA"
CREATE TABLE LLEVA(
	Numero_De_Etapa INT,
    Codigo_Jersey INT,
    Dorsal_Ciclista INT
);
TRUNCATE TABLE LLEVA;

DROP table LLEVA;

#Insertar en tabla "LLEVA"
INSERT INTO LLEVA (Numero_De_Etapa, Codigo_Jersey, Dorsal_Ciclista) VALUES 
(1,1,13),
(2,20,20),
(3,7,15),
(4,12,6),
(5,6,16),
(6,18,19),
(7,10,7),
(8,20,21),
(9,14,4),
(10,2,7),
(11,13,7),
(12,8,2),
(13,17,3),
(14,8,13),
(15,8,19),
(16,7,7),
(17,4,20),
(18,2,17),
(19,10,17),
(20,2,18),
(21,6,8);

#Asignar FOREIGN KEY
ALTER TABLE LLEVA ADD CONSTRAINT FK_Dorsal_Ciclista_LLEVA FOREIGN KEY (Dorsal_Ciclista)
REFERENCES CICLISTA (Dorsal) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE LLEVA ADD CONSTRAINT FK_Codigo_Jersey FOREIGN KEY (Codigo_Jersey)
REFERENCES JERSEY (Codigo) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE LLEVA ADD CONSTRAINT FK_Numero_De_Etapa FOREIGN KEY (Numero_De_Etapa)
REFERENCES ETAPA (Numero_De_Etapa) ON DELETE CASCADE ON UPDATE CASCADE;

use Giro_de_Italia;

#PUNTO 1
#Nombre y el equipo de aquellos corredores menores de 30 años que han ganado alguna etapa.
SELECT Nombre_Ciclista, Nombre_Equipo FROM CICLISTA, ETAPA WHERE Edad < 30 AND Dorsal_Ciclista = Dorsal ;


#PUNTO 2
#Nombre y equipo de los corredores mayores de 35 años que han ganado algún tramo.
SELECT Nombre_Ciclista, Nombre_Equipo FROM CICLISTA, TRAMO WHERE Edad > 35 AND Dorsal_Ciclista = Dorsal;

#PUNTO 3
#
SELECT * FROM ETAPA, TRAMO WHERE Salida=Llegada AND Nombre_Tramo LIKE '%Puertos%' AND ETAPA.Numero_De_Etapa=TRAMO.Numero_De_Etapa; 

#PUNTO 4
#Poblaciones que tienen la meta de alguna etapa, pero desde las que no se realiza ninguna salida.
SELECT distinct Llegada FROM ETAPA WHERE LLEGADA <> SALIDA;

#PUNTO 5
#Nombre y el equipo de los ciclistas que han ganado alguna etapa llevando la camiseta de color amarillo, mostrando también el número de etapa.
SELECT CICLISTA.Nombre_Ciclista, CICLISTA.Nombre_Equipo, LLEVA.Numero_De_Etapa  FROM CICLISTA, LLEVA WHERE Codigo_Jersey = 6 AND LLEVA.Dorsal_Ciclista=CICLISTA.Dorsal;

SELECT CICLISTA.Nombre_Ciclista, CICLISTA.Nombre_Equipo, LLEVA.Numero_De_Etapa  FROM CICLISTA INNER JOIN LLEVA ON Dorsal_Ciclista=Dorsal AND Codigo_Jersey = 6;

#PUNTO 6
#Poblaciones de salida y de llegada de las etapas donde se encuentran tramos con altura superior a 1300 metros.
SELECT SALIDA, LLEGADA FROM ETAPA, TRAMO WHERE ETAPA.Numero_De_Etapa=TRAMO.Numero_De_Etapa AND ALTURA >1300;

#PUNTO 7
#Número de las etapas que tienen algún(os) tramos de montaña, indicando cuántos tiene cada una de ellas.
SELECT Numero_De_Etapa, COUNT(Numero_De_Etapa) FROM TRAMO WHERE Nombre_Tramo LIKE '%Puertos%';

#PUNTO 8
#Obtener la edad media de los ciclistas que han ganado alguna etapa.
SELECT AVG(Edad) AS EDADES FROM CICLISTA,ETAPA WHERE Dorsal=ETAPA.Dorsal_Ciclista; 	

#PUNTO 9
#Obtener la edad del ciclista más joven, la del más veterano y la media de edad de los ciclistas que han participado en la vuelta.
SELECT MIN(Edad), MAX(Edad), AVG(Edad) FROM CICLISTA;

#PUNTO 10
#Obtener el nombre del equipo y el director del ciclista que ha ganado la etapa más larga
SELECT Nombre_Equipo, Director FROM EQUIPO WHERE Nombre_Equipo=(SELECT Nombre_Equipo FROM CICLISTA WHERE Dorsal=(SELECT Dorsal_Ciclista FROM ETAPA WHERE Km=(SELECT MAX(Km) FROM ETAPA)));

#PUNTO 11
#Nombre y equipo del ganador de la vuelta (es decir, el que ha lucido la camiseta amarilla en la última etapa).
SELECT CICLISTA.Nombre_Ciclista, CICLISTA.Nombre_Equipo FROM CICLISTA WHERE dorsal= (SELECT Dorsal_Ciclista
 FROM ETAPA WHERE ETAPA.Numero_De_Etapa = (SELECT max(Numero_De_Etapa) FROM ETAPA));

#Punto 12
#Nombre y director de los equipos que, en alguna etapa, sus ciclistas han llevado tres o más camisetas.
#Punto 13
#Dorsal y nombre del ciclista que ha llevado la camiseta verde durante más etapas.
SELECT CICLISTA.Nombre_Ciclista, CICLISTA.Dorsal FROM CICLISTA, LLEVA WHERE LLEVA.Dorsal_Ciclista=CICLISTA.Dorsal 
AND LLEVA.Codigo_Jersey = (SELECT JERSEY.Codigo FROM JERSEY WHERE JERSEY.Color = 'verde');

#Punto 14
#Obtener todos los datos de aquellos ciclistas de los que se desconozca su edad.
Select * FROM CICLISTA WHERE Edad IS NULL;

#Punto 15
#Obtener el nombre y la fecha de nacimiento de los ciclistas que pertenezcan a equipos cuyo nombre contenga la cadena 100%.
SELECT CICLISTA.Nombre_Ciclista, CICLISTA.Fecha_nacimiento FROM CICLISTA WHERE Nombre_Equipo LIKE '%100%';
