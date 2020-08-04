SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.MANAGER_ID, G.LAST_NAME
  FROM EMPLOYEES E LEFT JOIN EMPLOYEES G
       ON E.MANAGER_ID = G.EMPLOYEE_ID;
       
SELECT E.FIRST_NAME, E.SALARY, G.GRADE_LEVEL
  FROM EMPLOYEES E JOIN JOB_GRADES G
       ON E.SALARY BETWEEN G.LOWEST_SAL AND G.HIGHEST_SAL;     
       
SELECT * FROM JOB_GRADES;

SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_ID, D.DEPARTMENT_NAME
  FROM DEPARTMENTS D CROSS JOIN EMPLOYEES E
 WHERE D.DEPARTMENT_ID IN (50, 80, 20);
 
--CAPITULO 8
SELECT EMPLOYEE_ID, LAST_NAME
  FROM EMPLOYEES
 WHERE SALARY > (SELECT SALARY
                   FROM EMPLOYEES
                  WHERE LAST_NAME = 'Mourgos');

SELECT LAST_NAME, JOB_ID, SALARY
  FROM EMPLOYEES
 WHERE JOB_ID = (SELECT JOB_ID
                   FROM EMPLOYEES 
                  WHERE LAST_NAME = 'Taylor') --SA_REP
   AND SALARY > (SELECT SALARY
                   FROM EMPLOYEES
                  WHERE LAST_NAME = 'Taylor'); --8600
 
SELECT EMPLOYEE_ID, LAST_NAME
  FROM EMPLOYEES
 WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEES);
 
 
SELECT DEPARTMENT_ID, AVG(SALARY)
  FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY) > (SELECT AVG(SALARY) FROM EMPLOYEES);  --8775


SELECT EMPLOYEE_ID, LAST_NAME
  FROM EMPLOYEES
 WHERE SALARY = (SELECT MIN(SALARY)
                   FROM EMPLOYEES
                  GROUP BY DEPARTMENT_ID);

 SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID, SALARY
   FROM EMPLOYEES
  WHERE SALARY < ANY (SELECT SALARY
                        FROM EMPLOYEES
                       WHERE JOB_ID = 'IT_PROG') --9000, 6000, 4200
  AND   JOB_ID <> 'IT_PROG';                       
 
 SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID, SALARY
   FROM EMPLOYEES
  WHERE SALARY < ALL (SELECT SALARY
                        FROM EMPLOYEES
                       WHERE JOB_ID = 'IT_PROG') --9000, 6000, 4200
  AND   JOB_ID <> 'IT_PROG'; 
  
  
SELECT EMPLOYEE_ID, LAST_NAME
  FROM EMPLOYEES
 WHERE SALARY = ANY (SELECT MIN(SALARY)
                      FROM EMPLOYEES
                  GROUP BY DEPARTMENT_ID); 
                  
                  
SELECT EMPLOYEE_ID, LAST_NAME
  FROM EMPLOYEES
 WHERE SALARY  <> ALL  (SELECT MIN(SALARY)
                          FROM EMPLOYEES
                    GROUP BY DEPARTMENT_ID); 
                    
                    
SELECT EMPLOYEE_ID, LAST_NAME
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID <> ALL (SELECT MANAGER_ID
                             FROM EMPLOYEES
                            WHERE MANAGER_ID IS NOT NULL);
                    
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE (DEPARTMENT_ID, SALARY) IN (SELECT DEPARTMENT_ID, MIN(SALARY)
                                     FROM EMPLOYEES 
                                 GROUP BY DEPARTMENT_ID); 
                    



--7000,17000,6000,8300,2500,8600,4200,4400                    
                  