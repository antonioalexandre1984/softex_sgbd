Para desenvolver um banco de dados que relacione tabelas através de chaves estrangeiras ou nomes de colunas iguais,
vamos criar duas tabelas: "clientes" e "pedidos".A tabela "clientes" terá informações sobre os clientes,
enquanto a tabela "pedidos" terá informações sobre os pedidos realizados pelos clientes.Tabela "clientes":
CREATE TABLE
    clientes (
        id INT PRIMARY KEY,
        nome VARCHAR(50),
        email VARCHAR(50),
        cidade VARCHAR(50)
    );

Tabela "pedidos":
CREATE TABLE
    pedidos (
        id INT PRIMARY KEY,
        data_pedido DATE,
        valor DECIMAL(10, 2),
        cliente_id INT,
        FOREIGN KEY (cliente_id) REFERENCES clientes(id)
    );

Agora,
vamos inserir alguns dados nas tabelas para poder realizar os comandos Joins: Inserir dados na tabela "clientes":
INSERT INTO
    clientes (id, nome, email, cidade)
VALUES (
        1,
        'João',
        'joao@email.com',
        'São Paulo'
    );

INSERT INTO
    clientes (id, nome, email, cidade)
VALUES (
        2,
        'Maria',
        'maria@email.com',
        'Rio de Janeiro'
    );

Inserir dados na tabela "pedidos":
INSERT INTO
    pedidos (
        id,
        data_pedido,
        valor,
        cliente_id
    )
VALUES (1, '2022-01-01', 100.00, 1);

INSERT INTO
    pedidos (
        id,
        data_pedido,
        valor,
        cliente_id
    )
VALUES (2, '2022-01-15', 50.00, 1);

INSERT INTO
    pedidos (
        id,
        data_pedido,
        valor,
        cliente_id
    )
VALUES (3, '2022-02-01', 200.00, 2);

INSERT INTO
    pedidos (
        id,
        data_pedido,
        valor,
        cliente_id
    )
VALUES (4, '2022-02-15', 75.00, 2);

Agora,
vamos realizar os comandos Joins estudados:
INNER JOIN:
SELECT *
FROM clientes
    INNER JOIN pedidos ON clientes.id = pedidos.cliente_id;

SELECT *
FROM clientes
    INNER JOIN pedidos ON clientes.id = pedidos.cliente_id;

Resultado | id | nome | email | cidade | id | data_pedido | valor | cliente_id | | ----|-------|----------------|--------------|----|-------------|--------|------------|
| 1 | João | joao @email.com | São Paulo | 1 | 2022 -01 -01 | 100.00 | 1 | | 1 | João | joao @email.com | São Paulo | 2 | 2022 -01 -15 | 50.00 | 1 | | 2 | Maria | maria @email.com | Rio de Janeiro | 3 | 2022 -02 -01 | 200.00 | 2 | | 2 | Maria | maria @email.com | Rio de Janeiro | 4 | 2022 -02 -15 | 75.00 | 2 |
LEFT JOIN:
SELECT *
FROM clientes
    LEFT JOIN pedidos ON clientes.id = pedidos.cliente_id;

| id | nome | email | cidade | id | data_pedido | valor | cliente_id | | ----|-------|----------------|--------------|----|-------------|--------|------------|
| 1 | João | joao @email.com | São Paulo | 1 | 2022 -01 -01 | 100.00 |