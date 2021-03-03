create or replace PROCEDURE P_SEL_ENDERECO (
P_CURSOR OUT SYS_REFCURSOR,
P_FLG_ATIVO IN TBL_USUARIO.FLG_ATIVO%TYPE)
AS

BEGIN

    OPEN P_CURSOR FOR SELECT 
                    ID_ENDERECO,
                    ENDERECO,
                    END_NUM,
                    END_COMPL,
                    CEP,
                    BAIRRO,
                    CIDADE,
                    ESTADO,
                    ID_USUARIO
                FROM TBL_ENDERECO
                WHERE FLG_ATIVO = P_FLG_ATIVO;


END;