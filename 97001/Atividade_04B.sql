SET VERIFY OFF
DECLARE
    v_dia   PLS_INTEGER DEFAULT &dia;
BEGIN
    CASE v_dia
       WHEN 1 THEN dbms_output.put_line('DOMINGO');
       WHEN 2 THEN dbms_output.put_line('SEGUNDA');
       WHEN 3 THEN dbms_output.put_line('TER�A');
       WHEN 4 THEN dbms_output.put_line('QUARTA');
       WHEN 5 THEN dbms_output.put_line('QUINTA');
       WHEN 6 THEN dbms_output.put_line('SEXTA');
       WHEN 7 THEN dbms_output.put_line('S�BADO');
    ELSE
       dbms_output.put_line('VALOR INV�LIDO, INFORME DE 1 - 7.');
    END CASE;
END;
/