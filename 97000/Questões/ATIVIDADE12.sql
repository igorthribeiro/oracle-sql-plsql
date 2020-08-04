/*
1) EXECUTE A SEGUINTE QUERY PARA ANALIZAR O
COMPORTAMENTO DE ALGUMAS CONSTRAINTS:
*/
SELECT CONSTRAINT_NAME, SEARCH_CONDITION, STATUS,
       DEFERRABLE, DEFERRED
  FROM USER_CONSTRAINTS
 WHERE TABLE_NAME = 'ALUNO';
 
/*
2) MODIFIQUE O COMPORTAMENTO DA CK_MAIOR PARA DEFFERED
*/
ALTER TABLE ALUNO DROP CONSTRAINT CK_MAIOR;
ALTER TABLE ALUNO ADD
    CONSTRAINT CK_MAIOR CHECK(NUM_IDADE >= 18)
    DEFERRABLE INITIALLY DEFERRED;
    
INSERT INTO ALUNO VALUES (DEFAULT, 'MA777FF', 'LUIZ RANIELLE',
                          SYSDATE, DEFAULT, 17, 'luiz@gmail.com',97000);
COMMIT;                          
SELECT * FROM ALUNO;                          

SET CONSTRAINT CK_MAIOR IMMEDIATE; --SET CONSTRAINT ALL IMMEDIATE;



 