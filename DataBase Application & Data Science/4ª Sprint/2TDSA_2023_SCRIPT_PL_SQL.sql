set serveroutput on
set verify off

----------------------------------------------------------------
--Função Package que faz a verificação ao cadastrar um funcionario, em que, caso esse
-- funcionario ja exista no sistema armazenar as informações na tabela de erro,
-- e caso ele não exista, fará o cadastro do novo funcionario com as novas informações
-- essa função também irá verificar se o codigo do parceiro existe para que esse 
-- funcionário seja cadastrado com um parceiro existente

CREATE OR REPLACE PACKAGE PackageCadastroFunc IS
    FUNCTION cadastrar_funcionario(
        p_cd_funcionario IN NUMBER,
        p_nm_funcionario IN VARCHAR2,
        p_ds_email IN VARCHAR2,
        p_ds_senha IN VARCHAR2,
        p_cd_parceiro IN NUMBER
    ) RETURN VARCHAR2;
END PackageCadastroFunc;


CREATE OR REPLACE PACKAGE BODY PackageCadastroFunc IS
    FUNCTION cadastrar_funcionario(
        p_cd_funcionario IN NUMBER,
        p_nm_funcionario IN VARCHAR2,
        p_ds_email IN VARCHAR2,
        p_ds_senha IN VARCHAR2,
        p_cd_parceiro IN NUMBER
    ) RETURN VARCHAR2
    IS
        v_parceiro_exist NUMBER(1) := 0;
        v_cd_erro NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_parceiro_exist
        FROM t_aisb_parceiro_negocio
        WHERE cd_parceiro = p_cd_parceiro;

        IF v_parceiro_exist = 0 THEN
            SELECT MAX(cd_erro) + 1 INTO v_cd_erro FROM t_aisb_erro;
            IF v_cd_erro IS NULL THEN
                v_cd_erro := 1;
            END IF;

            INSERT INTO t_aisb_erro (cd_erro, nm_erro, dt_ocorrencia, nm_usuario)
            VALUES (v_cd_erro, 'Parceiro de negócios não encontrado', SYSDATE, USER);

            RETURN 'Não foi possível cadastrar esse funcionário pois o parceiro de negócios não foi encontrado.';
        END IF;

        INSERT INTO t_aisb_funcionario (cd_funcionario, nm_funcionario, ds_email, ds_senha, parceiro_fk)
        VALUES (p_cd_funcionario, p_nm_funcionario, p_ds_email, p_ds_senha, p_cd_parceiro);

        RETURN 'O funcionário foi cadastrado com sucesso.';
    EXCEPTION
        WHEN OTHERS THEN
            SELECT MAX(cd_erro) + 1 INTO v_cd_erro FROM t_aisb_erro;
            IF v_cd_erro IS NULL THEN
                v_cd_erro := 1;
            END IF;

            INSERT INTO t_aisb_erro (cd_erro, nm_erro, dt_ocorrencia, nm_usuario)
            VALUES (v_cd_erro, 'Erro ao cadastrar funcionario', SYSDATE, USER);

            RETURN 'Ocorreu um erro ao cadastrar o funcionario.';
    END cadastrar_funcionario;
END PackageCadastroFunc;



DECLARE
    v_cd_funcionario NUMBER(4);
    v_nm_funcionario VARCHAR2(50);
    v_ds_email VARCHAR2(50);
    v_ds_senha VARCHAR2(25);
    v_cd_parceiro NUMBER(4); 
    v_resultado VARCHAR2(200);
BEGIN
    v_cd_funcionario := &cd_funcionario;
    v_nm_funcionario := '&nome';
    v_ds_email := '&email';
    v_ds_senha := '&senha';
    v_cd_parceiro := &cd_parceiro; 
    
    v_resultado := PackageCadastroFunc.cadastrar_funcionario(v_cd_funcionario, v_nm_funcionario, v_ds_email, v_ds_senha, v_cd_parceiro); 
    DBMS_OUTPUT.PUT_LINE(v_resultado);
