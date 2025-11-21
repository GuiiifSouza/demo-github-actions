--liquibase formatted sql

--changeset demo-homolog:001-create-table-extrai-dados
CREATE TABLE IF NOT EXISTS extrai_dados (
  id INT PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--changeset demo-homolog:002-create-table-extrai-log
CREATE TABLE IF NOT EXISTS extrai_log (
  id INT PRIMARY KEY,
  extrai_dados_id INT NOT NULL,
  mensagem VARCHAR(500) NOT NULL,
  criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--changeset demo-homolog:003-add-foreign-key-extrai-log
ALTER TABLE extrai_log
ADD CONSTRAINT fk_extrai_log_extrai_dados
FOREIGN KEY (extrai_dados_id)
REFERENCES extrai_dados(id);

--changeset demo-homolog:004-add-column-descricao-ruim
ALTER TABLE extrai_dados
ADD COLUMN descricao VARCHAR(5);

--changeset demo-homolog:005-ajusta-tamanho-coluna-descricao
-- Correção: aumenta o tamanho da coluna descricao para um valor mais adequado
ALTER TABLE extrai_dados
ALTER COLUMN descricao TYPE VARCHAR(255);

--changeset demo-homolog:006-create-index-extrai-log-extrai-dados-id
CREATE INDEX idx_extrai_log_extrai_dados_id
ON extrai_log (extrai_dados_id);
