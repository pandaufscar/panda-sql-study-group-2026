# Semana 2 – Consultas Básicas e Filtragem

## Explicação da semana

Nesta segunda semana, o foco é aprofundar a capacidade de **consultar e filtrar dados** com SQL. A partir de agora, não basta apenas visualizar todas as linhas de uma tabela; precisamos extrair apenas as informações relevantes para a análise.

Os principais elementos estudados são:

- **Cláusulas fundamentais:** `SELECT`, `FROM`, `WHERE` e `AS` (alias)
- **Operadores de comparação:** `=`, `<>`, `>`, `<`, `>=`, `<=`
- **Operadores lógicos:** `AND`, `OR`, `NOT`
- **Operadores especiais de filtragem:** `LIKE`, `IN`, `BETWEEN`

Todos os exemplos utilizam a tabela **`olist_products_dataset`** do dataset **Brazilian E-Commerce Public Dataset by Olist**, que contém informações detalhadas sobre os produtos vendidos no e‑commerce.

---

## Banco de dados utilizado

Continuamos com o mesmo ambiente:

- **Dataset:** Brazilian E-Commerce Public Dataset by Olist  
- **Tabela utilizada nesta semana:** `olist_products_dataset`

As colunas mais relevantes para os exemplos são:

| Coluna                    | Descrição                                    | Tipo      |
|---------------------------|----------------------------------------------|-----------|
| `product_category_name`   | Categoria do produto                         | texto     |
| `product_length_cm`       | Comprimento do produto em centímetros        | numérico  |
| `product_height_cm`       | Altura do produto em centímetros             | numérico  |
| `product_width_cm`        | Largura do produto em centímetros            | numérico  |
| `product_weight_g`        | Peso do produto em gramas                    | numérico  |
| `product_photos_qty`      | Quantidade de fotos do produto               | numérico  |

---

## Conceitos importantes

### 🔹 `SELECT` e `FROM`

- `SELECT` define quais colunas serão exibidas.
- `FROM` indica a tabela de onde os dados serão extraídos.

### 🔹 `AS` – Alias (apelido)

Permite renomear temporariamente uma coluna (ou tabela) no resultado da consulta. Apenas afeta a exibição, não altera o banco.

### 🔹 `WHERE` – Filtragem

A cláusula `WHERE` é usada para **filtrar linhas** com base em uma condição. Apenas as linhas que atendem à condição são retornadas.

### 🔹 Operadores de comparação

| Operador | Significado     |
|----------|-----------------|
| `=`      | igual a         |
| `<>`     | diferente de    |
| `>`      | maior que       |
| `<`      | menor que       |
| `>=`     | maior ou igual  |
| `<=`     | menor ou igual  |

### 🔹 Operadores lógicos

| Operador | Descrição                                   |
|----------|---------------------------------------------|
| `AND`    | Todas as condições devem ser verdadeiras    |
| `OR`     | Pelo menos uma condição deve ser verdadeira |
| `NOT`    | Inverte o resultado lógico                  |

---

##  Prática – Consultas com filtros básicos

Abaixo estão os códigos desenvolvidos durante a prática, acompanhados de explicações detalhadas.

---

### Query 1 – Produtos com comprimento exatamente igual a 20 cm

