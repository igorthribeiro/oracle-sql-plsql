UPDATE NOTAS SET
   NN_MEDIA = PKG_TREINAMENTO.FC_CALCULA_MEDIA(NN_NOTA1, NN_NOTA2, NN_NOTA3, NN_NOTA4);
   
SELECT * FROM ALUNO NATURAL JOIN NOTAS ORDER BY 1;