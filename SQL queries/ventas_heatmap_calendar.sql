SELECT 
        fecha, 
        local,
        TRIM(TO_CHAR(fecha, 'Day')) AS dia_semana,  
        SUM(COALESCE(efectivo, 0) + COALESCE(bbva, 0) + COALESCE(rappi, 0) + COALESCE(davivienda, 0)) AS ventas_total
FROM ventas
GROUP BY fecha, local
ORDER BY fecha, local