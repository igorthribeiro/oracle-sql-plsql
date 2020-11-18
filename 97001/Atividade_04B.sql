SET VERIFY OFF
DECLARE
    v_dia   PLS_INTEGER DEFAULT &dia;
BEGIN
    CASE v_dia
       WHEN 1 THEN dbms_output.put_line('DOMINGO');
       WHEN 2 THEN dbms_output.put_line('SEGUNDA');
       WHEN 3 THEN dbms_output.put_line('TERÇA');
       WHEN 4 THEN dbms_output.put_line('QUARTA');
       WHEN 5 THEN dbms_output.put_line('QUINTA');
       WHEN 6 THEN dbms_output.put_line('SEXTA');
       WHEN 7 THEN dbms_output.put_line('SÁBADO');
    ELSE
       dbms_output.put_line('VALOR INVÁLIDO, INFORME DE 1 - 7.');
    END CASE;
END;

/

SET VERIFY OFF
DECLARE
    v_dia   PLS_INTEGER DEFAULT &dia;
    v_nome_dia VARCHAR2(20);
BEGIN
    v_nome_dia :=  CASE v_dia
                      WHEN 1 THEN 'DOMINGO'
                      WHEN 2 THEN 'SEGUNDA'
                      WHEN 3 THEN 'TERÇA'
                      WHEN 4 THEN 'QUARTA'
                      WHEN 5 THEN 'QUINTA'
                      WHEN 6 THEN 'SEXTA'
                      WHEN 7 THEN 'SÁBADO'
                   ELSE
                      'VALOR INVÁLIDO, INFORME DE 1 - 7.'
                   END;
    
    DBMS_OUTPUT.PUT_LINE(v_nome_dia);
END;
/


SET SERVEROUT ON
DECLARE
  V_NOME  EMPLOYEES.FIRST_NAME%TYPE;
  V_GRADE VARCHAR2(1);
  V_FAIXA VARCHAR2(20);
  
BEGIN
  select first_name, g.grade_level INTO V_NOME, V_GRADE
  from employees e
       join job_grades g
         on e.salary between g.lowest_sal and g.highest_sal
  where employee_id = 103;

   V_FAIXA := CASE
                WHEN V_GRADE IN ('A','B') THEN 'BAIXA'
                WHEN V_GRADE IN ('C','D') THEN 'MÉDIA'
                WHEN V_GRADE IN ('E','F') THEN 'ALTA'
                ELSE 'FORA DA GRADE'
              END;
              
   DBMS_OUTPUT.PUT_LINE('A FAIXA SALARIAL DO FUNCIONÁRIO: '|| UPPER(V_NOME) || ' É ' || V_FAIXA);
END;

/
