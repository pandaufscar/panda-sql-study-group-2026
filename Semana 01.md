# Semana 1 – Introdução ao SQL e ao Ambiente

## Explicação da semana

Nesta primeira semana, o objetivo é construir a base necessária para todo o minicurso: entender **o que é SQL**, como funcionam os **bancos de dados relacionais** e preparar o ambiente para as próximas análises.

Um **banco de dados relacional** organiza informações em tabelas estruturadas, compostas por:

- **Linhas (rows):** representam os registros (ex: um cliente, um pedido)  
- **Colunas (columns):** representam os atributos (ex: nome, preço, data)  

O termo *relacional* vem da capacidade de conectar diferentes tabelas por meio de **chaves**, permitindo análises mais completas.

Exemplo de estrutura:
- tabela de clientes  
- tabela de pedidos  
- tabela de produtos  

Essas tabelas podem ser relacionadas para responder perguntas como:  
> "Quais clientes compraram determinado produto?"

Além disso, foi introduzido o **SQL (Structured Query Language)**, a linguagem utilizada para:
- consultar dados  
- filtrar informações  
- organizar resultados  
- manipular dados no banco  

---

## 🗃️ Banco de dados utilizado

O banco utilizado foi o:

**Brazilian E-Commerce Public Dataset by Olist**

Importado em um ambiente SQL (MySQL/PostgreSQL + DBeaver ou similar).

### 📊 Contexto do dataset

Esse dataset representa dados reais de um e-commerce brasileiro e contém informações como:

- clientes (`customers`)  
- pedidos (`orders`)  
- produtos (`products`)  
- pagamentos (`payments`)  
- avaliações (`reviews`)  
- vendedores (`sellers`)  

### 🎯 Por que esse dataset?

Ele foi escolhido porque:
- simula um cenário real de mercado  
- possui múltiplas tabelas relacionadas  
- permite evoluir de consultas simples até análises complexas  

---

## 🧠 Conceitos importantes

### 🔹 SELECT

O comando `SELECT` é utilizado para **consultar dados** em uma tabela.

Ele é a base de praticamente toda análise em SQL.

Com o `SELECT`, podemos:
- visualizar todos os dados de uma tabela  
- selecionar colunas específicas  
- explorar a estrutura do banco  

Exemplo básico:

```sql
SELECT * FROM customers;
```

### 🔹 FROM

Define de qual tabela os dados serão consultados.

### 🔹 *

O símbolo `*` indica que queremos todas as colunas da tabela.

---

## ⚙️ Passo a passo da prática

### 1. Instalação do ambiente
- Instalação do banco de dados (MySQL ou PostgreSQL)  
- Instalação de uma ferramenta de apoio (ex: DBeaver)  

### 2. Download do dataset
- Dataset: Brazilian E-Commerce Public Dataset by Olist (Kaggle)  

### 3. Importação para o banco
- Importação das tabelas para o ambiente SQL  
- Verificação da estrutura das tabelas  

### 4. Exploração inicial

Análise inicial para entender:
- nomes das tabelas  
- colunas disponíveis  
- tipos de dados  
- organização do banco  

### 5. Primeira consulta
- Execução do primeiro `SELECT`  
- Visualização dos dados  

---

## 💻 Prática

### 🔹 Query 1 — Visualização geral da tabela de clientes

```sql
SELECT * FROM customers;
``` 

### 📖 Explicação linha por linha:

- `SELECT *` → seleciona todas as colunas da tabela  
- `FROM customers` → indica que os dados vêm da tabela `customers`  

---

## 📊 Resultando:

![Descrição da tabela employees](https://github.com/ThamaraCrispim/panda-sql-study-group/blob/main/Imagem/semana%20.png)

A consulta retorna **todos os registros da tabela de clientes**, permitindo:

- visualizar os dados disponíveis  
- entender a estrutura da tabela  
---

## 📈 Classificação das variáveis

A tabela `olist_products_dataset` apresenta diferentes tipos de variáveis, que podem ser classificadas em:

### 🔹 Variáveis qualitativas (categóricas)

Representam categorias ou identificadores, ou seja, informações não numéricas.

- **product_id**  
  Identificador único do produto (chave primária potencial).

- **product_category_name**  
  Categoria do produto, como por exemplo: `perfumaria`, `bebes` e `esporte_lazer`.

### 🔹 Variáveis quantitativas discretas

Representam contagens, ou seja, valores inteiros.

- **product_name_length**  
- **product_description_length**  
- **product_photos_qty**

### 🔹 Variáveis quantitativas contínuas

Representam medidas físicas do produto.

- **product_weight_g**  
- **product_length_cm**  
- **product_height_cm**  
- **product_width_cm**
