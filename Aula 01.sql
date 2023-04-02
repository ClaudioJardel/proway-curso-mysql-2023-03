-- Consultar bancos de dados criados
SHOW SCHEMAS;

-- Apagar o banco de dados que foi criado
DROP DATABASE IF EXISTS curso_mysql;

-- Criar o banco de dados que será utilizado no curso
CREATE DATABASE IF NOT EXISTS curso_mysql;

-- Definir o banco que dados que será executado as consultas(queries)
USE curso_mysql;

-- Consultar as tabelas do banco de dados utilizado (vulgo comando USE curso_mysql)
SHOW TABLES;

-- Criar tabela para armazenar os registros dos alunos
CREATE TABLE alunos(
    -- AUTO_INCREMENT vai fazer o id começar com e depois incrementar em 1 a cada registro
    -- NOT NULL coluna que é obrigatório informar valor
    id INT PRIMARY KEY AUTO_INCREMENT, 
    nome VARCHAR(100) NOT NULL -- VARCHAR(100) coluna com no máximo 100 caracteres
);

-- Consultar todos os registros da tabela de alunos
SELECT id, nome FROM alunos;

-- Criar registro na tabela de alunos
INSERT INTO alunos (nome) VALUE ("José");

-- CUIDADO: Apagar TODOS os registros da tabela;
DELETE FROM alunos;

-- Consultar as colunas das tabelas
DESCRIBE alunos;
-- +-------+--------------+------+-----+---------+----------------+                                         
-- | Field | Type         | Null | Key | Default | Extra          |
-- +-------+--------------+------+-----+---------+----------------+
-- | id    | int          | NO   | PRI | NULL    | auto_increment |
-- | nome  | varchar(100) | NO   |     | NULL    |                |
-- +-------+--------------+------+-----+---------+----------------+ 

-- Redefinir o AUTO_INCREMENT e apagar todos os registros da tabela, 
--   porém n pode ter FK relacionada a esta tabela
TRUNCATE TABLE alunos;

-- Criar registro na tabela de alunos
INSERT INTO alunos (nome) VALUE ("José");
INSERT INTO alunos (nome) VALUE ("Luiz");
INSERT INTO alunos (nome) VALUE ("Bruno");
INSERT INTO alunos (nome) VALUE ("Lucas");
INSERT INTO alunos (nome) VALUE ("Jardel");
INSERT INTO alunos (nome) VALUE ("Zaqueu");
INSERT INTO alunos (nome) VALUE ("João");

-- Apagar registro do João filtrando pelo nome "João"
DELETE FROM alunos WHERE nome = "João";
-- Apagar o registro do João filtrando pelo id 7
DELETE FROM alunos WHERE id = 7;

-- Consultar quantidade de registros da tabela
SELECT COUNT(id) FROM alunos;

-- Criar tabela de professores 
CREATE TABLE professores(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    valor_hora FLOAT(5, 2) -- cinco números, sendo 2 na parte decimal
); 

INSERT INTO professores (nome, valor_hora) VALUE ("Francisco", 53.00);
INSERT INTO professores (nome, valor_hora) VALUE ("Javeiro", 80.35);
INSERT INTO professores (nome, valor_hora) VALUE ("Rubens", 75.00);
INSERT INTO professores (nome, valor_hora) VALUE ("Pablo", 60.00);
INSERT INTO professores (nome, valor_hora) VALUE ("Pamela", 100.00);

SELECT id, nome, valor_hora FROM professores;


-- Criar tabela de cursos
CREATE TABLE cursos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    carga_horaria INT NOT NULL
);

-- Criar registros de cursos
INSERT INTO cursos (nome, carga_horaria) VALUE ('MySQL', 28);
INSERT INTO cursos (nome, carga_horaria) VALUE ('C#', 40);
INSERT INTO cursos (nome, carga_horaria) VALUE ('Python', 39);
INSERT INTO cursos (nome, carga_horaria) VALUE ('Java', 41);
INSERT INTO cursos (nome, carga_horaria) VALUE ('HTML, CSS', 32);
INSERT INTO cursos (nome, carga_horaria) VALUE ('React', 52);

-- Consultar registros de cursos
SELECT id, nome, carga_horaria FROM cursos;

-- Consultar registros de cursos ordenados em ordem crescente(ASC) da coluna nome
SELECT id, nome, carga_horaria FROM cursos ORDER BY nome ASC;

