# Projeto Final — Análise de Dados do E-commerce Olist (Parte 1)

## Contexto do Projeto

A Olist é uma plataforma brasileira que conecta vendedores e consumidores através de diversos marketplaces.

Com milhares de pedidos realizados diariamente em diferentes regiões do Brasil, a empresa gera uma grande quantidade de dados sobre clientes, produtos, vendas e pagamentos.

Neste projeto, o papel do analista de dados é transformar esses dados em informações úteis para apoiar decisões estratégicas da empresa.

---

## Problema de Negócio

A diretoria da Olist deseja entender melhor o comportamento dos clientes e o desempenho das vendas para identificar oportunidades de crescimento.

Algumas dúvidas importantes surgiram:

* Quais regiões possuem mais clientes?
* Quais categorias possuem melhor desempenho?
* Formas de Pagamento Mais Utilizadas
* Quais estados possuem mais vendedores
* Como os pagamentos se comportam ao longo da base de clientes?

Para responder essas perguntas, será realizada uma análise exploratória utilizando SQL sobre o banco de dados da Olist.

---

## Objetivo

O objetivo deste projeto é analisar os dados do e-commerce da Olist para gerar insights que auxiliem a empresa na tomada de decisões relacionadas a vendas, produtos e clientes.

---

## Base de Dados

Foi utilizado o conjunto de dados público:

**Brazilian E-Commerce Public Dataset by Olist**

O banco contém informações sobre:

* Clientes
* Pedidos
* Produtos
* Pagamentos
* Vendedores
* Avaliações
* Entregas

---

## Entendimento das Tabelas

Antes de iniciar as análises, foi realizada uma exploração das principais tabelas do banco.

### Clientes

```sql
DESCRIBE olist_customers_dataset;
```

### Pedidos

```sql
DESCRIBE olist_orders_dataset;
```

### Produtos

```sql
DESCRIBE olist_products_dataset;
```

### Pagamentos

```sql
DESCRIBE olist_order_payments_dataset;
```

### Itens dos Pedidos

```sql
DESCRIBE olist_order_items_dataset;
```

---

## Relacionamento entre as Tabelas

O modelo de análise pode ser representado da seguinte forma:

```text
Clientes
    ↓
Pedidos
    ↓
Itens dos Pedidos
    ↓
Produtos

Pedidos
    ↓
Pagamentos
```

Principais chaves utilizadas:

* customer_id
* order_id
* product_id

---

# Perguntas de Negócio

Para responder ao problema apresentado pela diretoria, foram definidas as seguintes perguntas:

### 1. Quais estados possuem mais clientes cadastrados?

Objetivo: Identificar os principais mercados consumidores da empresa.

---

### 2. Quais cidades concentram o maior número de clientes?

Objetivo: Entender a distribuição geográfica dos consumidores.

---

### 3. Quais categorias possuem mais produtos cadastrados?

Objetivo: Identificar os segmentos mais representativos da plataforma.

---

### 4. Quais produtos apresentam maior volume de vendas?

Objetivo: Descobrir os produtos mais populares entre os clientes.

---

### 5. Qual é o valor médio dos pagamentos realizados?

Objetivo: Compreender o comportamento geral das compras.

---

### 6. Quais estados possuem o maior ticket médio?

Objetivo: Identificar regiões com maior potencial de faturamento.

---

### 7. Quais categorias geram mais receita?

Objetivo: Identificar quais segmentos mais contribuem para o faturamento da empresa.

---

### 8. Como as vendas se comportam ao longo do tempo?

Objetivo: Identificar tendências e possíveis sazonalidades.

---

## Próximos Passos

Na Parte 2 do projeto serão desenvolvidas consultas SQL para responder cada uma das perguntas de negócio apresentadas neste documento.

Além das consultas, serão gerados insights e conclusões para apoiar a tomada de decisão da empresa.
