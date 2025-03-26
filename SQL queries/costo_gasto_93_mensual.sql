-- The query is written for one month. Please change the month number in the lines where 'EXTRACT(month FROM fecha) =' appears.

SELECT
    'COSTOS' AS tipo,
    COALESCE(categoria, 'TOTAL') AS categoria, 
    SUM(valor2) as valor
FROM costo_gasto_93  
WHERE categoria IN (
    'ARRIENDO/ADMINISTRACION', 'GAS', 'LUZ', 'AGUA', 'DATAFONO', 'VIGILANCIA', 
    'MOVISTAR', 'ETB', 'DIRECTV', 'NOMINA', 'DOMINICALES', 'PRIMAS', 
    'LIQUIDACION CONTRATO', 'PARAFISCALES'
) and EXTRACT(month FROM fecha) = 9
GROUP BY ROLLUP (categoria)
UNION ALL
SELECT 
    'GASTOS' AS tipo,
    COALESCE(categoria, 'TOTAL') AS categoria, 
    SUM(valor2) as valor
FROM costo_gasto_93  
WHERE categoria IN ('PROTEINA', 'ABARROTES', 'FRUVER', 
'BEBIDA NO ALCOHOLICA', 'BEBIDA ALCOHOLICA', 'ASEO', 
'DESECHABLES', 'COMIDA PARA PERSONAL', 'PUBLICIDAD', 
'MANTENIMIENTO', 'TRANSPORTE', 'OTRO', 
'NO RELACIONADO CON EL RESTAURANTE'
) and EXTRACT(month FROM fecha) = 9
GROUP BY ROLLUP (categoria);

