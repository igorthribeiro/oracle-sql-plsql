CREATE GLOBAL TEMPORARY TABLE deptemps (
    dept_id      NUMBER(4) NOT NULL,
    dept_name    VARCHAR2(30) NOT NULL,
    dept_funcs   NUMBER(3)
)
ON COMMIT DELETE ROWS;
/
CREATE SEQUENCE SQ_DEPT START WITH 100 INCREMENT BY 10;
/

SET SERVEROUTPUT ON
DECLARE
    --DECLARAR UM TIPO IBT PARA RECEBER OS DADOS DE deptemps
    TYPE t_deptemps IS
        TABLE OF deptemps%rowtype
    INDEX BY  PLS_INTEGER;
    --DECLARA A VARIÁVEL DO TIPO ACIMA
    v_deptemps   t_deptemps;
    
    --DECLARAR UM TIPO IBT PARA RECEBER OS IDS DOS DEPTS
    TYPE t_deptids IS
        TABLE OF departments.department_id%TYPE
    INDEX BY PLS_INTEGER;
    --DECLARAR UMA VARIÁVEL DO TIPO ACIMA    
    v_deptids    t_deptids;
    
    --DECLARAR UM CONTADOR PARA OS DEPARTAMENTOS
    v_countdept PLS_INTEGER;
    
    --DECLARAR UM RECORD PARA RECEBER A LINHA DE deptemps
    TYPE t_dept IS RECORD (
       v_deptid deptemps.dept_id%TYPE,
       v_deptname deptemps.dept_name%TYPE,
       v_deptfuncs deptemps.dept_funcs%TYPE
    );
    --DECLARAR A VARIÁVEL DO TIPO ACIMA    
    v_dept t_dept;
    
    --deptemps%ROWTYPE

BEGIN
   --OBTER A QUANTIDADE DE DEPARTAMENTOS
   SELECT COUNT(*) INTO v_countdept FROM departments;
   
   --OBTER OS CÓDIGOS DE DEPARTAMENTO
    FOR i IN 0..v_countdept-1 LOOP
        SELECT department_id INTO v_deptids(i+1)
         FROM departments
        OFFSET i ROWS FETCH NEXT 1 ROW ONLY;
    END LOOP;

    --CALCULAR A QUANTIDADE DE EMPREGADOS POR DEPARTAMENTO E JOGAR NA IBT v_deptemps
    FOR i IN 1..v_deptids.count LOOP 
        SELECT department_id, department_name, COUNT(EMPLOYEE_ID)
          INTO v_deptemps(v_deptids(i))
          FROM departments
          LEFT JOIN employees USING ( department_id )
         WHERE department_id = v_deptids(i)
         GROUP BY department_id, department_name;
    END LOOP;
    
    --INSERIR OS DADOS ENCONTRADOS NA GTT deptemps UTILIZANDO A SEQUENCE SQ_DEPT.
    FOR i IN v_deptids.FIRST..v_deptids.LAST LOOP
        v_dept := v_deptemps(v_deptids(i));
        CONTINUE WHEN v_dept.v_deptfuncs = 0;
        
        v_dept.v_deptid := SQ_DEPT.NEXTVAL;
        v_dept.v_deptname := UPPER(v_dept.v_deptname);
        
        INSERT INTO deptemps VALUES v_dept;
    END LOOP;
END;
/