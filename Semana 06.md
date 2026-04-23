# Semana 6 - Relacionamentos e JOIN's

## O que será abordado nesta semana:
* Chave primária e estrangeira (conceito)
* INNER JOIN
* LEFT JOIN

## Prática:
* Relacionar clientes com seus pedidos
* Relacionar pedidos com informações de pagamento
* Identificar pedidos que possuem clientes cadastrados 
* Listar todos os clientes, incluindo aqueles que não possuem pedidos

(Será utilizada o banco de dados *Brazilian E-Commerce Public Dataset by Olist*)

---

## Conceito de Chave Primária e de Chave Secundária
As chaves garantem a integridade dos dados e são os "ganchos" utilizados para conectar as tabelas através dos JOINS.

![Tabelas mostrando a relação entre Primary Key e Foreign Key](Imagem/Semana%206/primary_and_foreign_key.png)

### Chave Primária (Primary Key - PK)
* Uma Chave Primária é uma coluna (ou um conjunto de colunas) que identifica de forma única cada registro dentro de uma tabela.
* Uma tabela só pode ter uma única Primary Key e as colunas definidas como tal não podem conter valores nulos (NULL). Elas garantem a integridade e a exclusividade daquela linha de dados.

#### Sintaxe Básica (ao criar uma tabela):
```sql
CREATE TABLE nome_da_tabela (
    id_coluna INT NOT NULL,
    outra_coluna VARCHAR(50),
    PRIMARY KEY (id_coluna)
);
```

### Chave Secundária (Foreign Key - FK)
* A Chave Secundária (ou Estrangeira) é uma coluna ou conjunto de colunas em uma tabela que faz referência à Chave Primária de outra tabela.
* É ela a grande responsável por criar o relacionamento e conectar as duas entidades dentro de um banco de dados relacional.

#### Sintaxe Básica (ao criar uma tabela):
```sql
CREATE TABLE tabela_filha (
    id_filha INT PRIMARY KEY,
    id_tabela_mae INT,
    FOREIGN KEY (id_tabela_mae) REFERENCES tabela_mae(id_mae)
);
```

---

## JOINS
Os comandos JOIN de forma geral são utilizados para combinar linhas de duas ou mais tabelas, baseados em uma coluna comum entre elas (geralmente conectando uma PK com uma FK).

### INNER JOIN
* O INNER JOIN retorna apenas os registros que possuem correspondência exata em ambas as tabelas cruzadas.
* Se um registro da Tabela A não tiver um par correspondente na Tabela B, ele é simplesmente descartado do resultado final.
* Matematicamente, pense nisso como a interseção de dois conjuntos.

![Diagrama de Venn ilustrando um INNER JOIN](Imagem/Semana%206/inner_join.png)

#### Sintaxe Básica:
```sql
SELECT colunas_desejadas
FROM tabela_A
INNER JOIN tabela_B 
    ON tabela_A.coluna_comum = tabela_B.coluna_comum;
```

### LEFT JOIN (ou LEFT OUTER JOIN)
* O LEFT JOIN foca em trazer a totalidade dos dados de um lado do cruzamento. Ele retorna todos os registros da tabela "da esquerda" (que é a primeira tabela mencionada após o comando FROM), e apenas os registros que corresponderem da tabela "da direita".
* Se houver um registro na tabela da esquerda que não encontre nenhum par correspondente na tabela da direita, a consulta não o descarta; em vez disso, o resultado mostrará NULL (nulo) para todas as colunas que viriam da tabela da direita.

![Diagrama de Venn ilustrando um LEFT JOIN](Imagem/Semana%206/left_join.png)

#### Sintaxe Básica:
```sql
SELECT colunas_desejadas
FROM tabela_A
LEFT JOIN tabela_B 
    ON tabela_A.coluna_comum = tabela_B.coluna_comum;
```

---

## Prática

### 1. Relacionar clientes com seus pedidos
```sql
SELECT c.customer_id, c.customer_unique_id, c.customer_city, c.customer_state,
       o.order_id, o.order_status, o.order_purchase_timestamp
FROM olist_customers_dataset c
INNER JOIN olist_orders_dataset o ON c.customer_id = o.customer_id;
```

