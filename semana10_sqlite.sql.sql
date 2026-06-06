DROP TABLE IF EXISTS pedidos_tarefa;
DROP TABLE IF EXISTS produtos_tarefa;
DROP TABLE IF EXISTS clientes_tarefa;
DROP TABLE IF EXISTS teste_drop_table;

CREATE TABLE clientes_tarefa (
    customer_id TEXT NOT NULL,
    customer_unique_id TEXT NOT NULL,
    customer_zip_code_prefix TEXT NOT NULL,
    customer_city TEXT NOT NULL,
    customer_state TEXT NOT NULL,
    data_cadastro TEXT DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (customer_id),
    UNIQUE (customer_unique_id)
);

CREATE TABLE produtos_tarefa (
    product_id TEXT NOT NULL,
    product_category_name TEXT,
    product_weight_g INTEGER,
    product_length_cm INTEGER,
    product_height_cm INTEGER,
    product_width_cm INTEGER,
    PRIMARY KEY (product_id)
);

CREATE TABLE pedidos_tarefa (
    pedido_item_id INTEGER PRIMARY KEY AUTOINCREMENT,
    order_id TEXT NOT NULL,
    customer_id TEXT NOT NULL,
    product_id TEXT NOT NULL,
    order_status TEXT NOT NULL DEFAULT 'created',
    order_purchase_timestamp TEXT,
    price REAL NOT NULL DEFAULT 0,
    freight_value REAL NOT NULL DEFAULT 0,
    FOREIGN KEY (customer_id) REFERENCES clientes_tarefa(customer_id),
    FOREIGN KEY (product_id) REFERENCES produtos_tarefa(product_id)
);

ALTER TABLE clientes_tarefa
ADD COLUMN telefone_cliente TEXT;

ALTER TABLE pedidos_tarefa
ADD COLUMN canal_venda TEXT DEFAULT 'e-commerce';

CREATE TABLE teste_drop_table (
    id INTEGER NOT NULL,
    descricao TEXT NOT NULL,
    PRIMARY KEY (id)
);

DROP TABLE teste_drop_table;

SELECT name
FROM sqlite_master
WHERE type = 'table';
