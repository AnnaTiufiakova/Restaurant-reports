-- The query is written for one month. Please change the month number in the lines where 'EXTRACT(month FROM fecha) =' appears.

SELECT 
    local,
    EXTRACT(month FROM fecha) AS mes,
    SUM(
        COALESCE(efectivo, 0) + 
        COALESCE(bbva, 0) + 
        COALESCE(rappi, 0) + 
        COALESCE(davivienda, 0)
    ) AS ventas_total_por_local
FROM ventas 
WHERE EXTRACT(month FROM fecha) = 9
GROUP BY local, mes
ORDER BY local;
