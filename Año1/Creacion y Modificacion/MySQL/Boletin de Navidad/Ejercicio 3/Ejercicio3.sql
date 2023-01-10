--DROP TABLE pago;
--DROP TABLE detalle_pedido;
--DROP TABLE producto;
--DROP TABLE pedido;
--DROP TABLE cliente;
--DROP TABLE gama_producto;
--DROP TABLE empleado;
--DROP TABLE oficina;

CREATE TABLE oficina (
  codigo_oficina VARCHAR(10),
  ciudad VARCHAR(30) NOT NULL,
  pais VARCHAR(50) NOT NULL,
  region VARCHAR(50),
  codigo_postal VARCHAR(10) NOT NULL,
  telefono VARCHAR(20) NOT NULL,
  linea_direccion1 VARCHAR(50) NOT NULL,
  linea_direccion2 VARCHAR(50),
  PRIMARY KEY (codigo_oficina)
);

CREATE TABLE empleado (
  codigo_empleado int(11),
  nombre VARCHAR(50) NOT NULL,
  apellido1 VARCHAR(50) NOT NULL,
  apellido2 VARCHAR(50),
  extension VARCHAR(10) NOT NULL,
  email VARCHAR(100) NOT NULL,
  codigo_oficina VARCHAR(10) NOT NULL,
  codigo_jefe int(11) DEFAULT NULL,
  puesto VARCHAR(50),
  PRIMARY KEY (codigo_empleado),
  FOREIGN KEY (codigo_oficina) REFERENCES oficina (codigo_oficina),
  FOREIGN KEY (codigo_jefe) REFERENCES empleado (codigo_empleado)
);

CREATE TABLE gama_producto (
  gama VARCHAR(50),
  descripcion_texto text,
  descripcion_html text,
  imagen VARCHAR2(256),
  PRIMARY KEY (gama)
);

CREATE TABLE cliente (
  codigo_cliente int(11),
  nombre_cliente VARCHAR(50) NOT NULL,
  nombre_contacto VARCHAR(30),
  apellido_contacto VARCHAR(30),
  telefono VARCHAR(15) NOT NULL,
  fax VARCHAR(15) NOT NULL,
  linea_direccion1 VARCHAR(50) NOT NULL,
  linea_direccion2 VARCHAR(50),
  ciudad VARCHAR(50) NOT NULL,
  region VARCHAR(50),
  pais VARCHAR(50),
  codigo_postal VARCHAR(10),
  codigo_empleado_rep_ventas int(11),
  limite_credito decimal(15,2),
  PRIMARY KEY (codigo_cliente),
  FOREIGN KEY (codigo_empleado_rep_ventas) REFERENCES empleado (codigo_empleado)
);

CREATE TABLE pedido (
  codigo_pedido int(11),
  fecha_pedido date NOT NULL,
  fecha_esperada date NOT NULL,
  fecha_entrega date DEFAULT NULL,
  estado VARCHAR(15) NOT NULL,
  comentarios text,
  codigo_cliente int(4) NOT NULL,
  PRIMARY KEY (codigo_pedido),
  FOREIGN KEY (codigo_cliente) REFERENCES cliente (codigo_cliente)
);

CREATE TABLE producto (
  codigo_producto VARCHAR(15),
  nombre VARCHAR(70) NOT NULL,
  gama VARCHAR(50) NOT NULL,
  dimensiones VARCHAR(25),
  proveedor VARCHAR(50),
  descripcion text,
  cantidad_en_stock amallint(6) NOT NULL,
  precio_venta decimal(15,2) NOT NULL,
  precio_proveedor decimal(15,2),
  PRIMARY KEY (codigo_producto),
  FOREIGN KEY (gama) REFERENCES gama_producto (gama)
);

CREATE TABLE detalle_pedido (
  codigo_pedido int(11),
  codigo_producto VARCHAR(15) NOT NULL,
  cantidad int(11),
  precio_unidad decimal(15,2) NOT NULL,
  numero_linea smallint(4) NOT NULL,
  PRIMARY KEY (codigo_pedido, codigo_producto),
  FOREIGN KEY (codigo_pedido) REFERENCES pedido (codigo_pedido),
  FOREIGN KEY (codigo_producto) REFERENCES producto (codigo_producto)
);

CREATE TABLE pago (
  codigo_cliente int(4),
  forma_pago VARCHAR(40) NOT NULL,
  id_transaccion VARCHAR(50) NOT NULL,
  fecha_pago date NOT NULL,
  total decimal(15,2) NOT NULL,
  PRIMARY KEY (codigo_cliente, id_transaccion),
  FOREIGN KEY (codigo_cliente) REFERENCES cliente (codigo_cliente)
);