```sql
SELECT 
    product_category_name,
    product_length_cm
FROM olist_products_dataset 
WHERE product_length_cm = '20';
Explicação:
-SELECT product_category_name, product_length_cm → seleciona apenas as colunas de categoria e comprimento.
-FROM olist_products_dataset → define a tabela de origem.
-WHERE product_length_cm = '20' → filtra os produtos cujo comprimento é exatamente 20 cm.
<img width="677" height="267" alt="image" src="https://github.com/user-attachments/assets/a3f86e4a-24d8-4f1d-800d-dee545f6ff25" />

### Query 2 – Produtos com altura maior ou igual a 10 cm
SELECT 
    product_category_name,  
    product_height_cm
FROM olist_products_dataset
WHERE product_height_cm >= '10';
Explicação:
- SELECT exibe categoria e altura.
- WHERE product_height_cm >= '10' → seleciona produtos com altura maior ou igual a 10 cm.
Inclui os que têm altura exatamente 10 cm e os que têm mais.
<img width="680" height="271" alt="image" src="https://github.com/user-attachments/assets/26383173-bd0e-4acd-84aa-3326ad7a9a6e" />

### Query 3 – Produtos com largura menor que 10 cm
SELECT 
    product_category_name,
    product_width_cm
FROM olist_products_dataset 
WHERE product_width_cm < 10;
Explicação:
- SELECT exibe categoria e altura.
- WHERE product_height_cm >= '10' → seleciona produtos com altura maior ou igual a 10 cm.
- Inclui os que têm altura exatamente 10 cm e os que têm mais.
<img width="293" height="269" alt="image" src="https://github.com/user-attachments/assets/6db9648f-0603-4afd-af53-4740a5a425af" />

### Query 4 – Produtos com peso maior que 1500 gramas (1,5 kg)
SELECT 
    product_category_name,
    product_weight_g
FROM olist_products_dataset
WHERE product_weight_g > 1500;
Explicação:
- WHERE product_weight_g > 1500 → filtra produtos com peso superior a 1500 gramas.
<img width="272" height="212" alt="image" src="https://github.com/user-attachments/assets/39902645-2b25-4f97-838e-56f5352283dd" />

### Query 5 – Produtos com largura menor ou igual a 15 cm
SELECT 
    product_category_name,
    product_width_cm
FROM olist_products_dataset
WHERE product_width_cm <= 15;
Explicação:
- WHERE product_width_cm <= 15 → inclui produtos com largura de 15 cm ou menos.
<img width="299" height="249" alt="image" src="https://github.com/user-attachments/assets/e69af497-1b7e-46e7-b56e-2612618d283a" />

### Query 6 – Uso de alias (AS) para renomear colunas
SELECT  
    product_category_name AS Nome_do_Produto, 
    product_length_cm AS Cumprimento_do_Produto_cm,
    product_width_cm AS Largura_do_Produto_cm
FROM olist_products_dataset;
Explicação:
- O AS cria apelidos para as colunas no resultado.
- A coluna product_category_name aparece como Nome_do_Produto.
- product_length_cm aparece como Cumprimento_do_Produto_cm.
- product_width_cm aparece como Largura_do_Produto_cm.
- O FROM permanece o mesmo.
<img width="454" height="192" alt="image" src="https://github.com/user-attachments/assets/386692c2-0ef4-4cb8-8940-628acb49d36a" />

### Query 7 – Combinação de condições com AND
SELECT 
    product_category_name, 
    product_length_cm, 
    product_height_cm 
FROM olist_products_dataset 
WHERE product_length_cm > 20 AND product_height_cm < 40;
Explicação:
- WHERE product_length_cm > 20 AND product_height_cm < 40 → a condição AND exige que ambas as condições sejam verdadeiras.
- Retorna produtos cujo comprimento é maior que 20 cm E a altura é menor que 40 cm.
<img width="398" height="197" alt="image" src="https://github.com/user-attachments/assets/f0be0fae-fa1a-4877-955f-5208aa6a0fce" />

### Query 8 – Combinação de condições com OR
SELECT 
    product_category_name,
    product_length_cm,
    product_width_cm
FROM olist_products_dataset 
WHERE product_length_cm > 10 OR product_width_cm < 50;
Explicação:
-WHERE product_length_cm > 10 OR product_width_cm < 50 → OR exige que pelo menos uma das condições seja verdadeira.
-Retorna produtos que atendem a qualquer um dos critérios (ou ambos).
<img width="388" height="218" alt="image" src="https://github.com/user-attachments/assets/a5bece6a-4580-4220-933a-730a94b87290" />

### Query 9 – Uso do operador NOT
SELECT 
    product_category_name,
    product_photos_qty
FROM olist_products_dataset 
WHERE NOT product_photos_qty > 10;
Explicação:
- NOT inverte a condição que o segue.
- product_photos_qty > 10 → selecionaria produtos com mais de 10 fotos.
- Com NOT, o resultado passa a ser os produtos que não possuem mais de 10 fotos, ou seja, com product_photos_qty <= 10.
<img width="302" height="195" alt="image" src="https://github.com/user-attachments/assets/0b8465bb-5a9f-4343-8ea3-21de9b3e3d23" />

# Operadores LIKE, IN e BETWEEN – Consultas com Filtragem Avançada

## Explicação geral

Estes operadores complementam os filtros básicos, permitindo buscas mais flexíveis e expressivas:

- **`LIKE`** → busca por padrões em strings, usando curingas `%` (zero ou mais caracteres) e `_` (um caractere).
- **`IN`** → verifica se o valor pertence a uma lista pré‑definida.
- **`BETWEEN`** → verifica se o valor está dentro de um intervalo inclusivo (numérico ou de datas).

Todos os exemplos utilizam a tabela `olist_products_dataset` do dataset **Brazilian E-Commerce Public Dataset by Olist**.

---

## 1. LIKE – categorias que começam com a letra "i"

```sql
SELECT product_category_name 
FROM olist_products_dataset 
WHERE product_category_name LIKE 'i%';

