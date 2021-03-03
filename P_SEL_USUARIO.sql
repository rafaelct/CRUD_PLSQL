create or replace PROCEDURE P_SEL_USUARIO (
P_CURSOR OUT SYS_REFCURSOR,
P_FLG_ATIVO IN TBL_USUARIO.FLG_ATIVO%TYPE)
AS

BEGIN

    OPEN P_CURSOR FOR SELECT 
                        NOME,
                        DECODE(SEXO,'M','MASCULINO','F','FEMININO') SEXO,
                        FLG_ATIVO 
                        FROM TBL_USUARIO 
                        WHERE FLG_ATIVO = P_FLG_ATIVO;


END;