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

--changeset demo-homolog:004-create-index-extrai-log-dados-id
CREATE INDEX IF NOT EXISTS idx_extrai_log_dados_id
ON extrai_log (extrai_dados_id);
