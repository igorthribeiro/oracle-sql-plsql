SET SERVEROUTPUT ON
DECLARE
   TYPE t_table IS TABLE OF VARCHAR2(20)
                INDEX BY PLS_INTEGER;
   v_table t_table;
   
BEGIN
    FOR i IN REVERSE 100..150 LOOP
        v_table(i) := TO_CHAR(i);
    END LOOP;
    --v_table(200) := 'X';
    --v_table(10) := 'Y';
    DBMS_OUTPUT.PUT_LINE(v_table.first);
    DBMS_OUTPUT.PUT_LINE(v_table.last);    

END;
/