-- Consolidación de Demanda Histórica y Costos Mensuales
SELECT 
    strftime('%Y-%m', fecha) AS anio_mes,
    categoria,
    producto,
    COUNT(id_movimiento) AS total_movimientos,
    SUM(cantidad) AS unidades_movidas,
    ROUND(SUM(costo_almacenamiento), 2) AS costo_almacenamiento_total
FROM movimientos_inventario
GROUP BY anio_mes, categoria, producto
ORDER BY anio_mes DESC, costo_almacenamiento_total DESC;