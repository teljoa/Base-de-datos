--1. Mostrar el identificador de los alumnos matriculados en cualquier asignatura excepto la '150212' y la '130113'.
SELECT IDALUMNO
FROM ALUMNO_ASIGNATURA
WHERE IDASIGNATURA NOT IN ('150212','130113');
--2. Mostrar el nombre de las asignaturas que tienen más créditos que "Seguridad Vial". 
SELECT DISTINCT NOMBRE
FROM ASIGNATURA
WHERE CREDITOS > (SELECT CREDITOS 
                  FROM ASIGNATURA 
                  WHERE NOMBRE LIKE 'Seguridad Vial');
--3. Obtener el Id de los alumnos matriculados en las asignaturas "150212" y "130113" a la vez. 
SELECT DISTINCT IDALUMNO
FROM ALUMNO_ASIGNATURA
WHERE IDASIGNATURA  IN ('150212', '130113');
--4. Mostrar el Id de los alumnos matriculados en las asignatura "150212" ó "130113", en una o en otra pero no en ambas a la vez. 
SELECT IDALUMNO
FROM ALUMNO_ASIGNATURA
WHERE IDASIGNATURA  IN '150212' 
OR IDASIGNATURA  IN '130113';
--5. Mostrar el nombre de las asignaturas de la titulación "130110" cuyos costes básicos sobrepasen el coste básico promedio 
--por asignatura en esa titulación.
SELECT NOMBRE 
FROM ASIGNATURA
WHERE IDTITULACION LIKE '130110'
AND COSTEBASICO > (SELECT AVG(COSTEBASICO)
                   FROM ASIGNATURA
                   WHERE IDTITULACION LIKE '130110');
--6. Mostrar el identificador de los alumnos matriculados en cualquier asignatura excepto la "150212" y la "130113”
SELECT IDALUMNO
FROM ALUMNO_ASIGNATURA
WHERE IDASIGNATURA NOT  IN ('150212', '130113');
--7. Mostrar el Id de los alumnos matriculados en la asignatura "150212" pero no en la "130113". 
SELECT IDALUMNO
FROM ALUMNO_ASIGNATURA
WHERE IDASIGNATURA IN '150212' 
AND IDASIGNATURA NOT IN '130113';
--8. Mostrar el nombre de las asignaturas que tienen más créditos que "Seguridad Vial". 
SELECT DISTINCT NOMBRE
FROM ASIGNATURA
WHERE CREDITOS > (SELECT CREDITOS
                  FROM ASIGNATURA
                  WHERE NOMBRE LIKE 'Seguridad Vial');
--9. Mostrar las personas que no son ni profesores ni alumnos.
SELECT *
FROM PERSONA
WHERE (DNI NOT IN (SELECT DNI
                  FROM PROFESOR)
AND DNI NOT IN (SELECT DNI
                FROM ALUMNO));
--10. Mostrar el nombre de las asignaturas que tengan más créditos. 
SELECT DISTINCT NOMBRE 
FROM ASIGNATURA
WHERE CREDITOS = (SELECT MAX(CREDITOS)
                 FROM ASIGNATURA);
--11. Lista de asignaturas en las que no se ha matriculado nadie. 
SELECT ASIGNATURA.NOMBRE
FROM ASIGNATURA, ALUMNO_ASIGNATURA
WHERE ALUMNO_ASIGNATURA.IDASIGNATURA(+) = ASIGNATURA.IDASIGNATURA
AND NUMEROMATRICULA IS NULL;
--12. Ciudades en las que vive algún profesor y también algún alumno. 
SELECT DISTINCT CIUDAD
FROM PERSONA P, ALUMNO A
WHERE A.DNI =P.DNI 
AND P.CIUDAD IN (SELECT CIUDAD
				 FROM PERSONA p2,PROFESOR p3
				 WHERE P2.DNI=P3.DNI);
			  
			  










