Explicação
- LIKE 'i%' → busca categorias cujo nome comece com a letra i (minúscula).
- O curinga % significa “qualquer sequência de caracteres após o i”.
- Exemplos de saída: informatica_acessorios, instrumentos_musicais, industria_comercio etc.
<img width="158" height="199" alt="image" src="https://github.com/user-attachments/assets/8192c242-60b7-45e1-8fb6-a8282741b615" />

## 2. NOT LIKE – categorias que NÃO começam com "i"
SELECT product_category_name 
FROM olist_products_dataset 
WHERE product_category_name NOT LIKE 'i%';

Explicação
- NOT LIKE inverte a condição: retorna categorias que não começam com a letra i.
- Útil para excluir um padrão específico.
<img width="306" height="237" alt="image" src="https://github.com/user-attachments/assets/5a76399c-fe8f-4361-8081-b85153f1f001" />

## 3. BETWEEN – comprimento entre 10 e 50 cm (inclusive)
SELECT 
    product_category_name,
    product_length_cm
FROM olist_products_dataset 
WHERE product_length_cm BETWEEN 10 AND 50;

Explicação
- BETWEEN 10 AND 50 → seleciona produtos cujo comprimento está entre 10 e 50 centímetros, incluindo os limites (10 e 50).
<img width="294" height="250" alt="image" src="https://github.com/user-attachments/assets/6eab7087-fc5d-4973-9a7a-d1a456a2c097" />

## 4. NOT BETWEEN – comprimento fora da faixa de 10 a 50 cm
SELECT 
    product_category_name,
    product_length_cm
FROM olist_products_dataset 
WHERE product_length_cm NOT BETWEEN 10 AND 50;

Explicação
- NOT BETWEEN retorna os produtos cujo comprimento está fora do intervalo de 10 a 50 cm (incluindo os limites, eles também ficam de fora? Cuidado: NOT BETWEEN exclui os limites, pois o BETWEEN é inclusivo. Ou seja, valores 10 e 50 não aparecem no resultado de NOT BETWEEN).
- Equivalente a: product_length_cm < 10 OR product_length_cm > 50.
<img width="303" height="225" alt="image" src="https://github.com/user-attachments/assets/8a2c6652-1a46-46b0-a80a-bef641c51ef8" />

## 5. IN – categorias específicas
SELECT product_category_name
FROM olist_products_dataset 
WHERE product_category_name IN ('moveis_decoracao', 'brinquedos');

Explicação
- IN verifica se o valor da coluna corresponde a qualquer um dos elementos da lista.
- Retorna os produtos cuja categoria é moveis_decoracao ou brinquedos.
- É uma forma mais legível do que usar múltiplos OR: categoria = 'A' OR categoria = 'B'.
<img width="297" height="253" alt="image" src="https://github.com/user-attachments/assets/8a8f2c06-282a-4a44-9c72-43fda008eb26" />

## 6. NOT IN – categorias que NÃO estão na lista
SELECT product_category_name
FROM olist_products_dataset 
WHERE product_category_name NOT IN ('moveis_decoracao', 'brinquedos');

Explicação
- NOT IN retorna os produtos cuja categoria não é nem moveis_decoracao nem brinquedos.
- Atenção: se a lista contiver NULL, o NOT IN pode retornar um resultado vazio. Neste exemplo, não há NULL na lista, então funciona normalmente.
<img width="306" height="229" alt="image" src="https://github.com/user-attachments/assets/4248f4db-e9d4-478f-92dd-74c6c06b0ec8" />

