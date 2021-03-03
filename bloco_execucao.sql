DECLARE

V_ID_USUARIO TBL_USUARIO.ID_USUARIO%TYPE;
V_NOME  TBL_USUARIO.NOME%TYPE;
V_SEXO TBL_USUARIO.SEXO%TYPE;

V_ENDERECO TBL_ENDERECO.ENDERECO%TYPE;
V_END_NUM TBL_ENDERECO.END_NUM%TYPE;
V_END_COMPL TBL_ENDERECO.END_COMPL%TYPE;
V_CEP TBL_ENDERECO.CEP%TYPE;
V_BAIRRO TBL_ENDERECO.BAIRRO%TYPE;
V_CIDADE TBL_ENDERECO.CIDADE%TYPE;
V_ESTADO TBL_ENDERECO.ESTADO%TYPE;

BEGIN

    V_NOME := 'Rafael Costa Teixeira';
    V_SEXO := 'M';
    
    V_ENDERECO := 'Rua Avelina Nogueira do Prado';
    V_END_NUM := 222;
    V_END_COMPL := 'apto 42 bloco C';
    V_CEP := 06755325;
    V_BAIRRO := 'Jardim Monte Alegre';
    V_CIDADE := 'Taboão da Serra';
    V_ESTADO := 'SP';
    
    BEGIN
    
    P_INS_USUARIO(
        P_NOME => V_NOME,
        P_SEXO => V_SEXO,
        P_ID_USUARIO => V_ID_USUARIO);
    
    EXCEPTION WHEN OTHERS THEN
        P_INS_LOG('Erro na execução da procedure P_INS_USUARIO - '||SQLCODE||' - '||SQLERRM);
        RETURN;
    END;
    
    BEGIN
    
        P_INS_ENDERECO(
            P_ENDERECO => V_ENDERECO,
            P_END_NUM => V_END_NUM,
            P_END_COMPL => V_END_COMPL,
            P_CEP => V_CEP,
            P_BAIRRO => V_BAIRRO,
            P_CIDADE => V_CIDADE,
            P_ESTADO => V_ESTADO,
            P_ID_USUARIO => V_ID_USUARIO);
    
    EXCEPTION WHEN OTHERS THEN
        P_INS_LOG('Erro na execução da procedure P_INS_ENDERECO - '||SQLCODE||' - '||SQLERRM);
        RETURN;
    END;

    P_INS_LOG('Endereco inserido.');
    
END;
--SELECT * FROM TBL_USUARIO;