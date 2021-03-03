create or replace PROCEDURE  P_UPD_USUARIO (
P_ID_USUARIO IN TBL_USUARIO.ID_USUARIO%TYPE,
P_NOME IN TBL_USUARIO.NOME%TYPE,
P_SEXO IN TBL_USUARIO.SEXO%TYPE,
P_FLG_ATIVO IN TBL_USUARIO.FLG_ATIVO%TYPE)

AS

V_ID_USUARIO TBL_USUARIO.ID_USUARIO%TYPE;
V_NOME TBL_USUARIO.NOME%TYPE;
V_SEXO TBL_USUARIO.SEXO%TYPE;
V_SQL VARCHAR2(2000);


BEGIN

    BEGIN

        V_SQL := 'UPDATE TBL_USUARIO SET ';

        IF P_NOME IS NOT NULL THEN
            V_SQL := V_SQL || ' NOME = "'|| P_NOME ||'" ,' ;
        END IF;


        IF P_SEXO IS NOT NULL THEN
            V_SQL := V_SQL || ' SEXO = "'|| P_SEXO ||'" ,' ; 
        END IF;

        IF P_FLG_ATIVO IS NOT NULL THEN
            V_SQL := V_SQL || ' FLG_ATIVO = '|| P_FLG_ATIVO ||',' ; 
        END IF;

        V_SQL := SUBSTR(V_SQL,1,LENGTH(V_SQL)-1);
        V_SQL := V_SQL ||' WHERE ID_USUARIO = '|| P_ID_USUARIO;
        V_SQL:= REPLACE(V_SQL,CHR(34),CHR(39));

        --DBMS_OUTPUT.PUT_LINE(V_SQL);

        EXECUTE IMMEDIATE V_SQL;
        
        COMMIT;



    EXCEPTION WHEN OTHERS THEN
        P_INS_LOG('Erro ao tentar atualizar a tbl_usuario'||
                'P_ID_USUARIO = '||P_ID_USUARIO||
                ' - P_NOME = '||P_NOME||
                ' - P_SEXO = '||P_SEXO||
                ' - '||SQLCODE||' - '||SQLERRM);
                RETURN;

    END;

    P_INS_LOG('Usuario id = '||V_ID_USUARIO||' INSERIDO.');

    --P_ID_USUARIO := V_ID_USUARIO;

END;