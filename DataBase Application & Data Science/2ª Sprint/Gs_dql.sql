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