**Parte dos Resultados:**
| customer_id | customer_unique_id | customer_city | customer_state | order_id | order_status | order_purchase_timestamp |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 06b8999e2fba1e1be88172c00ba8bc7 | 861e847118542e4b93843c6dd1ebb | franca | SP | 00e7ee1b05068499577073aeb2b297a1 | delivered | 2017-05-16 15:05:35.0000000 |
| 18955e83d337d6b2def1b18428ac77 | 290c77bc529b7ac935b63566c333dc3 | sao bernardo do campo | SP | 291501276685802b5eab3eec7545c7 | delivered | 2018-01-12 20:48:24.0000000 |
| 4e7b3e00288586ebd00712fdd0374803 | 060722b5b29e8181a18229c7b0b2b5e | sao paulo | SP | b2050ed67ce144a36e2aa97d29evad2 | delivered | 2018-05-19 16:07:45.0000000 |
| b2b6027bc5c510952904dc6358b12c3 | 259dac757896d24d7702bünchb3f3c | mogi das cruzes | SP | 9516709235941e4a63112aa7306eña | delivered | 2018-03-13 16:06:38.0000000 |
| 4f2d8ab171c80ec8364f7c1235b23ad | 345ecd01c38d1880036ed96c73583066 | campinas | SP | 6b7d50bd145f7f33cebabd7e49d0f | delivered | 2018-07-29 00:51:30.0000000 |
| 879864dab0bc3047522c92c826121268 | 4693744516667ad3b0f1b645a311664 | jaragua do sul | SC | 5741a1191b5fbab2bd2dc653a5b5099 | delivered | 2017-09-14 18:14:31.0000000 |
| fd826e7cf63180e5360008c75c3441 | addec96d2e059c80c30fe6871d30d177 | sao paulo | SP | 36e594chichc2a4503200c35e84ahdc4 | delivered | 2018-02-19 14:38:35.0000000 |
| 5e274e7a0c3809e14aba7ad5aae0d407 | 57629540981251806766bbebe4f | timoteo | MG | 1093c83047003280dd34598194913d | delivered | 2017-11-16 19:29:02.0000000 |
| 5ad8e34b7e993982470709506553 | 117595fb47ddff9delt2606188f7e0d | curitiba | PR | 1mbesa341c500ell6a14a0d7a48e7d062 | delivered | 2018-01-18 12:35:44.0000000 |
| 4671393459263831607243a302fa75b | 9afe194fbill33f7be300378500171122 | belo horizonte | MG | 7433cbcc783205509d66a5260da5b574 | delivered | 2016-01-06 11:22:34.0000000 |
| 9fb35e4ed6f0s14a4977cdilaea4042hb | 2a7745e1ed516b289ed0b29c7d0539a5 | montes claros | MG | 8428e578bb1cf839ee26a6b7615502b9 | delivered | 2017-11-27 17:23:20.0000000 |
| 5aalekidd4dd20959ced2d772509598 | 2a46fb54aef5cbeeb650418118cee090 | rio de janeiro | RJ | 186c5ed7048ac10eb88ec21c00f71892 | delivered | 2018-02-07 11:36:42.0000000 |
| 6281536598b73a9abd180d75d92103 | 918dc67cd72cd95ed4bd442ed785235 | lencois paulista | SP | 83d8f70415ed963764836430305 | delivered | 2017-09-09 09:54:57.0000000 |
| ealiebad39a3bb55b523728612 | 295c05e819179256762456042740184d | sao paulo | SP | 862d24d37773bcbc21cbe09a05e4ea5 | delivered | 2015-03-07 15:57:14.0000000 |
| 11c7bf1c9b0416292af6c1044706753 | 31516810018386361b62277d7fabect | caxias do sul | RS | 5c949e070b5d33dc8fb8ad25b6da4880 | delivered | 2018-04-01 18:56:31.0000000 |
| 2063129c0e4d7d0b955042602308 | 211740161416889014eb3ee6fa325 | piracicaba | SP | eac76692452422620996fm5e1a7bb0 | delivered | 2018-01-29 20:32:08.0000000 |

### 2. Relacionar pedidos com informações de pagamento
```sql
SELECT o.order_id, o.order_status, 
       p.payment_sequential, p.payment_type, p.payment_installments, p.payment_value
FROM olist_orders_dataset o
INNER JOIN olist_order_payments_dataset p ON o.order_id = p.order_id;
```

