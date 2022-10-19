*&---------------------------------------------------------------------*
*& Report  ZTR_AI_TESTES
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT ZTR_AI_TESTES.


DATA: SFLIGHTS TYPE TABLE OF SFLIGHT,
      SFLIGHT  TYPE SFLIGHT,
      CL_TABLE TYPE REF TO CL_SALV_TABLE. "CL_SALV_TABLE classe da SAP que gera um padrão para o relatório

START-OF-SELECTION.
  PERFORM GET_DADOS.
  PERFORM DISPLAY_ALV.

FORM GET_DADOS.
  "Seleciona todas as colunas da tabela sflight para a tabela interna sflights
  SELECT *
  FROM SFLIGHT
  INTO TABLE SFLIGHTS.

*  "Impressão dos dados da tabela
*  LOOP AT SFLIGHTS INTO SFLIGHT.
*    WRITE SFLIGHT-CARRID.
*  ENDLOOP.

ENDFORM.

FORM DISPLAY_ALV.
  CALL METHOD CL_SALV_TABLE=>FACTORY "Método estático.
    EXPORTING
      LIST_DISPLAY = ABAP_TRUE "Exibir em formato de lista
    IMPORTING
      R_SALV_TABLE = CL_TABLE "Importando o objeto para a classe cl_table
    CHANGING
      T_TABLE      = SFLIGHTS.

  PERFORM FEED_FUNCTIONS.

  CALL METHOD CL_TABLE->DISPLAY.
ENDFORM.

FORM FEED_FUNCTIONS.
  DATA: LC_FUNCTIONS TYPE REF TO CL_SALV_FUNCTIONS.

  LC_FUNCTIONS = CL_TABLE->GET_FUNCTIONS( ).
  LC_FUNCTIONS->SET_ALL('X'). "set_all habilita todas as funcionalidades da ALV
  "('x') ou abap_true significam a mesma coisa.
ENDFORM.
