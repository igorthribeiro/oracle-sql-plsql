DECLARE
   V_FEEDBACK VARCHAR2(100);
BEGIN
   V_FEEDBACK := 'INSERINDO O CURSO JAVA B�SICO!';
   SP_INSERE_CURSO(P_NM_CURSO => 'JAVA B�SICO', P_FEEDBACK => V_FEEDBACK);
   DBMS_OUTPUT.PUT_LINE(V_FEEDBACK);
END;
/