--1. Número de clientes que tienen alguna factura con IVA 16%.
SELECT COUNT(CODCLI)
FROM FACTURAS
WHERE IVA = 16;
--2. Número de clientes que no tienen ninguna factura con un 16% de IVA.
SELECT COUNT(CODCLI)
FROM FACTURAS
WHERE IVA NOT IN 16;
--3. Número de clientes que en todas sus facturas tienen un 16% de IVA (los clientes deben tener al menos una factura).
SELECT COUNT(CODCLI)
FROM FACTURAS
WHERE IVA = 16;
--4. Fecha de la factura con mayor importe (sin tener en cuenta descuentos ni impuestos).
SELECT FACTURAS.FECHA
FROM FACTURAS, LINEAS_FAC 
WHERE FACTURAS.CODFAC(+) = LINEAS_FAC.CODFAC
GROUP BY FECHA
HAVING MAX(LINEAS_FAC.PRECIO) IN (SELECT MAX(PRECIO)
                                  FROM LINEAS_FAC);
--5. Número de pueblos en los que no tenemos clientes.
SELECT COUNT(PUEBLOS.CODPUE)
FROM PUEBLOS, CLIENTES
WHERE PUEBLOS.CODPUE = CLIENTES.CODPUE(+)
AND CLIENTES.CODPUE IS NULL;
--6. Número de artículos cuyo stock supera las 20 unidades, con precio superior a 15 euros y de los que no hay ninguna factura 
--en el último trimestre del año pasado.
SELECT COUNT(ARTICULOS.CODART)
FROM ARTICULOS, LINEAS_FAC
WHERE ARTICULOS.CODART(+) = LINEAS_FAC.CODART
AND ARTICULOS.STOCK > 20
AND ARTICULOS.PRECIO > 15
AND LINEAS_FAC.CODFAC IN (SELECT CODFAC
                          FROM FACTURAS
                          WHERE EXTRACT(MONTH FROM SYSDATE) NOT BETWEEN 10 AND 12);
--7. Obtener el número de clientes que en todas las facturas del año pasado han pagado IVA (no se ha pagado IVA si es cero o nulo).
SELECT COUNT(CODCLI)
FROM FACTURAS
WHERE EXTRACT(YEAR FROM FECHA) = EXTRACT(YEAR FROM sysdate)-1
AND IVA IS NOT NULL
AND IVA NOT IN 0;
--8. Clientes (código y nombre) que fueron preferentes durante el mes de noviembre del año pasado y que en diciembre de ese 
--mismo año no tienen ninguna factura. Son clientes preferentes de un mes aquellos que han solicitado más de 60,50 euros en 
--facturas durante ese mes, sin tener en cuenta descuentos ni impuestos.
SELECT CLIENTES.CODCLI, CLIENTES.NOMBRE
FROM CLIENTES, FACTURAS, LINEAS_FAC
WHERE CLIENTES.CODCLI(+) = FACTURAS.CODCLI
AND FACTURAS.CODFAC = LINEAS_FAC.CODFAC
AND (EXTRACT(MONTH FROM FACTURAS.FECHA) = 11
AND EXTRACT(YEAR FROM FECHA) = EXTRACT(YEAR FROM sysdate)-1
AND LINEAS_FAC.PRECIO > 60.50)
AND (EXTRACT(MONTH FROM FACTURAS.FECHA) = 12
AND EXTRACT(YEAR FROM FECHA) = EXTRACT(YEAR FROM sysdate)-1
AND FACTURAS.CODFAC IS NULL);
--9. Código, descripción y precio de los diez artículos más caros.
SELECT CODART, DESCRIP, PRECIO
FROM ARTICULOS
WHERE ROWNUM < 10;
--10. Nombre de la provincia con mayor número de clientes.
SELECT PROVINCIAS.NOMBRE
FROM PROVINCIAS, PUEBLOS
WHERE PROVINCIAS.CODPRO = PUEBLOS.CODPRO
GROUP BY PROVINCIAS.NOMBRE
HAVING MAX(PUEBLOS.CODPUE) IN (SELECT MAX(CODPUE)
                                 FROM CLIENTES);
--11. Código y descripción de los artículos cuyo precio es mayor de 90,15 euros y se han vendido menos de 10 unidades (o ninguna) durante el año pasado.
SELECT CODART, DESCRIP
FROM ARTICULOS
WHERE PRECIO > 90.15
AND CODART IN (SELECT LINEAS_FAC.CODART
               FROM LINEAS_FAC, FACTURAS
               WHERE LINEAS_FAC.CODFAC = FACTURAS.CODFAC
               AND LINEAS_FAC.CANT < 10
               AND EXTRACT(YEAR FROM FACTURAS.FECHA) = EXTRACT(YEAR FROM sysdate)-1);
--12. Código y descripción de los artículos cuyo precio es más de tres mil veces mayor que el precio mínimo de cualquier artículo.
SELECT CODART, DESCRIP
FROM ARTICULOS 
WHERE PRECIO > (SELECT MIN(PRECIO)*3000
                FROM ARTICULOS);
--13. Nombre del cliente con mayor facturación.
SELECT CLIENTES.NOMBRE
FROM CLIENTES, FACTURAS, LINEAS_FAC
WHERE CLIENTES.CODCLI = FACTURAS.CODCLI
AND FACTURAS.CODFAC = LINEAS_FAC.CODFAC
GROUP BY CLIENTES.NOMBRE
HAVING MAX(LINEAS_FAC.PRECIO) IN (SELECT MAX(PRECIO)
                               FROM LINEAS_FAC);
--14. Código y descripción de aquellos artículos con un precio superior a la media y que hayan sido comprados por más de 5 clientes.
SELECT ARTICULOS.CODART, ARTICULOS.DESCRIP
FROM ARTICULOS, LINEAS_FAC, FACTURAS
WHERE ARTICULOS.CODART = LINEAS_FAC.CODART
AND LINEAS_FAC.CODFAC = FACTURAS.CODFAC
AND ARTICULOS.PRECIO > (SELECT AVG(NVL(PRECIO,0))
                        FROM ARTICULOS)
GROUP BY ARTICULOS.CODART, ARTICULOS.DESCRIP                        
HAVING COUNT(FACTURAS.CODCLI) > 5;                        

                   
