# Semana 5 – Agregação e Agrupamento

## Explicação da Semana

Nesta semana, o foco foi o estudo e aplicação prática de **agregação e agrupamento** em SQL. Esses recursos permitem resumir informações de uma tabela, calcular valores estatísticos e organizar os dados em grupos para facilitar a análise.

Trabalhamos com os principais comandos e funções de agregação:

- `COUNT`
- `SUM`
- `AVG`
- `MIN`
- `MAX`
- `GROUP BY`
- Diferença entre `WHERE` e `HAVING`
- Filtros em agrupamentos usando `HAVING`

---

## Banco de Dados Utilizado

- **Nome:** Brazilian E-Commerce Public Dataset by Olist
- **Fonte:** Kaggle
- **Descrição:** Dataset público contendo informações de pedidos, clientes, produtos, pagamentos e itens vendidos de uma grande plataforma de e-commerce brasileira, a Olist.

---

## Conceitos Importantes

- **COUNT:** Conta a quantidade de registros de uma tabela ou agrupamento.
- **SUM:** Soma valores numéricos.
- **AVG:** Calcula a média dos valores.
- **MIN:** Retorna o menor valor encontrado.
- **MAX:** Retorna o maior valor encontrado.
- **GROUP BY:** Agrupa registros com valores iguais em uma ou mais colunas.
- **WHERE:** Filtra os registros antes do agrupamento.
- **HAVING:** Filtra os resultados depois que os agrupamentos já foram formados.

---

## Prática Realizada

### Setup inicial

**Passo a passo:**

- Os códigos e testes foram feitos no Google Colab.
- Foi utilizada a biblioteca `pandasql` para executar consultas SQL nos DataFrames.
- O dataset da Olist foi carregado.
- As tabelas necessárias foram importadas para a realização das consultas.

1. Instalar a biblioteca `pandasql`
2. Importar as bibliotecas necessárias
3. Definir o caminho do dataset
4. Carregar as tabelas que serão utilizadas
5. Executar as consultas SQL

Utilizando o dataset da Olist, foram desenvolvidas as seguintes análises:

---

## 1. Contar quantos pedidos existem no banco

**Objetivo:**  
Identificar a quantidade total de pedidos registrados no dataset.

```sql
-- Conta a quantidade total de pedidos registrados
SELECT 
    COUNT(*) AS total_pedidos
FROM df_orders;
```

**Explicação da consulta:**

- Utilizamos `COUNT(*)` para contar todos os registros da tabela de pedidos.
- Cada linha da tabela representa um pedido.
- O resultado mostra a quantidade total de pedidos existentes no banco.

---

## 2. Calcular quantidade de clientes por estado

**Objetivo:**  
Verificar a distribuição dos clientes de acordo com cada estado.

```sql
-- Conta a quantidade de clientes por estado
SELECT 
    customer_state AS estado,
    COUNT(*) AS quantidade_clientes
FROM df_customers
GROUP BY customer_state
ORDER BY quantidade_clientes DESC;
```

**Explicação da consulta:**

- Utilizamos `GROUP BY` para agrupar os clientes por estado.
- O `COUNT(*)` conta quantos clientes existem em cada grupo.
- O `ORDER BY quantidade_clientes DESC` organiza os estados do maior para o menor número de clientes.

---

## 3. Calcular média de valor de pagamento

**Objetivo:**  
Calcular o valor médio dos pagamentos realizados.

```sql
-- Calcula a média dos valores de pagamento
SELECT 
    ROUND(AVG(payment_value), 2) AS media_valor_pagamento
FROM df_payments;
```

**Explicação da consulta:**

- Utilizamos `AVG(payment_value)` para calcular a média dos valores pagos.
- O `ROUND(..., 2)` foi utilizado para deixar o resultado com duas casas decimais.
- Essa consulta ajuda a entender o valor médio gasto nos pedidos.

---

## 4. Identificar categorias com maior número de produtos

**Objetivo:**  
Descobrir quais categorias possuem mais produtos cadastrados no dataset.

```sql
-- Lista as categorias com maior quantidade de produtos
SELECT 
    product_category_name AS categoria,
    COUNT(*) AS quantidade_produtos
FROM df_products
WHERE product_category_name IS NOT NULL
GROUP BY product_category_name
ORDER BY quantidade_produtos DESC
LIMIT 15;
```

**Explicação da consulta:**

- O `WHERE product_category_name IS NOT NULL` remove produtos sem categoria cadastrada.
- O `GROUP BY` agrupa os produtos de acordo com a categoria.
- O `COUNT(*)` conta a quantidade de produtos em cada categoria.
- O `ORDER BY quantidade_produtos DESC` mostra primeiro as categorias com mais produtos.
- O `LIMIT 15` limita a visualização às 15 categorias com maior quantidade.

---

## 5. Filtrar agrupamentos com base em condições específicas

**Objetivo:**  
Mostrar apenas os estados que possuem mais de 1000 clientes, utilizando `HAVING`.

```sql
-- Filtra apenas os estados com mais de 1000 clientes
SELECT 
    customer_state AS estado,
    COUNT(*) AS quantidade_clientes
FROM df_customers
GROUP BY customer_state
HAVING COUNT(*) > 1000
ORDER BY quantidade_clientes DESC;
```

**Explicação da consulta:**

- Primeiro, os clientes são agrupados por estado usando `GROUP BY`.
- Depois, o `HAVING COUNT(*) > 1000` filtra apenas os grupos com mais de 1000 clientes.
- Nesse caso, o `HAVING` é usado porque o filtro depende do resultado de uma agregação.
- Diferente do `WHERE`, que filtra linhas antes do agrupamento, o `HAVING` filtra depois que os grupos já foram criados.

---

## Diferença entre WHERE e HAVING

Durante a prática, também foi importante entender a diferença entre `WHERE` e `HAVING`.

```sql
-- Exemplo usando WHERE antes do agrupamento
SELECT 
    customer_state AS estado,
    COUNT(*) AS quantidade_clientes
FROM df_customers
WHERE customer_state IS NOT NULL
GROUP BY customer_state;
```

Nesse exemplo, o `WHERE` filtra os registros antes de formar os grupos.

```sql
-- Exemplo usando HAVING depois do agrupamento
SELECT 
    customer_state AS estado,
    COUNT(*) AS quantidade_clientes
FROM df_customers
GROUP BY customer_state
HAVING COUNT(*) > 1000;
```

Nesse segundo exemplo, o `HAVING` filtra os grupos depois do cálculo da quantidade de clientes.

---

## Observações

- As funções de agregação foram utilizadas para resumir e analisar os dados do dataset.
- O `GROUP BY` foi essencial para organizar as informações em grupos.
- O `WHERE` foi utilizado para filtrar registros antes da agregação.
- O `HAVING` foi utilizado para filtrar agrupamentos depois da agregação.
- Essa prática ajudou a entender como gerar relatórios e análises resumidas usando SQL.
- Com essas consultas, foi possível analisar pedidos, clientes, pagamentos e produtos de forma mais organizada.
