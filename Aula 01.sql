-- CONSULTAR BANCO DE DADOS CRIADOS
SHOW SCHEMAS;

-- Apagar o banco de dados que foi criado
DROP DATABASE IF EXISTS curso_mysql

-- Criar o banco de dados que será utilizado no curso
CREATE DATABASE IF NOT EXISTS curso_mysql;

-- Definir o banco de dados que será executado as consultas (queries)
USE curso_mysql

-- Consultar as tabelas do banco de dados utilizado (vulgo comando USE curso_mysql)
SHOW TABLES;

-- Criar tabela para armazenar os registro dos alunos
-- AUTO_INCREMENT vai fazer o id começar com e depois incrementar em 1 a cada registro
-- VAR CHAR(100) coluna com no máximo 100 caracteres
CREATE TABLE alunos(
    id INT PRIMARY KEY AUTO_INCREMENT, 
    nome VARCHAR(100) NOT NULL 
);

--  Consultar todos os registros da tablea de alunos
SELECT
    id,
    nome
    FROM alunos;

-- Criar registro na tabela de alunos
INSERT INTO alunos (nome) VALUE ("Jardel");

-- CUIDADO: APAGAR TODOS os registros da table;
DELETE FROM alunos;

-- Consultar as colunas das tabelas
DESCRIBE alunos;

-- +-------+--------------+------+-----+---------+----------------+
-- | Field | Type         | Null | Key | Default | Extra          |
-- +-------+--------------+------+-----+---------+----------------+
-- | id    | int          | NO   | PRI | NULL    | auto_increment |
-- | nome  | varchar(100) | NO   |     | NULL    |                |
-- +-------+--------------+------+-----+---------+----------------+

-- Redefinir o AUTO_INCREMENT e apagar todos os registros da tabela;
-- Porém não pode ter FK relacionada a esta tabela
TRUNCATE TABLE alunos;

-- Criar registro na tabela de alunos
INSERT INTO alunos (nome) VALUE ("Jardel");
INSERT INTO alunos (nome) VALUE ("José");
INSERT INTO alunos (nome) VALUE ("Luiz");
INSERT INTO alunos (nome) VALUE ("Bruno");
INSERT INTO alunos (nome) VALUE ("Lucas");
INSERT INTO alunos (nome) VALUE ("Zaqueu");
INSERT INTO alunos (nome) VALUE ("João");

-- Apagar registro do João filtrado pelo nome "João"
DELETE FROM alunos WHERE nome = "João";
-- Apagar registro do João filtado pelo id 7
DELETE FROM alunos WHERE id = 7;

--  Consultar quantidade de registros da tabela
SELECT COUNT(id) FROM alunos;

-- Criando tabela de professores

-- Cinco números, sendo 2 na parte decimal
CREATE TABLE professores(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    valor_hora FLOAT(5, 2)
);

INSERT INTO professores (nome, valor_hora) VALUE ("Francisco", 53.00 );
INSERT INTO professores (nome, valor_hora) VALUE ("Javeiro", 80.35 );
INSERT INTO professores (nome, valor_hora) VALUE ("Rubens", 75.00 );
INSERT INTO professores (nome, valor_hora) VALUE ("Pablo", 60.00 );
INSERT INTO professores (nome, valor_hora) VALUE ("Pamela", 100.00 );

-- Criando tabela para cursos

CREATE TABLE cursos(
 id INT PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR(30) NOT NULL,
 carga_horaria INT
);

-- Criar registros de cursos

INSERT INTO cursos (nome, carga_horaria) VALUE ("MySQL", 28);
INSERT INTO cursos (nome, carga_horaria) VALUE ("C#", 40);
INSERT INTO cursos (nome, carga_horaria) VALUE ("Python", 39);
INSERT INTO cursos (nome, carga_horaria) VALUE ("Java", 41);
INSERT INTO cursos (nome, carga_horaria) VALUE ("HTML, CSS", 32);
INSERT INTO cursos (nome, carga_horaria) VALUE ("React", 52);

-- Consultar registros de cursos

SELECT * FROM cursos;

-- Consultar registros de cursos ordenados em órdem crescente (ASC) da coluna nome
SELECT * FROM cursos ORDER BY nome ASC;

