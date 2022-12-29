CREATE TABLE cliente(
DNI VARCHAR2(50),
Nombre VARCHAR2(50),
Apellidos VARCHAR2(50),
Fecha_Nacimiento DATE,
Direccion VARCHAR2(50),
CONSTRAINT pk1 PRIMARY KEY(DNI)
);

CREATE TABLE Categoria(
Nombre VARCHAR2(50),
CONSTRAINT pk1_c PRIMARY KEY(Nombre)
);

CREATE TABLE Producto(
Nombre Varchar2(50),
Precio Number(6),
Cantidad Number(6),
Nombre_Categoria Varchar2(50) NOT NULL,
CONSTRAINT pk1_p PRIMARY KEY(Nombre),
CONSTRAINT fk1_p FOREIGN KEY(Nombre_Categoria) REFERENCES Categoria(Nombre)
);

CREATE TABLE Compra(
DNI Varchar2(50),
Nombre Varchar2(50),
Fecha DATE,
CONSTRAINT pk1_co PRIMARY KEY(DNI,Nombre,fecha),
CONSTRAINT fk1_co FOREIGN KEY(DNI) REFERENCES Cliente(DNI),
CONSTRAINT fk2_co FOREIGN KEY(Nombre) REFERENCES Producto(Nombre)
);