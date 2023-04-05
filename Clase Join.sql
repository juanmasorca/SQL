CREATE DATABASE JOIN_ CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;
USE JOIN_;
drop table clientes;
CREATE TABLE CLIENTES(
	ClienteID INT PRIMARY KEY,
    NombreCliente VARCHAR(100),
    Contacto BIGINT
);

CREATE TABLE PEDIDOS(
	PedidoID INT PRIMARY KEY,
    ClienteID VARCHAR(100),
    Factura INT
);

INSERT INTO CLIENTES(ClienteID, NombreCliente, Contacto)
VALUES 
(1,'Marco Aurelio',456443552),
(2,'Lydia Johana',4455332221),
(3,'Ebbe',488982635),
(4,'Sogia Mariona',412436773)
;

INSERT INTO PEDIDOS(PedidoID, ClienteID, Factura)
VALUES 
(234,4,160),
(235,2,48),
(236,3,64),
(237,4,92);

select clientes.nombrecliente,pedidos.pedidoid
from clientes
OUTER JOIN pedidos on clientes.clienteid=pedidos.clienteid
order by clientes.nombrecliente;