**Parte dos Resultados:**
| order_id | order_status | payment_sequential | payment_type | payment_installments | payment_value |
| :--- | :--- | :--- | :--- | :--- | :--- |
| b81ef226f3fe1789b1e8b2acac839d17 | delivered | 1 | credit_card | 8 | 99,33 |
| a9810da82917af2d9aefd1278f1dcfa0 | delivered | 1 | credit_card | 1 | 24,39 |
| 25e8ea4e93396b6fa0d3dd708e76c1bd | delivered | 1 | credit card | 1 | 65.71 |
| ba78997921bbcdc1373bb41e913ab953 | delivered | 1 | credit_card | 8 | 107.78 |
| 42fdf880ba16b47b59251dd489d4441a | delivered | 1 | credit_card | 2 | 128,45 |
| 298fcdf1f73eb413e4d26d01b25bc1cd | delivered | 1 | credit_card | 2 | 96,12 |
| 771ee386b001106208a7419e4fc1bbd7 | delivered | 1 | credit_card | 1 | 81,16 |
| 3d7239c394a212faae122962df514ac7 | delivered | 1 | credit_card | 3 | 51,84 |
| 1f78449c87a54faf9e96e88ba1491fa9 | delivered | 1 | credit_card | 6 | 341,09 |
| 0573b5e23cbd798006520e1d5b4c6714 | delivered | 1 | boleto | 1 | 51,95 |
| d88e0d5fa41661ce03cf6cf336527646 | delivered | 1 | credit_card | 8 | 188,73 |
| 2480f727e869fdeb397244a21b721b67 | delivered | 1 | credit_card | 1 | 141,9 |
| 616105c935289668c38303ad44e056cd | delivered | 1 | credit_card | 1 | 75,78 |
| cf95215a722f3ebf29e6bbab87a29e61 | delivered | 1 | credit_card | 5 | 102,66 |
| 769214176682788892801d8907fa1b40 | delivered | 1 | credit_card | 4 | 105,28 |
| 12e5cfe0e4716b59afb0e0f4a3bd6570 | delivered | 1 | credit card | 10 | 157.45 |

### 3. Identificar pedidos que possuem clientes cadastrados
```sql
SELECT o.order_id, o.order_status, o.customer_id, c.customer_unique_id
FROM olist_orders_dataset o
INNER JOIN olist_customers_dataset c ON o.customer_id = c.customer_id
WHERE o.order_status = 'delivered';
```

**Parte dos Resultados:**
| order_id | order_status | customer_id | customer_unique_id |
| :--- | :--- | :--- | :--- |
| 00e7ee1b05068499577073aeb2a297a1 | delivered | 06b8999e2fba1a1fbc88172c00ba8bc7 | 861eff4711a542e4b93843c6dd7febb0 |
| 2915012766685892b6eab3eec79f59c7 | delivered | 18955e83d337fd6b2def6b18a428ac77 | 290c77bc529b7ac935b93aa66c333dc3 |
| b2059ed67ce144a36e2aa97d2c9e9ad2 | delivered | 4e7b3e00288586ebd08712fdd0374803 | 060e732b5b29e8181a18229c7b0b2b5e |
| 951670192359f4fe4a63112aa7306eba | delivered | b2b6027bc5c5109e529d4dc6358b12c3 | 259dac757896d24d7702b9acbbff3f3c |
| 6b7d50bd145f6fc7f33cebabd7e49d0f | delivered | 4f2d8ab171c80ec8364f7c12e35b23ad | 345ecd01c38d18a9036ed96c73b8d066 |
| 5741ea1f91b5fbab2bd2dc653a5b5099 | delivered | 879864dab9bc3047522c92c82e1212b8 | 4c93744516667ad3b8f1fb645a3116a4 |
| 36e694cf4cbc2a4803200c35e84abdc4 | delivered | fd826e7cf63160e536e0908c76c3f441 | addec96d2e059c80c30fe6871d30d177 |
| 1093c8304c7a003280dd34598194913d | delivered | 5e274e7a0c3809e14aba7ad5aae0d407 | 57b2a98a409812fe9618067b6b8ebe4f |
| 1ebeea841c590e86a14a0d7a48e7d062 | delivered | 5adf08e34b2e993982847070956c5c65 | 1175e95fb47ddff9de6b2b06188f7e0d |
| 7433cbcc783205509d66a5260da5b574 | delivered | 467139134592b3a31687243a302fa75b | 9afe194fb833f79e300e37e580171122 |
| 8428e578bb1cf839ae26a6b761550269 | delivered | 9fb35e4ed6f0a14a4977cd9aea4042bb | 2a7745e1ed516b289ed9b29c7d0539a5 |
| f86c5ed7048ac10eb88ec21c00f71892 | delivered | 5aa9e4fdd4dfd20959cad2d772509598 | 2a46fb94aef5cbeeb850418118cee090 |
| 83d8f70418eefd96f37b483dff430305 | delivered | b2d1536598b73a9abd18e0d75d92f0a3 | 918dc87cd72cd9f6ed4bd442ed785235 |
| 852d2f4d37773bcbc21c8e09a05a4ea5 | delivered | eabebad39a88bb6f5b52376faec28612 | 295c05e81917928d76245e842748184d |
| 6c949e670b5d33dc8fb8ad25b6da4860 | delivered | 1f1c7bf1c9b0416292af6c1c4470b753 | 3151a81801c8386361662277d7fa5ecf |
| eac76692452422620996fe5e1a7f8bb0 | delivered | 206f3129c0e4d7d0b95504260230a08 | 21f748a16f4e1688a9014eb3ee6fa325 |

