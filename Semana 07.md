# Semana 7 - JOINs (Parte 2) e Operações de Conjunto

## O que será abordado nesta semana:
* RIGHT JOIN
* FULL JOIN
* UNION
* UNION ALL
* INTERSECT
* EXCEPT

## Prática:
* Comparar resultados obtidos com diferentes tipos de JOIN
* Unir resultados de diferentes consultas de clientes
* Identificar registros presentes em uma tabela e ausentes em outra
* Encontrar produtos que nunca apareceram em pedidos

(Será utilizado o banco de dados *Brazilian E-Commerce Public Dataset by Olist*)

---

## Revisando JOINs

Na semana anterior, vimos que os comandos `JOIN` são utilizados para combinar informações de duas ou mais tabelas com base em uma coluna em comum.

Nesta semana, vamos continuar estudando outros tipos de JOIN e também operações de conjunto, que permitem combinar ou comparar resultados de diferentes consultas SQL.

---

## RIGHT JOIN

O `RIGHT JOIN`, também chamado de `RIGHT OUTER JOIN`, retorna todos os registros da tabela da direita e apenas os registros correspondentes da tabela da esquerda.

Caso algum registro da tabela da direita não tenha correspondência na tabela da esquerda, os campos da tabela da esquerda aparecerão como `NULL`.

### Sintaxe Básica:

```sql
SELECT colunas_desejadas
FROM tabela_A
RIGHT JOIN tabela_B
    ON tabela_A.coluna_comum = tabela_B.coluna_comum;
```

### Exemplo:

Listar todos os pedidos e seus respectivos clientes, mantendo todos os registros da tabela de pedidos.

```sql
SELECT c.customer_id, c.customer_unique_id, c.customer_city,
       o.order_id, o.order_status
FROM olist_customers_dataset c
RIGHT JOIN olist_orders_dataset o
    ON c.customer_id = o.customer_id;
```

**Parte dos Resultados:**

| customer_id | customer_unique_id | customer_city | order_id | order_status |
| :--- | :--- | :--- | :--- | :--- |
| 06b8999e2fba1a1fbc88172c00ba8bc7 | 861eff4711a542e4b93843c6dd7febb0 | franca | 00e7ee1b05068499577073aeb2a297a1 | delivered |
| 18955e83d337fd6b2def6b18a428ac77 | 290c77bc529b7ac935b93aa66c333dc3 | sao bernardo do campo | 2915012766685892b6eab3eec79f59c7 | delivered |
| 4e7b3e00288586ebd08712fdd0374803 | 060e732b5b29e8181a18229c7b0b2b5e | sao paulo | b2059ed67ce144a36e2aa97d2c9e9ad2 | delivered |
| b2b6027bc5c51096529d4dc6358b12c3 | 259dac757896d24d7702b9acbbff3f3c | mogi das cruzes | 951670192359f4fe4a63112aa7306eba | delivered |

---

## FULL JOIN

O `FULL JOIN`, também chamado de `FULL OUTER JOIN`, retorna todos os registros das duas tabelas.

Quando houver correspondência entre as tabelas, os dados aparecem juntos. Quando não houver correspondência, os campos da tabela sem correspondência aparecem como `NULL`.

Em outras palavras, o `FULL JOIN` combina o comportamento do `LEFT JOIN` com o `RIGHT JOIN`.

### Sintaxe Básica:

```sql
SELECT colunas_desejadas
FROM tabela_A
FULL JOIN tabela_B
    ON tabela_A.coluna_comum = tabela_B.coluna_comum;
```

### Exemplo:

Listar todos os clientes e todos os pedidos, mesmo que algum cliente não tenha pedido ou algum pedido não tenha cliente relacionado.

```sql
SELECT c.customer_id, c.customer_unique_id, c.customer_city,
       o.order_id, o.order_status
FROM olist_customers_dataset c
FULL JOIN olist_orders_dataset o
    ON c.customer_id = o.customer_id;
```

> Observação: alguns bancos de dados, como o MySQL, não possuem suporte direto ao `FULL JOIN`. Nesse caso, é possível simular usando `LEFT JOIN`, `RIGHT JOIN` e `UNION`.

