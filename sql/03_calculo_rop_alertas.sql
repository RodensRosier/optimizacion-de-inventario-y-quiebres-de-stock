-- Métricas Base para Stock de Seguridad y Punto de Reorden (ROP)
SELECT 
    almacen,
    provincia,
    producto,
    categoria,
    COUNT(id_movimiento) AS frecuencia_movimientos,
    ROUND(AVG(cantidad), 2) AS demanda_promedio_diaria,
    ROUND(SUM(costo_almacenamiento), 2) AS costo_almacenamiento_total
FROM movimientos_inventario
GROUP BY almacen, provincia, producto, categoria
ORDER BY demanda_promedio_diaria DESC;