### 4. Listar todos os clientes, incluindo aqueles que não possuem pedidos
```sql
SELECT c.customer_id, c.customer_unique_id, c.customer_city,
       o.order_id, o.order_status
FROM olist_customers_dataset c
LEFT JOIN olist_orders_dataset o ON c.customer_id=o.customer_id;
```

**Parte dos Resultados:**
| customer_id | customer_unique_id | customer_city | order_id | order_status |
| :--- | :--- | :--- | :--- | :--- |
| 06b8999e2fba1a1fbc88172c00ba8bc7 | 861eff4711a542e4b93843c6dd7febb0 | franca | 00e7ee1b05068499577073aeb2a297a1 | delivered |
| 18955e83d337fd6b2def6b18a428ac77 | 290c77bc529b7ac935b93aa66c333dc3 | sao bernardo do campo | 2915012766685892b6eab3eec79f59c7 | delivered |
| 4e7b3e00288586ebd08712fdd0374803 | 060e732b5b29e8181a18229c7b0b2b5e | sao paulo | b2059ed67ce144a36e2aa97d2c9e9ad2 | delivered |
| b2b6027bc5c51096529d4dc6358b12c3 | 259dac757896d24d7702b9acbbff3f3c | mogi das cruzes | 951670192359f4fe4a63112aa7306eba | delivered |
| 4f2d8ab171c80ec8364f7c12e35b23ad | 345ecd01c38d18a9036ed96c73b8d066 | campinas | 6b7d50bd145f6fc7f33cebabd7e49d0f | delivered |
| 879864dab9bc3047522c92c82e121268 | 4c93744516667ad3b8f1fb645a3116a4 | jaragua do sul | 5741ea1f91b5fbab2bd2dc653a5b5099 | delivered |
| fd826e7cf63160e536e0908c76c3f441 | addec96d2e059c80c30fe6871d30d177 | sao paulo | 36e694cf4cbc2a4803200c35e84abdc4 | delivered |
| 5e274e7a0c3809e14aba7ad5aae0d407 | 57b2a98a409812fe9618067b6b8ebe4f | timoteo | 1093c8304c7a003280dd34598194913d | delivered |
| 5ad08e34b2e993982847070956c5c65 | 1175e95fb47ddff9de6b2b06188f7e0d | curitiba | 1ebeea841c590e86a14a0d7a48e7d062 | delivered |
| 467139134592b3a31687243a302fa75b | 9afe194fb833f79e300e37e580171122 | belo horizonte | 7433cbcc783205509d66a5260da5b574 | delivered |
| 9fb35e4ed6f0a1484977cd9aea4042bb | 2a7745e1ed516b289ed9b29c7d0539a5 | montes claros | 8428e578bb1cf839ae26a6b761550269 | delivered |
| 5aa9e4fdd4dfd20959cad2d772509598 | 2a46fb94aef5cbeeb850418118cee090 | rio de janeiro | f86c5ed7048ac10eb88ec21c00f71892 | delivered |
| b2d1536598b73a9abd18e0d75d92f0a3 | 918dc87cd72cd9f6ed4bd442ed785235 | lencois paulista | 83d8f70418eefd96f37b483dff430305 | delivered |
| eabebad39a88bb6f5b52376faec28612 | 295c05681917928d762456842748184d | sao paulo | 852d2f4d37773bcbc21c8e09a05a4ea5 | delivered |
| 1f1c7bf1c9b041b292af6c1c44706753 | 3151a81801c8386361662277d7fa5ecf | caxias do sul | 6c949e670b5d33dc8fb8ad25b6da4860 | delivered |
| 206f3129c0e4d7d0b9550426023008 | 21f748a16f4e1688a9014eb3ee6fa325 | piracicaba | eac76692452422620996fe5e1a7f8bb0 | delivered |

