/*
1) CRIE A SEGUINTE TABELA:

   CREATE TABLE DEPT_STAT (
        DEPARTMENT_ID NUMBER(10),
		MIN_SALARY    NUMBER(10,2),
		MAX_SALARY    NUMBER(10,2));
*/        
		
   CREATE TABLE DEPT_STAT (
        DEPARTMENT_ID NUMBER(10),
		MIN_SALARY    NUMBER(10,2),
		MAX_SALARY    NUMBER(10,2));


/*
2) INSIRA NA TABELA TODOS OS DEPARTAMENTOS:

   INSERT INTO DEPT_SAL(DEPARTMENT_ID)
     SELECT DISTINCT DEPARTMENT_ID
       FROM EMPLOYEES;
*/       
   INSERT INTO DEPT_STAT(DEPARTMENT_ID)
          SELECT DISTINCT DEPARTMENT_ID
            FROM EMPLOYEES
          WHERE DEPARTMENT_ID IS NOT NULL;
   SELECT * FROM  DEPT_STAT;
   TRUNCATE TABLE DEPT_STAT;

/*
3) ATUALIZE A TABELA DEPT_STAT PARA INCLUINDO
   O MAIOR E MENOR SALARIO POR DEPARTAMENTO.	   
*/   
   
UPDATE DEPT_STAT DS SET
       MIN_SALARY = (SELECT MIN(SALARY)
                       FROM EMPLOYEES
                      WHERE DEPARTMENT_ID = DS.DEPARTMENT_ID),
       MAX_SALARY = (SELECT MAX(SALARY)
                       FROM EMPLOYEES
                      WHERE DEPARTMENT_ID = DS.DEPARTMENT_ID);
   
   
   
   
   
   