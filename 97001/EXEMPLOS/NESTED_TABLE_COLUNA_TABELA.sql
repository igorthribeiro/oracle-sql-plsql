--NESTED TABLEA AS COLUMN DATA TYPE

CREATE TYPE O_FUNCIONARIO_OBJECT AS OBJECT (
   NOME VARCHAR2(40 CHAR),
   DEPARTAMENTO NUMBER(10),
   SALARIO NUMBER(10,2));
   

CREATE TYPE T_FUNCIONARIO_OBJECT IS TABLE OF O_FUNCIONARIO_OBJECT;
   

CREATE SEQUENCE SQ_FUNCIONARIO_OBJ START WITH 1 INCREMENT BY 1;


CREATE TABLE FUNCIONARIOS_OBJ (
    COD_FUNCIONARIO NUMBER(10) DEFAULT SQ_FUNCIONARIO_OBJ.NEXTVAL CONSTRAINT PK_FUNCIONARIO_OBJ PRIMARY KEY,
    FUNCIONARIO T_FUNCIONARIO_OBJECT)
    NESTED TABLE FUNCIONARIO STORE AS FUNC_OBJ_TABLE_DATA;
    
    
INSERT INTO FUNCIONARIOS_OBJ VALUES (
     DEFAULT,--SEQUENCE
     T_FUNCIONARIO_OBJECT(O_FUNCIONARIO_OBJECT('IGOR', 50, 22000)));
     
     
SELECT O.COD_FUNCIONARIO, D.NOME, D.DEPARTAMENTO, D.SALARIO
  FROM FUNCIONARIOS_OBJ O, TABLE(O.FUNCIONARIO) D;
  
/ 
