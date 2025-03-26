-- The query is written for one month. Please change the month number in the lines where 'EXTRACT(month FROM fecha) =' appears.

SELECT 
    local, 
    SUM(COALESCE(rappi, 0)) AS ventas,
    'RAPPI' as categoria
FROM ventas
WHERE EXTRACT(month FROM fecha) = 9
GROUP BY local
UNION ALL
SELECT 
    local, 
        SUM(
        COALESCE(efectivo, 0) + 
        COALESCE(bbva, 0) + 
        COALESCE(davivienda, 0)
    ) AS ventas,
    'RESTAURANTE' as categoria
FROM ventas
WHERE EXTRACT(month FROM fecha) = 9
GROUP BY local;
