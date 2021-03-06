SELECT DEPARTMENT_ID, EMPLOYEE_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE ROWNUM < 6
 ORDER BY DEPARTMENT_ID, EMPLOYEE_ID DESC;
 
SELECT DEPARTMENT_ID, EMPLOYEE_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
 ORDER BY DEPARTMENT_ID, EMPLOYEE_ID DESC
 FETCH FIRST 5 ROWS ONLY;
 
SELECT DEPARTMENT_ID, EMPLOYEE_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
 ORDER BY DEPARTMENT_ID, EMPLOYEE_ID DESC
 OFFSET 10 ROWS FETCH FIRST 5 ROWS ONLY; 
 
 SELECT DEPARTMENT_ID, EMPLOYEE_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
 ORDER BY DEPARTMENT_ID
 FETCH FIRST 5 ROWS WITH TIES;
 
 