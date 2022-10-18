*&---------------------------------------------------------------------*
*& Report  ZAI_EXEMPLOVENDAS_PRINCIPAL
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT ZAI_EXEMPLOVENDAS_PRINCIPAL.

*DATA: NUM_PEDIDO TYPE I,
*      VALOR_PEDIDO TYPE P DECIMALS 2,
*      DATA_CRIACAO TYPE SY-DATUM. "Data_criação é do tipo data do sistema
*
*NUM_PEDIDO = 1.
*VALOR_PEDIDO = 10.
*DATA_CRIACAO = '20221018'. "Formato YYYY.MM.DD
*
*WRITE: NUM_PEDIDO, VALOR_PEDIDO, DATA_CRIACAO.

**********************************************************************
*Criando uma estrutura para armazenar os pedidos
**********************************************************************
TYPES: BEGIN OF TY_PEDIDO,
      NUM_PEDIDO TYPE I,
      VALOR_PEDIDO TYPE P DECIMALS 2,
      DATA_CRIACAO TYPE SY-DATUM, "Data_criação é do tipo data do sistema
  END OF TY_PEDIDO.


"Criação da tabela interna e preenchimento das tuplas
 DATA:PEDIDOS TYPE TABLE OF TY_PEDIDO, "Cada atributo do tipo pedido é uma coluna na tabela
      PEDIDO TYPE TY_PEDIDO. "linha da tabela ou Workara


*LINHA 1
PEDIDO-NUM_PEDIDO = 1.
PEDIDO-VALOR_PEDIDO = 10.
PEDIDO-DATA_CRIACAO = '20221018'.
APPEND PEDIDO TO PEDIDOS. "Adiciona a linha a tabela.

*LINHA 2
PEDIDO-NUM_PEDIDO = 2.
PEDIDO-VALOR_PEDIDO = 15.
PEDIDO-DATA_CRIACAO = '20221018'.
APPEND PEDIDO TO PEDIDOS. "Adiciona a linha a tabela.


*WRITE: 'Numero do pedido: ', PEDIDO-NUM_PEDIDO, 'Valor do pedido: ', PEDIDO-VALOR_PEDIDO, 'Data de Criação: ', PEDIDO-DATA_CRIACAO.

*Adicionar quantidade especifica de linhas:
DO 10 TIMES.
  PEDIDO-NUM_PEDIDO = 1.
  PEDIDO-VALOR_PEDIDO = 15.
  PEDIDO-DATA_CRIACAO = '20221018'.
  APPEND PEDIDO TO PEDIDOS.
ENDDO.


"Escrever todas as linhas com loop:
LOOP AT PEDIDOS INTO PEDIDO.
  "Entra 'n' vezes, onde n é o número de linhas.
  "A cada iteração pedido será uma nova linha da tabela
  WRITE:PEDIDO-NUM_PEDIDO, PEDIDO-VALOR_PEDIDO, PEDIDO-DATA_CRIACAO.
  ULINE.
ENDLOOP.
