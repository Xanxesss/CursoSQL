-- Curso de SQL, Aula 5 (Lista de Exercícios) --

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

-- 05.
INSERT INTO estado (id_estado, nome, sigla, ativo, data_cadastro) VALUES (1, "Paraná", 'PR', 'S', '2020-09-03');
INSERT INTO estado (id_estado, nome, sigla, ativo, data_cadastro) VALUES (2, "São Paulo", 'SP', 'S', '2020-09-03');
INSERT INTO estado (id_estado, nome, sigla, ativo, data_cadastro) VALUES (3, "Ceará", 'CE', 'S', '2020-09-03');

-- 06.
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ("Bahia", 'BA', 'S', '2020-09-03');
INSERT INTO estado (nome, sigla, ativo, data_cadastro) VALUES ("Goiás", 'GO', 'S', '2020-09-03');

-- 07.
INSERT INTO estado (nome, sigla) VALUES ("Pará", 'PA');
INSERT INTO estado (nome, sigla) VALUES ("Minas Gerais", 'MG');

-- 08.
INSERT INTO cidade (id_cidade, nome, ativo, data_cadastro, id_estado) VALUES (1, "Paranvaí", 'S', '2020-09-03', 1);
INSERT INTO cidade (nome, ativo, data_cadastro, id_estado) VALUES ("Salvador", 'S', '2020-09-03', 4);
INSERT INTO cidade (nome, id_estado) VALUES ("Ouro Preto", 7);

-- 09.
-- A tabela 'cliente' não existe.

-- 10.
-- Não compreendi muito bem o comando dessa questão.






