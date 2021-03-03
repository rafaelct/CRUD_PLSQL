create or replace PROCEDURE  P_DEL_USUARIO (
P_ID_USUARIO IN TBL_USUARIO.ID_USUARIO%TYPE
)

AS

BEGIN

    BEGIN

        DELETE TBL_USUARIO WHERE ID_USUARIO = P_ID_USUARIO;

        COMMIT;



    EXCEPTION WHEN OTHERS THEN
        P_INS_LOG('Erro ao tentar remover o usuario'||
                'P_ID_USUARIO = '||P_ID_USUARIO||
                ' - '||SQLCODE||' - '||SQLERRM);
                RETURN;

    END;

    P_INS_LOG('Usuario id = '||P_ID_USUARIO||' REMOVIDO.');

    --P_ID_USUARIO := V_ID_USUARIO;

END;