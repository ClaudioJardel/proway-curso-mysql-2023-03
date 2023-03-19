-- Enunciado: Criar tabela de estoques
-- id: INT 
-- produto: VARCHAR(50)
-- quantidade: INT
-- preço_unitário: Float(6,2)
-- data_vencimento: DATE
-- categoria: VARCHAR(30)

-- Inserir 7 registros
-- 2 registros de frutas
-- 2 registros de lanches
-- 2 registros de bebidas
-- 1 registro de produto de limpeza
-- https://miro.com/app/board/uXjVMeHZLE0=/?share_link_id=821951056661

CREATE TABLE estoques(
    id INT PRIMARY KEY AUTO_INCREMENT, 
    produto VARCHAR(50) NOT NULL ,
    quantidade INT,
    preco_unitario FLOAT(6,2),
    data_vencimento DATE,
    categoria VARCHAR(30)
);

INSERT INTO estoques(produto, quantidade, preco_unitario, data_vencimento, categoria) VALUE ("Maça", 7, 5.89, "2023-03-21", "FRUTAS");
INSERT INTO estoques(produto, quantidade, preco_unitario, data_vencimento, categoria) VALUE ("Pêra", 4, 6.89, "2023-03-22", "FRUTAS");
INSERT INTO estoques(produto, quantidade, preco_unitario, data_vencimento, categoria) VALUE ("Coxinha", 3, 7.00, "2023-03-20", "LANCHES");
INSERT INTO estoques(produto, quantidade, preco_unitario, data_vencimento, categoria) VALUE ("Pastel", 2, 7.00, "2023-03-20", "LANCHES");
INSERT INTO estoques(produto, quantidade, preco_unitario, data_vencimento, categoria) VALUE ("Pepsi Black", 4, 6.99, "2024-04-20","BEBIDAS");
INSERT INTO estoques(produto, quantidade, preco_unitario, data_vencimento, categoria) VALUE ("Coca Cola 2L", 5, 9.90, "2024-05-21","BEBIDAS");
INSERT INTO estoques(produto, quantidade, preco_unitario, data_vencimento, categoria) VALUE ("Detergente", 9, 2.89, "2025-05-04" ,"PRODUTO DE LIMPEZA");