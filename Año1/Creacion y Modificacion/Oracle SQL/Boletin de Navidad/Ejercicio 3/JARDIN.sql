--DROP TABLE pago;
--DROP TABLE detalle_pedido;
--DROP TABLE producto;
--DROP TABLE pedido;
--DROP TABLE cliente;
--DROP TABLE gama_producto;
--DROP TABLE empleado;
--DROP TABLE oficina;

CREATE TABLE oficina (
  codigo_oficina VARCHAR2(10),
  ciudad VARCHAR2(30) NOT NULL,
  pais VARCHAR2(50) NOT NULL,
  region VARCHAR2(50),
  codigo_postal VARCHAR2(10) NOT NULL,
  telefono VARCHAR2(20) NOT NULL,
  linea_direccion1 VARCHAR2(50) NOT NULL,
  linea_direccion2 VARCHAR2(50),
  PRIMARY KEY (codigo_oficina)
);

CREATE TABLE empleado (
  codigo_empleado NUMBER(4),
  nombre VARCHAR2(50) NOT NULL,
  apellido1 VARCHAR2(50) NOT NULL,
  apellido2 VARCHAR2(50),
  extension VARCHAR2(10) NOT NULL,
  email VARCHAR2(100) NOT NULL,
  codigo_oficina VARCHAR2(10) NOT NULL,
  codigo_jefe NUMBER(4) DEFAULT NULL,
  puesto VARCHAR2(50),
  PRIMARY KEY (codigo_empleado),
  FOREIGN KEY (codigo_oficina) REFERENCES oficina (codigo_oficina),
  FOREIGN KEY (codigo_jefe) REFERENCES empleado (codigo_empleado)
);

CREATE TABLE gama_producto (
  gama VARCHAR2(50),
  descripcion_texto VARCHAR2(100),
  descripcion_html VARCHAR2(100),
  imagen VARCHAR2(256),
  PRIMARY KEY (gama)
);

CREATE TABLE cliente (
  codigo_cliente NUMBER(2),
  nombre_cliente VARCHAR2(50) NOT NULL,
  nombre_contacto VARCHAR2(30),
  apellido_contacto VARCHAR2(30),
  telefono VARCHAR2(15) NOT NULL,
  fax VARCHAR2(15) NOT NULL,
  linea_direccion1 VARCHAR2(50) NOT NULL,
  linea_direccion2 VARCHAR2(50),
  ciudad VARCHAR2(50) NOT NULL,
  region VARCHAR2(50),
  pais VARCHAR2(50),
  codigo_postal VARCHAR2(10),
  codigo_empleado_rep_ventas NUMBER(4),
  limite_credito NUMBER(15,2),
  PRIMARY KEY (codigo_cliente),
  FOREIGN KEY (codigo_empleado_rep_ventas) REFERENCES empleado (codigo_empleado)
);

CREATE TABLE pedido (
  codigo_pedido NUMBER(4),
  fecha_pedido date NOT NULL,
  fecha_esperada date NOT NULL,
  fecha_entrega date DEFAULT NULL,
  estado VARCHAR2(15) NOT NULL,
  comentarios VARCHAR2(1000),
  codigo_cliente NUMBER(4) NOT NULL,
  PRIMARY KEY (codigo_pedido),
  FOREIGN KEY (codigo_cliente) REFERENCES cliente (codigo_cliente)
);

CREATE TABLE producto (
  codigo_producto VARCHAR2(15),
  nombre VARCHAR2(70) NOT NULL,
  gama VARCHAR2(50) NOT NULL,
  dimensiones VARCHAR2(25),
  proveedor VARCHAR2(50),
  descripcion VARCHAR2(2000),
  cantidad_en_stock NUMBER(4) NOT NULL,
  precio_venta NUMBER(15,2) NOT NULL,
  precio_proveedor NUMBER(15,2),
  PRIMARY KEY (codigo_producto),
  FOREIGN KEY (gama) REFERENCES gama_producto (gama)
);

CREATE TABLE detalle_pedido (
  codigo_pedido NUMBER(4),
  codigo_producto VARCHAR2(15) NOT NULL,
  cantidad NUMBER(4),
  precio_unidad NUMBER(15,2) NOT NULL,
  numero_linea NUMBER(4) NOT NULL,
  PRIMARY KEY (codigo_pedido, codigo_producto),
  FOREIGN KEY (codigo_pedido) REFERENCES pedido (codigo_pedido),
  FOREIGN KEY (codigo_producto) REFERENCES producto (codigo_producto)
);

CREATE TABLE pago (
  codigo_cliente NUMBER(4),
  forma_pago VARCHAR2(40) NOT NULL,
  id_transaccion VARCHAR2(50) NOT NULL,
  fecha_pago date NOT NULL,
  total NUMBER(15,2) NOT NULL,
  PRIMARY KEY (codigo_cliente, id_transaccion),
  FOREIGN KEY (codigo_cliente) REFERENCES cliente (codigo_cliente)
);