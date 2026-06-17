# Projeto Final — Análise de Dados do E-commerce Olist (Parte 2)

## Introdução

Na Parte 1 do projeto foram definidas perguntas de negócio para compreender melhor o comportamento dos clientes, produtos e vendas da plataforma Olist.

Nesta etapa, utilizaremos SQL para responder essas perguntas e gerar insights que possam auxiliar a tomada de decisão da empresa.

---

# Análise 1 — Estados com mais clientes

## Pergunta

Quais estados possuem mais clientes cadastrados?

## Consulta SQL

```sql
SELECT
    customer_state,
    COUNT(*) AS quantidade_clientes
FROM olist_customers_dataset
GROUP BY customer_state
ORDER BY quantidade_clientes DESC;
```

## Resultado

![Resultado prática 1](https://github.com/ThamaraCrispim/panda-sql-study-group/blob/main/Imagem/Captura%20de%20tela%202026-06-08%20103701.png)

## Insight


A análise mostra que São Paulo é o estado com mais clientes cadastrados na plataforma, seguido por Rio de Janeiro e Minas Gerais. 
Os resultados indicam uma forte concentração de clientes na região Sudeste, que representa uma parcela importante da base de consumidores da Olist.

# Análise 2 — Cidades com mais clientes

## Pergunta

Quais cidades possuem mais clientes cadastrados?

## Consulta SQL

```sql
SELECT
    customer_city,
    COUNT(*) AS quantidade_clientes
FROM olist_customers_dataset
GROUP BY customer_city
ORDER BY quantidade_clientes DESC
LIMIT 10;
```

## Resultado

![Resultado prática 1](https://github.com/ThamaraCrispim/panda-sql-study-group/blob/main/Imagem/pergunta%202.png)

## Insight

A cidade de São Paulo concentra o maior número de clientes da plataforma, seguida por Rio de Janeiro e Belo Horizonte.
Isso indica que os grandes centros urbanos possuem uma participação importante na base de clientes da Olist.
---

# Análise 3 — Categorias com mais produtos

## Pergunta

Quais categorias possuem mais produtos cadastrados?

## Consulta SQL

```sql
SELECT
    product_category_name,
    COUNT(*) AS quantidade_produtos
FROM olist_products_dataset
GROUP BY product_category_name
ORDER BY quantidade_produtos DESC;
```

## Resultado

![Resultado prática 1](https://github.com/ThamaraCrispim/panda-sql-study-group/blob/main/Imagem/Pergunta%203.png)

## Insight

As categorias cama, mesa e banho, esporte e lazer e móveis e decoração apresentam a maior quantidade de produtos cadastrados. 
Esse resultado sugere que a Olist possui uma forte presença nesses segmentos, oferecendo uma ampla variedade de opções aos consumidores.
---

# Análise 4 — Formas de Pagamento Mais Utilizadas

## Pergunta

Formas de Pagamento Mais Utilizadas

## Consulta SQL

```sql
SELECT
    product_id,
    COUNT(*) AS quantidade_vendas
FROM olist_order_items_dataset
GROUP BY product_id
ORDER BY quantidade_vendas DESC
LIMIT 10;
```

## Resultado

![Resultado prática 1](https://github.com/ThamaraCrispim/panda-sql-study-group/blob/main/Imagem/pergunta%204.png)

## Insight

O cartão de crédito foi a forma de pagamento mais utilizada pelos clientes, com 917 registros, seguido por boleto (241) e voucher (87). 
Isso mostra uma forte preferência dos consumidores por pagamentos realizados via cartão de crédito.

---

# Análise 5 — Valor médio dos pagamentos

## Pergunta

Qual é o valor médio dos pagamentos realizados?

## Consulta SQL

```sql
SELECT
    ROUND(AVG(payment_value),2) AS media_pagamentos
FROM olist_order_payments_dataset;
```

## Resultado

![Resultado prática 1](https://github.com/ThamaraCrispim/panda-sql-study-group/blob/main/Imagem/pergunta%205.png)

## Insight

A análise mostrou que o valor médio dos pagamentos é de R$ 154,53. Esse resultado fornece uma estimativa do ticket médio das compras realizadas na plataforma e ajuda a compreender o padrão de consumo dos clientes.
---

# Análise 6 — Quais estados possuem mais vendedores?

## Pergunta

Quais estados possuem o maior ticket médio?

## Consulta SQL

```sql
SELECT
    seller_state,
    COUNT(*) AS quantidade_vendedores
FROM olist_sellers_dataset
GROUP BY seller_state
ORDER BY quantidade_vendedores DESC;
```

## Resultado

![Resultado prática 6](https://github.com/ThamaraCrispim/panda-sql-study-group/blob/main/Imagem/pergunta%2006.novo.png)

## Insight

São Paulo concentra a maior quantidade de vendedores cadastrados na plataforma. Isso sugere que boa parte da oferta de produtos está concentrada nesse estado.
---

# Análise 7 — Categorias com maior faturamento

## Pergunta

Quais categorias geram mais receita?

## Consulta SQL

```sql
SELECT
    p.product_category_name,
    ROUND(SUM(oi.price),2) AS faturamento
FROM olist_products_dataset p
INNER JOIN olist_order_items_dataset oi
    ON p.product_id = oi.product_id
GROUP BY p.product_category_name
ORDER BY faturamento DESC;
```

## Resultado

![Resultado prática 1](https://github.com/ThamaraCrispim/panda-sql-study-group/blob/main/Imagem/pergunta%207.png)

## Insight

A categoria esporte e lazer apresentou o maior faturamento da análise, totalizando R$ 948,49. Em seguida aparecem cool stuff (R$ 814,89) e brinquedos (R$ 571,69).
Esses resultados indicam que essas categorias possuem maior participação na receita gerada pelas vendas da plataforma.
---

# Análise 8 — Evolução das vendas ao longo do tempo

## Pergunta

Como as vendas se comportam ao longo do tempo?

## Consulta SQL

```sql
SELECT
    YEAR(order_purchase_timestamp) AS ano,
    MONTH(order_purchase_timestamp) AS mes,
    COUNT(*) AS quantidade_pedidos
FROM olist_orders_dataset
GROUP BY ano, mes
ORDER BY ano, mes;
```

## Resultado

![Resultado prática 1](https://github.com/ThamaraCrispim/panda-sql-study-group/blob/main/Imagem/pergunta%208.png)

## Insight

Foram identificados pedidos distribuídos entre os anos de 2017 e 2018. Os registros disponíveis mostram que houve pedidos em diferentes períodos ao longo do tempo, indicando atividade da plataforma durante os dois anos analisados.


