WITH categorias AS (
    SELECT unnest(ARRAY[
        'ARRIENDO/ADMINISTRACION', 'GAS', 'LUZ', 'AGUA', 'DATAFONO', 'VIGILANCIA', 
        'MOVISTAR', 'ETB', 'DIRECTV', 'NOMINA', 'DOMINICALES', 'PRIMAS', 
        'LIQUIDACION CONTRATO', 'PARAFISCALES', 'PROTEINA', 'ABARROTES', 'FRUVER', 
        'BEBIDA NO ALCOHOLICA', 'BEBIDA ALCOHOLICA', 'ASEO', 
        'DESECHABLES', 'COMIDA PARA PERSONAL', 'PUBLICIDAD', 
        'MANTENIMIENTO', 'TRANSPORTE', 'OTRO', 
        'NO RELACIONADO CON EL RESTAURANTE'
    ]) AS categoria
), 

data AS (
    SELECT
        CASE 
            WHEN c.categoria IN (
                'ARRIENDO/ADMINISTRACION', 'GAS', 'LUZ', 'AGUA', 'DATAFONO', 'VIGILANCIA', 
                'MOVISTAR', 'ETB', 'DIRECTV', 'NOMINA', 'DOMINICALES', 'PRIMAS', 
                'LIQUIDACION CONTRATO', 'PARAFISCALES'
            ) THEN 'COSTOS'
            ELSE 'GASTOS'
        END AS tipo,
        c.categoria,
        COALESCE(SUM(CASE WHEN EXTRACT(month FROM cg.fecha) = 9 THEN cg.valor2 END), 0) AS septiembre,
        COALESCE(SUM(CASE WHEN EXTRACT(month FROM cg.fecha) = 10 THEN cg.valor2 END), 0) AS octubre,
        COALESCE(SUM(CASE WHEN EXTRACT(month FROM cg.fecha) = 11 THEN cg.valor2 END), 0) AS noviembre
    FROM categorias c
    LEFT JOIN costo_gasto_uni cg 
        ON c.categoria = cg.categoria
    GROUP BY tipo, c.categoria
)

SELECT * FROM data
ORDER BY tipo, categoria;
