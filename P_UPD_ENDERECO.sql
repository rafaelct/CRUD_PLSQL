create or replace PROCEDURE  P_UPD_ENDERECO (
P_ID_ENDERECO IN TBL_ENDERECO.ID_ENDERECO%TYPE,
P_ENDERECO IN TBL_ENDERECO.ENDERECO%TYPE,
P_END_NUM IN TBL_ENDERECO.END_NUM%TYPE,
P_END_COMPL IN TBL_ENDERECO.END_COMPL%TYPE,
P_CEP IN TBL_ENDERECO.CEP%TYPE,
P_BAIRRO IN TBL_ENDERECO.BAIRRO%TYPE,
P_CIDADE IN TBL_ENDERECO.CIDADE%TYPE,
P_ESTADO IN TBL_ENDERECO.ESTADO%TYPE,
P_ID_USUARIO IN TBL_ENDERECO.ID_USUARIO%TYPE)

AS

V_SQL VARCHAR2(2000);

BEGIN

    BEGIN

        V_SQL := 'UPDATE TBL_ENDERECO SET ';

        IF P_ENDERECO IS NOT NULL THEN
            V_SQL := V_SQL || ' ENDERECO = "'|| P_ENDERECO ||'" ,' ;
        END IF;

        IF P_END_NUM IS NOT NULL THEN
            V_SQL := V_SQL || ' END_NUM = '|| P_END_NUM ||' ,' ; 
        END IF;

        IF P_END_COMPL IS NOT NULL THEN
            V_SQL := V_SQL || ' END_COMPL = "'|| P_END_COMPL ||'",' ; 
        END IF;

        IF P_CEP IS NOT NULL THEN
            V_SQL := V_SQL || ' CEP = '|| P_CEP ||',' ; 
        END IF;

        IF P_BAIRRO IS NOT NULL THEN
            V_SQL := V_SQL || ' BAIRRO = "'|| P_BAIRRO ||'",' ; 
        END IF;

        IF P_CIDADE IS NOT NULL THEN
            V_SQL := V_SQL || ' CIDADE = "'|| P_CIDADE ||'",' ; 
        END IF;

        IF P_ESTADO IS NOT NULL THEN
            V_SQL := V_SQL || ' ESTADO = "'|| P_ESTADO ||'",' ; 
        END IF;

        IF P_ID_USUARIO IS NOT NULL THEN
            V_SQL := V_SQL || ' ID_USUARIO = '|| P_ID_USUARIO ||',' ; 
        END IF;

        V_SQL := SUBSTR(V_SQL,1,LENGTH(V_SQL)-1);
        V_SQL := V_SQL ||' WHERE ID_ENDERECO = '|| P_ID_ENDERECO;
        V_SQL:= REPLACE(V_SQL,CHR(34),CHR(39));

        --DBMS_OUTPUT.PUT_LINE(V_SQL);

        EXECUTE IMMEDIATE V_SQL;

        COMMIT;



    EXCEPTION WHEN OTHERS THEN
        P_INS_LOG('Erro ao tentar atualizar a tbl_endereco'||
                'P_ID_ENDERECO = '||P_ID_ENDERECO||
                ' - P_ENDERECO = '||P_ENDERECO||
                ' - P_END_NUM = '||P_END_NUM||
                ' - P_END_COMPL = '||P_END_COMPL||
                ' - P_CEP = '||P_CEP||
                ' - P_BAIRRO = '||P_BAIRRO||
                ' - P_CIDADE = '||P_CIDADE||
                ' - P_ESTADO = '||P_ESTADO||
                ' - P_ID_USUARIO = '||P_ID_USUARIO||
                ' - '||SQLCODE||' - '||SQLERRM);
                RETURN;

    END;

    P_INS_LOG('ENDERECO id = '||P_ID_ENDERECO||' ATUALIZADO.');

    --P_ID_USUARIO := V_ID_USUARIO;

END;