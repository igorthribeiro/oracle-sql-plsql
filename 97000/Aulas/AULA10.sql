CREATE USER IGOR IDENTIFIED BY 12345678;
GRANT CREATE SESSION TO IGOR;
GRANT CREATE TABLE, CREATE SEQUENCE,
      CREATE VIEW, CREATE SYNONYM TO IGOR;
GRANT SELECT
   ON ORA1.EMPLOYEES
   TO IGOR;
   

ALTER USER IGOR
  QUOTA UNLIMITED ON USERS;
  
CREATE ROLE RL_PROGRAMADOR;
GRANT CREATE SESSION, CREATE TABLE,
      CREATE VIEW, CREATE SEQUENCE
   TO RL_PROGRAMADOR;
GRANT RL_PROGRAMADOR TO IGOR;
REVOKE CREATE SESSION, CREATE TABLE,
      CREATE VIEW, CREATE SEQUENCE
 FROM IGOR;

CREATE TABLE SAL_LOW(
   EMP_ID NUMBER(10),
   NAME VARCHAR2(30 CHAR),
   SALARY NUMBER(10,2));

CREATE TABLE SAL_MID(
   EMP_ID NUMBER(10),
   NAME VARCHAR2(30 CHAR),
   SALARY NUMBER(10,2));

CREATE TABLE SAL_HIG(
   EMP_ID NUMBER(10),
   NAME VARCHAR2(30 CHAR),
   SALARY NUMBER(10,2));
   
CREATE TABLE SAL (
   EMPID NUMBER(10),
   HIREDATE DATE,
   SALARY NUMBER(10,2));
   
CREATE TABLE MGR (
   EMPID NUMBER (10),
   MGR NUMBER(10),
   JOBID VARCHAR2(10 CHAR));
   
INSERT ALL
   INTO SAL VALUES(EMPID, HIREDATE, SAL)
   INTO MGR VALUES(EMPID, MGR, JOBID)
   SELECT EMPLOYEE_ID EMPID, HIRE_DATE HIREDATE,
          SALARY SAL, MANAGER_ID MGR, JOB_ID JOBID
     FROM EMPLOYEES;
COMMIT;
SELECT COUNT(*) FROM SAL;   

INSERT FIRST
   WHEN SALARY < 5000 THEN
      INTO SAL_LOW VALUES (EMPLOYEE_ID, FIRST_NAME, SALARY)
   WHEN SALARY < 10000 THEN
      INTO SAL_MID VALUES (EMPLOYEE_ID, FIRST_NAME, SALARY)
   ELSE
      INTO SAL_HIG VALUES (EMPLOYEE_ID, FIRST_NAME, SALARY)
   SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
     FROM EMPLOYEES;

COMMIT;


CREATE TABLE COPY_EMP (
     EMPID         NUMBER(10),
     FIRST_NAME    VARCHAR2(30 CHAR),
     SALARY        NUMBER(10,2),
     DEPARTMENT_ID NUMBER(10));
INSERT INTO COPY_EMP
   SELECT EMPLOYEE_ID, FIRST_NAME, SALARY,
          DEPARTMENT_ID
     FROM EMPLOYEES WHERE DEPARTMENT_ID = 50;          
UPDATE COPY_EMP SET SALARY = 0;
COMMIT; 
SELECT * FROM COPY_EMP;

MERGE INTO COPY_EMP DEST
USING (SELECT * FROM EMPLOYEES
        WHERE DEPARTMENT_ID IN (50,60)) ORIG
ON (DEST.EMPID = ORIG.EMPLOYEE_ID)
WHEN MATCHED THEN
  UPDATE SET DEST.SALARY = ORIG.SALARY
WHEN NOT MATCHED THEN
  INSERT VALUES (ORIG.EMPLOYEE_ID, ORIG.FIRST_NAME,
                 ORIG.SALARY, ORIG.DEPARTMENT_ID);
COMMIT;
SELECT * FROM COPY_EMP;

SELECT EMPLOYEE_ID, FIRST_NAME,
       HIRE_DATE,
       HIRE_DATE + TO_YMINTERVAL('01-02') FERIAS
  FROM EMPLOYEES;

SELECT TO_CHAR(
       SYSDATE + TO_DSINTERVAL('3 12:30:30')
       ,'DD/MM/YYYY HH24:MI:SS') FROM DUAL;
       
SELECT EXTRACT(YEAR FROM SYSDATE) ANO FROM DUAL;       
SELECT EXTRACT(MONTH FROM SYSDATE) MES FROM DUAL;       
SELECT EXTRACT(DAY FROM SYSDATE) DIA FROM DUAL;       
SELECT EXTRACT(HOUR FROM CURRENT_TIMESTAMP)
       HORA FROM DUAL;       
SELECT EXTRACT(MINUTE FROM CURRENT_TIMESTAMP)
       MINUTO FROM DUAL;       
SELECT EXTRACT(MONTH FROM HIRE_DATE) FROM EMPLOYEES;       













   
   
   
   
   
   
















   
   