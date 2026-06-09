# Semana 10 – Criação e Alteração de Estruturas (DDL)

## Explicação da semana

Nesta semana, o objetivo foi trabalhar com comandos de **DDL (Data Definition Language)**, ou seja, comandos utilizados para criar, alterar e remover estruturas dentro de um banco de dados.

A prática foi desenvolvida a partir de uma modelagem simplificada inspirada no **Brazilian E-Commerce Public Dataset by Olist**, criando tabelas relacionadas a clientes, produtos e pedidos.

Foram utilizados os seguintes conceitos:

- `CREATE TABLE`
- `ALTER TABLE`
- `DROP TABLE`
- `PRIMARY KEY`
- `FOREIGN KEY`
- `NOT NULL`
- `UNIQUE`
- `DEFAULT`

---

## Banco de dados utilizado

O banco utilizado foi inspirado no:

**Brazilian E-Commerce Public Dataset by Olist**

A modelagem criada nesta prática não reproduz todas as tabelas originais do dataset. O objetivo foi criar uma estrutura simplificada, com três tabelas principais:

| Tabela criada | Finalidade |
|---|---|
| `clientes_tarefa` | Armazenar informações básicas dos clientes |
| `produtos_tarefa` | Armazenar informações básicas dos produtos |
| `pedidos_tarefa` | Registrar pedidos e relacionar clientes com produtos |

---

## Modelo proposto

A estrutura criada representa um sistema simples de comércio eletrônico:

- um cliente pode estar relacionado a pedidos;
- um produto pode aparecer em pedidos;
- a tabela de pedidos funciona como ligação entre clientes e produtos.

---

## Conceitos importantes

### `CREATE TABLE`

O comando `CREATE TABLE` é utilizado para criar uma nova tabela no banco de dados.

Nesta prática, ele foi usado para criar as tabelas:

- `clientes_tarefa`
- `produtos_tarefa`
- `pedidos_tarefa`
- `teste_drop_table`

---

### `PRIMARY KEY`

A chave primária identifica de forma única cada registro de uma tabela.

Na prática:

| Tabela | Chave primária |
|---|---|
| `clientes_tarefa` | `customer_id` |
| `produtos_tarefa` | `product_id` |
| `pedidos_tarefa` | `pedido_item_id` |

---

### `FOREIGN KEY`

A chave estrangeira cria uma relação entre tabelas.

Na tabela `pedidos_tarefa`, foram criadas duas chaves estrangeiras:

| Coluna | Referência |
|---|---|
| `customer_id` | `clientes_tarefa(customer_id)` |
| `product_id` | `produtos_tarefa(product_id)` |

Com isso, cada pedido fica relacionado a um cliente e a um produto.

---

### `NOT NULL`

A restrição `NOT NULL` indica que uma coluna não pode ficar vazia.

Exemplo utilizado:

```sql
customer_id TEXT NOT NULL
```

Nesse caso, todo cliente precisa ter um identificador.

---

### `UNIQUE`

A restrição `UNIQUE` impede que valores se repitam em uma coluna.

Na tabela `clientes_tarefa`, essa restrição foi aplicada em:

```sql
UNIQUE (customer_unique_id)
```

Isso garante que o identificador único do cliente não seja repetido.

---

### `DEFAULT`

A restrição `DEFAULT` define um valor padrão para uma coluna quando nenhum valor é informado.

Exemplos utilizados:

```sql
data_cadastro TEXT DEFAULT CURRENT_TIMESTAMP
```

```sql
order_status TEXT NOT NULL DEFAULT 'created'
```

```sql
canal_venda TEXT DEFAULT 'e-commerce'
```

---

### `ALTER TABLE`

O comando `ALTER TABLE` é usado para alterar uma tabela já existente.

Nesta prática, ele foi usado para adicionar novas colunas:

```sql
ALTER TABLE clientes_tarefa
ADD COLUMN telefone_cliente TEXT;
```

```sql
ALTER TABLE pedidos_tarefa
ADD COLUMN canal_venda TEXT DEFAULT 'e-commerce';
```

---

### `DROP TABLE`

O comando `DROP TABLE` remove uma tabela do banco de dados.

Nesta prática, foi criada uma tabela de teste chamada `teste_drop_table` e depois ela foi apagada:

```sql
CREATE TABLE teste_drop_table (
    id INTEGER NOT NULL,
    descricao TEXT NOT NULL,
    PRIMARY KEY (id)
);

DROP TABLE teste_drop_table;
```

---

## Código utilizado

```sql
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
```

---

## Resultado da execução

Após executar o código no SQLite, foram criadas as seguintes tabelas:

| name |
|---|
| `sqlite_sequence` |
| `clientes_tarefa` |
| `produtos_tarefa` |
| `pedidos_tarefa` |

A tabela `sqlite_sequence` foi criada automaticamente pelo SQLite por causa do uso de `AUTOINCREMENT` na tabela `pedidos_tarefa`.

---

## Verificação da prática

A execução da consulta abaixo confirmou que as tabelas foram criadas no banco:

```sql
SELECT name
FROM sqlite_master
WHERE type = 'table';
```

O resultado retornou as tabelas `clientes_tarefa`, `produtos_tarefa` e `pedidos_tarefa`, confirmando que a estrutura foi criada corretamente.

---

## Conclusão

A prática permitiu compreender como criar e alterar estruturas de tabelas em SQL usando comandos DDL.

Foram criadas tabelas para clientes, produtos e pedidos, com definição de chaves primárias e estrangeiras. Também foram aplicadas restrições importantes, como `NOT NULL`, `UNIQUE` e `DEFAULT`.

Além disso, o comando `ALTER TABLE` foi utilizado para adicionar colunas em tabelas existentes, e o comando `DROP TABLE` foi utilizado para excluir uma tabela de teste.

Dessa forma, a atividade demonstrou como estruturar um banco de dados relacional simples inspirado em um cenário real de comércio eletrônico.