### Simulando FULL JOIN no MySQL:

```sql
SELECT c.customer_id, c.customer_unique_id, c.customer_city,
       o.order_id, o.order_status
FROM olist_customers_dataset c
LEFT JOIN olist_orders_dataset o
    ON c.customer_id = o.customer_id

UNION

SELECT c.customer_id, c.customer_unique_id, c.customer_city,
       o.order_id, o.order_status
FROM olist_customers_dataset c
RIGHT JOIN olist_orders_dataset o
    ON c.customer_id = o.customer_id;
```

---

## Comparando INNER JOIN, LEFT JOIN e RIGHT JOIN

### INNER JOIN

Retorna apenas os registros que possuem correspondência nas duas tabelas.

```sql
SELECT c.customer_id, c.customer_unique_id,
       o.order_id, o.order_status
FROM olist_customers_dataset c
INNER JOIN olist_orders_dataset o
    ON c.customer_id = o.customer_id;
```

### LEFT JOIN

Retorna todos os clientes, mesmo aqueles que não possuem pedidos.

```sql
SELECT c.customer_id, c.customer_unique_id,
       o.order_id, o.order_status
FROM olist_customers_dataset c
LEFT JOIN olist_orders_dataset o
    ON c.customer_id = o.customer_id;
```

### RIGHT JOIN

Retorna todos os pedidos, mesmo aqueles que não possuem cliente correspondente.

```sql
SELECT c.customer_id, c.customer_unique_id,
       o.order_id, o.order_status
FROM olist_customers_dataset c
RIGHT JOIN olist_orders_dataset o
    ON c.customer_id = o.customer_id;
```

---

## Operações de Conjunto

As operações de conjunto permitem combinar resultados de duas ou mais consultas SQL.

Elas são úteis quando queremos unir, comparar ou encontrar diferenças entre conjuntos de dados.

As principais operações são:

* `UNION`
* `UNION ALL`
* `INTERSECT`
* `EXCEPT`

Para utilizar operações de conjunto, as consultas precisam retornar a mesma quantidade de colunas e tipos de dados compatíveis.

---

## UNION

O `UNION` combina o resultado de duas ou mais consultas e remove registros duplicados.

### Sintaxe Básica:

```sql
SELECT coluna1, coluna2
FROM tabela_A

UNION

SELECT coluna1, coluna2
FROM tabela_B;
```

### Exemplo:

Unir clientes dos estados de São Paulo e Rio de Janeiro.

```sql
SELECT customer_id, customer_unique_id, customer_city, customer_state
FROM olist_customers_dataset
WHERE customer_state = 'SP'

UNION

SELECT customer_id, customer_unique_id, customer_city, customer_state
FROM olist_customers_dataset
WHERE customer_state = 'RJ';
```

**Parte dos Resultados:**

| customer_id | customer_unique_id | customer_city | customer_state |
| :--- | :--- | :--- | :--- |
| 06b8999e2fba1a1fbc88172c00ba8bc7 | 861eff4711a542e4b93843c6dd7febb0 | franca | SP |
| 4e7b3e00288586ebd08712fdd0374803 | 060e732b5b29e8181a18229c7b0b2b5e | sao paulo | SP |
| 5aa9e4fdd4dfd20959cad2d772509598 | 2a46fb94aef5cbeeb850418118cee090 | rio de janeiro | RJ |
| eabebad39a88bb6f5b52376faec28612 | 295c05681917928d762456842748184d | sao paulo | SP |

---

## UNION ALL

O `UNION ALL` também combina o resultado de duas ou mais consultas, porém não remove registros duplicados.

Isso significa que, se o mesmo registro aparecer nas duas consultas, ele será exibido mais de uma vez.

### Sintaxe Básica:

```sql
SELECT coluna1, coluna2
FROM tabela_A

UNION ALL

SELECT coluna1, coluna2
FROM tabela_B;
```

### Exemplo:

Unir clientes dos estados de São Paulo e Rio de Janeiro, mantendo possíveis duplicações.

