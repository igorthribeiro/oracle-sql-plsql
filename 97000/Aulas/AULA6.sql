DESC EMPLOYEES;
INSERT INTO EMPLOYEES (EMPLOYEE_ID, LAST_NAME, EMAIL, JOB_ID,
                       SALARY, HIRE_DATE, DEPARTMENT_ID)
       VALUES (&ID, '&SOBRENOME','&EMAIL','&JOB_ID',
               &SALARY, CURRENT_DATE, &DEPARTMENT_ID);
               
SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID = 160;

CREATE TABLE EMP_TEMP (
    EMP_ID NUMBER(10) PRIMARY KEY,
    EMP_NAME VARCHAR2(50 CHAR) NOT NULL,
    EMP_SAL NUMBER(8,2) NOT NULL);
    
DESC EMP_TEMP;   

INSERT INTO EMP_TEMP(EMP_ID, EMP_NAME, EMP_SAL)
  SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
    FROM EMPLOYEES
   WHERE DEPARTMENT_ID IN (50,60);
   
SELECT * FROM EMP_TEMP;   

COMMIT;

SELECT * FROM EMP_TEMP WHERE EMP_ID BETWEEN 141 AND 144;
UPDATE EMP_TEMP
   SET EMP_SAL = EMP_SAL * 1.15
 WHERE EMP_ID BETWEEN 141 AND 144;
 
 SELECT * FROM EMP_TEMP FOR UPDATE;
 SELECT * FROM DEPARTMENTS FOR UPDATE;
 




   




               
    