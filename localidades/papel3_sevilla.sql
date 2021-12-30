-- DROPS
DROP TABLE HISTORICO;

DROP TABLE EMPLEADO25;

DROP TABLE RESERVA25;

DROP TABLE CLIENTE;

DROP TABLE ENTREGA25;

DROP TABLE HOTEL25;

DROP TABLE ARTICULO;

DROP TABLE PROVEEDOR2;

-- TABLES
CREATE TABLE HOTEL25(
	HID NUMBER NOT NULL,
	EID NUMBER,
	NOMBRE VARCHAR(50) NOT NULL,
	CIUDAD VARCHAR(20) NOT NULL,
	PROVINCIA VARCHAR(10) NOT NULL,
	N_HAB NUMBER NOT NULL,
	N_HAB2 NUMBER NOT NULL,
	PRIMARY KEY(HID)
);

CREATE TABLE PROVEEDOR2(
	PID NUMBER NOT NULL,
	NOMBRE VARCHAR(50) NOT NULL,
	PROVINCIA VARCHAR(10) NOT NULL,
	PRIMARY KEY(PID)
);

CREATE TABLE ARTICULO(
	PID NUMBER NOT NULL,
	AID NUMBER NOT NULL,
	NOMBRE VARCHAR(50) NOT NULL,
	TIPO VARCHAR(50) NOT NULL,
	PRIMARY KEY(PID, AID)
);

CREATE TABLE ENTREGA25(
	PID NUMBER NOT NULL,
	AID NUMBER NOT NULL,
	HID NUMBER NOT NULL REFERENCES HOTEL25(HID),
	FECHA DATE NOT NULL,
	PRECIO NUMBER NOT NULL,
	CANTIDAD NUMBER NOT NULL,
	PRIMARY KEY(PID, AID, HID, FECHA),
	FOREIGN KEY(PID,AID) REFERENCES ARTICULO(PID, AID)
);

CREATE TABLE EMPLEADO25(
	EID NUMBER NOT NULL,
	HID NUMBER NOT NULL REFERENCES HOTEL25(HID),
	NOMBRE VARCHAR(50) NOT NULL,
	DIRECCION VARCHAR(70) NOT NULL,
	SALARIO NUMBER NOT NULL,
	DNI NUMBER NOT NULL,
	TLF NUMBER NOT NULL,
	FECHA_CONTRATO DATE NOT NULL,
	FECHA_INI DATE NOT NULL,
	PRIMARY KEY(EID)
);

CREATE TABLE CLIENTE(
	CID NUMBER NOT NULL,
	NOMBRE VARCHAR(50) NOT NULL,
	DNI NUMBER NOT NULL,
	TLF NUMBER NOT NULL,
	PRIMARY KEY(CID)
);

CREATE TABLE RESERVA25(
	CID NUMBER NOT NULL REFERENCES CLIENTE(CID),
	HID NUMBER NOT NULL REFERENCES HOTEL25(HID),
	FECHA_FIN DATE NOT NULL,
	FECHA_INI DATE NOT NULL,
	TIPO_HAB VARCHAR(20) NOT NULL,
	PRECIO NUMBER NOT NULL,
	PRIMARY KEY(CID, HID, FECHA_FIN, FECHA_INI)
);

CREATE TABLE HISTORICO(
	EID NUMBER NOT NULL,
	HID NUMBER NOT NULL,
	FECHA_INI DATE NOT NULL,
	FECHA_FIN DATE NOT NULL,
	PRIMARY KEY(EID, HID)
);

-- GRANTS
GRANT DELETE, INSERT, UPDATE, SELECT
ON ARTICULO
TO PAPEL1,PAPEL2,PAPEL4;
commit;

GRANT DELETE, INSERT, UPDATE, SELECT
ON CLIENTE
TO PAPEL1,PAPEL2,PAPEL4;
commit;

GRANT DELETE, INSERT, UPDATE, SELECT
ON EMPLEADO25
TO PAPEL1,PAPEL2,PAPEL4;
commit;

GRANT DELETE, INSERT, UPDATE, SELECT
ON ENTREGA25
TO PAPEL1,PAPEL2,PAPEL4;
commit;

GRANT DELETE, INSERT, UPDATE, SELECT
ON HOTEL25
TO PAPEL1,PAPEL2,PAPEL4;
commit;

GRANT DELETE, INSERT, UPDATE, SELECT
ON PROVEEDOR2
TO PAPEL1,PAPEL2,PAPEL4;
commit;

GRANT DELETE, INSERT, UPDATE, SELECT
ON RESERVA25
TO PAPEL1,PAPEL2,PAPEL4;
commit;

GRANT DELETE, INSERT, UPDATE, SELECT
ON HISTORICO
TO PAPEL1,PAPEL2,PAPEL4;
commit;