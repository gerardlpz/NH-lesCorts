SELECT * FROM orders;

insert into orders (orders_id, total_order, storeent_id, lastupdate, timeplaced)
values (44444444, 400, 4, '2024-01-22 15:00:00', '2024-01-22 15:45:00'),
(66666666, 500, 5, '2024-01-22 15:00:00', '2024-01-22 15:45:00'),
(77777777, 600, 6, '2024-01-22 15:00:00', '2024-01-22 15:45:00'),
(88888888, 700, 7, '2024-01-22 15:00:00', '2024-01-22 15:45:00');

select ORDERS_ID from orders where ORDERS_ID not in ('11111111, 22222222,33333333,44444444');

/* pregunta dos------------------------------------ */
CREATE TABLE ORDERS_ID (
    ORDERS_ID INTEGER NOT NULL,
    TOTAL_ORDER INTEGER,
    STORE_ID INTEGER NOT NULL,
    LASTUPDATE TIMESTAMP(6),
    TIMEPLACED TIMESTAMP(6),
    PRIMARY KEY (ORDERS_ID),
    FOREIGN KEY (STORE_ID) REFERENCES STORE(STORE_ID)
);

CREATE TABLE STORE (
    STORE_ID INTEGER NOT NULL,
    NAME VARCHAR(300),
	PRIMARY KEY (STORE_ID)
);
/* añade datos en tabla orders_id y en la tabla store */
insert into orders_id (orders_id, total_order, store_id, lastupdate, timeplaced)
values (11111111, 100, 1, '2024-01-20 12:00:00', '2024-01-20 12:30:00'),
(11112222, 20, 1, '2024-01-20 12:00:00', '2024-01-20 12:30:00'),
(22222222, 150, 2, '2024-01-20 13:00:00', '2024-01-20 13:45:00'),
(33333333, 200, 1, '2024-01-21 10:00:00', '2024-01-21 10:30:00'),
(44444444, 400, 4, '2024-01-22 15:00:00', '2024-01-22 15:45:00'),
(55555555, 300, 3, '2024-01-22 15:00:00', '2024-01-22 15:45:00'),
(66666666, 500, 5, '2024-01-22 15:00:00', '2024-01-22 15:45:00'),
(77777777, 600, 6, '2024-01-22 15:00:00', '2024-01-22 15:45:00'),
(88888888, 700, 7, '2024-01-22 15:00:00', '2024-01-22 15:45:00');

insert into store (store_id, name)
values (1, 'store1'),
(2, 'store2'),
(3, 'store3'),
(4, 'store4'),
(5, 'store5'),
(6, 'store6'),
(7, 'store7');

select * from orders_id
select * from store
/* hay que truncar la fecha si pongo timeplaced as fecha , agrupa x hora exacta , hace falta DATE(timeplaced)*/
select  SUM(orders_id.total_order) as SUMA_TOTAL, DATE(ORDERS_ID.timeplaced) as fecha, STORE.NAME as nombre_tienda
from orders_id
join store on ORDERS_ID.STORE_ID = store.STORE_ID
group by  fecha, nombre_tienda;

/* pregunta tres ------------------------------------ */

-- Crear tabla USER
CREATE TABLE USER (
    UserId INT PRIMARY KEY,
    UserName VARCHAR(255) NOT NULL
);

-- Crear tabla ROLE
CREATE TABLE ROLE (
    RoleID INT PRIMARY KEY,
    RoleNAME VARCHAR(255) NOT NULL
);

-- Crear tabla MBRROLE
CREATE TABLE MBRROLE (
    UserId INT,
    RoleId INT,
    PRIMARY KEY (UserId, RoleId),
    FOREIGN KEY (UserId) REFERENCES USER(UserId),
    FOREIGN KEY (RoleId) REFERENCES ROLE(RoleID)
);

-- Insertar datos de ejemplo en USER
INSERT INTO USER (UserId, UserName) VALUES
    (1, 'Ana'),
    (2, 'Juan'),
    (3, 'Maria');

-- Insertar datos de ejemplo en ROLE
INSERT INTO ROLE (RoleID, RoleNAME) VALUES
    (1, 'OrderQuery'),
    (2, 'OrderUpdate'),
    (3, 'User'),
    (4, 'Support'),
    (5, 'Report');

-- Insertar datos de ejemplo en MBRROLE
INSERT INTO MBRROLE (UserId, RoleId) VALUES
    (1, 1),
    (1, 2),
    (2, 1),
    (2, 2),
    (2, 4),
    (3, 5);

select user.UserName, group_concat(role.RoleNAME) as roles,
case
    when max(role.RoleNAME) = 'Support' then 'SYS'
    when max(role.RoleNAME) = 'User' then 'ADMIN'
    when max(role.RoleNAME) = 'User' then 'ADMIN'
    when max(role.RoleNAME) = 'OrderUpdate' then 'MANAGER'
    when count(role.RoleID) > 1 then 'CONSULTANT'
    else 'UNDEFINED'
end as Descripcion
FROM mbrrole
join user on mbrrole.UserId = user.UserId
join role on mbrrole.RoleId = role.RoleId
group by user.UserName
