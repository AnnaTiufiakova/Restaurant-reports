-- The query is written for one month. Please change the month number in the lines where 'EXTRACT(month FROM fecha) =' appears.

SELECT 
    CASE 
        WHEN centro_costo IN ('RESTAURANTE', 'BAR', 'DESECHABLES') THEN 'RESTAURANTE'
        ELSE centro_costo
    END AS centro_costo, 
    SUM(ventas) AS total_ventas
FROM local_93 
WHERE EXTRACT(month FROM fecha) = 9
GROUP BY centro_costo
ORDER BY total_ventas DESC;
