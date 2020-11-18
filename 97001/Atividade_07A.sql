SELECT * FROM COUNTRIES;

DECLARE
   TYPE T_DEPT IS RECORD (
       DEPT_ID EMPLOYEES.DEPARTMENT_ID%TYPE,
       EMPS NUMBER(10),
       SOMA_SAL NUMBER(10,2),
       MEDIA_SAL NUMBER(10,2));

   TYPE T_DEPT_TABLE IS TABLE OF T_DEPT
      INDEX BY PLS_INTEGER;

   TYPE T_DEPT_IDS IS TABLE OF EMPLOYEES.DEPARTMENT_ID%TYPE
      INDEX BY PLS_INTEGER;
   
   V_IDS T_DEPT_IDS;
   V_DEPTS T_DEPT_TABLE;
BEGIN
    V_IDS(1) := 50;
    V_IDS(2) := 60;
    V_IDS(3) := 80;
    V_IDS(4) := 90;
    V_IDS(4) := 110;
    
    --CARREGAR DADOS PARA MEMÓRIA
    FOR I IN V_IDS.FIRST..V_IDS.LAST LOOP
        SELECT DEPARTMENT_ID, COUNT(*), SUM(SALARY), AVG(SALARY) INTO V_DEPTS(I)
          FROM EMPLOYEES WHERE DEPARTMENT_ID = V_IDS(I)
         GROUP BY DEPARTMENT_ID;

    END LOOP;
    
    --LISTAR DADOS ARMAZENADOS
    FOR I IN V_DEPTS.FIRST..V_DEPTS.LAST LOOP
        DBMS_OUTPUT.PUT_LINE('ID DEPARTAMENTO: ' || V_DEPTS(I).DEPT_ID);
        DBMS_OUTPUT.PUT_LINE('TOTAL DE FUNCIONÁRIOS: ' || V_DEPTS(I).EMPS);
        DBMS_OUTPUT.PUT_LINE('SOMA DOS SALÁRIOS: ' || TO_CHAR(V_DEPTS(I).SOMA_SAL, 'fmL999G990D00'));
        DBMS_OUTPUT.PUT_LINE('MÉDIA SALARIAL: ' || TO_CHAR(V_DEPTS(I).MEDIA_SAL, 'fmL999G990D00'));
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------');
    END LOOP;
   
END;
/






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