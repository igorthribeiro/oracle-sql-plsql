/*
1) CRIE UMA VIEW COM O NOME EMP_50 QUE MOSTRE
O ID, NOME (MAIUSCULO), SOBRENOME (MAIUSCULO),
A DATA DE ADMISS�O NO FORMATO '03/10/2018 - QUARTA'
E O SALARIO NO FORMATO R$24.000,00 MOSTRANDO
APENAS OS EMPREGADOS DO DEPARTAMENTO 50.
*/
CREATE OR REPLACE VIEW EMP_50 AS
SELECT EMPLOYEE_ID, UPPER(FIRST_NAME) NOME, UPPER(LAST_NAME) SOBRENOME,
       TO_CHAR(HIRE_DATE, 'DD/MM/YYYY - DAY') ADMISSAO,
       TO_CHAR(SALARY,'fmL999G990D90') SALARIO
  FROM EMPLOYEES       
 WHERE DEPARTMENT_ID = 50;       

SELECT * FROM EMP_50;

/*
2) CRIE UMA VIEW COM O NOME EMP_80 QUE MOSTRE
O ID, NOME, SOBRENOME, EMAIL, ADMISSAO, JOB E
ID DO DEPARTAMENTO. APENAS PARA OS EMPREGADOS
DO DEPARTAMENTO 80.
*/
CREATE OR REPLACE VIEW EMP_80 AS
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, HIRE_DATE,
       JOB_ID, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 80
 WITH CHECK OPTION CONSTRAINT CK_DEPT_80;
 
/*
3) INSIRA UM NOVO EMPREGADO NO DEPARTAMENTO 50
*/

DESC EMP_80;
INSERT INTO EMP_80 VALUES (330, 'MARCO', 'AUR�LIO', 'marelio2',
                           SYSDATE, 'IT_PROG', 50);
COMMIT;

SELECT * FROM EMP_80;




