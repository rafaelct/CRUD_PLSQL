create or replace PROCEDURE  P_INS_USUARIO (
P_NOME IN TBL_USUARIO.NOME%TYPE,
P_SEXO IN TBL_USUARIO.SEXO%TYPE,
P_ID_USUARIO OUT TBL_USUARIO.ID_USUARIO%TYPE)

AS

V_ID_USUARIO TBL_USUARIO.ID_USUARIO%TYPE;
V_NOME TBL_USUARIO.NOME%TYPE;
V_SEXO TBL_USUARIO.SEXO%TYPE;

NOME_INVALIDO EXCEPTION;
PRAGMA EXCEPTION_INIT (NOME_INVALIDO,-20000);

BEGIN

    BEGIN

        V_ID_USUARIO := SQ_USUARIO.NEXTVAL;
        V_NOME := P_NOME;
        V_SEXO := P_SEXO;

        IF FN_TEMNUMERO(V_NOME) > 0 THEN 
            RAISE_APPLICATION_ERROR(-20000,'NOME INVALIDO');
        END IF;
        
        INSERT INTO TBL_USUARIO (ID_USUARIO,NOME,SEXO,FLG_ATIVO) 
        values (
        V_ID_USUARIO,
        V_NOME,
        V_SEXO,
        1);

        COMMIT;



    EXCEPTION WHEN OTHERS THEN
        P_INS_LOG('Erro ao tentar inserir na tbl_usuario'||
                'v_nome = '||V_NOME||
                ' - v_sexo = '||V_SEXO||
                ' - '||SQLCODE||' - '||SQLERRM);
                RETURN;

    END;

    P_INS_LOG('Usuario id = '||V_ID_USUARIO||' INSERIDO.');

    P_ID_USUARIO := V_ID_USUARIO;

END;