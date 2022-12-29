CREATE TABLE TEMA(
cod_tema NUMBER(5,2),
denominacion varchar2(15),
cod_tema_padre NUMBER(5,2),
CONSTRAINT pk_tema PRIMARY KEY(cod_tema),
CONSTRAINT fk_tema FOREIGN KEY(cod_tema_padre) REFERENCES TEMA(cod_tema),
CONSTRAINT ch_tema CHECK(cod_tema_padre>cod_tema)
);

CREATE TABLE AUTOR(
cod_autor NUMBER(5,2),
nombre varchar2(15),
f_nacimiento DATE,
libro_principal number(5,2),
CONSTRAINT pk_autor PRIMARY KEY(cod_autor)
);

CREATE TABLE LIBRO(
cod_libro NUMBER(5,2),
titulo varchar2(15),
f_creacion DATE,
cod_tema number(5,2),
autor_principal NUMBER(5,2),
CONSTRAINT pk_libro PRIMARY key(cod_libro)
);

ALTER TABLE AUTOR ADD CONSTRAINT fk1_autor FOREIGN KEY(libro_principal) REFERENCES LIBRO(cod_libro);
ALTER TABLE LIBRO ADD CONSTRAINT fk1_libro FOREIGN KEY(cod_tema) REFERENCES TEMA(cod_tema);

CREATE TABLE LIBRO_AUTOR(
cod_libro number(5,2),
cod_autor number(5,2),
orden number(1),
CONSTRAINT pk_libro_autor PRIMARY key(cod_libro, cod_autor),
CONSTRAINT fk1_libro_autor FOREIGN key(cod_libro) REFERENCES LIBRO(cod_libro),
CONSTRAINT fk2_libro_autor FOREIGN key(cod_autor) REFERENCES AUTOR(cod_autor),
CONSTRAINT ch_libro_autor check(orden >=1 AND orden <=5)
);

CREATE TABLE PUBLICACIONES(
cod_editorial number(5,2),
cod_libro number(5,2),
precio number(5,2) NOT NULL,
f_publicacion DATE DEFAULT SYSDATE,
CONSTRAINT pk_publicaciones PRIMARY KEY(cod_editorial, cod_libro),
CONSTRAINT fk1_publicaciones FOREIGN KEY(cod_libro) REFERENCES LIBRO(cod_libro),
CONSTRAINT fk2_publicaciones FOREIGN KEY(cod_editorial) REFERENCES EDITORIAL(cod_editorial) ON DELETE CASCADE,
CONSTRAINT ch_publicaciones check(precio>0)
); 

CREATE TABLE Editorial(
cod_editorial number(5,2),
denominacion varchar2(15),
CONSTRAINT pk_editorial PRIMARY KEY(cod_editorial)
);
ALTER TABLE EDITORIAL ADD publicacion_libro number(5,2);
ALTER TABLE EDITORIAL ADD CONSTRAINT fk_editorial FOREIGN KEY(publicacion_libro) REFERENCES EDITORIAL(cod_editorial);

DROP TABLE TEMA CASCADE CONSTRAINT;
DROP TABLE AUTOR CASCADE CONSTRAINT;
DROP TABLE LIBRO CASCADE CONSTRAINT;
DROP TABLE LIBRO_AUTOR CASCADE CONSTRAINT;
DROP TABLE PUBLICACIONES CASCADE CONSTRAINT;
DROP TABLE EDITORIAL CASCADE CONSTRAINT;