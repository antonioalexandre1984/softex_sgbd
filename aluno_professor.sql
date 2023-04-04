SELECT * FROM tabela WHERE nota > 7.0;

SELECT * FROM tabela WHERE serie = '1 ano' AND nota >= 8.0;

SELECT p.nome, u.nome, nota FROM tabela;

CREATE TABLE
    professor (
        primeiro_nome VARCHAR(50),
        ultimo_nome VARCHAR(50)
    );

INSERT INTO
    professor (primeiro_nome, ultimo_nome)
SELECT
    SUBSTRING_INDEX(nome, ' ', 1),
    SUBSTRING_INDEX(nome, ' ', -1)
FROM tabela;

SELECT primeiro_nome, ultimo_nome FROM professor;

CREATE TABLE
    aluno (
        primeiro_nome VARCHAR(50),
        ultimo_nome VARCHAR(50)
    );

INSERT INTO
    aluno (primeiro_nome, ultimo_nome)
SELECT
    SUBSTRING_INDEX(p.nome, ' ', 1),
    SUBSTRING_INDEX(u.nome, ' ', -1)
FROM tabela;

SELECT primeiro_nome, ultimo_nome FROM aluno;

CREATE TABLE
    aluno_professor (
        primeiro_nome VARCHAR(50),
        ultimo_nome VARCHAR(50),
        tipo VARCHAR(10)
    );

INSERT INTO
    aluno_professor (
        primeiro_nome,
        ultimo_nome,
        tipo
    )
SELECT
    SUBSTRING_INDEX(p.nome, ' ', 1),
    SUBSTRING_INDEX(u.nome, ' ', -1),
    'ALUNO'
FROM tabela
UNION
SELECT
    SUBSTRING_INDEX(nome, ' ', 1),
    SUBSTRING_INDEX(nome, ' ', -1),
    'PROFESSOR'
FROM tabela_professor;

SELECT primeiro_nome, ultimo_nome FROM aluno_professor;

CREATE TABLE
    aluno_professor (
        primeiro_nome VARCHAR(50),
        ultimo_nome VARCHAR(50),
        tipo VARCHAR(10)
    );

INSERT INTO
    aluno_professor (
        primeiro_nome,
        ultimo_nome,
        tipo
    )
SELECT
    SUBSTRING_INDEX(p.nome, ' ', 1),
    SUBSTRING_INDEX(u.nome, ' ', -1),
    'ALUNO'
FROM tabela
INTERSECT
SELECT
    SUBSTRING_INDEX(nome, ' ', 1),
    SUBSTRING_INDEX(nome, ' ', -1),
    'PROFESSOR'
FROM tabela_professor;

SELECT primeiro_nome, ultimo_nome FROM aluno_professor;

CREATE TABLE
    aluno_professor (
        primeiro_nome VARCHAR(50),
        ultimo_nome VARCHAR(50),
        tipo VARCHAR(10)
    );

INSERT INTO
    aluno_professor (
        primeiro_nome,
        ultimo_nome,
        tipo
    )
SELECT
    SUBSTRING_INDEX(p.nome, ' ', 1),
    SUBSTRING_INDEX(u.nome, ' ', -1),
    'ALUNO'
FROM tabela
WHERE NOT EXISTS (
        SELECT nome
        FROM tabela_professor
        WHERE
            SUBSTRING_INDEX(p.nome, ' ', 1) = SUBSTRING_INDEX(nome, ' ', 1)
            AND SUBSTRING_INDEX(u.nome, ' ', -1) = SUBSTRING_INDEX(nome, ' ', -1)
    );

SELECT primeiro_nome, ultimo_nome FROM aluno_professor;