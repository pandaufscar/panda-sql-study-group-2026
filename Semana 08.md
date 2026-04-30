# Semana 8 – Subconsultas (Subqueries)

## Explicação da Semana

Nesta semana, o foco foi o estudo e aplicação prática de **Subconsultas** (Subqueries) em SQL. As subconsultas permitem criar consultas mais complexas e poderosas, ao utilizar o resultado de uma consulta dentro de outra.

Trabalhamos com diferentes tipos de subconsultas:
- Subquery no `WHERE` (usando `IN` e `EXISTS`)
- Subquery no `SELECT`
- Subquery no `FROM` (tabelas derivadas)
- Uso de **CTE (Common Table Expression)** com `WITH`

---

## Banco de Dados Utilizado

- **Nome:** Brazilian E-Commerce Public Dataset by Olist  
- **Fonte:** Kaggle  
- **Descrição:** Dataset público contendo informações de pedidos, clientes, produtos, pagamentos e itens vendidos de uma grande plataforma de e-commerce brasileira (Olist).

---

## Conceitos Importantes

- **Subquery (Subconsulta):** Uma consulta SQL dentro de outra consulta.
- **CTE (Common Table Expression):** Forma mais legível de criar tabelas temporárias usando `WITH`.
- **Tabela Derivada:** Subquery utilizada na cláusula `FROM`.
- **Agregação com Percentual:** Cálculo de participação relativa usando `SUM() OVER()`.
- **Análise de Desempenho:** Otimização de consultas com múltiplos JOINs e agrupamentos.

---

## Prática Realizada

Utilizando o dataset da Olist, foram desenvolvidas as seguintes análises:

### 1. Encontrar pedidos com valor acima da média de pagamentos

```sql
WITH media_pagamento AS (
    SELECT AVG(payment_value) as media_geral
    FROM df_payments
)
SELECT 
    p.order_id as order_id,
    ROUND(p.payment_value, 2) as valor_pagamento,
    ROUND(m.media_geral, 2) as media_geral,
    ROUND(p.payment_value - m.media_geral, 2) as diferenca_da_media
FROM df_payments p, media_pagamento m
WHERE p.payment_value > m.media_geral
ORDER BY p.payment_value DESC
LIMIT 20
```

### 2. Calcular o total de vendas por produto e a porcentagem de participação de cada produto nas vendas

**Objetivo:**  
Identificar os produtos que mais geraram receita e calcular qual é a participação percentual de cada um no faturamento total da empresa.

```sql
WITH vendas_por_produto AS (
    SELECT 
        oi.product_id,
        ROUND(SUM(oi.price), 2) as total_vendas_reais,
        COUNT(*) as quantidade_vendida
    FROM df_order_items oi
    GROUP BY oi.product_id
),
vendas_com_categoria AS (
    SELECT 
        v.product_id,
        COALESCE(t.product_category_name_english, 'Sem categoria') as categoria,
        v.total_vendas_reais,
        v.quantidade_vendida
    FROM vendas_por_produto v
    LEFT JOIN df_products p ON v.product_id = p.product_id
    LEFT JOIN df_translation t ON p.product_category_name = t.product_category_name
)
SELECT 
    product_id,
    categoria,
    total_vendas_reais,
    quantidade_vendida,
    ROUND(100.0 * total_vendas_reais / SUM(total_vendas_reais) OVER(), 2) as percentual_participacao
FROM vendas_com_categoria
ORDER BY total_vendas_reais DESC
LIMIT 15
```

**Observações:**
- Utilizamos CTE (Common Table Expression) para organizar melhor a consulta.
- A porcentagem foi calculada usando a função de janela SUM() OVER().
- Fizemos o agrupamento primeiro e o JOIN com a tabela de categorias depois, para melhorar a performance da consulta.

### 3. Usar uma subconsulta como tabela temporária para analisar pedidos ou pagamentos (CTE)

**Objetivo:**  
Demonstrar o uso de **subconsultas como tabelas temporárias** (CTE - Common Table Expression) para realizar uma análise mais complexa e organizada de pedidos.

```sql
WITH valor_total_pedido AS (
    -- Subconsulta 1: Calcula o valor total de cada pedido
    SELECT 
        order_id,
        ROUND(SUM(payment_value), 2) as valor_total_pedido
    FROM df_payments
    GROUP BY order_id
),
pedidos_acima_media AS (
    -- Subconsulta 2: Calcula a média geral e prepara os dados
    SELECT 
        order_id,
        valor_total_pedido,
        ROUND(AVG(valor_total_pedido) OVER(), 2) as media_pedidos
    FROM valor_total_pedido
)
SELECT 
    order_id,
    valor_total_pedido,
    media_pedidos,
    ROUND(valor_total_pedido - media_pedidos, 2) as diferenca
FROM pedidos_acima_media
WHERE valor_total_pedido > media_pedidos
ORDER BY valor_total_pedido DESC
LIMIT 15
```

**Explicação da consulta:**
- Utilizamos duas CTEs (valor_total_pedido e pedidos_acima_media) para tornar o código mais legível e modular.
- A primeira CTE calcula o valor total pago em cada pedido (agregando a tabela de pagamentos).
- A segunda CTE calcula a média geral dos pedidos usando a função de janela AVG() OVER().
- Por fim, filtramos apenas os pedidos que estão acima da média.

**Este tipo de estrutura (CTE) é muito utilizada em análise de dados porque facilita a manutenção, melhora a legibilidade e permite construir consultas complexas de forma organizada.**
