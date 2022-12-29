CREATE TABLE Tema(
cod_tema Number(6),
Denominacion Varchar2(50),
cod_tema_padre Number(6),
CONSTRAINT pk1_te PRIMARY KEY(cod_tema),
CONSTRAINT fk1_te FOREIGN KEY(cod_tema_padre) REFERENCES tema(cod_tema)
);

CREATE TABLE autor(
cod_autor Number(6),
nombre Varchar2(50),
f_nacimiento DATE,
libro_principal number(6),
CONSTRAINT pk1_au PRIMARY KEY(cod_autor)
);

CREATE TABLE libro(
cod_libro Number(6),
titulo Varchar2(50),
f_creacion DATE,
cod_tema Number(6),
autor_principal Number(6),
CONSTRAINT pk1_li PRIMARY KEY(cod_libro),
CONSTRAINT fk1_li FOREIGN KEY(autor_principal) REFERENCES autor(cod_autor),
CONSTRAINT fk2_li FOREIGN KEY(cod_tema) REFERENCES tema(cod_tema)
);

CREATE TABLE libro_autor(
cod_libro Number(6),
cod_autor Number(6),
orden Number(6),
CONSTRAINT pk1_lia PRIMARY KEY(cod_libro,cod_autor),
CONSTRAINT fk1_lia FOREIGN KEY(cod_autor) REFERENCES autor(cod_autor)
);

ALTER TABLE autor ADD CONSTRAINT fk2_au FOREIGN KEY(libro_principal) REFERENCES libro(cod_libro);
ALTER TABLE libro_autor ADD CONSTRAINT fk2_lia FOREIGN KEY(cod_libro) REFERENCES libro(cod_libro);

CREATE TABLE publicaciones(
cod_editorial Number(6),
cod_libro Number(6),
precio Number(6),
f_publicacion DATE,
CONSTRAINT pk1_pu PRIMARY KEY(cod_editorial,cod_libro),
CONSTRAINT fk1_PU FOREIGN KEY(cod_libro) REFERENCES libro(cod_libro)
);

CREATE TABLE editorial(
cod_editorial Number(6),
denominacion Varchar2(50),
CONSTRAINT pk1_edi PRIMARY KEY(cod_editorial)
);

ALTER TABLE publicaciones ADD CONSTRAINT fk2_pu FOREIGN KEY(cod_editorial) REFERENCES editorial(cod_editorial);
