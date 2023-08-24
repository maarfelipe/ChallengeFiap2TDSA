--Query para agrupar e listar somente o codigo da recomendacao
-- e a data da mensagem dessa recomendacao
SELECT cd_recomendacao, dt_mensagem
FROM T_AISB_RECOMENDACAO
GROUP BY cd_recomendacao, dt_mensagem;


-- Query que faz a juncaoo da tabela T_AISB_PARCEIROS_NEGOCIOS 
-- com a tabela T_AISB_FUNCIONARIO e lista o nome de cada funcionario vinculado 
-- a empresa, listando o codigo identificador do parceiro e seu numero de cnpj
select nm_funcionario, cd_parceiros, nm_fantasia from t_aisb_parceiros_negocios
inner join t_aisb_funcionario on cd_parceiros = parceiros_fk;


set serveroutput on
set verify off


-- Verificando se o funcionário ja exite no sistema, caso o mesmo não exista,
-- fará um update com as novas informaçoes do funcionario
DECLARE
    v_cd_funcionario NUMBER(4);
    v_nm_funcionario VARCHAR2(50);
    v_ds_email VARCHAR2(50);
BEGIN
   
    v_cd_funcionario := &cd_funcionario; 


    SELECT cd_funcionario, nm_funcionario, ds_email
    INTO v_cd_funcionario, v_nm_funcionario, v_ds_email
    FROM t_aisb_funcionario
    WHERE cd_funcionario = v_cd_funcionario;

    DBMS_OUTPUT.PUT_LINE('O funcionário já existe no sistema.');

EXCEPTION
    
    WHEN NO_DATA_FOUND THEN
    
        v_nm_funcionario := '&nm_funcionario'; 
        v_ds_email := '&ds_email'; 


        INSERT INTO t_aisb_funcionario (cd_funcionario, nm_funcionario, ds_email)
        VALUES (v_cd_funcionario, v_nm_funcionario, v_ds_email);

       
        DBMS_OUTPUT.PUT_LINE('O funcionário foi cadastrado com sucesso.');
END;

select * from t_aisb_funcionario;




-- -- Verificando se o parceiro ja exite no sistema, caso o mesmo não exista,
-- fará um update com as novas informaçoes do parceiro de negocio
DECLARE
    v_cd_parceiro NUMBER(3);
    v_nm_fantasia VARCHAR2(50);
    v_dt_entrada_parceiro DATE;
    v_dt_encerramento_parceiro DATE;
    v_nr_cnpj NUMBER(14);
BEGIN
    v_cd_parceiro := &cd_parceiro; 

    SELECT cd_parceiro
    INTO v_cd_parceiro
    FROM t_aisb_parceiro_negocio
    WHERE cd_parceiro = v_cd_parceiro;
    DBMS_OUTPUT.PUT_LINE('O parceiro já existe no sistema.');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        v_nm_fantasia := '&nm_fantasia'; 
        v_dt_entrada_parceiro := TO_DATE('&dt_entrada_parceiro', 'DD/MM/YYYY'); 
        v_nr_cnpj := '&nr_cnpj'; 

        
        INSERT INTO t_aisb_parceiro_negocio (cd_parceiro, nm_fantasia, dt_entrada_parceiro, nr_cnpj)
        VALUES (v_cd_parceiro, v_nm_fantasia, v_dt_entrada_parceiro, v_nr_cnpj);

        
        DBMS_OUTPUT.PUT_LINE('O parceiro de negócio foi cadastrado com sucesso.');
END;


select * from t_aisb_parceiro_negocio;



SELECT dt_mensagem, ds_mensagem_recomendacao
FROM t_aisb_recomendacao
WHERE cd_usuario = 100000;


----------------------------------------------------------------
--Função que faz a verificação ao cadastrar um funcionario, em que, caso esse
-- funcionario ja exista no sistema armazenar as informações na tabela de erro,
-- e caso ele não exista, fará o cadastro do novo funcionario com as novas informações
CREATE OR REPLACE FUNCTION cadastrar_funcionario(
    p_cd_funcionario IN NUMBER,
    p_nm_funcionario IN VARCHAR2,
    p_ds_email IN VARCHAR2
) RETURN VARCHAR2
IS
    v_result VARCHAR2(100); -- Variável para armazenar o resultado
    v_cd_erro NUMBER(3);
BEGIN
    -- Verificar se o funcionário já existe na tabela
    SELECT 'Funcionário já cadastrado'
    INTO v_result
    FROM t_aisb_funcionario
    WHERE cd_funcionario = p_cd_funcionario;

    -- Funcionário já existe no sistema
    SELECT MAX(cd_erro) + 1 INTO v_cd_erro FROM t_aisb_erro;
    IF v_cd_erro IS NULL THEN
        v_cd_erro := 1;
    END IF;
    
    INSERT INTO t_aisb_erro (cd_erro, nm_erro, dt_ocorrencia, nm_usuario)
    VALUES (v_cd_erro, 'Tentativa de duplicação de funcionário', SYSDATE, USER);

    RETURN 'Não foi possível cadastrar esse funcionário pois ele já existe no sistema. Informações armazenadas na tabela de erro.';
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        -- Funcionário não existe, realizar inserção
        INSERT INTO t_aisb_funcionario (cd_funcionario, nm_funcionario, ds_email)
        VALUES (p_cd_funcionario, p_nm_funcionario, p_ds_email);

        RETURN 'O funcionário foi cadastrado com sucesso.';
END cadastrar_funcionario;


DECLARE
    v_cd_funcionario NUMBER(4);
    v_nm_funcionario VARCHAR2(50);
    v_ds_email VARCHAR2(50);
    v_resultado VARCHAR2(200);
BEGIN
    -- Solicitar informações ao usuário
    v_cd_funcionario := &v_cd_funcionario;
    v_nm_funcionario := '&v_nm_funcionario';
    v_ds_email := '&v_ds_email';
    
    -- Chamar a função cadastrar_funcionario com as informações inseridas
    v_resultado := cadastrar_funcionario(v_cd_funcionario, v_nm_funcionario, v_ds_email);
    DBMS_OUTPUT.PUT_LINE(v_resultado);
END;
select * from t_aisb_erro;





