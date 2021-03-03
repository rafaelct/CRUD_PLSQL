create or replace PROCEDURE  P_DEL_ENDERECO (
P_ID_ENDERECO IN TBL_ENDERECO.ID_ENDERECO%TYPE
)

AS

BEGIN

    BEGIN

        DELETE TBL_ENDERECO WHERE ID_ENDERECO = P_ID_ENDERECO;

        COMMIT;



    EXCEPTION WHEN OTHERS THEN
        P_INS_LOG('Erro ao tentar remover o endereco'||
                'P_ID_ENDERECO = '||P_ID_ENDERECO||
                ' - '||SQLCODE||' - '||SQLERRM);
                RETURN;

    END;

    P_INS_LOG('Endereco id = '||P_ID_ENDERECO||' REMOVIDO.');



END;