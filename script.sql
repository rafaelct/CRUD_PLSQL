DROP TABLE TBL_ENDERECO;
DROP TABLE TBL_LOG;
DROP TABLE TBL_USUARIO;

DROP SEQUENCE SQ_USUARIO;
DROP SEQUENCE SQ_ENDERECO;
DROP SEQUENCE SQ_LOG;

CREATE SEQUENCE SQ_USUARIO INCREMENT BY 1 START WITH 0 MAXVALUE 9999 MINVALUE 0;
CREATE SEQUENCE SQ_ENDERECO INCREMENT BY 1 START WITH 0 MAXVALUE 9999 MINVALUE 0;
CREATE SEQUENCE SQ_LOG INCREMENT BY 1 START WITH 0 MAXVALUE 9999 MINVALUE 0;

CREATE TABLE TBL_LOG (
ID_LOG NUMBER PRIMARY KEY,
DATA_LOG DATE NOT NULL,
MSG VARCHAR2(2000) );

CREATE TABLE TBL_USUARIO (
ID_USUARIO  NUMBER PRIMARY KEY,
NOME VARCHAR2(100) NOT NULL,
SEXO CHAR(1) CHECK( SEXO = 'M' OR SEXO = 'F' ) NOT NULL,
ID_ENDERECO NUMBER NOT NULL,
FLG_ATIVO NUMBER CHECK (FLG_ATIVO IN(0,1) ) NOT NULL);

CREATE TABLE TBL_ENDERECO (
ID_ENDERECO NUMBER PRIMARY KEY,
ENDERECO VARCHAR2(500) NOT NULL,
END_NUM NUMBER(5),
CEP NUMBER(8) NOT NULL,
BAIRRO VARCHAR(100) NOT NULL,
CIDADE VARCHAR(100) NOT NULL,
ESTADO CHAR(2) NOT NULL,
ID_USUARIO NUMBER NOT NULL,
CONSTRAINT FK_ID_USUARIO FOREIGN KEY (ID_USUARIO) REFERENCES TBL_USUARIO (ID_USUARIO),
FLG_ATIVO NUMBER CHECK (FLG_ATIVO IN(0,1) ) NOT NULL );

ALTER TABLE TBL_ENDERECO ADD END_COMPL VARCHAR2(500);
ALTER TABLE TBL_USUARIO DROP COLUMN ID_ENDERECO;

