SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE (DEPARTMENT_ID, SALARY)
              IN (SELECT DEPARTMENT_ID, MIN(SALARY)
                    FROM EMPLOYEES
                   GROUP BY DEPARTMENT_ID);
                   
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, DEPARTMENT_ID
  FROM EMPLOYEES EMPFORA
 WHERE SALARY
             = (SELECT MIN(SALARY)
                   FROM EMPLOYEES EMPDENTRO
                  WHERE EMPDENTRO.DEPARTMENT_ID =
                        EMPFORA.DEPARTMENT_ID);    
                        
SELECT EMPLOYEE_ID, FIRST_NAME
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID != ALL (
                      SELECT DISTINCT MANAGER_ID
                        FROM EMPLOYEES
                       WHERE MANAGER_ID IS NOT NULL);                        
                        
                   
SELECT EMPLOYEE_ID, FIRST_NAME
  FROM EMPLOYEES EMPF
 WHERE NOT EXISTS (SELECT NULL
                 FROM EMPLOYEES EMPD
                WHERE EMPF.EMPLOYEE_ID = EMPD.MANAGER_ID);                        
                   


                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   