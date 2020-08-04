CREATE SEQUENCE SEQ_COD_CURSO
    INCREMENT BY 1
    START WITH 95002;
     
CREATE SEQUENCE SEQ_COD_ALUNO
    INCREMENT BY 1
    START WITH 3;
    
ALTER TABLE ALUNO MODIFY (
    COD_ALUNO DEFAULT SEQ_COD_ALUNO.NEXTVAL);
    
ALTER TABLE CURSO MODIFY (
    COD_CURSO DEFAULT SEQ_COD_CURSO.NEXTVAL);
    

INSERT INTO CURSO (COD_CURSO, NOM_CURSO,
                     DAT_INICIO, DAT_FIM)
           VALUES (DEFAULT, 'JAVA I',
                     SYSDATE, SYSDATE + 30);
                     
                     
INSERT INTO ALUNO (COD_ALUNO, NUM_MATRICULA,
                   NOM_ALUNO, NUM_IDADE,
                   DES_EMAIL, COD_CURSO)
           VALUES (DEFAULT, 'MA4567',
                   'JACKSON SANTOS', 20,
                   'jackson@gmail.com', 95002);

SELECT SEQ_COD_CURSO.CURRVAL FROM DUAL;
SELECT SEQ_COD_ALUNO.CURRVAL FROM DUAL;

CREATE SYNONYM EMP FOR EMPLOYEES;
SELECT * FROM EMP;

CREATE INDEX IDX_FNAME ON EMPLOYEES(FIRST_NAME);
CREATE INDEX IDX_FNAMEU ON EMPLOYEES(UPPER(FIRST_NAME));

CREATE OR REPLACE VIEW EMP_50 AS
SELECT EMPLOYEE_ID EMP_ID, UPPER(FIRST_NAME) NOME,
       UPPER(LAST_NAME) SOBRENOME,
       TO_CHAR(HIRE_DATE,'DD/MM/YYYY - DAY') DT_ADM,
       TO_CHAR(SALARY,'fmL999G999D00') SALARIO
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = '50';

SELECT * FROM EMP_50;

SELECT * FROM USER_VIEWS;

SELECT ROWNUM, EMPLOYEE_ID, FIRST_NAME
  FROM EMP
 ORDER BY FIRST_NAME;
 
 DESC DEPARTMENTS;
 
 DESC EMP;
 
 CREATE OR REPLACE VIEW EMP_80 AS
    SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME,
           EMAIL, HIRE_DATE, JOB_ID, DEPARTMENT_ID
      FROM EMPLOYEES
     WHERE DEPARTMENT_ID = 80
 WITH CHECK OPTION CONSTRAINT CK_DEPT_80;
    
 SELECT * FROM EMP_80;    
 
 INSERT INTO EMP_80 VALUES (320, 'MARCO','AUR�LIO',
                            'MAURELIO', SYSDATE,
                            'IT_PROG', 50);
 
 
 
 