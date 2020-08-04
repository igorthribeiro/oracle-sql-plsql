create or replace TRIGGER TR_AUDITORIA BEFORE DDL ON DATABASE
DECLARE
   V_OBJECT_NAME VARCHAR2(30);
   V_SYS_EVENT VARCHAR2(255);
BEGIN
   V_OBJECT_NAME := ORA_DICT_OBJ_NAME;
   --ORA_DICT_OBJ_TYPE => TIPO
   --ORA_DICT_OBJ_OWNER => SCHEMA
   --https://docs.oracle.com/cd/B10501_01/appdev.920/a96590/adg14evt.htm   
   V_SYS_EVENT := ORA_SYSEVENT;

   SP_GRAVA_LOG('O USUÁRIO EXECUTOU '||V_SYS_EVENT||' NO OBJETO '||V_OBJECT_NAME);

   IF (TO_CHAR(SYSDATE,'DY') IN ('SÁB','DOM')) OR
      (TO_CHAR(SYSDATE,'HH24:MI') NOT BETWEEN '08:00' AND '18:00') THEN

      RAISE_APPLICATION_ERROR(-20600, 'Você não pode executar comandos ddl '||
                                      ' fora do horário de expediente!');
   END IF;

END;