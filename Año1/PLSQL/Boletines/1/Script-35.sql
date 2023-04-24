--1
CREATE OR REPLACE PROCEDURE ESCRIBE
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('HOLA MUNDO');
END;

BEGIN
	ESCRIBE;
END;
--2
CREATE OR REPLACE PROCEDURE Escribe_mensaje (mensaje varchar2)
IS
BEGIN 
dbms_output.put_line(mensaje);
END;

BEGIN
	escribe_mensaje('Hola');
END;
--3
CREATE OR REPLACE PROCEDURE Serie (minimo int, maximo int, paso int)
IS 
BEGIN 
	WHILE paso<=maximo LOOP 
		dbms_output.put_line(paso);
		paso:=paso+1;
	END LOOP;
END;

BEGIN
	Serie(1 , 100 , 2);
END;
--4
CREATE FUNCTION AZAR(minimo NUMBER, maximo NUMBER)
IS
SELECT ((RAND()* (maximo-minimo))+minimo
RETURN NUMBER;
END;
--5
CREATE FUNCTION NOTA(nota NUMBER(10))
RETURN varchar2
IS
	mensaje varchar2(50);
BEGIN 
  CASE nota
	WHEN 10 THEN mensaje:=('Sobresaliente');
	WHEN 9 THEN mensaje:=('Sobresaliente');
	WHEN 8 THEN mensaje:=('Notable');
	WHEN 7 THEN mensaje:=('Notable');
	WHEN 6 THEN mensaje:=('Bien');
	WHEN 5 THEN mensaje:=('Suficiente');
	WHEN 4 THEN mensaje:=('Insuficiente');
	WHEN 3 THEN mensaje:=('Insuficiente');
	WHEN 2 THEN mensaje:=('Insuficiente');
	WHEN 1 THEN mensaje:=('Insuficiente');
	WHEN 0 THEN mensaje:=('Insuficiente');
	mensaje:=('Nota no valida');
	END CASE;

END;


