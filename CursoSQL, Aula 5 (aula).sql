-- Curso de SQL, Aula 5 --

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

DROP DATABASE IF EXISTS curso_sql;

CREATE DATABASE curso_sql;

USE curso_sql;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

DROP TABLE IF EXISTS estado;

CREATE TABLE estado(
	id_estado INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL UNIQUE,
	sigla CHAR(2) NOT NULL UNIQUE,
	ativo ENUM('S','N') NOT NULL DEFAULT 'S',
    data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS cidade;

CREATE TABLE cidade(
	id_cidade INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(200) NOT NULL,
	ativo ENUM('S','N') NOT NULL DEFAULT 'S',
	data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_estado INT NOT NULL,
    CONSTRAINT fk_cidade_estado FOREIGN KEY (id_estado) REFERENCES estado(id_estado),
    CONSTRAINT cidade_unica UNIQUE(nome, id_estado)
);

-- inserindo registros na tabela estado
INSERT INTO estado (id_estado, nome, sigla, ativo, data_cadastro) VALUES (DEFAULT, "Paraná", 'PR', 'S', '2020-09-03');
INSERT INTO estado (id_estado, nome, sigla, ativo, data_cadastro) VALUES (DEFAULT, "São Paulo", 'SP', DEFAULT, DEFAULT);
INSERT INTO estado (nome, sigla) VALUES ("Ceará", 'CE');

-- inserindo registros na tabela cidade
INSERT INTO cidade (id_cidade, nome, ativo, data_cadastro, id_estado) VALUES (DEFAULT, "Paranavaí", 'S', '2020-09-03', 1);
INSERT INTO cidade (id_cidade, nome, ativo, data_cadastro, id_estado) VALUES (DEFAULT, "São Paulo", DEFAULT, DEFAULT, 2);
INSERT INTO cidade (nome, id_estado) VALUES ("Fortaleza", 3);

-- consultando os registros nas tabelas
SELECT * FROM estado;
SELECT * FROM cidade;