END;


select * from t_aisb_erro;
select * from t_aisb_funcionario;



---------------------------------------------------------------------------
--Função que faz a verificação ao cadastrar um usuário, em que, caso esse
-- usuário ja exista no sistema armazenar as informações na tabela de erro,
-- e caso ele não exista, fará o cadastro do novo usuário com as novas informações

CREATE OR REPLACE PACKAGE PackageCadastroUsuario IS
    FUNCTION cadastrar_usuario(
        p_cd_usuario IN NUMBER,
        p_ds_genero IN CHAR,
        p_nm_usuario IN VARCHAR2,
        p_nr_cpf IN NUMBER,
        p_nr_cep_residencia IN NUMBER,
        p_dt_nascimento IN DATE
    ) RETURN VARCHAR2;
END PackageCadastroUsuario;


CREATE OR REPLACE PACKAGE BODY PackageCadastroUsuario IS
    FUNCTION cadastrar_usuario(
        p_cd_usuario IN NUMBER,
        p_ds_genero IN CHAR,
        p_nm_usuario IN VARCHAR2,
        p_nr_cpf IN NUMBER,
        p_nr_cep_residencia IN NUMBER,
        p_dt_nascimento IN DATE
    ) RETURN VARCHAR2
    IS
        v_result VARCHAR2(100);
        v_cd_erro NUMBER(3);
    BEGIN
        SELECT 'Usuário já cadastrado'
        INTO v_result
        FROM t_aisb_usuario
        WHERE cd_usuario = p_cd_usuario;

        SELECT NVL(MAX(cd_erro), 0) + 1 INTO v_cd_erro FROM t_aisb_erro;

        INSERT INTO t_aisb_erro (cd_erro, nm_erro, dt_ocorrencia, nm_usuario)
        VALUES (v_cd_erro, 'Tentativa de duplicação de usuário', SYSDATE, USER);

        RETURN 'Não foi possível cadastrar esse usuário pois ele já existe no sistema.';
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            INSERT INTO t_aisb_usuario (cd_usuario, ds_genero, nm_usuario, nr_cpf, nr_cep_residencia, dt_nascimento)
            VALUES (p_cd_usuario, p_ds_genero, p_nm_usuario, p_nr_cpf, p_nr_cep_residencia, p_dt_nascimento);

            RETURN 'O usuario foi cadastrado com sucesso.';
    END cadastrar_usuario;
END PackageCadastroUsuario;


DECLARE
    v_cd_usuario NUMBER(6);
    v_ds_genero CHAR(2);
    v_nm_usuario VARCHAR2(50);
    v_nr_cpf NUMBER(11);
    v_nr_cep_residencia NUMBER(8);
    v_dt_nascimento DATE;
    v_resultado VARCHAR2(200);
BEGIN
    v_cd_usuario := &codigo_usuario;
    v_ds_genero := '&genero';
    v_nm_usuario := '&nome';
    v_nr_cpf := &cpf;
    v_nr_cep_residencia := &cep;
    v_dt_nascimento := TO_DATE('&v_dt_nascimento', 'DD/MM/YYYY');
    
    v_resultado := PackageCadastroUsuario.cadastrar_usuario(
        v_cd_usuario, v_ds_genero, v_nm_usuario,
        v_nr_cpf, v_nr_cep_residencia, v_dt_nascimento
    );
    
    DBMS_OUTPUT.PUT_LINE(v_resultado);
END;



select * from t_aisb_erro;
select * from t_aisb_usuario;


--------------------------------------------------------------------------------------
--Feito o package do Procedure que  verifica e atualizr a data de encerramento do parceiro de negócio
CREATE OR REPLACE PACKAGE PackageAtualizacaoParceiro IS
    PROCEDURE atualizar_encerramento_parceiro(
        p_cd_parceiro IN NUMBER,
        p_dt_encerramento DATE
    );