-- Consultar registros de cursos ordenados em ordem decrescente(DESC) da coluna nome
SELECT id, nome, carga_horaria FROM cursos ORDER BY nome DESC;

-- Consultar registros de cursos filtrando onde a carga_horaria é maior ou igual a 40 horas
-- Ordenando pela carga_horaria em ordem crescente
SELECT id, nome, carga_horaria FROM cursos 
    WHERE carga_horaria >= 40
    ORDER BY carga_horaria ASC;

-- Operadores relacionais:
-- IGUAL            =
-- DIFERENTE        != <>
-- MENOR            <
-- MENOR OU IGUAL   <=
-- MAIOR            >
-- MAIOR OU IGUAL   >=


-- https://bit.ly/3YLA5xk

-- Consultar a menor carga horária
SELECT MIN(carga_horaria) FROM cursos;
-- Consultar a maior carga horária
SELECT MAX(carga_horaria) FROM cursos; 
-- Consultar a soma das cargas horárias
SELECT SUM(carga_horaria) FROM cursos;
-- Consultar a médias das cargas horárias
SELECT SUM(carga_horaria) / COUNT(id) FROM cursos;
SELECT AVG(carga_horaria) FROM cursos;

SELECT 
    AVG(carga_horaria) AS "Média de carga horária de cursos > 40h"
    FROM cursos WHERE carga_horaria > 40;

-- Consultar a quantidade de caracteres da coluna do nome
SELECT LENGTH(nome), nome FROM cursos;

-- Criar coluna na tabela de alunos para armazenar a data de nascimento
ALTER TABLE alunos ADD COLUMN data_nascimento DATE;

-- Consultar a data de nascimento dos alunos
SELECT id, nome, data_nascimento FROM alunos;

-- Atualizar a data de nascimento do José
DELETE FROM alunos WHERE id = 7; 
UPDATE alunos SET data_nascimento = '2000-06-28' WHERE id = 1;
UPDATE alunos SET data_nascimento = '2004-10-27' WHERE id = 2;
UPDATE alunos SET data_nascimento = '1981-10-18' WHERE id = 3;
UPDATE alunos SET data_nascimento = '2000-01-01' WHERE id = 4;
UPDATE alunos SET data_nascimento = '1996-07-27' WHERE id = 5;
UPDATE alunos SET data_nascimento = '2000-01-02' WHERE id = 6;

SELECT 
    DATE_FORMAT(data_nascimento, "%d/%m/%Y") AS 'Data de nascimento'
    FROM alunos;

-- Consultar o ano da data de nascimento
SELECT YEAR(data_nascimento) FROM alunos;
-- Consultar o mês da data de nascimento
SELECT MONTH(data_nascimento) FROM alunos;
-- Consultar o dia da data de nascimento;
SELECT DAY(data_nascimento) FROM alunos;

-- Consultar o nome e data de nascimento concatenados
SELECT CONCAT(nome, " ", data_nascimento) FROM alunos;

-- Consultar o nome e data de nascimento, de alunos nascidos depois de 1999,
-- ordenando por múltiplas colunas
SELECT nome, data_nascimento 
    FROM alunos 
    WHERE YEAR(data_nascimento) >= 2000 
    ORDER BY YEAR(data_nascimento) ASC, MONTH(data_nascimento) ASC, DAY(data_nascimento);


-- OPERADOR LÓGICO AND
-- V    e   V   => V
-- V    e   F   => F
-- F    e   V   => F
-- F    e   F   => F

-- Consultar os alunos que nasceram na década de 90
SELECT id, nome, data_nascimento 
    FROM alunos 
    WHERE 
        YEAR(data_nascimento) >= 1990 AND 
        YEAR(data_nascimento) <= 1999;

-- OPERADOR LÓGICO OR
-- V    ou  V => V
-- V    ou  F => V
-- F    ou  V => V
-- F    ou  F => F
-- Consultar os cursos com o nome C# ou Python
SELECT id, nome FROM cursos WHERE nome = "C#" OR nome = "Python";

-- Consultar os cursos com o nome C# ou Pyhon ou Java
SELECT id, nome FROM cursos WHERE nome IN ("C#", "Python", "Java");

-- Consultar os cursos com o nome diferente de C# e Python e Java (SEM NOT IN)
SELECT id, nome FROM cursos WHERE nome != "C#" AND nome != "Python" AND nome != "Java";

