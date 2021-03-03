create or replace NONEDITIONABLE FUNCTION FN_TEMNUMERO( P_STR IN VARCHAR2 ) 
RETURN NUMBER
AS

BEGIN

    IF INSTR(P_STR,'0',1) > 0 THEN 
        RETURN 1;
    END IF;
    IF INSTR(P_STR,'1',1) > 0 THEN 
        RETURN 1;
    END IF;
    IF INSTR(P_STR,'2',1) > 0 THEN 
        RETURN 1;
    END IF;
    IF INSTR(P_STR,'3',1) > 0 THEN
        RETURN 1;
    END IF;
    IF INSTR(P_STR,'4',1) > 0 THEN
        RETURN 1;
    END IF;
    IF INSTR(P_STR,'5',1) > 0 THEN
        RETURN 1;
    END IF;
    IF INSTR(P_STR,'6',1) > 0 THEN
        RETURN 1;
    END IF;
    IF INSTR(P_STR,'7',1) > 0 THEN
        RETURN 1;
    END IF;

    IF INSTR(P_STR,'8',1) > 0 THEN
        RETURN 1;
    END IF;
    IF INSTR(P_STR,'9',1) > 0 THEN
        RETURN 1;
    END IF;

RETURN 0;

END FN_TEMNUMERO;