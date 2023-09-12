set serveroutput on
set verify off

----------------------------------------------------------------
--Fun��o que faz a verifica��o ao cadastrar um funcionario, em que, caso esse
-- funcionario ja exista no sistema armazenar as informa��es na tabela de erro,
-- e caso ele n�o exista, far� o cadastro do novo funcionario com as novas informa��es
-- essa fun��o tamb�m ir� verificar se o codigo do parceiro existe para que esse 
-- funcion�rio seja cadastrado com um parceiro existente
CREATE OR REPLACE FUNCTION cadastrar_funcionario(
    p_cd_funcionario IN NUMBER,
    p_nm_funcionario IN VARCHAR2,
    p_ds_email IN VARCHAR2,
    p_ds_senha IN VARCHAR2,
    p_cd_parceiro IN NUMBER
) RETURN VARCHAR2
IS
    v_parceiro_exist NUMBER(1) := 0;
BEGIN
    SELECT COUNT(*) INTO v_parceiro_exist
    FROM t_aisb_parceiro_negocio
    WHERE cd_parceiro = p_cd_parceiro;

    IF v_parceiro_exist = 0 THEN
        INSERT INTO t_aisb_erro (cd_erro, nm_erro, dt_ocorrencia, nm_usuario)
        VALUES (t_aisb_erro_seq.nextval, 'Parceiro de neg�cios n�o encontrado', SYSDATE, USER);

        RETURN 'N�o foi poss�vel cadastrar esse funcion�rio pois o parceiro de neg�cios n�o foi encontrado.';
    END IF;

    INSERT INTO t_aisb_funcionario (cd_funcionario, nm_funcionario, ds_email, ds_senha, parceiro_fk)
    VALUES (p_cd_funcionario, p_nm_funcionario, p_ds_email, p_ds_senha, p_cd_parceiro);

    RETURN 'O funcion�rio foi cadastrado com sucesso.';
EXCEPTION
    WHEN OTHERS THEN
        INSERT INTO t_aisb_erro (cd_erro, nm_erro, dt_ocorrencia, nm_usuario)
        VALUES (t_aisb_erro_seq.nextval, 'Erro ao cadastrar funcion�rio', SYSDATE, USER);

        RETURN 'Ocorreu um erro ao cadastrar o funcion�rio.';
END cadastrar_funcionario;




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
    
    v_resultado := cadastrar_funcionario(v_cd_funcionario, v_nm_funcionario, v_ds_email, v_ds_senha, v_cd_parceiro); 
    DBMS_OUTPUT.PUT_LINE(v_resultado);
END;


select * from t_aisb_erro;
select * from t_aisb_funcionario;



