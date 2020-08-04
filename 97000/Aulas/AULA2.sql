SELECT '#'||EMPLOYEE_ID AS "#ID",
       FIRST_NAME||' - Cargo: '||JOB_ID||' Dept.: '||DEPARTMENT_ID "Nome",
       COMMISSION_PCT "Comiss�o",
       SALARY "Sal�rio Base",
       SALARY + SALARY * NVL(COMMISSION_PCT,0)
          "Sal. M�s"
  FROM EMPLOYEES;


SELECT FIRST_NAME||q'( - Department's   ID: )'||DEPARTMENT_ID
  FROM EMPLOYEES;
  

SELECT DISTINCT JOB_ID, DEPARTMENT_ID FROM EMPLOYEES;  

SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 60;

SELECT SYSDATE FROM DUAL;

SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME NOT BETWEEN 'B' AND 'K';
 
 SELECT FIRST_NAME, JOB_ID
   FROM EMPLOYEES
  WHERE JOB_ID LIKE '%@_R%' ESCAPE '@';

  
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID, SALARY
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 60
   AND SALARY < 8000;
   
SELECT LAST_NAME, DEPARTMENT_ID, SALARY SAL, JOB_ID, HIRE_DATE
  FROM EMPLOYEES
 WHERE (DEPARTMENT_ID = 60) OR DEPARTMENT_ID = 80 AND SALARY > 10000
 ORDER BY JOB_ID DESC, SAL ASC;
 
 
SELECT SALARY, COMMISSION_PCT
  FROM EMPLOYEES
 ORDER BY COMMISSION_PCT NULLS FIRST;  
 

SELECT EMPLOYEE_ID, FIRST_NAME
  FROM EMPLOYEES
 ORDER BY EMPLOYEE_ID
 FETCH FIRST 5 ROWS ONLY;

SELECT EMPLOYEE_ID, FIRST_NAME
  FROM EMPLOYEES
 ORDER BY EMPLOYEE_ID
 OFFSET 4 ROWS FETCH NEXT 5 ROWS ONLY;
 
SELECT FIRST_NAME, JOB_ID, SALARY
  FROM EMPLOYEES
 WHERE SALARY >= &VALOR_SALARIO
   AND HIRE_DATE >= &DATA_DDMMYYYY
 ORDER BY &ORDENACAO;
 
 SELECT &PROJECAO
   FROM &TABELA
  WHERE &CONDICAO
  ORDER BY &ORDENACAO;
  
  
 SELECT FIRST_NAME, LAST_NAME, JOB_ID, SALARY
   FROM EMPLOYEES
  WHERE FIRST_NAME LIKE '&LETRA%';
  
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, &&OUTRAS_COLUNAS
  FROM EMPLOYEES
 ORDER BY &OUTRAS_COLUNAS;
UNDEFINE OUTRAS_COLUNAS
 
  
  
  
 
 
 
 
 
 
 
 
 
  