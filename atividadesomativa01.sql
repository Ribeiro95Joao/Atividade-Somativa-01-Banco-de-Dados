CREATE DATABASE atividade_somativa_01;
USE atividade_somativa_01;

CREATE TABLE sanduiche (
	id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    preco DECIMAL(6,2) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE pedido_processado (
	id INT NOT NULL AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_sanduiche INT NOT NULL,
    quantidade INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_pedido) REFERENCES pedido (id),
    FOREIGN KEY (id_sanduiche) REFERENCES sanduiche (id)
);

CREATE TABLE entregador (
	id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(80) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE contato_entregador (
	id INT NOT NULL AUTO_INCREMENT,
    telefone VARCHAR(11) NOT NULL,
    id_entregador INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_entregador) REFERENCES entregador (id)
);

CREATE TABLE pedido (
	id INT NOT NULL AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    status_pedido INT NOT NULL,
    data_emissao DATETIME NOT NULL,
    id_entregador INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_cliente) REFERENCES cliente (id),
    FOREIGN KEY (id_entregador) REFERENCES entregador (id)
);

CREATE TABLE cliente (
	id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(80) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE contato_cliente (
	id INT NOT NULL AUTO_INCREMENT,
	telefone VARCHAR(11) NOT NULL,
	id_cliente INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_cliente) REFERENCES cliente (id)
);

CREATE TABLE endereco_cliente (
	 id INT NOT NULL AUTO_INCREMENT,
     endereco VARCHAR(200) NOT NULL,
     id_cliente INT NOT NULL,
     PRIMARY KEY (id),
     FOREIGN KEY (id_cliente) REFERENCES cliente (id)
);

-- Inserindo clientes

INSERT INTO cliente (nome) VALUES ('Aragorn Passo Largo');
INSERT INTO cliente (nome) VALUES ('Frodo Bolseiro');
INSERT INTO cliente (nome) VALUES ('Samwise Gamgee');

-- Inserido o contato destes clientes

INSERT INTO contato_cliente (telefone, id_cliente) VALUES ('11999658321', 1);
INSERT INTO contato_cliente (telefone, id_cliente) VALUES ('11975508081', 2);
INSERT INTO contato_cliente (telefone, id_cliente) VALUES ('11987657805', 3);

-- Inserido o endereco destes clientes

INSERT INTO endereco_cliente (endereco, id_cliente) VALUES ('Minas Tirith, Royal Avenue, 001', 1);
INSERT INTO endereco_cliente (endereco, id_cliente) VALUES ('The Shire, Magnolia Street, 059', 2);
INSERT INTO endereco_cliente (endereco, id_cliente) VALUES ('The Shire, Bolseiros Street, 004', 3);

-- Inserindo entregadores

INSERT INTO entregador (nome) VALUES ('Meriadoc Merry Brandybuck');
INSERT INTO entregador (nome) VALUES ('Peregrin Pippin Took');
INSERT INTO entregador (nome) VALUES ('Denethor');

-- Inserindo o contato destes entregadores

INSERT INTO contato_entregador (telefone, id_entregador) VALUES ('11965202011', 1);
INSERT INTO contato_entregador (telefone, id_entregador) VALUES ('11941325896', 2);
INSERT INTO contato_entregador (telefone, id_entregador) VALUES ('11901028897', 3);

-- Inserindo sanduiches

INSERT INTO sanduiche (nome, preco) VALUES ('Mordors Furious Bacon', 32);
INSERT INTO sanduiche (nome, preco) VALUES ('Special Shire X-Egg', 28);
INSERT INTO sanduiche (nome, preco) VALUES ('Special Elvish Sauce', 29);

-- Inserindo pedidos

INSERT INTO pedido (id_cliente, status_pedido, data_emissao, id_entregador) VALUES (1, 2, '2023-08-23 15:27:15', 3);
INSERT INTO pedido (id_cliente, status_pedido, data_emissao, id_entregador) VALUES (2, 1, '2023-08-23 17:11:02', 1);
INSERT INTO pedido (id_cliente, status_pedido, data_emissao, id_entregador) VALUES (3, 0, '2023-08-23 11:52:35', 2);

-- Fazendo o pedido

INSERT INTO pedido_processado (id_pedido, id_sanduiche, quantidade) VALUES (1, 1, 1);
INSERT INTO pedido_processado (id_pedido, id_sanduiche, quantidade) VALUES (2, 2, 2);
INSERT INTO pedido_processado (id_pedido, id_sanduiche, quantidade) VALUES (2, 1, 1);
INSERT INTO pedido_processado (id_pedido, id_sanduiche, quantidade) VALUES (3, 1, 1);
INSERT INTO pedido_processado (id_pedido, id_sanduiche, quantidade) VALUES (3, 2, 2);
INSERT INTO pedido_processado (id_pedido, id_sanduiche, quantidade) VALUES (3, 3, 1);

-- Fazendo uma Query para identificar os pedidos em preparação, ou seja, com status_pedido = 0

SELECT c.nome, s.nome, r.quantidade, p.data_emissao, e.nome  FROM cliente AS c, sanduiche AS s, entregador AS e, pedido AS p, pedido_processado AS r WHERE p.id_cliente = c.id AND r.id_sanduiche = s.id AND p.id_entregador = e.id AND r.id_pedido = p.id AND p.status_pedido = 0;















































