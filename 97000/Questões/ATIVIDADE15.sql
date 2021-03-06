/*
1) UTILIZANDO A CL�USULA WITH, ENCONTRE A DIFEREN�A
ENTRE A MEDIA DA EMPRESA E O MENOR SALARIOS DE
CADA DEPARTAMENTO. PARA ISSO VOC� IR� PRECISAR
- ENCONTRAR A MEDIA SALARIAL DA EMPRESA
- ENCONTRAR O MENOR SALARIO POR DEPARTAMENTO
- MOSTRAR O CODIGO DO DEPARTAMENTO E A DIFEREN�A
*/
WITH
   AVG_EMP AS (SELECT AVG(SALARY) MEDIA
                 FROM EMPLOYEES),
  MIN_DEPT AS (SELECT DEPARTMENT_ID, MIN(SALARY) MINIMO
                 FROM EMPLOYEES
                GROUP BY DEPARTMENT_ID)
 SELECT DEPARTMENT_ID, MEDIA-MINIMO DIFERENCA
   FROM AVG_EMP, MIN_DEPT;

/*
2) UTILIZANDO A CL�USULA WITH, ENCONTRE OS EMPREGADOS
QUE GANHAM UM SALARIO ACIMA DA M�DIA DO SEU
DEPARTAMENTO.
*/
WITH
   MED_DEPT AS (SELECT DEPARTMENT_ID, AVG(SALARY) M_SAL
                  FROM EMPLOYEES
                 GROUP BY DEPARTMENT_ID)
   SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
     FROM EMPLOYEES E JOIN MED_DEPT M
          ON (E.DEPARTMENT_ID = M.DEPARTMENT_ID)
    WHERE E.SALARY > M.M_SAL;