-- Consultar registros de cursos ordenados em órdem decrescente (DESC) da coluna nome
SELECT * FROM cursos ORDER BY nome DESC;

-- Consultar registros de cursos filtrando onde a carga_horaria é maior ou igual a 40 horas
-- Ordenando pela carga_horaria em ordem crescente
SELECT * FROM cursos
    -> WHERE carga_horaria >= 40
    -> ORDER BY carga_horaria ASC;

-- Operadores Relacionais
-- Igual                =
-- Diferente            != <>
-- MENOR                <
-- MENOR OU IGUAL       <=
-- MAIOR                >
-- MAIOR OU IGUAL       >=

-- Consultar a menor carga horária
SELECT MIN(carga_horaria) FROM cursos;
-- Consultar a maior carga horária
SELECT MAX(carga_horaria) FROM cursos;
-- Consultar a soma das cargas horárias
SELECT SUM(carga_horaria) FROM cursos;
-- Consultar a média das cargas horárias
SELECT SUM(carga_horaria) / COUNT(id) FROM cursos;
SELECT AVG(carga_horaria) FROM cursos;

SELECT AVG(carga_horaria) FROM cursos WHERE carga_horaria > 40
SELECT AVG(carga_horaria) AS "Média de carga horária de cursos > 40h"
FROM cursos WHERE carga_horaria > 40;

-- Consultar a quantidade de caracteres da coluna do nome
SELECT LENGTH(nome), nome FROM cursos;
-- Criar coluna na tabela de alunos para armazenar a data de nascimento
ALTER TABLE alunos ADD COLUMN data_nascimento DATE;

-- Consultar a data de nascimento dos alunos
SELECT id,nome, data_nascimento FROM alunos;

-- Atualizar a data de nascimento do José
UPDATE alunos SET data_nascimento = '1996-07-27' WHERE id = 1;
UPDATE alunos SET data_nascimento = '2000-06-28' WHERE id = 2;
UPDATE alunos SET data_nascimento = '1981-10-18' WHERE id = 3;
UPDATE alunos SET data_nascimento = '2000-01-01' WHERE id = 4;
UPDATE alunos SET data_nascimento = '2004-10-27' WHERE id = 5;
UPDATE alunos SET data_nascimento = '2000-01-02' WHERE id = 6;

SELECT DATE_FORMAT(data_nascimento, "%d/%m/%Y") AS 'Data de nascimento'
FROM alunos;
-- Consultar Ano data de nascimento
SELECT YEAR(data_nascimento) FROM alunos;
--Consultar Mês da data de nascimento
SELECT MONTH(data_nascimento) FROM alunos;
-- Consultar Dia da data de nascimento
SELECT DAY(data_nascimento) FROM alunos;
-- Consultar o Nome e a Data de nascimento concatenados
SELECT CONCAT(nome," ",data_nascimento) FROM alunos;

-- Consultar o nome de data de nascimento, de alunos nascidos depoisn de 1999,
-- Ordenando por múltiplas colunas
SELECT nome, data_nascimento FROM alunos 
WHERE YEAR(data_nascimento) >= 2000
ORDER BY YEAR(data_nascimento) ASC, MONTH (data_nascimento) ASC, DAY(data_nascimento);

-- Operador Lógico AND

SELECT * FROM alunos
WHERE   YEAR(data_nascimento) >= 1990 AND
        YEAR(data_nascimento) <= 1999;

-- Operador Lógico OR
-- Consultar os cursos com o nome C# ou Python
SELECT id,nome FROM cursos WHERE nome="C#" OR nome="Python";
SELECT id,nome FROM cursos WHERE nome IN ("C#","Python","Java");

--Consultar os cursos com nome diferente de C# e Python e Java (SEM NOT IN)
SELECT * FROM cursos WHERE nome != "C#" AND nome != "Python" AND nome != "Java";

-- Consultar os cursos com nome diferente de C# e Python e Java (COM NOT IN)
SELECT * FROM cursos WHERE nome NOT IN ("C#", "Python", "Java");

SELECT * FROM cursos;
-- Consultar os Cursos com carga horária entre 40 e 45 horas

SELECT * FROM cursos WHERE carga_horaria >= 40 AND carga_horaria <= 45; -- Sem Between
SELECT * FROM cursos WHERE carga_horaria BETWEEN 40 AND 45; -- Com Between