---------------------------------------------------------------------------
--Fun��o que faz a verifica��o ao cadastrar um usu�rio, em que, caso esse
-- usu�rio ja exista no sistema armazenar as informa��es na tabela de erro,
-- e caso ele n�o exista, far� o cadastro do novo usu�rio com as novas informa��es
CREATE OR REPLACE FUNCTION cadastrar_usuario(
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
    SELECT 'Usu�rio j� cadastrado'
    INTO v_result
    FROM t_aisb_usuario
    WHERE cd_usuario = p_cd_usuario;

    SELECT NVL(MAX(cd_erro), 0) + 1 INTO v_cd_erro FROM t_aisb_erro;
    
    INSERT INTO t_aisb_erro (cd_erro, nm_erro, dt_ocorrencia, nm_usuario)
    VALUES (v_cd_erro, 'Tentativa de duplica��o de usu�rio', SYSDATE, USER);

    RETURN 'N�o foi poss�vel cadastrar esse usu�rio pois ele j� existe no sistema.';
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        INSERT INTO t_aisb_usuario (cd_usuario, ds_genero, nm_usuario, nr_cpf, nr_cep_residencia, dt_nascimento)
        VALUES (p_cd_usuario, p_ds_genero, p_nm_usuario, p_nr_cpf, p_nr_cep_residencia, p_dt_nascimento);

        RETURN 'O usu�rio foi cadastrado com sucesso.';
END cadastrar_usuario;


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
    
    v_resultado := cadastrar_usuario(
        v_cd_usuario, v_ds_genero, v_nm_usuario,
        v_nr_cpf, v_nr_cep_residencia, v_dt_nascimento
    );
    
    DBMS_OUTPUT.PUT_LINE(v_resultado);
END;


select * from t_aisb_erro;
select * from t_aisb_usuario;


--------------------------------------------------------------------------------------
--Procedure para verificar e atualizar a data de encerramento do parceiro de neg�cio
CREATE OR REPLACE PROCEDURE atualizar_encerramento_parceiro (
    p_cd_parceiro NUMBER,
    p_dt_encerramento DATE
) IS
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
        VALUES (v_cd_erro, 'Parceiro n�o encontrado para atualiza��o', SYSDATE, USER);
        COMMIT;

        DBMS_OUTPUT.PUT_LINE('Parceiro n�o encontrado. Erro registrado na tabela de erro.');
    WHEN OTHERS THEN
        SELECT COALESCE(MAX(cd_erro) + 1, 1) INTO v_cd_erro FROM t_aisb_erro;
        INSERT INTO t_aisb_erro (cd_erro, nm_erro, dt_ocorrencia, nm_usuario)
        VALUES (v_cd_erro, 'Erro ao atualizar data de encerramento', SYSDATE, USER);
        COMMIT;

        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar data de encerramento. Erro registrado na tabela de erro.');
END atualizar_encerramento_parceiro;




DECLARE
    v_cd_parceiro NUMBER(3);
    v_dt_encerramento DATE := TO_DATE('2023-08-31', 'YYYY-MM-DD');
BEGIN
    v_cd_parceiro := &v_cd_parceiro;
  
    atualizar_encerramento_parceiro(v_cd_parceiro, v_dt_encerramento);
END;

select * from t_aisb_parceiro_negocio;
select * from t_aisb_erro;

---------------------------------------------------------------------
--Procedure que ir� exibir um relat�rio de todos os parceiros que encerram 
-- o contrato conosco e caso d� a�gum erro, ele ir� inserir na tebala de erro
CREATE OR REPLACE PROCEDURE relatorio_parceiros_encerrados AS
    v_cd_erro NUMBER;
    v_nm_erro VARCHAR2(50);
BEGIN
    DBMS_OUTPUT.PUT_LINE('Relat�rio de Parceiros Encerrados');
    DBMS_OUTPUT.PUT_LINE('--------------------------------');

    BEGIN
        FOR rec IN (SELECT cd_parceiro, nm_fantasia, dt_entrada_parceiro, dt_encerramento_parceiro, nr_cnpj
                    FROM t_aisb_parceiro_negocio
                    WHERE dt_encerramento_parceiro IS NOT NULL) LOOP

            DBMS_OUTPUT.PUT_LINE('C�digo do Parceiro: ' || rec.cd_parceiro);
            DBMS_OUTPUT.PUT_LINE('Nome Fantasia: ' || rec.nm_fantasia);
            DBMS_OUTPUT.PUT_LINE('Data de Entrada: ' || TO_CHAR(rec.dt_entrada_parceiro, 'DD/MM/YYYY'));
            DBMS_OUTPUT.PUT_LINE('Data de Encerramento: ' || TO_CHAR(rec.dt_encerramento_parceiro, 'DD/MM/YYYY'));
            DBMS_OUTPUT.PUT_LINE('CNPJ: ' || rec.nr_cnpj);
            DBMS_OUTPUT.PUT_LINE('--------------------------------');
        END LOOP;
        
        DBMS_OUTPUT.PUT_LINE('--------------------------------');
        DBMS_OUTPUT.PUT_LINE('Fim do Relat�rio');
    EXCEPTION
        WHEN OTHERS THEN
            v_cd_erro := -1; 
            v_nm_erro := SQLERRM;

            INSERT INTO t_aisb_erro (cd_erro, nm_erro, dt_ocorrencia, nm_usuario)
            VALUES (v_cd_erro, v_nm_erro, SYSDATE, USER);

            DBMS_OUTPUT.PUT_LINE('Ocorreu um erro durante a execu��o da procedure.');
            DBMS_OUTPUT.PUT_LINE('Detalhes do erro: ' || v_nm_erro);
    END;
END relatorio_parceiros_encerrados;


BEGIN
    relatorio_parceiros_encerrados;
END;



-----------------------------------------------------------------------
--Trigger para atualizar a senha do funcion�rio
CREATE OR REPLACE TRIGGER trg_before_atualizacao_senha
BEFORE UPDATE ON t_aisb_funcionario
FOR EACH ROW
BEGIN
    IF :OLD.ds_senha <> :NEW.ds_senha THEN 
        INSERT INTO t_atualizacao_senha (cd_funcionario, senha_anterior, senha_nova, data_atualizacao)
        VALUES (:OLD.cd_funcionario, :OLD.ds_senha, :NEW.ds_senha, SYSTIMESTAMP);
    END IF;
END;


UPDATE t_aisb_funcionario
SET ds_senha = 'nova_senha'
WHERE cd_funcionario = 123; 

select * from  t_atualizacao_senha;
select * from t_aisb_funcionario; 


