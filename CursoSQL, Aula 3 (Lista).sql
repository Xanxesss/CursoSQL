-- Curso de SQL, Aula 3 (Lista de Exercícios) --

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

DROP DATABASE IF EXISTS curso_sql;

CREATE DATABASE curso_sql;

USE curso_sql;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

DROP TABLE IF EXISTS estado;

-- criação da tabela estado
CREATE TABLE estado(
	id_estado INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL UNIQUE,
	sigla CHAR(2) NOT NULL UNIQUE,
	ativo CHAR(1) NOT NULL DEFAULT 'S',
    data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT valores_ativo_estado CHECK (ativo IN ('S', 'N'))
);

DROP TABLE IF EXISTS cidade;

-- criação da tabela cidade
CREATE TABLE cidade(
	id_cidade INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(200) NOT NULL,
    ativo CHAR(1) NOT NULL DEFAULT 'S',
	data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_estado INT NOT NULL,
    CONSTRAINT fk_cidade_estado FOREIGN KEY (id_estado) REFERENCES estado(id_estado),
    CONSTRAINT valores_ativo_cidade CHECK (ativo IN ('S', 'N'))
);

-- inserção de dois registros na tabela estado
INSERT INTO estado (nome, sigla) VALUES ("Paraná", "PR");
INSERT INTO estado (nome, sigla) VALUES ("São Paulo", "SP");

-- inserção de dois registros na tabela cidade
INSERT INTO cidade (nome, id_estado) VALUES ("Alto Paraná", 1);
INSERT INTO cidade (nome, id_estado) VALUES ("Paranavaí", 1);
INSERT INTO cidade (nome, id_estado) VALUES ("São Paulo", 2);

-- 09.
UPDATE cidade SET
nome = "Maringá"
WHERE id_cidade = 1;

-- 10.
UPDATE cidade SET
nome = "Londrina",
id_estado = 1
WHERE nome = "São Paulo";

-- 11.
UPDATE cidade SET
nome = "São Paulo",
id_estado = 2;

DROP TABLE IF EXISTS cidade;

CREATE TABLE cidade(
	id_cidade INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(200) NOT NULL,
    ativo CHAR(1) NOT NULL DEFAULT 'S',
	data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_estado INT NOT NULL,
    CONSTRAINT fk_cidade_estado FOREIGN KEY (id_estado) REFERENCES estado(id_estado),
    CONSTRAINT valores_ativo_cidade CHECK (ativo IN ('S', 'N'))
);

INSERT INTO cidade (nome, id_estado) VALUES ("Alto Paraná", 1);
INSERT INTO cidade (nome, id_estado) VALUES ("Paranavaí", 1);
INSERT INTO cidade (nome, id_estado) VALUES ("São Paulo", 2);

-- 12
DELETE FROM cidade
WHERE id_cidade = 1;

-- 13.
DELETE FROM cliente
WHERE id_cliente = 38;
