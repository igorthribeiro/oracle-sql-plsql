DECLARE
   V_TESTE BOOLEAN;
BEGIN
   V_TESTE := FC_VALIDA_EMAIL('teste@');
   IF V_TESTE THEN
      DBMS_OUTPUT.PUT_LINE('OK');
   ELSE 
      DBMS_OUTPUT.PUT_LINE('ERRO');
   END IF;      
END;      