-- Consultar os cursos com o nome diferente de C# e Python e Java (COM NOT IN)
SELECT id, nome FROM cursos WHERE nome NOT IN ("C#", "Python", "Java");

-- Consultar os cursos com carga horária entre 40 e 45 horas
SELECT id, nome, carga_horaria 
    FROM cursos 
    WHERE carga_horaria >= 40 AND carga_horaria <= 45; -- Sem BETWEEN

SELECT id, nome, carga_horaria 
    FROM cursos
    WHERE carga_horaria BETWEEN 40 AND 45; -- Com Between

-- Consultar os cursos limitados a dois registros
SELECT * FROM cursos LIMIT 2;

-- Consultar os cursos limitados a dois registros da primeira página
SELECT * FROM cursos LIMIT 0, 2;
-- +----+-------+---------------+
-- | id | nome  | carga_horaria |
-- +----+-------+---------------+
-- |  1 | MySQL |            28 |
-- |  2 | C#    |            40 |
-- +----+-------+---------------+
-- 2 rows in set (0.00 sec)
-- Consultar os cursos limitados a dois registros da segunda página
SELECT * FROM cursos LIMIT 2, 2;
-- +----+--------+---------------+
-- | id | nome   | carga_horaria |
-- +----+--------+---------------+
-- |  3 | Python |            39 |
-- |  4 | Java   |            41 |
-- +----+--------+---------------+
-- 2 rows in set (0.00 sec)

-- Consultar os cursos limitados a dois registros da terceira página
SELECT * FROM cursos LIMIT 4, 2;
-- +----+-----------+---------------+
-- | id | nome      | carga_horaria |
-- +----+-----------+---------------+
-- |  5 | HTML, CSS |            32 |
-- |  6 | React     |            52 |
-- +----+-----------+---------------+
-- 2 rows in set (0.00 sec)

-- Consultar o nome e a geração do aluno de acordo com data de nascimento
SELECT
    nome,
    CASE
        WHEN YEAR(data_nascimento) BETWEEN 1980 AND 1994 THEN "Geração Y"
        WHEN YEAR(data_nascimento) BETWEEN 1995 AND 2009 THEN "Geração Z"
        WHEN YEAR(data_nascimento) BETWEEN 2010 AND 2023 THEN "Geração Alpha"
        ELSE "Geração X"
    END AS "Geração" -- AS chamado ALIAS (Apelido)
    FROM alunos;


CREATE TABLE turmas(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_curso INT NOT NULL, -- FK(id_curso) aponta tabela cursos para coluna id(PK)
    id_professor INT NOT NULL, -- FK(id_professor) aponta tabela professores coluna id(PK)
    
    data_inicio DATE NOT NULL,
    data_termino DATE NOT NULL,

    -- FOREIGN KEY(nome_da_coluna_de_fk) REFERENCES nome_tabela_pai(coluna_pk_da_tabela_pai)
    FOREIGN KEY(id_curso) REFERENCES cursos(id),
    FOREIGN KEY(id_professor) REFERENCES professores(id)
);

INSERT INTO turmas (id_curso, id_professor, data_inicio, data_termino) VALUES
(1,	1,	"2023-03-12",	"2023-04-16"),
(2,	1,	"2023-05-01",	"2023-07-10"),
(3,	2,	"2024-01-01",	"2024-02-10"),
(4,	2,	"2022-01-01",	"2022-12-31"),
(5,	3,	"2023-04-01",	"2023-04-10"),
(6,	4,	"2024-01-10",	"2024-02-10"),
(5,	5,	"2023-05-11",	"2023-05-20"),
(5,	3,	"2023-08-01",	"2023-08-20");

-- Consultar nome do professor e data de inicio
SELECT 
    t.id, -- > ID da tabela de turmas, ou seja, o código da turma
    p.nome AS "Professor", -- > Nome do professor na tabela de professores
    t.data_inicio
    FROM turmas AS t
    -- INNER JOIN nome_tabela AS apelido ON (PK = FK)
    INNER JOIN professores AS p ON (p.id = t.id_professor);

-- Consultar o nome do curso, data de inicio e término
SELECT
    cursos.nome AS "Curso",
    turmas.data_inicio AS "Data de inicio",
    turmas.data_termino AS "Data de término"
    FROM turmas
    INNER JOIN cursos ON(cursos.id = turmas.id_curso);

