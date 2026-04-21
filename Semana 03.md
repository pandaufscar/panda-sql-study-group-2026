# Semana 3 – Ordenação, Limitação e Tratamento de Nulos

## Explicação da semana

Nesta terceira semana, o foco é melhorar a **organização e controle dos resultados das consultas SQL**, além de lidar com um problema muito comum em bancos de dados: os valores **nulos (`NULL`)**.

Até agora, aprendemos a filtrar dados. Agora, vamos aprender a:

- Ordenar resultados
- Limitar quantas linhas queremos ver
- Pular linhas (paginação)
- Tratar valores ausentes (`NULL`)

Essas técnicas são fundamentais em análises reais, dashboards e aplicações.

---

## Banco de dados utilizado

Seguimos utilizando:

- **Dataset:** Brazilian E-Commerce Public Dataset by Olist  
- **Tabela:** `olist_products_dataset`

Colunas principais:

| Coluna                    | Descrição                             |
|---------------------------|--------------------------------------|
| `product_category_name`   | Categoria do produto                 |
| `product_length_cm`       | Comprimento (cm)                     |
| `product_height_cm`       | Altura (cm)                          |
| `product_width_cm`        | Largura (cm)                         |
| `product_weight_g`        | Peso (g)                             |
| `product_photos_qty`      | Quantidade de fotos                  |

---

## Conceitos importantes

### 🔹 `ORDER BY` – Ordenação

Permite ordenar os resultados:

- `ASC` → crescente (padrão)
- `DESC` → decrescente

---

### 🔹 `LIMIT` – Limitar resultados

Define quantas linhas serão retornadas.

---

### 🔹 `OFFSET` – Pular linhas

Usado junto com `LIMIT` para paginação.

---

### 🔹 `NULL`

Representa ausência de valor (não é zero, nem vazio).

---

### 🔹 `IS NULL` e `IS NOT NULL`

- `IS NULL` → verifica valores nulos  
- `IS NOT NULL` → verifica valores preenchidos  

---

### 🔹 `COALESCE`

Substitui valores `NULL` por um valor definido.

---

## Prática – Ordenação e controle de resultados

---

### Query 1 – Ordenar produtos por peso (crescente)

```sql
SELECT 
    product_category_name,
    product_weight_g
FROM olist_products_dataset
ORDER BY product_weight_g ASC;
````

**Explicação:**

* `ORDER BY product_weight_g ASC` → ordena do menor para o maior peso.
* `ASC` é opcional (já é o padrão).

---

### Query 2 – Ordenar produtos por peso (decrescente)

```sql
SELECT 
    product_category_name,
    product_weight_g
FROM olist_products_dataset
ORDER BY product_weight_g DESC;
```

**Explicação:**

* `DESC` mostra os produtos mais pesados primeiro.

---

### Query 3 – Ordenação por múltiplas colunas

```sql
SELECT 
    product_category_name,
    product_weight_g,
    product_length_cm
FROM olist_products_dataset
ORDER BY product_weight_g DESC, product_length_cm ASC;
```

**Explicação:**

* Primeiro ordena por peso (maior → menor)
* Em caso de empate, ordena pelo comprimento (menor → maior)

---

### Query 4 – Limitar resultados (TOP N)

```sql
SELECT 
    product_category_name,
    product_weight_g
FROM olist_products_dataset
ORDER BY product_weight_g DESC
LIMIT 10;
```

**Explicação:**

* Retorna apenas os 10 produtos mais pesados.

---

### Query 5 – Paginação com LIMIT e OFFSET

```sql
SELECT 
    product_category_name,
    product_weight_g
FROM olist_products_dataset
ORDER BY product_weight_g DESC
LIMIT 10 OFFSET 10;
```

**Explicação:**

* `LIMIT 10` → pega 10 linhas
* `OFFSET 10` → pula as 10 primeiras
* Resultado: mostra da 11ª até a 20ª linha

---

## Prática – Trabalhando com valores NULL

---

### Query 6 – Encontrar valores nulos

```sql
SELECT 
    product_category_name,
    product_length_cm
FROM olist_products_dataset
WHERE product_length_cm IS NULL;
```

**Explicação:**

* Retorna produtos sem informação de comprimento.

---

### Query 7 – Filtrar valores não nulos

```sql
SELECT 
    product_category_name,
    product_length_cm
FROM olist_products_dataset
WHERE product_length_cm IS NOT NULL;
```

**Explicação:**

* Retorna apenas produtos com comprimento preenchido.

---

### Query 8 – Usando COALESCE para substituir NULL

```sql
SELECT 
    product_category_name,
    COALESCE(product_length_cm, 0) AS comprimento_tratado
FROM olist_products_dataset;
```

**Explicação:**

* Se `product_length_cm` for NULL → substitui por `0`
* Caso contrário → mantém o valor original

---

### Query 9 – COALESCE com texto

```sql
SELECT 
    COALESCE(product_category_name, 'Categoria desconhecida') AS categoria
FROM olist_products_dataset;
```

**Explicação:**

* Substitui valores nulos por um texto mais amigável

---

### Query 10 – Ordenação considerando NULL

```sql
SELECT 
    product_category_name,
    product_length_cm
FROM olist_products_dataset
ORDER BY product_length_cm ASC;
```

**Explicação:**

* Em muitos bancos, valores `NULL` aparecem primeiro ou último (depende do SGBD)
* É importante entender esse comportamento

---

### Query 11 – Combinando filtro + ordenação + limite

```sql
SELECT 
    product_category_name,
    product_weight_g
FROM olist_products_dataset
WHERE product_weight_g IS NOT NULL
ORDER BY product_weight_g DESC
LIMIT 5;
```

**Explicação:**

* Filtra apenas valores válidos
* Ordena do maior para o menor
* Retorna os 5 mais pesados

---
