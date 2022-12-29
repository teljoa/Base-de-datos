--1. Generar las siguientes tablas para guardar esta información

CREATE TABLE PROFESOR(
nombre VARCHAR2(20),
apellido1 VARCHAR2(20),
apellido2 VARCHAR2(20),
dni VARCHAR2(10),
direccion VARCHAR2(50),
titulo VARCHAR2(50),
gana NUMBER(4),
CONSTRAINT pk_PRO PRIMARY key(dni)
);

CREATE TABLE CURSO(
nombre_curso VARCHAR2(20),
cod_curso number(2),
dni_profesor VARCHAR2(10),
maximo_alumnos number(5),
fecha_inicio DATE,
fecha_fin DATE,
num_horas NUMBER(5),
CONSTRAINT pk_cur PRIMARY KEY(cod_curso),
CONSTRAINT fk_cur FOREIGN KEY(dni_profesor) REFERENCES PROFESOR(dni)
);

CREATE TABLE ALUMNO(
nombre VARCHAR2(20),
apellido1 VARCHAR2(20),
apellido2 VARCHAR2(20),
dni VARCHAR2(10),
direccion VARCHAR2(50),
sexo VARCHAR2(1),
fecha_nacimiento DATE,
curso NUMBER(2),
CONSTRAINT pk_alum PRIMARY KEY(dni),
CONSTRAINT fk_alum FOREIGN KEY(curso) REFERENCES CURSO(cod_curso),
CONSTRAINT ch_alum CHECK(sexo IN('H' OR 'M')
);

--2.Insertar las siguientes tuplas:

--Tabla PROFESORES:

INSERT INTO PROFESOR(nombre,apellido1,apellido2,dni,direccion,titulo,gana)
VALUES ('Juan','Arch','López',32432455,'Puerta Negra 4' ,'Ing. Informática',7500);

INSERT INTO PROFESOR(nombre,apellido1,apellido2,dni,direccion,titulo,gana)
VALUES ('María','Oliva','Rubio',43215643,'Juan Alfonso 32' ,'Lda. Fil. Inglesa ',5400);

--Tabla CURSOS:

INSERT INTO CURSO(nombre_curso,cod_curso,dni_profesor,maximo_alumnos,fecha_inicio,fecha_fin,num_horas)
VALUES ('Inglés Básico',1,43215643,15,'01/11/00', '22-DIC-00',120);

INSERT INTO CURSO(nombre_curso,cod_curso,dni_profesor,fecha_inicio,num_horas)
VALUES ('Administración Linux',2,32432455,'01-SEPT-00',80);

--Tabla ALUMNOS:

INSERT INTO ALUMNO(nombre,apellido1,apellido2,dni,direccion,sexo,fecha_nacimiento,curso)
VALUES ('Lucas','Manilva','López',123523,'Alhamar, 3','V','01/11/79',1);

INSERT INTO ALUMNO(nombre,apellido1,apellido2,dni,direccion,sexo,curso)
VALUES ('Antonia','Lopez','Alcantara',2567567,'Maniqui, 21','M',2);

INSERT INTO ALUMNO(nombre,apellido1,apellido2,dni,direccion,sexo,curso)
VALUES ('Manuel','Alcantara','Pedros',3123689,'Julian, 2',2,1);

INSERT INTO ALUMNO(nombre,apellido1,apellido2,dni,direccion,sexo,fecha_nacimiento,curso)
VALUES ('Jose','Perez','Caballar',4896765,'Jarcha, 5','V','03/02/77',3);

--3. Insertar la siguiente tupla en ALUMNOS:

INSERT INTO ALUMNO(nombre,apellido1,apellido2,dni,sexo,curso)
VALUES ('Sergio','Navas','Retal',123523,'P',1);

--4. Insertar las siguientes tupla en la tabla profesores:
INSERT INTO PROFESOR(nombre,apellido1,apellido2,dni,direccion,titulo,gana)
VALUES ('Juan','Arch','López',32432455,'Puerta Negra,5' 'Ing. Informática','NULL');

--5. Insertar la siguiente tupla en la tabla estudiante:

INSERT INTO ALUMNO(nombre,apellido1,apellido2,dni,direccion,sexo)
VALUES ('Maria','Jaen','Sevilla',789678,'Martos, 5','M');

--6. La fecha de nacimiento de Antonia López está equivocada. La verdadera es 23 de diciembre de 1976.
UPDATE ALUMNO
SET fecha_nacimiento = '23/12/1976'
WHERE nombre = 'Antonia';

--7. Cambiar a Antonia López al curso de código 5.
UPDATE ALUMNO
SET cod_curso = 5
WHERE nombre = 'Antonia';

--8. Eliminar la profesora Laura Jiménez
--DELETE FROM POFESOR
--WHERE nombre,apellido1 = 'Laura','Jimenez';
--ESTA PUESTO EN COMENTARIO YA QUE DA ERROR PORQUE DICHOS DATOS NO EXISTEN LA TABLA DE PROFESORES
--CORECION:
--ANADIMOS LOS DATOS SOLICITADOS
INSERT INTO PROFESOR(nombre,apellido1,apellido2,dni,direccion,titulo,gana)
VALUES ('Laura','Jimenez','López',32432458,'Puerta Negra,5' 'Ing. Informática','NULL');
--Y ENTONCES NOS DISPONEMOS A LA ELEMINACION DE DILLOS DATOS:
DELETE FROM POFESOR
WHERE nombre,apellido1 = 'Laura','Jimenez';

--9. Borrar el curso con código 1.
DELETE FROM CURSO
WHERE codigo = 1;

--10. Añadir un campo llamado numero_alumnos en la tabla curso
ALTER TABLE CURSO ADD numero_alumnos NUMBER(5,2);

--11. Modificar la fecha de nacimiento a 01/01/2012 en aquellos alumnos que no tengan fecha de nacimiento.
UPDATE CURSO
SET fecha_nacimiento = '01/01/2012'
WHERE fecha_nacimiento = NULL;

--12. Borra el campo sexo en la tabla de alumnos.
 ALTER TABLE ALUMNO DROP COLUMN sexo;

--13. Modificar la tabla profesores para que los  profesores de Informática cobren un 20 pro ciento más de lo que cobran actualmente.
UPDATE PROFESOR
SET gana = gana + 20%;
WHERE  titulo= 'Ing. Informatica';

--14. Modifica el dni de Juan Arch a 1234567
UPDATE PROFESOR
SET dni = 1234567;
WHERE  nombre,apellido1 = 'Juan','Arch';

--15. Modifica el dni de todos los profesores de informática para que tengan el dni 7654321
UPDATE PROFESOR
SET dni = 7654321
WHERE titulo = 'Ing. Informatica';

--16. Cambia el sexo de la alumna María Jaén a F.
UPDATE ALUMNO
SET sexo = 'F';
WHERE  nombre,apellido1 = 'Maria','Jaen';
#16. Cambia el sexo de la alumna María Jaén a F.
#UPDATE ALUMNO
#SET sexo = 'F';
#WHERE  nombre,apellido1 = 'Maria','Jaen';
#Esta puesto en comentario ya que da error porque dicha insercion de datos no esta permitida por que solo se puede ayadir: H o M.
#Coreccion:
#Lo que hay que hacer es modificar la CONSTRAINT.
ALTER TABLE ALUMNOS MODIFY CONSTRAINT ch_alum CHECK (sexo IN 'H' , 'M' OR 'F');
#Y entoces se puede modificar.
UPDATE ALUMNO
SET sexo = 'F';
WHERE  nombre,apellido1 = 'Maria','Jaen';