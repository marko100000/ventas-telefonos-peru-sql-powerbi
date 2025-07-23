--Consultas usadas para análisis
SELECT TOP 5 * FROM vendedores;
SELECT TOP 5 * FROM productos;
SELECT TOP 5 * FROM ventas;

--Total de ventas por ciudad
SELECT v.ciudad, SUM(ve.unidades * p.precio_venta) AS total_ventas
FROM ventas ve
JOIN vendedores v ON ve.representante = v.representante
JOIN productos p ON ve.codigo_producto = p.codigo_producto
GROUP BY v.ciudad
ORDER BY total_ventas DESC;

--Margen de ganancia por producto
SELECT p.descripcion,
       SUM(ve.unidades) AS unidades_vendidas,
       SUM(ve.unidades * (p.precio_venta - p.costo_venta)) AS ganancia_total
FROM ventas ve
JOIN productos p ON ve.codigo_producto = p.codigo_producto
GROUP BY p.descripcion
ORDER BY ganancia_total DESC;