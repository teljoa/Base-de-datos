CREATE TABLE VEHICULOS(
matricula varchar2(7),
marca varchar2(10) NOT NULL,
modelo varchar2(10) NOT NULL,
fecha_compra DATE,
precio_por_dia number(5,2),
CONSTRAINT pk_vehiculo PRIMARY KEY(matricula),
CONSTRAINT ch1_vehiculos CHECK(precio_por_dia >=0)
);

CREATE TABLE CLIENTES(
dni varchar2(9),
nombre varchar2(30) NOT NULL,
nacionalidad varchar2(30),
fecha_nacimiento DATE,
direccion varchar2(50),
CONSTRAINT pk_clientes PRIMARY KEY(dni)
);

CREATE TABLE ALQUILERES(
matricula varchar2(7) NOT NULL,
dni varchar2(10) NOT NULL,
fecha_hora DATE,
num_dias number(2) NOT NULL,
kilometros number(4),
CONSTRAINT pk_alquileres PRIMARY KEY(matricula, dni, fecha_hora),
CONSTRAINT fk1_alquileres FOREIGN KEY(dni) REFERENCES CLIENTES(dni),
CONSTRAINT fk2_alquileres FOREIGN KEY(matricula) REFERENCES VEHICULOS(matricula)
);