SELECT NN_NOTA1, NN_NOTA2, NN_NOTA3, NN_NOTA4 
  FROM NOTAS NEX
 WHERE CD_NOTA = (SELECT MAX(CD_NOTA)
                    FROM NOTAS NIN
                   WHERE NIN.CD_ALUNO = NEX.CD_ALUNO)
   AND CD_ALUNO = 9;
/   
SELECT PKG_TREINAMENTO.FC_CALCULA_MEDIA(9) FROM DUAL;   
/
DESC PKG_TREINAMENTO;
/
UPDATE NOTAS SET
   NN_MEDIA = PKG_TREINAMENTO.FC_CALCULA_MEDIA(CD_ALUNO);
/
DESC STANDARD








