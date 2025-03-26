CREATE TABLE costo_gasto_93 (
    id INT PRIMARY KEY,
    fecha DATE NOT NULL, 
    valor1 NUMERIC(12,2),
    centro_de_costo TEXT,	
    numero_de_nit_proveedor TEXT,
    nombre_de_proveedor	TEXT, 
    categoria TEXT,
    concepto TEXT,
    no_factura TEXT,
    valor2 NUMERIC(12,2),
    metodo_de_pago TEXT
);