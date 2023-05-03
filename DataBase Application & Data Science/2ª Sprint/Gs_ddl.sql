/* Dropando Tabelas 
DROP TABLE t_aisb_funcionario CASCADE CONSTRAINTS;

DROP TABLE t_aisb_parceiros_negocios CASCADE CONSTRAINTS;

DROP TABLE t_aisb_produto CASCADE CONSTRAINTS;

DROP TABLE t_aisb_recomendacao CASCADE CONSTRAINTS;

DROP TABLE t_aisb_transacoes CASCADE CONSTRAINTS;

DROP TABLE t_aisb_usuario CASCADE CONSTRAINTS;
*/

CREATE TABLE t_aisb_funcionario (
    cd_funcionario NUMBER(4) NOT NULL,
    cd_parceiros   NUMBER(3) NOT NULL,
    nm_funcionario VARCHAR2(50) NOT NULL,
    ds_email       VARCHAR2(50) NOT NULL
);

CREATE TABLE t_aisb_parceiros_negocios (
    cd_parceiros             NUMBER(3) NOT NULL,
    nm_fantasia              VARCHAR2(50) NOT NULL,
    dt_entrada_parceiro      DATE NOT NULL,
    dt_encerramento_parceiro DATE,
    nr_cnpj                  NUMBER(14) NOT NULL
);

CREATE TABLE t_aisb_produto (
    cd_produto      NUMBER(10) NOT NULL,
    cd_recomendacao NUMBER(6) NOT NULL,
    nm_produto      VARCHAR2(50) NOT NULL,
    ds_tipo         VARCHAR2(50) NOT NULL,
    vl_produto      NUMBER(10) NOT NULL,
    ds_produto      VARCHAR2(35) NOT NULL,
    ds_categoria    VARCHAR2(35) NOT NULL
);

CREATE TABLE t_aisb_recomendacao (
    cd_recomendacao          NUMBER(6) NOT NULL,
    cd_usuario               NUMBER(6) NOT NULL,
    dt_mensgaem              DATE NOT NULL,
    ds_mensagem_recomendacao VARCHAR2(250) 
);

CREATE TABLE t_aisb_transacoes (
    cd_transacoes          NUMBER(6) NOT NULL,
    cd_usuario             NUMBER(6) NOT NULL,
    cd_parceiros           NUMBER(3) NOT NULL,
    cd_produto             NUMBER(10) NOT NULL,
    st_cancelado           NUMBER(1) NOT NULL,
    vl_total               NUMBER(10),
    nr_cep_estabelicimento NUMBER(8),
    dt_transacao           DATE NOT NULL
);


CREATE TABLE t_aisb_usuario (
    cd_usuario        NUMBER(6) NOT NULL,
    ds_genero         CHAR(2) NOT NULL, 
    nm_usuario        VARCHAR2(50) NOT NULL,
    nr_cpf            NUMBER(11) NOT NULL,
    nr_cep_residencia NUMBER(8),
    dt_nascimento     DATE NOT NULL
);

---------------Primarary keys:-------------------
--TABELA T_AISB_FUNCIONARIO
ALTER TABLE t_aisb_funcionario ADD CONSTRAINT pk_aisb_funcionario PRIMARY KEY ( cd_funcionario );

--Tabela T_AISB_PARCEIROS_NEGOCIOS
ALTER TABLE t_aisb_parceiros_negocios ADD CONSTRAINT pk_aisb_parceiros_negocios PRIMARY KEY ( cd_parceiros );

--Tabela T_AISB_PRODUTO
ALTER TABLE t_aisb_produto ADD CONSTRAINT pk_aisb_produto PRIMARY KEY ( cd_produto );

--Tabela T_AISB_RECOMENDACAO
ALTER TABLE t_aisb_recomendacao ADD CONSTRAINT pk_aisb_recomendacao PRIMARY KEY ( cd_recomendacao );

--Tabela T_AISB_TRANSACOES
ALTER TABLE t_aisb_transacoes ADD CONSTRAINT pk_aisb_transacoes PRIMARY KEY ( cd_transacoes );

--Tabela T_AISB_USUARIO
ALTER TABLE t_aisb_usuario ADD CONSTRAINT pk_aisb_usuario PRIMARY KEY ( cd_usuario );


--------------CIANDO AS CHECKS:----------------
--TABELA T_AISB_USUARIO
ALTER TABLE T_AISB_USUARIO
ADD CONSTRAINT ck_aisb_usuario_ds_genero
CHECK (upper(ds_genero) = 'M' OR upper(ds_genero) = 'H' OR upper(ds_genero) = 'NB');


--------------FOREIGN KEYS:-------------------
ALTER TABLE t_aisb_funcionario
    ADD CONSTRAINT fk_aisb_funcionario_parceiros FOREIGN KEY ( cd_parceiros )
        REFERENCES t_aisb_parceiros_negocios ( cd_parceiros );

ALTER TABLE t_aisb_produto
    ADD CONSTRAINT fk_aisb_produto_recomendacao FOREIGN KEY ( cd_recomendacao )
        REFERENCES t_aisb_recomendacao ( cd_recomendacao );

ALTER TABLE t_aisb_recomendacao
    ADD CONSTRAINT fk_aisb_recomendacao_usuario FOREIGN KEY ( cd_usuario )
        REFERENCES t_aisb_usuario ( cd_usuario );

ALTER TABLE t_aisb_transacoes
    ADD CONSTRAINT fk_aisb_transacoes_parceiros FOREIGN KEY ( cd_parceiros )
        REFERENCES t_aisb_parceiros_negocios ( cd_parceiros );

ALTER TABLE t_aisb_transacoes
    ADD CONSTRAINT fk_aisb_transacoes_produto FOREIGN KEY ( cd_produto )
        REFERENCES t_aisb_produto ( cd_produto );

ALTER TABLE t_aisb_transacoes
    ADD CONSTRAINT fk_aisb_transacoes_usuario FOREIGN KEY ( cd_usuario )
        REFERENCES t_aisb_usuario ( cd_usuario );