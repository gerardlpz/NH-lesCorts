CREATE TABLE RANGOS (
    ID_RANGO INTEGER PRIMARY KEY,
    Anho INTEGER,
    Bimestre INTEGER,
    Rango_Inicial VARCHAR(20),
    Rango_Final VARCHAR(20),
    Ultima_actualizacion TIMESTAMP
);

-- Valores de ejemplo
INSERT INTO RANGOS (ID_RANGO, Anho, Bimestre, Rango_Inicial, Rango_Final, Ultima_actualizacion)
VALUES
    (1, 2022, 1, 'AA-123456678', 'AA-123456688', '2022-01-20 12:00:00'),
    (2, 2022, 2, 'AA-223456678', 'AA-223456688', '2022-02-15 14:30:00'),
    (3, 2022, 3, 'AA-323456678', 'AA-323456688', '2022-03-22 10:45:00'),
    (4, 2022, 4, 'AA-423456678', 'AA-423456688', '2022-04-18 09:15:00');

SELECT * FROM rangos