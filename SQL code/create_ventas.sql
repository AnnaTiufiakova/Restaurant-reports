CREATE TABLE ventas (
    id INT PRIMARY KEY,  -- Unique ID for each row
    local TEXT NOT NULL,    -- Store name or location
    fecha DATE NOT NULL,    -- Date of transaction
    efectivo NUMERIC(12,2), -- Cash payments
    bbva NUMERIC(12,2),     -- BBVA bank transactions
    rappi NUMERIC(12,2),    -- Rappi transactions
    davivienda NUMERIC(12,2) -- Davivienda bank transactions
);