--1. Escribe un procedimiento que muestre el número de empleados y el salario mínimo, máximo y medio del departamento 
--de FINANZAS. Debe hacerse uso de cursores implícitos, es decir utilizar SELECT ... INTO.
CREATE OR REPLACE PROCEDURE Finanzas()
IS
Numero NUMBER;
Minimo NUMBER;  
Maximo NUMBER;
Medio  NUMBER;
dpto   NUMBER;
BEGIN
	SELECT NUMDE INTO dpto FROM DEPARTAMENTOS
	WHERE UPPER(NOMDE) = 'FINANZAS';

    SELECT COUNT(*), MAX(SALAR), MIN(SALAR), ROUND(AVG(SALAR),2)
    INTO numero, maximo, minimo, media
    FROM EMPLEADOS WHERE NUMDE = dpto;

DBMS_OUTPUT.PUT_LINE('Departamento de FINANZAS');
DBMS_OUTPUT.PUT_LINE(numero || 'Empleados');
DBMS_OUTPUT.PUT_LINE(maximo || 'es el salario maximo');
DBMS_OUTPUT.PUT_LINE(minimo || 'es el salario minimo');
DBMS_OUTPUT.PUT_LINE(media || ' es el salario medio');
EXCEPTION
WHEN NO_DATA_FOUND THEN
  DBMS_OUTPUT.PUT_LINE('No se han encontrado datos');
END Finanzas;

--2. Escribe un procedimiento que suba un 10% el salario a los EMPLEADOS con más de 2 hijos y que ganen menos de 2000 €. 
--Para cada empleado se mostrar por pantalla el código de empleado, nombre, salario anterior y final. Utiliza un cursor 
--explícito. La transacción no puede quedarse a medias. Si por cualquier razón no es posible actualizar todos estos 
--salarios, debe deshacerse el trabajo a la situación inicial.
CREATE OR REPLACE 
PROCEDURE Subir_salarios AS
  CURSOR c IS
    SELECT NUMEM, NOMEM, SALAR, ROWID
    FROM EMPREADOS WHERE NUMHI > 2 AND SALAR < 2000;
  sal_nuevo NUMBER;
BEGIN
  FOR registro IN c LOOP
  	sal_nuevo := registro.SALAR*1.1;
    
    UPDATE EMPLEADOS SET SALAR = sal_nuevo
    WHERE NUMEM = registro.NUMEM;
   
   IF SQL%NOTFOUND THEN
     DBMS_OUTPUT.PUT_LINE('Actualizacion no completada');
   END IF;
   DBMS_OUTPUT.PUT_LINE(registro.NUMEM ||''|| registro.NOMEM
     ||':'|| registro.SALAR ||'-->'|| sal_nuevo);
  END LOOP
  COMMIT;
 
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
END Subir_salarios;
/
--3. Escribe un procedimiento que reciba dos parámetros (número de departamento, hijos). Deber. crearse un cursor 
--explícito al que se le pasarán estos parámetros y que mostrar. los datos de los empleados que pertenezcan al 
--departamento y con el número de hijos indicados. Al final se indicar. el número de empleados obtenidos.
CREATE OR REPLACE
PROCEDURE Dpto_Empleados_Hijos (
   numero EMPLEADOS.NUMDE%TYPE,
   hijos  EMPLEADOS.NUMHI%TYPE)
AS
   CURSOR c(numero EMPLEADOS.NUMDE%TYPE, hijos  EMPLEADOS.NUMHI%TYPE) IS
     SELECT NUMEM, NOMEM, NUMHI, NUMDE
     FROM EMPLEADOS WHERE NUMDE = numero AND NUMHI = hijos;
   contador NUMBER;
  
BEGIN
  contador := 0;
  FOR registro IN c (numero, hijos) LOOP
  	DBMS_OUTPUT.PUT_LINE(registro.NUMEM ||' '|| registro.NOMEM
  	  ||''|| registro.NUMHI ||''|| registro.NUMDE);
  	contador := contador + 1;
  END LOOP;
  
  DBMS_OUTPUT.PUT_LINE(contador ||'Empleados obtenidos');
END Dpto_empleados_hijos;
/
--4. Escribe un procedimiento con un parámetro para el nombre de empleado, que nos muestre la edad de dicho empleado en 
--años, meses y días.

CREATE OR REPLACE
PROCEDUCE EDAD (
  NOMBRE EMPLEADOS.NUMDE%TYPE
)
AS  
  CURSOR C(numero EMPLEADOS.NUMDE%TYPE) IS
  SELECT FECHA_NACIMIENTO
  FROM EMPLEADOS;

BEGIN
  DBMS_OUTPUT.PUT_LINE(EDAD);
END EMPLEADOS;