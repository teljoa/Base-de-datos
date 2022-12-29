CREATE TABLE JUGADORES(
cod_jugador varchar2(4),
nombre varchar2(30),
fecha_nacimiento DATE,
demarcacion varchar2(10),
cod_equipo varchar2(4),
CONSTRAINT pk_jugadores PRIMARY kEY(cod_jugador),
CONSTRAINT fk_jugadores FOREIGN KEY(cod_equipo) REFERENCES EQUIPOS(cod_equipo)
);

CREATE TABLE EQUIPOS(
cod_equipo VARCHAR2(4),
nombre VARCHAR2(30),
localidad VARCHAR2(15),
goles_marcados NUMBER(3),
CONSTRAINT pk_equipos PRIMARY KEY(cod_equipo)
);

CREATE TABLE PARTIDOS(
cod_partido VARCHAR2(4),
cod_equipo_local VARCHAR2(4),
cod_equipo_visitante VARCHAR2(4),
fecha DATE,
competicion VARCHAR2(4),
jornada VARCHAR2(20),
CONSTRAINT pk_partidos PRIMARY KEY(cod_partido),
CONSTRAINT fk1_partidos FOREIGN KEY(cod_equipo_local) REFERENCES EQUIPOS(cod_equipo),
CONSTRAINT fk2_partidos FOREIGN KEY(cod_equipo_visitante) REFERENCES EQUIPOS(cod_equipo)
);

CREATE TABLE INCIDENCIAS(
num_incidencia VARCHAR2(6),
cod_partido VARCHAR2(4),
cod_jugador VARCHAR2(4),
minuto NUMBER(2),
tipo VARCHAR2(20),
CONSTRAINT pk_incidencias PRIMARY KEY(num_incidencia),
CONSTRAINT fk1_incidencias FOREIGN KEY(cod_partido) REFERENCES PARTIDOS(cod_partido),
CONSTRAINT fk2_incidencias FOREIGN KEY(cod_jugador) REFERENCES JUGADORES(cod_jugador),
CONSTRAINT ch_incidencias CHECK(minuto >=1 AND minuto <=100)
)
