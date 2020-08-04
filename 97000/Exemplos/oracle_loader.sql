create or replace directory oracle_dp as '/home/oracle/oracle_dp';
grant read, write on directory oracle_dp to IGOR;

--DROP TABLE MEMBRO;
CREATE TABLE MEMBRO (
    CPF         VARCHAR2(255),
    NOME        VARCHAR2(255),
    CARGO       VARCHAR2(255),
    CLASSE      VARCHAR2(255),
    DAT_INI     VARCHAR2(255),
    DAT_FIM     VARCHAR2(255),
    VALIDADE    VARCHAR2(255))
ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER DEFAULT
  DIRECTORY oracle_dp ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE
                                  SKIP 1
                                  CHARACTERSET WE8ISO8859P1
                                  FIELDS TERMINATED BY ';' (
                                    CPF         CHAR(255),
                                    NOME        CHAR(255),
                                    CARGO       CHAR(255),
                                    CLASSE      CHAR(255),
                                    DAT_INI     CHAR(255),
                                    DAT_FIM     CHAR(255),
                                    VALIDADE    CHAR(255)))
  LOCATION('membros.csv'));

/

SELECT * FROM MEMBRO;
  