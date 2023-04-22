--APARTADO 1
SELECT NOMBRE, APELLIDOS
FROM PERSONAS
WHERE EXTRACT(YEAR FROM FECHA_NACIMIENTO)>0079
ORDER BY FECHA_NACIMIENTO ASC;
--APARTADO 2
SELECT DISTINCT CODCABALLO
FROM PARTICIPACIONES 
WHERE POSICIONFINAL >=3
ORDER BY CODCABALLO ASC;
--APARTADO 3
SELECT*
FROM CARRERAS
WHERE IMPORTEPREMIO > 50000;
--APARTADO 4
SELECT DISTINCT C.NOMBRE 
FROM CLIENTES C, APUESTAS A, CABALLOS C2, PERSONAS P
WHERE C.DNI =A.DNICLIENTE 
AND A.CODCABALLO =C2.CODCABALLO
AND C2.PROPIETARIO =P.CODIGO 
AND P.NOMBRE IN ('Jose','Inmaculada');
--APARTADO 5
SELECT NOMBRE, DNI
FROM CLIENTES
WHERE NACIONALIDAD NOT IN ('Brinanica','Escosesa');
--APARTADO 6
SELECT PROPIETARIO, NOMBRE
FROM CABALLOS
WHERE (EXTRACT(MONTH FROM FECHANACIMIENTO)=11)
OR (PESO >= 260)
ORDER BY PROPIETARIO DESC, NOMBRE DESC;
--APARTADO 7
SELECT DISTINCT NOMBRE
FROM PERSONAS
WHERE (UPPER(NOMBRE) LIKE '%J%'
AND LOWER(NOMBRE) LIKE '%e%'); 
--APARTADO 8
SELECT DISTINCT CODCABALLO 
FROM PARTICIPACIONES
GROUP BY CODCABALLO 
HAVING COUNT(CODCABALLO)>1;
--APARTADO 9
SELECT DNICLIENTE 
FROM APUESTAS ,(SELECT MAX(COUNT(DNICLIENTE))
				FROM APUESTAS
				GROUP BY DNICLIENTE)
WHERE ROWNUM =1;

--APARTADO 10
SELECT P2.NOMBRE , COUNT(DISTINCT P.CODCABALLO)
FROM PARTICIPACIONES P, PERSONAS P2
WHERE P.JOCKEY = P2.CODIGO 
GROUP BY P2.NOMBRE  
ORDER BY COUNT(DISTINCT P.CODCABALLO) DESC, P2.NOMBRE  ASC;
--APARTADO 11
SELECT P1.NOMBRE , P1.APELLIDOS, C.NOMBRE 
FROM PERSONAS P1, PARTICIPACIONES P2, CABALLOS C
WHERE P1.CODIGO = P2.JOCKEY 
AND P2.CODCABALLO = C.CODCABALLO;
--APARTADO 12
SELECT C1.NOMBRECARRERA, C2.NOMBRE, A.IMPORTE 
FROM CARRERAS C1, APUESTAS A, CLIENTES C2
WHERE C1.CODCARRERA = A.CODCARRERA 
AND A.DNICLIENTE = C2.DNI 
AND C1.APUESTALIMITE < A.IMPORTE;
--APARTADO 13
SELECT P1.NOMBRE, P1.APELLIDOS, C.NOMBRE 
FROM PERSONAS P1, CABALLOS C, PARTICIPACIONES P2
WHERE P1.CODIGO = C.PROPIETARIO 
AND C.CODCABALLO = P2.CODCABALLO 
GROUP BY P1.NOMBRE, P1.APELLIDOS, C.NOMBRE
HAVING COUNT(P2.CODCARRERA)>2;
--APARTADO 14
SELECT C2.NOMBRE, P1.NOMBRE, P3.NOMBRE, C1.NOMBRECARRERA 
FROM CARRERAS C1, CABALLOS C2, PERSONAS P1, PARTICIPACIONES P2, PERSONAS P3
WHERE C1.CODCARRERA = P2.CODCARRERA 
AND P2.CODCABALLO = C2.CODCABALLO 
AND C2.PROPIETARIO = P1.CODIGO 
AND P2.JOCKEY = P3.CODIGO 
AND C1.FECHAHORA = TO_CHAR('12-07-2009') 
ORDER BY C1.NOMBRECARRERA , C2.NOMBRE;
--APARTADO 15
SELECT C.NOMBRE, C.NACIONALIDAD 
FROM CLIENTES C, APUESTAS A
WHERE C.DNI = A.DNICLIENTE 
GROUP BY C.NOMBRE, C.NACIONALIDAD 
HAVING SUM(A.IMPORTE)>800;
--APARTADO 16
SELECT C.*
FROM CLIENTES C, APUESTAS A
WHERE C.DNI = A.DNICLIENTE(+)
AND A.IMPORTE IS NULL;