-- Consultar o nome do professor e nome do curso, data de inicio e término
SELECT 
    LOWER(professores.nome) AS "Professor", -- Nome do professor em caixa baixa
    UPPER(cursos.nome) AS "Curso",          -- Nome do curso em caixa alta
    turmas.data_inicio AS "Data de inicio",
    turmas.data_termino AS "Data de término"
    FROM turmas
    INNER JOIN professores  ON(professores.id   = turmas.id_professor)
    INNER JOIN cursos       ON(cursos.id        = turmas.id_curso);


-- Nome do Professor => Nome Curso (carga horária)

SELECT
    CONCAT(
        professores.nome, SPACE(30 - LENGTH(professores.nome)), " => ",
        cursos.nome, SPACE(30 - LENGTH(cursos.nome)), " (",
        cursos.carga_horaria, ")"
    ) AS "Turmas"
    FROM professores
    INNER JOIN turmas ON (professores.id = turmas.id_professor)
    INNER JOIN cursos ON (cursos.id = turmas.id_curso);

-- +-----------------------------------------------------------------------+
-- | Turmas                                                                |
-- +-----------------------------------------------------------------------+
-- | Francisco                      => MySQL                          (28) |
-- | Francisco                      => C#                             (40) |
-- | Javeiro                        => Python                         (39) |
-- | Javeiro                        => Java                           (41) |
-- | Rubens                         => HTML, CSS                      (32) |
-- | Rubens                         => HTML, CSS                      (32) |
-- | Pablo                          => React                          (52) |
-- | Pamela                         => HTML, CSS                      (32) |
-- +-----------------------------------------------------------------------+

SELECT CONCAT(SUBSTRING(nome, 1, 2), "...") FROM cursos;

CREATE TABLE mercadorias(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
);

INSERT INTO mercadorias (nome) VALUES
("   Nescau   "), -- 1
("Nescau"), -- 2
("Nescau  "), -- 3
("Nescau cereal"), -- 4 
("O nescau de todo dia"), -- 5
("Nescal com L"), -- 6
("Uma mercadoria que termina com nescau"); -- 7

-- Consultar as mercadorias onde o nome é Nescau
SELECT * FROM mercadorias WHERE nome = "Nescau"; -- 2

-- Consultar as mercadorias onde o nome começa com Nescau
SELECT * FROM mercadorias WHERE nome LIKE "Nescau%"; -- 2, 3, 4

-- Consultar as mercadorias onde o nome terminal com nescau -- 2, 7
SELECT * FROM mercadorias WHERE nome LIKE "%Nescau";

-- Consultar as mercadorias onde o nome contém nescau (começo, meio e fim) 1, 2, 3, 4, 5, 7 
SELECT * FROM mercadorias WHERE nome LIKE "%Nescau%";

-- Consultar a quantidade de mercadorias que contém nescau
SELECT COUNT(*) FROM mercadorias WHERE nome LIKE "%nescau%";

-- Consultar o nome das mercadorias substituindo o Nescal por Nescau
SELECT REPLACE(nome, "Nescal", "Nescau") FROM mercadorias;

-- Consultar o nome removendo os espaços da esquerda
SELECT LTRIM(nome), LENGTH(LTRIM(nome)) FROM mercadorias;

-- Consultar o nome removendo os espaços da direita
SELECT RTRIM(nome), LENGTH(RTRIM(nome)) FROM mercadorias;

-- Consultar o nome removendo os espaços da direita e esquerda
SELECT TRIM(nome), LENGTH(TRIM(nome)) FROM mercadorias;

-- Adicionar coluna de data de vencimento na tabela de mercadorias
ALTER TABLE mercadorias ADD COLUMN data_vencimento DATE;

-- Apagar coluna de data de vencimento da tabela de mercadorias;
ALTER TABLE mercadorias DROP COLUMN data_vencimento;

-- Consultar o comando de CREATE TABLE da tabela de mercadorias
SHOW CREATE TABLE mercadorias;

-- Adicionar coluna de especificando a posição na tabela
ALTER TABLE mercadorias ADD COLUMN data_vencimento DATE; -- Será adicionada depois da coluna nome
ALTER TABLE mercadorias ADD COLUMN estoque INT FIRST; -- Será a primeira coluna
-- Será adicionada entre a coluna nome e data_vencimento
ALTER TABLE mercadorias ADD COLUMN valor_unitario FLOAT(5, 2) AFTER nome; 