```sql
SELECT customer_id, customer_unique_id, customer_city, customer_state
FROM olist_customers_dataset
WHERE customer_state = 'SP'

UNION ALL

SELECT customer_id, customer_unique_id, customer_city, customer_state
FROM olist_customers_dataset
WHERE customer_state = 'RJ';
```

---

## Diferença entre UNION e UNION ALL

| Comando | Remove duplicados? | Quando usar |
| :--- | :---: | :--- |
| UNION | Sim | Quando queremos apenas registros únicos |
| UNION ALL | Não | Quando queremos manter todos os resultados, inclusive repetidos |

Exemplo simples com `UNION`:

```sql
SELECT customer_state
FROM olist_customers_dataset
WHERE customer_state = 'SP'

UNION

SELECT customer_state
FROM olist_customers_dataset
WHERE customer_state = 'SP';
```

Resultado:

| customer_state |
| :--- |
| SP |

Exemplo simples com `UNION ALL`:

```sql
SELECT customer_state
FROM olist_customers_dataset
WHERE customer_state = 'SP'

UNION ALL

SELECT customer_state
FROM olist_customers_dataset
WHERE customer_state = 'SP';
```

Resultado:

| customer_state |
| :--- |
| SP |
| SP |

---

## INTERSECT

O `INTERSECT` retorna apenas os registros que aparecem nos resultados das duas consultas.

Matematicamente, ele representa a interseção entre dois conjuntos.

### Sintaxe Básica:

```sql
SELECT coluna1, coluna2
FROM tabela_A

INTERSECT

SELECT coluna1, coluna2
FROM tabela_B;
```

### Exemplo:

Encontrar clientes que aparecem em duas consultas diferentes.

```sql
SELECT customer_unique_id
FROM olist_customers_dataset
WHERE customer_state = 'SP'

INTERSECT

SELECT c.customer_unique_id
FROM olist_customers_dataset c
INNER JOIN olist_orders_dataset o
    ON c.customer_id = o.customer_id;
```

Esse exemplo retorna clientes únicos do estado de São Paulo que também possuem pedidos cadastrados.

> Observação: em alguns bancos, como MySQL em versões antigas, o `INTERSECT` pode não estar disponível diretamente. Nesses casos, podemos simular usando `INNER JOIN`.

### Simulando INTERSECT com INNER JOIN:

```sql
SELECT DISTINCT c.customer_unique_id
FROM olist_customers_dataset c
INNER JOIN olist_orders_dataset o
    ON c.customer_id = o.customer_id
WHERE c.customer_state = 'SP';
```

---

## EXCEPT

O `EXCEPT` retorna os registros que aparecem na primeira consulta, mas não aparecem na segunda.

Matematicamente, ele representa a diferença entre dois conjuntos.

### Sintaxe Básica:

```sql
SELECT coluna1, coluna2
FROM tabela_A

EXCEPT

SELECT coluna1, coluna2
FROM tabela_B;
```

### Exemplo:

Identificar clientes cadastrados que não possuem pedidos.

```sql
SELECT customer_id
FROM olist_customers_dataset

EXCEPT

SELECT customer_id
FROM olist_orders_dataset;
```

Esse comando retorna os clientes que existem na tabela de clientes, mas não aparecem na tabela de pedidos.

> Observação: em alguns bancos, como MySQL em versões antigas, o `EXCEPT` também pode não estar disponível diretamente. Nesses casos, podemos simular usando `LEFT JOIN` com `IS NULL`.

### Simulando EXCEPT com LEFT JOIN:

```sql
SELECT c.customer_id, c.customer_unique_id, c.customer_city, c.customer_state
FROM olist_customers_dataset c
LEFT JOIN olist_orders_dataset o
    ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;
```

---

## Identificando registros presentes em uma tabela e ausentes em outra

Uma tarefa comum em banco de dados é descobrir quais registros estão em uma tabela, mas não aparecem em outra.

Por exemplo: clientes cadastrados que nunca fizeram pedidos.

```sql
SELECT c.customer_id, c.customer_unique_id, c.customer_city, c.customer_state
FROM olist_customers_dataset c
LEFT JOIN olist_orders_dataset o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
```

**Parte dos Resultados:**

