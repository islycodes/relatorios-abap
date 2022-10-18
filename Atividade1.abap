*&---------------------------------------------------------------------*
*& Report  ZTR_AI_001
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT ZTR_AI_001.

**********************************************************************
*Criando uma estrutura para armazenar os dados

**********************************************************************
TYPES: BEGIN OF TY_PESSOA,
      NOME TYPE STRING,
      IDADE TYPE I,
      CIDADE_NATAL TYPE STRING,
      HOBBY TYPE STRING,
  END OF TY_PESSOA.


"Criação da tabela interna e preenchimento das tuplas
 DATA:PESSOAS TYPE TABLE OF TY_PESSOA,
      PESSOA TYPE TY_PESSOA. "linha da tabela ou Workara

*Adiciona 7 linhas de dados
DO 7 TIMES.
  PESSOA-NOME = 'ADRIELLY'.
  PESSOA-IDADE = 23.
  PESSOA-CIDADE_NATAL = 'RECIFE - PE'.
  PESSOA-HOBBY = 'DORMIR'.
  APPEND PESSOA TO PESSOAS.
ENDDO.

*Exibe os dados
LOOP AT PESSOAS INTO PESSOA.
  "Entra 'n' vezes, onde n é o número de linhas.
  "A cada iteração pedido será uma nova linha da tabela
  WRITE: 'NOME: ', PESSOA-NOME, 'IDADE: ', PESSOA-IDADE, 'CIDADE NATAL: ', PESSOA-CIDADE_NATAL, 'HOBBY: ', PESSOA-HOBBY.
  ULINE.
ENDLOOP.
