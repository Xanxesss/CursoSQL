-- Curso de SQL, Aula 1 --

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
    CONSTRAINT valores_ativo CHECK (ativo IN ('S', 'N'))
);

-- inserção de dois registros na tabela estado
INSERT INTO estado (nome, sigla) VALUES ("Paraná", "PR");
INSERT INTO estado (nome, sigla) VALUES ("São Paulo", "SP");

-- seleção de todas as colunas da tabela estado
SELECT * FROM estado;