END PackageAtualizacaoParceiro;


CREATE OR REPLACE PACKAGE BODY PackageAtualizacaoParceiro IS
    PROCEDURE atualizar_encerramento_parceiro(
        p_cd_parceiro IN NUMBER,
        p_dt_encerramento DATE
    )
    IS
        v_cd_parceiro t_aisb_parceiro_negocio.cd_parceiro%TYPE;
        v_cd_erro NUMBER(3);
    BEGIN
        SELECT cd_parceiro INTO v_cd_parceiro
        FROM t_aisb_parceiro_negocio
        WHERE cd_parceiro = p_cd_parceiro;

        UPDATE t_aisb_parceiro_negocio
        SET dt_encerramento_parceiro = p_dt_encerramento
        WHERE cd_parceiro = v_cd_parceiro;

        COMMIT;

        SELECT COALESCE(MAX(cd_erro) + 1, 1) INTO v_cd_erro FROM t_aisb_erro;

        INSERT INTO t_aisb_erro (cd_erro, nm_erro, dt_ocorrencia, nm_usuario)
        VALUES (v_cd_erro, 'Data de encerramento atualizada com sucesso', SYSDATE, USER);

        DBMS_OUTPUT.PUT_LINE('Data de encerramento atualizada com sucesso.');
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            SELECT COALESCE(MAX(cd_erro) + 1, 1) INTO v_cd_erro FROM t_aisb_erro;
            INSERT INTO t_aisb_erro (cd_erro, nm_erro, dt_ocorrencia, nm_usuario)
            VALUES (v_cd_erro, 'Parceiro não encontrado para atualização', SYSDATE, USER);
            COMMIT;

            DBMS_OUTPUT.PUT_LINE('Parceiro não encontrado. Erro registrado na tabela de erro.');
        WHEN OTHERS THEN
            SELECT COALESCE(MAX(cd_erro) + 1, 1) INTO v_cd_erro FROM t_aisb_erro;
            INSERT INTO t_aisb_erro (cd_erro, nm_erro, dt_ocorrencia, nm_usuario)
            VALUES (v_cd_erro, 'Erro ao atualizar data de encerramento', SYSDATE, USER);
            COMMIT;

            DBMS_OUTPUT.PUT_LINE('Erro ao atualizar data de encerramento. Erro registrado na tabela de erro.');
    END atualizar_encerramento_parceiro;
END PackageAtualizacaoParceiro;




DECLARE
    v_cd_parceiro NUMBER(3) := &v_cd_parceiro; 
    v_dt_encerramento DATE := TO_DATE('2023-08-31', 'YYYY-MM-DD'); 
BEGIN
    PackageAtualizacaoParceiro.atualizar_encerramento_parceiro(v_cd_parceiro, v_dt_encerramento);
END;


select * from t_aisb_parceiro_negocio;
select * from t_aisb_erro;

---------------------------------------------------------------------
--Procedure que irá exibir um relatório de todos os parceiros que encerram 
-- o contrato conosco e caso dê açgum erro, ele irá inserir na tebala de erro

CREATE OR REPLACE PACKAGE PackageRelatorioParceiros IS
    FUNCTION gerar_relatorio_parceiros_encerrados RETURN VARCHAR2;
END PackageRelatorioParceiros;

