--1.
BEGIN
	IF 10 > 5 THEN
		DBMS_OUTPUT.PUT_LINE ('Cierto');
	ELSE
		DBMS_OUTPUT.PUT_LINE ('Falso');
	END IF;
END;
/*10 es mayor que 5*/
--2.
BEGIN
	IF 10 > 5 AND 5 > 1 THEN
		DBMS_OUTPUT.PUT_LINE ('Cierto');
	ELSE
		DBMS_OUTPUT.PUT_LINE ('Falso');
	END IF;
END;
/*10 es mayor que 5 y 5 es mayor que 1*/
--3.
BEGIN
	IF 10 > 5 AND 5 > 50 THEN
		DBMS_OUTPUT.PUT_LINE ('Cierto');
	ELSE
		DBMS_OUTPUT.PUT_LINE ('Falso');
	END IF;
END;
/*10 es mayor que 5 pero 5 es menor a 50*/
--4.
BEGIN
	CASE
		WHEN 10 > 5 AND 5 > 50 THEN
			DBMS_OUTPUT.PUT_LINE ('Cierto');
		ELSE
			DBMS_OUTPUT.PUT_LINE ('Falso');
	END CASE;
END;
/*10 es mayor que 5 pero 5 es menor a 50*/
--5.
BEGIN
	FOR i IN 1..10 LOOP
		DBMS_OUTPUT.PUT_LINE (i);
	END LOOP;
END;
/*Un bucle con sentencia FOR el cual te muestra desde el 1 al 10 */
--6.
BEGIN
	FOR i IN REVERSE 1..10 LOOP
		DBMS_OUTPUT.PUT_LINE (i);
	END LOOP;
END;
/*Un bucle con sentencia FOR el cual te muestra desde el 1 al 10 pero al reves */
--7.
DECLARE
	num NUMBER(3) := 0;
BEGIN
	WHILE num<=100 LOOP
		DBMS_OUTPUT.PUT_LINE (num);
		num:= num+2;
	END LOOP;
END;
/*Un bucle while el cual te muestra del 1 al 100 todos los numeros pares*/
--8.
DECLARE
	num NUMBER(3) := 0;
BEGIN
	LOOP
		DBMS_OUTPUT.PUT_LINE (num);
		IF num > 100 THEN EXIT; END IF;
		num:= num+2;
	END LOOP;
END;
/*Un bucle loop el cual te muestra del 1 al 100 todos los numeros pares*/
--9.
DECLARE
	num NUMBER(3) := 0;
BEGIN
	LOOP
		DBMS_OUTPUT.PUT_LINE (num);
		EXIT WHEN num > 100;
		num:= num+2;
	END LOOP;
END;
/*Un bucle loop el cual te muestra del 1 al 100 todos los numeros pares*/