| customer_id | customer_unique_id | customer_city | customer_state |
| :--- | :--- | :--- | :--- |
| exemplo_customer_id_1 | exemplo_unique_id_1 | sao paulo | SP |
| exemplo_customer_id_2 | exemplo_unique_id_2 | rio de janeiro | RJ |
| exemplo_customer_id_3 | exemplo_unique_id_3 | belo horizonte | MG |

---

## Encontrando produtos que nunca apareceram em pedidos

Para encontrar produtos cadastrados que nunca foram vendidos ou nunca apareceram em pedidos, podemos comparar a tabela de produtos com a tabela de itens dos pedidos.

A tabela `olist_products_dataset` contém os produtos cadastrados.

A tabela `olist_order_items_dataset` contém os produtos que aparecem nos pedidos.

### Usando LEFT JOIN:

```sql
SELECT p.product_id, p.product_category_name
FROM olist_products_dataset p
LEFT JOIN olist_order_items_dataset oi
    ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;
```

### Usando EXCEPT:

```sql
SELECT product_id
FROM olist_products_dataset

EXCEPT

SELECT product_id
FROM olist_order_items_dataset;
```

Esse resultado mostra os produtos que existem na tabela de produtos, mas que nunca aparecem na tabela de itens de pedidos.

---

## Prática

### 1. Comparar resultados obtidos com diferentes tipos de JOIN

#### INNER JOIN

```sql
SELECT c.customer_id, c.customer_unique_id,
       o.order_id, o.order_status
FROM olist_customers_dataset c
INNER JOIN olist_orders_dataset o
    ON c.customer_id = o.customer_id;
```

#### LEFT JOIN

```sql
SELECT c.customer_id, c.customer_unique_id,
       o.order_id, o.order_status
FROM olist_customers_dataset c
LEFT JOIN olist_orders_dataset o
    ON c.customer_id = o.customer_id;
```

#### RIGHT JOIN

```sql
SELECT c.customer_id, c.customer_unique_id,
       o.order_id, o.order_status
FROM olist_customers_dataset c
RIGHT JOIN olist_orders_dataset o
    ON c.customer_id = o.customer_id;
```

---

### 2. Unir resultados de diferentes consultas de clientes

```sql
SELECT customer_id, customer_unique_id, customer_city, customer_state
FROM olist_customers_dataset
WHERE customer_state = 'SP'

UNION

SELECT customer_id, customer_unique_id, customer_city, customer_state
FROM olist_customers_dataset
WHERE customer_state = 'RJ';
```

---

### 3. Identificar clientes cadastrados que não possuem pedidos

```sql
SELECT c.customer_id, c.customer_unique_id, c.customer_city, c.customer_state
FROM olist_customers_dataset c
LEFT JOIN olist_orders_dataset o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
```

---

### 4. Encontrar produtos que nunca apareceram em pedidos

```sql
SELECT p.product_id, p.product_category_name
FROM olist_products_dataset p
LEFT JOIN olist_order_items_dataset oi
    ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;
```

---

## Resumo da Semana

| Comando | Função |
| :--- | :--- |
| RIGHT JOIN | Retorna todos os registros da tabela da direita e os correspondentes da esquerda |
| FULL JOIN | Retorna todos os registros das duas tabelas |
| UNION | Une resultados e remove duplicados |
| UNION ALL | Une resultados mantendo duplicados |
| INTERSECT | Retorna apenas registros presentes nas duas consultas |
| EXCEPT | Retorna registros da primeira consulta que não aparecem na segunda |

---

## Observações Importantes

* `RIGHT JOIN` pode ser reescrito como `LEFT JOIN`, apenas invertendo a ordem das tabelas.
* `FULL JOIN` nem sempre está disponível em todos os bancos de dados.
* `UNION` remove duplicados automaticamente.
* `UNION ALL` é mais rápido que `UNION`, pois não precisa verificar duplicidade.
* `INTERSECT` retorna apenas registros em comum.
* `EXCEPT` é útil para encontrar dados ausentes em outra tabela.
* Em bancos que não suportam `INTERSECT` ou `EXCEPT`, podemos usar `JOIN`, `LEFT JOIN` e `WHERE IS NULL`.