CREATE OR REPLACE PACKAGE BODY PackageRelatorioParceiros IS
    FUNCTION gerar_relatorio_parceiros_encerrados RETURN VARCHAR2
    IS
        v_cd_erro NUMBER;
        v_nm_erro VARCHAR2(50);
        v_relatorio VARCHAR2(4000) := 'Relatorio de Parceiros Encerrados' || CHR(10) || '--------------------------------' || CHR(10);
    BEGIN
        BEGIN
            FOR rec IN (SELECT cd_parceiro, nm_fantasia, dt_entrada_parceiro, dt_encerramento_parceiro, nr_cnpj
                        FROM t_aisb_parceiro_negocio
                        WHERE dt_encerramento_parceiro IS NOT NULL) LOOP

                v_relatorio := v_relatorio ||
                    'Código do Parceiro: ' || rec.cd_parceiro || CHR(10) ||
                    'Nome Fantasia: ' || rec.nm_fantasia || CHR(10) ||
                    'Data de Entrada: ' || TO_CHAR(rec.dt_entrada_parceiro, 'DD/MM/YYYY') || CHR(10) ||
                    'Data de Encerramento: ' || TO_CHAR(rec.dt_encerramento_parceiro, 'DD/MM/YYYY') || CHR(10) ||
                    'CNPJ: ' || rec.nr_cnpj || CHR(10) ||
                    '--------------------------------' || CHR(10);
            END LOOP;

            v_relatorio := v_relatorio || '--------------------------------' || CHR(10) || 'Fim do Relatorio' || CHR(10);
        EXCEPTION
            WHEN OTHERS THEN
                v_cd_erro := -1; 
                v_nm_erro := SQLERRM;

                INSERT INTO t_aisb_erro (cd_erro, nm_erro, dt_ocorrencia, nm_usuario)
                VALUES (v_cd_erro, v_nm_erro, SYSDATE, USER);

                v_relatorio := 'Ocorreu um erro durante a execucao da fun�ao.' || CHR(10) || 'Detalhes do erro: ' || v_nm_erro || CHR(10);
        END;
        
        RETURN v_relatorio;
    END gerar_relatorio_parceiros_encerrados;
END PackageRelatorioParceiros;


DECLARE
    v_relatorio VARCHAR2(4000);
BEGIN
    v_relatorio := PackageRelatorioParceiros.gerar_relatorio_parceiros_encerrados;
    DBMS_OUTPUT.PUT_LINE(v_relatorio);
END;

-----------------------Trigger Audite Update---------------------
CREATE OR REPLACE TRIGGER trg_rastreamento_alteracoes
BEFORE UPDATE ON t_aisb_funcionario
FOR EACH ROW
BEGIN
    IF :OLD.ds_senha <> :NEW.ds_senha THEN 
        INSERT INTO t_atualizacao_senha (cd_atualizacao_senha, cd_funcionario, ds_operacao, senha_anterior, senha_nova, data_atualizacao)
        VALUES (sk_update.nextval, :NEW.cd_funcionario, 'UPDATE', :OLD.ds_senha, :NEW.ds_senha, SYSTIMESTAMP);
    END IF;
END;


UPDATE t_aisb_funcionario
SET ds_senha = 'nova_senha'
WHERE cd_funcionario = 123; 

select * from  t_atualizacao_senha;
select * from t_aisb_funcionario; 

-----------------------Trigger Audite Insert---------------------
CREATE OR REPLACE TRIGGER trg_rastreamento_insercao
AFTER INSERT ON t_aisb_funcionario
FOR EACH ROW
BEGIN
    INSERT INTO t_atualizacao_senha (cd_atualizacao_senha, cd_funcionario, ds_operacao, senha_anterior, senha_nova, data_atualizacao)
    VALUES (sk_tb_senha.nextval, :NEW.cd_funcionario, 'INSERT', :OLD.ds_senha, :NEW.ds_senha, SYSTIMESTAMP);
END;

insert into t_aisb_funcionario values(220, 'Joao Augusto', 'Joaoaugusto@gmail.com', '253', 100);
insert into t_aisb_funcionario values(221, 'Paulo Jose', 'Paulojose@gmail.com', '462', 101);
insert into t_aisb_funcionario values(223, 'Henrique Souza', 'Henriquesouza@gmail.com', '153', 102);

select * from  t_atualizacao_senha;
select * from t_aisb_funcionario; 





