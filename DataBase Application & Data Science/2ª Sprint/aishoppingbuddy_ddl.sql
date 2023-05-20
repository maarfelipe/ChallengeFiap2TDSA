/* Dropando Tabelas 
DROP TABLE t_aisb_funcionario CASCADE CONSTRAINTS;

DROP TABLE t_aisb_parceiro_negocio CASCADE CONSTRAINTS;

DROP TABLE t_aisb_produto CASCADE CONSTRAINTS;

DROP TABLE t_aisb_recomendacao CASCADE CONSTRAINTS;

DROP TABLE t_aisb_transacao CASCADE CONSTRAINTS;

DROP TABLE t_aisb_usuario CASCADE CONSTRAINTS;
*/


CREATE TABLE t_aisb_parceiro_negocio (
    cd_parceiro             NUMBER(3) primary key,
    nm_fantasia              VARCHAR2(50) NOT NULL,
    dt_entrada_parceiro      DATE NOT NULL,
    dt_encerramento_parceiro DATE,
    nr_cnpj                  NUMBER(14) NOT NULL
);



CREATE TABLE t_aisb_funcionario (
    cd_funcionario NUMBER(4) primary key,
    nm_funcionario VARCHAR2(50) NOT NULL,
    ds_email       VARCHAR2(50) NOT NULL,
    parceiro_fk references t_aisb_parceiro_negocio
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
    cd_parceiros             NUMBER(3) NOT NULL,
    dt_mensagem              DATE NOT NULL,
    ds_mensagem_recomendacao VARCHAR2(250) 
);

CREATE TABLE t_aisb_transacao (
    cd_transacao          NUMBER(6) NOT NULL,
    cd_usuario             NUMBER(6) NOT NULL,
    cd_parceiro           NUMBER(3) NOT NULL,
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
--Tabela T_AISB_PRODUTO
ALTER TABLE t_aisb_produto ADD CONSTRAINT pk_aisb_produto PRIMARY KEY ( cd_produto );

--Tabela T_AISB_RECOMENDACAO
ALTER TABLE t_aisb_recomendacao ADD CONSTRAINT pk_aisb_recomendacao PRIMARY KEY ( cd_recomendacao );

--Tabela T_AISB_TRANSACOES
ALTER TABLE t_aisb_transacao ADD CONSTRAINT pk_aisb_transacao PRIMARY KEY ( cd_transacao );

--Tabela T_AISB_USUARIO
ALTER TABLE t_aisb_usuario ADD CONSTRAINT pk_aisb_usuario PRIMARY KEY ( cd_usuario );


--------------CIANDO AS CHECKS:----------------
--TABELA T_AISB_USUARIO
ALTER TABLE T_AISB_USUARIO
ADD CONSTRAINT ck_aisb_usuario_ds_genero
CHECK (upper(ds_genero) = 'M' OR upper(ds_genero) = 'H' OR upper(ds_genero) = 'NB');


--------------FOREIGN KEYS:-------------------

ALTER TABLE t_aisb_produto
    ADD CONSTRAINT fk_aisb_produto_recomendacao FOREIGN KEY ( cd_recomendacao )
        REFERENCES t_aisb_recomendacao ( cd_recomendacao );

ALTER TABLE t_aisb_recomendacao
    ADD CONSTRAINT fk_aisb_recomendacao_usuario FOREIGN KEY ( cd_usuario )
        REFERENCES t_aisb_usuario ( cd_usuario );
ALTER TABLE t_aisb_recomendacao
    ADD CONSTRAINT fk_aisb_recomendacao_parceiro_negocio FOREIGN KEY ( cd_parceiros )
        REFERENCES t_aisb_parceiros_negocios ( cd_parceiros );

ALTER TABLE t_aisb_transacao
    ADD CONSTRAINT fk_aisb_transacao_parceiro FOREIGN KEY ( cd_parceiro )
        REFERENCES t_aisb_parceiro_negocio ( cd_parceiro );

ALTER TABLE t_aisb_transacao
    ADD CONSTRAINT fk_aisb_transacao_produto FOREIGN KEY ( cd_produto )
        REFERENCES t_aisb_produto ( cd_produto );

ALTER TABLE t_aisb_transacao
    ADD CONSTRAINT fk_aisb_transacao_usuario FOREIGN KEY ( cd_usuario )
        REFERENCES t_aisb_usuario ( cd_usuario );
        
        