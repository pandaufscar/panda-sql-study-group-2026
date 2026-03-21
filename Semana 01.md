# Semana 1 – Introdução ao SQL e ao ambiente

## Explicação da semana

Nesta primeira semana, o objetivo foi entender os conceitos iniciais de SQL e de banco de dados relacional, além de preparar o ambiente para as próximas atividades.

Um **banco de dados relacional** é uma forma de organizar informações em tabelas.  
Cada tabela possui **linhas** e **colunas**:
- as colunas representam os tipos de informação
- as linhas representam os registros armazenados

Esse modelo é chamado de relacional porque as tabelas podem se relacionar entre si por meio de chaves, como por exemplo:
- uma tabela de clientes
- uma tabela de pedidos
- uma tabela de produtos

Assim, é possível conectar essas informações e fazer análises mais completas.

Nesta semana, também entendemos a função do **SQL**, que é a linguagem usada para consultar, organizar e manipular dados dentro do banco.

---

## Banco de dados utilizado

O banco de dados utilizado foi o **Brazilian E-Commerce Public Dataset by Olist**, importado em **MySQL**.

Esse conjunto de dados reúne informações de um e-commerce brasileiro, com tabelas relacionadas a:
- clientes
- pedidos
- produtos
- pagamentos
- avaliações
- vendedores

Esse dataset foi escolhido porque permite trabalhar com dados reais e explorar diferentes tipos de consultas ao longo do grupo de estudos.

---

## O que faz o SELECT?

O comando `SELECT` é usado para **consultar dados** em uma tabela.

Ele permite visualizar informações armazenadas no banco de dados.  
Por exemplo, ao usar um `SELECT`, podemos:
- ver todos os registros de uma tabela
- selecionar colunas específicas
- explorar os dados disponíveis

Foi o primeiro comando estudado porque ele é a base para começar a analisar um banco de dados.

---

## Passo a passo da prática

### 1. Instalação do ambiente
Foi realizada a instalação do **MySQL** e de uma ferramenta de apoio para visualizar e executar consultas no banco.

### 2. Download do dataset
Foi feito o download do dataset **Brazilian E-Commerce Public Dataset by Olist**.

### 3. Importação para o MySQL
As tabelas do dataset foram importadas para o banco de dados, permitindo o acesso às informações no ambiente SQL.

### 4. Exploração inicial das tabelas
Depois da importação, foi feita uma exploração inicial para identificar:
- nomes das tabelas
- colunas existentes
- tipos de dados
- organização geral das informações

### 5. Primeira consulta com SELECT
Por fim, foram executadas consultas simples para visualizar os dados e começar a entender a estrutura do banco.

---

## Prática

### Consulta 1 – Visualização geral de uma tabela

```sql
SELECT * FROM customers;