-- Definir o valor padrão para a coluna de data de vencimento do produto
ALTER TABLE mercadorias ALTER data_vencimento SET DEFAULT '2023-04-05';
-- TODO: verificar comando para calcular 10 dias contando hoje
-- ALTER TABLE mercadorias ALTER data_vencimento SET DEFAULT DATE(DATE_ADD(NOW(), INTERVAL 10 DAY)); 

UPDATE mercadorias SET data_vencimento = DATE(DATE_ADD(NOW(), INTERVAL 10 DAY));

INSERT INTO mercadorias (nome, estoque, valor_unitario) VALUE ('Toddy', 3, 13.50);

-- Remover o valor padrão para a coluna de data de vencimento de produto
ALTER TABLE mercadorias ALTER data_vencimento DROP DEFAULT;

INSERT INTO mercadorias (nome, estoque, valor_unitario, data_vencimento) VALUE 
    ('Todinho', 1, 5.00, '2024-01-01');

-- Alterar o tamanho da coluna do nome de 30 carac para 75 carac
ALTER TABLE mercadorias MODIFY nome VARCHAR(75);
-- ALTER TABLE mercadorias MODIFY nome CHAR(75);

-- Renomear coluna valor_unitario para preco_unitario da tabela de mercadorias
ALTER TABLE mercadorias CHANGE valor_unitario preco_unitario FLOAT(5, 2);

-- Renomear tabela de mercadorias para mercadorias_do_mercado
ALTER TABLE mercadorias RENAME TO mercadorias_do_mercado;

-- Consultar o nome do aluno, codigo da turma e nome do curso
-- Consultar o nome do aluno, nome do professor
-- Consultar o nome do aluno, nome do curso, data de inicio e término ordenados por data de inicio

-- Criar coluna para a idade na tabela de alunos
ALTER TABLE alunos ADD COLUMN idade TINYINT;

-- Adicionar constraint de validação da idade, onde a idade deve ser maior ou igual a 14 anos.
ALTER TABLE alunos ADD CONSTRAINT CHECK_AlunoIdade CHECK (Idade >= 14);

-- Inserir um aluno com 13 anos, não funciona pois a idade é < 14
INSERT INTO alunos (nome, data_nascimento, idade) VALUES ('Pedro de Silva', '2009-01-01', 13);
-- Inserir um aluno com 14 anos
INSERT INTO alunos (nome, data_nascimento, idade) VALUES ('Pedro de Silva', '2009-01-01', 14);

-- SHOW CREATE TABLE alunos;
-- CREATE TABLE `alunos` (
--   `id` int NOT NULL AUTO_INCREMENT,
--   `nome` varchar(100) NOT NULL,
--   `data_nascimento` date DEFAULT NULL,
--   `idade` tinyint DEFAULT NULL,
--   PRIMARY KEY (`id`),
--   CONSTRAINT `CHECK_AlunoIdade` CHECK ((`Idade` >= 14))
-- )
-- Apagar constraint de validação da idade do aluno
ALTER TABLE alunos DROP CONSTRAINT CHECK_AlunoIdade;

-- Adicionar coluna de CPF a tabela de professores
ALTER TABLE professores ADD COLUMN cpf CHAR(14);
-- Preencher o cpf dos professores
UPDATE professores SET cpf = '818.365.480-01' WHERE id = 1;
UPDATE professores SET cpf = '119.069.540-54' WHERE id = 2;
UPDATE professores SET cpf = '734.482.460-42' WHERE id = 3;
UPDATE professores SET cpf = '813.042.480-03' WHERE id = 4;
UPDATE professores SET cpf = '474.368.310-62' WHERE id = 5;

INSERT INTO professores (nome, valor_hora, cpf) VALUE ('Luiz com z', 200.10, '606.689.490-07');
INSERT INTO professores (nome, valor_hora, cpf) VALUE ('Joana', 197.50, '474.368.310-62');
-- Apagar a professora Joana pois a tabela n tinha validação de cpf único
DELETE FROM professores WHERE id = 7;

-- Adicionar validação de CPF único
ALTER TABLE professores ADD CONSTRAINT UniqueProfessoresCpf UNIQUE (cpf);
ALTER TABLE professores ADD UNIQUE (cpf); -- Não especifica o nome da constraint, o bd gera o nome

-- Tentar inserir o registro com CPF já cadastrado, não realizando o insert
INSERT INTO professores (nome, valor_hora, cpf) VALUE ('Joana', 197.50, '474.368.310-62');

