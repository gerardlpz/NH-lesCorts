--Pruebas SQL DB2

**** Dada la tabla ORDER (especificada con el create table que hay a continuación), y dada  una lista de IDs de pedido (coincidenctes con la columna ORDERS_ID) se necesita crear una consulta que obtenga el subconjunto de IDs de pedido que no se encuentran en la tabla.
-- Lista de IDS de pedido: 11111111, 22222222,33333333,44444444
--TABLAS
CREATE TABLE ORDER(
    ORDERS_ID INTEGER NOT NULL,
    TOTAL_ORDER INTEGER,
	STOREENT_ID INTEGER NOT NULL,
	LASTUPDATE TIMESTAMP(12),
	TIMEPLACED TIMESTAMP(12),
	PRIMARY KEY (ORDERS_ID)
);

-- SOLUCION






**** Sacar un informe de cuántos pedidos hemos hecho por día agrupados por nombre tienda
-- TABLAS
CREATE TABLE ORDERS_ID (
    ORDERS_ID INTEGER NOT NULL,
    TOTAL_ORDER INTEGER,
	STORE_ID INTEGER NOT NULL,
	LASTUPDATE TIMESTAMP(12),
	TIMEPLACED TIMESTAMP(12),
	PRIMARY KEY (ORDERS_ID)
);

CREATE TABLE STORE (
    STORE_ID INTEGER NOT NULL,
    NAME VARCHAR(300),
	PRIMARY KEY (STORE_ID)
);


-- SOLUCION




**** Se quiere obtener la lista de usuarios de una base de datos, la lista de roles que tienen los mismos y su perfil, siendo el perfil algo inducido por los roles.

Deben crearse dos soluciones:

- Una que obtenga el resultado solo con una query, sin crear procedimientos ni tablas físicas temporales.

- Otra a elección. Esta es optativa


SELECT UserId, UserName


La base de datos tiene el siguiente modelo:


Tabla USER

- UserId

- UserName


Tabla ROLE

- RoleID

- RoleNAME


Tabla MBRROLE (tabla relacional entre User y Role)

- UserId

- RoleId



Los valores que contiene la tabla ROLE son los siguientes:

- Role1 OrderQuery

- Role2 OrderUpdate

- Role3 User

- Role4 Support

- Role5 Report


Un usuario puede tener de 0..n roles. Independientemente del resto de roles que tenga un usuario, el perfil del mismo se define de la siguiente forma y con la siguiente prioridad:

- Si al menos tiene el rol de Support -> SYS

- Si no Si al menos tiene el rol de User -> ADMIN

- Si no Si al menos tiene el rol de OrderUpdate -> MANAGER

- En otro caso pero con al menos un rol -> CONSULTANT

- Si no tiene ningun rol -> indicar UNDEFINED


Ejemplo. Dado el siguiente set de datos:


User1 - Ana

User2 - Juan

User3 - Maria


User1 Role1

User1 Role2

User2 Role1

User2 Role2

User2 Role4

Maria Role5


El resultado sería el siguiente:

"Ana"; "OrderQuery,OrderUpdate" ; "MANAGER"

"Juan" ; "OrderQuery,OrderUpdate, Support" ; "SYS"

"Maria"; "Report"; "CONSULTANT"

