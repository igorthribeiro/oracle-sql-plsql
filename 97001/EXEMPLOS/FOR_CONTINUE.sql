SET VERIFY OFF;
SET SERVEROUTPUT ON;
UNDEFINE NUM;
DECLARE
   V_INE_VAL NUMBER := &&NUM;

BEGIN
   <<fora>>
   FOR I IN 1..5 LOOP
     DBMS_OUTPUT.PUT_LINE('VALOR: ' || I * V_INE_VAL);
     FOR I IN 1..1000 LOOP
        V_INE_VAL := I;   
        CONTINUE fora WHEN V_INE_VAL >= &&NUM;
        DBMS_OUTPUT.PUT_LINE('DEPOIS DO CONTINUE: ' || V_INE_VAL);
     END LOOP;
   END LOOP fora;
END;
