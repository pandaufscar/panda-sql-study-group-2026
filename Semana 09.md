# Semana 9 — Manipulação de Dados (DML)

Nesta semana, vamos aprender sobre **DML (Data Manipulation Language)**.

Os comandos DML são utilizados para manipular os dados armazenados em uma tabela.

Até agora utilizamos principalmente consultas para visualizar informações. Nesta semana vamos aprender como inserir, atualizar e remover registros.

Os principais comandos são:

* INSERT
* UPDATE
* DELETE

Esses comandos são muito utilizados em sistemas de cadastro, e-commerce, bancos, aplicativos e qualquer sistema que precise armazenar informações.

---

## INSERT

O comando `INSERT` é utilizado para adicionar novos registros em uma tabela.

### Exemplo

```sql
INSERT INTO clientes (
    customer_id,
    customer_city,
    customer_state
)
VALUES (
    'C001',
    'São Carlos',
    'SP'
);
```

Resultado: Um novo cliente é inserido na tabela.

---

## UPDATE

O comando `UPDATE` é utilizado para alterar informações já existentes.

### Exemplo

```sql
UPDATE clientes
SET customer_city = 'Araraquara'
WHERE customer_id = 'C001';
```

Resultado: A cidade do cliente foi atualizada.

---

## DELETE

O comando `DELETE` é utilizado para remover registros.

### Exemplo

```sql
DELETE FROM clientes
WHERE customer_id = 'C001';
```

Resultado: O cliente foi removido da tabela.

---

## Cuidados importantes

⚠️ Sempre utilize `WHERE` em comandos UPDATE e DELETE.

Sem o WHERE, todos os registros da tabela podem ser alterados ou removidos.

Exemplo perigoso:

```sql
DELETE FROM clientes;
```

Esse comando remove todos os registros da tabela.

---

# Prática

## 1 - Criar uma tabela de testes baseada em dados do banco Olist

```sql
CREATE TABLE clientes_teste AS
SELECT
    customer_id,
    customer_city,
    customer_state
FROM olist_customers_dataset
LIMIT 100;
```

Resultado: Foi criada uma tabela de testes contendo 100 clientes da base Olist.

---

## 2 - Inserir novos registros simulando novos clientes

```sql
INSERT INTO clientes_teste (
    customer_id,
    customer_city,
    customer_state
)
VALUES
(
    'CLIENTE_TESTE_001',
    'São Carlos',
    'SP'
);
```

Resultado: Um novo cliente foi inserido na tabela de testes.

---

## 3 - Atualizar informações de registros existentes

```sql
UPDATE clientes_teste
SET customer_city = 'Descalvado'
WHERE customer_id = 'CLIENTE_TESTE_001';
```

Resultado: A cidade do cliente foi alterada para Descalvado.

---

## 4 - Remover registros incorretos utilizando subquery

```sql
DELETE FROM clientes_teste
WHERE customer_id IN
(
    SELECT customer_id
    FROM
    (
        SELECT customer_id
        FROM clientes_teste
        WHERE customer_id = 'CLIENTE_TESTE_001'
    ) AS subconsulta
);
```

Resultado: O registro inserido para teste foi removido da tabela.

---

