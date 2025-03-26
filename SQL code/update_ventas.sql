INSERT INTO ventas (id, local, fecha, efectivo, bbva, rappi, davivienda)  
SELECT id, local, fecha, efectivo, bbva, rappi, davivienda  
FROM temp_table t  
WHERE NOT EXISTS (
    SELECT 1 FROM ventas2 v
    WHERE v.id = t.id
);