-- Apagar a constraint de unique
ALTER TABLE professores DROP CONSTRAINT UniqueProfessoresCpf;

-- Consultar o nome dos produtos do mercado uma única vez, ou seja, o nome n se repetirá na consulta
SELECT DISTINCT TRIM(nome) FROM mercadorias_do_mercado ORDER BY TRIM(nome);

TRUNCATE TABLE mercadorias_do_mercado;
ALTER TABLE mercadorias_do_mercado RENAME TO mercadorias;

ALTER TABLE mercadorias DROP COLUMN data_vencimento;
ALTER TABLE mercadorias ADD COLUMN categoria VARCHAR(25);
ALTER TABLE mercadorias ADD COLUMN corredor INT;
TRUNCATE TABLE mercadorias
INSERT INTO mercadorias (nome, estoque, preco_unitario, categoria, corredor) VALUES
("Qboa", 19, 4.79, "Limpeza", 4),
("Ovo", 30, 0.83, "Derivados", 1),
("Suco de uva", 100, 17.00, "Bebida", 2),
("Queijo Colonial", 2, 30.00, "Derivados", 1),
("Calabresa com macarrão", 3, 15.00, "PF", 3),
("Arroz", 3, 13.99, "Grãos", 3),
("Pão Sírio", 1, 14.99, "Pão", 2),
("Lasanha com Z", 1, 12.99, "PF", 3),
("Baguete", 3, 5.99, "Pão", 2),
("Monster", 6, 8.50, "Bebida", 2),
("Ajax", 6, 10.99, "Limpeza", 4),
("Alcatra com feijão/arroz", 1, 72.00, "PF", 3),
("Vinho", 3, 13.00, "Bebida", 2);

SELECT * FROM mercadorias;


-- Consultar a soma dos produtos unitários por categoria
SELECT 
    categoria AS "Categoria",
    SUM(preco_unitario) AS "Total dos preços unitários"
    FROM mercadorias
    GROUP BY categoria
    ORDER BY categoria;

-- Consultar o menor valor dos produtos unitários por categoria

SELECT  
    categoria AS "Categoria",
    MIN(preco_unitario)
    FROM mercadorias
    GROUP BY categoria;

SELECT * FROM mercadorias;

-- Consultar o preço total por produto em estoque
SELECT nome, preco_unitario * estoque "Preço Total" FROM mercadorias ORDER BY categoria;

-- Consultar a soma dos produtos por categorias
SELECT
    categoria,
    SUM(preco_unitario * estoque)
    FROM mercadorias
    GROUP BY categoria;



SELECT * FROM mercadorias,
    ORDER BY corredor, categoria;

-- Consultar as categorias com respectivo total do corredor 2 e 3

SELECT
    categoria,
    SUM(preco_unitario * estoque)
    FROM mercadorias
    WHERE corredor IN(2,3)
    GROUP BY categoria;
    HAVING SUM(preco_unitario * estoque) > 100;

-- Consultar por categoria quantos registros estão cadastrados

SELECT
    categoria,
    COUNT(*)
    FROM mercadorias
    GROUP BY categoria;

CREATE VIEW ListaMercadorias AS 
    SELECT 
        nome,
        categoria,
        preco_unitario * estoque
        FROM mercadorias;

SELECT * FROM ListaMercadorias

CREATE VIEW CursosProfessoresView AS
    SELECT
        cursos.nome AS "Curso",
        professores.nome AS "Professor",
        cursos.carga_horaria AS "Carga Horária",
        turmas.data_inicio AS "Data Inicio",
        turmas.data_termino AS "Data Término"
        FROM cursos
        INNER JOIN turmas ON(cursos.id = turmas.id_curso)
        INNER JOIN professores ON(professores.id = turmas.id_professor);

-- Gerar JSON com as propriedades do nome e estoque
SELECT CONCAT("{""nome"": """, nome, """,""estoque"":", estoque, "}") FROM mercadorias; 
-- Gerar JSON com as propriedades utilizando função do MYSQL
SELECT JSON_OBJECT("produto", nome, "quantidade", estoque) FROM mercadorias;
-- Gerar Lista de objetos(produtos) utilizando função do MYSQL (CTRL SHIFT P -> lang )
SELECT 
    JSON_ARRAYAGG(
        JSON_OBJECT(
            "produto", nome,
            "quantidade", estoque
        )
    ) AS "Produtos"
    FROM mercadorias;
