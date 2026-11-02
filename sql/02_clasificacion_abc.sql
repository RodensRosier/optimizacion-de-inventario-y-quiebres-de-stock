-- Clasificación ABC Dinámica (Curva de Pareto 80/20)
WITH costo_por_producto AS (
    SELECT 
        producto,
        categoria,
        SUM(costo_almacenamiento) AS costo_total
    FROM movimientos_inventario
    GROUP BY producto, categoria
),
costo_acumulado AS (
    SELECT 
        producto,
        categoria,
        costo_total,
        SUM(costo_total) OVER (ORDER BY costo_total DESC) AS costo_cum,
        SUM(costo_total) OVER () AS costo_total_general
    FROM costo_por_producto
)
SELECT 
    producto,
    categoria,
    ROUND(costo_total, 2) AS costo_total_almacenamiento,
    ROUND((costo_cum * 100.0 / costo_total_general), 2) AS porcentaje_acumulado,
    CASE 
        WHEN (costo_cum * 100.0 / costo_total_general) <= 80 THEN 'Clase A'
        WHEN (costo_cum * 100.0 / costo_total_general) <= 95 THEN 'Clase B'
        ELSE 'Clase C'
    END AS clasificacion_abc
FROM costo_acumulado
ORDER BY costo_total DESC;