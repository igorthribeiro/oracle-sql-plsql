--ALTER TRIGGER TR_AUDITORIA DISABLE;
--SET SERVEROUTPUT ON
ALTER SESSION SET PLSQL_WARNINGS='ERROR:ALL';
ALTER SESSION SET PLSQL_OPTIMIZE_LEVEL=3;
CREATE OR REPLACE FUNCTION FC_TESTEW(P_VALOR NUMBER) RETURN BOOLEAN
AUTHID CURRENT_USER IS
BEGIN
   WHILE P_VALOR < 10 LOOP
      DBMS_OUTPUT.PUT_LINE('OK');
   END LOOP;
   --DBMS_OUTPUT.PUT_LINE('OK');
   RETURN TRUE;
END;
/
SHOW ERRORS;
