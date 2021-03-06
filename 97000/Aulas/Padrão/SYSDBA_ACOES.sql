CREATE DIRECTORY DP AS 'C:\TEMP';
GRANT READ, WRITE ON DIRECTORY DP TO ORA1;

CREATE USER IGOR IDENTIFIED BY 12345678;

GRANT CREATE SESSION TO IGOR;

GRANT CREATE TABLE, CREATE SEQUENCE, 
      CREATE VIEW, CREATE SYNONYM TO IGOR;
      
GRANT SELECT ON ORA1.EMPLOYEES TO IGOR;      

GRANT CREATE ANY TABLE TO IGOR;

GRANT SELECT ANY TABLE TO ORA41;

GRANT SELECT ON ORA1.DEPARTMENTS TO IGOR WITH GRANT OPTION;
GRANT SELECT ON ORA1.EMPLOYEES TO IGOR WITH GRANT OPTION;
GRANT CREATE SEQUENCE TO IGOR WITH ADMIN OPTION;

--ROLES
CREATE ROLE RL_ADMIN;

GRANT CREATE TABLE, CREATE SEQUENCE, 
      CREATE VIEW, CREATE SYNONYM TO RL_ADMIN;

GRANT RL_ADMIN TO IGOR;

REVOKE CREATE TABLE, CREATE SEQUENCE, 
      CREATE VIEW, CREATE SYNONYM FROM IGOR;





