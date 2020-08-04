SET SERVEROUTPUT ON
DECLARE
   v_juiznome juiz.nom_juiz%type;
   v_cont number := 0;
BEGIN
    LOOP
        SELECT nom_juiz INTO v_juiznome
          FROM juiz
         ORDER BY nom_juiz
        OFFSET v_cont ROWS FETCH NEXT 1 ROW ONLY;
          
          DBMS_OUTPUT.PUT_LINE('Nome: ' || v_juiznome);
     
          
        v_cont := v_cont + 1;
        EXIT WHEN v_cont = 10;
     
     END LOOP;
END;
/