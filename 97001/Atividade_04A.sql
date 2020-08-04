DECLARE
    v_dia   PLS_INTEGER DEFAULT &dia;
BEGIN
    IF v_dia = 1 THEN
        dbms_output.put_line('DOMINGO');
    ELSIF v_dia = 2 THEN
        dbms_output.put_line('SEGUNDA');
    ELSIF v_dia = 3 THEN
        dbms_output.put_line('TERÇA');
    ELSIF v_dia = 4 THEN
        dbms_output.put_line('QUARTA');
    ELSIF v_dia = 5 THEN
        dbms_output.put_line('QUINTA');
    ELSIF v_dia = 6 THEN
        dbms_output.put_line('SEXTA');
    ELSIF v_dia = 7 THEN
        dbms_output.put_line('SÁBADO');
    ELSE
        dbms_output.put_line('VALOR INVÁLIDO, INFORME DE 1 - 7.');
    END IF;
END;
/