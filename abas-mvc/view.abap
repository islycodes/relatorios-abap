*&---------------------------------------------------------------------*
*&  Include           ZTR_AI_TESTES_VIEW
*&---------------------------------------------------------------------*

CLASS REPORT_VIEW DEFINITION.

  PUBLIC SECTION.

    DATA: SALV_ALV TYPE REF TO CL_SALV_TABLE.

    METHODS: INITIALIZATION,
      SELECTION_SCREEN_O,
      SELECTION_SCREEN IMPORTING MODEL TYPE REF TO REPORT_MODEL,
      END_OF_SELECTION IMPORTING MODEL TYPE REF TO REPORT_MODEL, "Dessa forma o endofselection consegue receber um modelo por parametro.
      DISPLAY_ALV IMPORTING MODEL TYPE REF TO REPORT_MODEL,
      SET_TOOLBAR,
      SET_FIELDCATALOG,
      SET_TEXT IMPORTING
                 NAME    TYPE LVC_FNAME
                 SHORT   TYPE SCRTEXT_S
                 LONG    TYPE SCRTEXT_L
                 COLUMNS TYPE REF TO CL_SALV_COLUMNS_TABLE.

ENDCLASS.

CLASS REPORT_VIEW IMPLEMENTATION.
  "Qualquer validação a ser feita na inicialização do programa deve ser feita aqui.
  "Validações de usuários, permissões..
  METHOD INITIALIZATION.
    FILTRO = '@4G@ Filtros'.
    MODIFY = '@17@ Criação/Modificação'.
    MOD_BTN = '@2L@ Salvar'.
  ENDMETHOD.

  METHOD SELECTION_SCREEN_O.

  ENDMETHOD.

  METHOD SELECTION_SCREEN.
    "Evento para modificação/inserção de dados na tabela.
    CASE SY-UCOMM.
    WHEN 'MODIFY'.

    MODEL->INIT_MODIFY_PED( ).

    WHEN OTHERS.
   ENDCASE.

  ENDMETHOD.

  METHOD END_OF_SELECTION.
    ME->DISPLAY_ALV( MODEL ).
  ENDMETHOD.

  METHOD DISPLAY_ALV.

    CL_SALV_TABLE=>FACTORY(

      IMPORTING R_SALV_TABLE = SALV_ALV
      CHANGING T_TABLE      = MODEL->T_CAB_PEDIDO
    ).

    "Chamada das funções
    ME->SET_TOOLBAR( ).

    ME->SET_FIELDCATALOG( ).

    SALV_ALV->DISPLAY( ).

  ENDMETHOD.

  METHOD SET_TOOLBAR.

    "Adiciona opções de filtro
    DATA: FUNCTIONS TYPE REF TO CL_SALV_FUNCTIONS_LIST.
    FUNCTIONS = SALV_ALV->GET_FUNCTIONS( ).
    FUNCTIONS->SET_ALL( ).

  ENDMETHOD.

  "Metodo para esconder alguma coluna na exibição
  METHOD SET_FIELDCATALOG.

    DATA: COLUMNS TYPE REF TO CL_SALV_COLUMNS_TABLE, "Essa classe do SAP é responsável por receber todos os parametros de coluna do ALV.
          COLUMN  TYPE REF TO CL_SALV_COLUMN.

    COLUMNS = SALV_ALV->GET_COLUMNS( ). "Manipula todas as colunas

    COLUMNS->SET_OPTIMIZE( ABAP_TRUE ). "Alinha a coluna automaticamente

    COLUMN = COLUMNS->GET_COLUMN( 'MANDT' )."Manipula uma coluna especifica
    COLUMN->SET_VISIBLE( ABAP_FALSE ). "Esconde a coluna mandt

    ME->SET_TEXT( EXPORTING NAME = 'NUMERO_PEDIDO'
                          SHORT = 'Nº Pedido'
                          LONG = 'Número Pedido'
                          COLUMNS = COLUMNS ).

*--------------------------------------------------------------------*
**Exibe ao por o mouse em cima
*    COLUMN = COLUMNS->GET_COLUMN( 'NUMERO PEDIDO' ).
*    COLUMN->SET_SHORT_TEXT( 'Nº' ).
*
*    COLUMN = COLUMNS->GET_COLUMN( 'NUMERO PEDIDO' ).
*    COLUMN->SET_LONG_TEXT( 'Numero Pedido' ).
*
*    COLUMN = COLUMNS->GET_COLUMN( 'DATA PEDIDO' ).
*    COLUMN->SET_SHORT_TEXT( 'D Pedido' ).
*
*    COLUMN = COLUMNS->GET_COLUMN( 'NUMERO PEDIDO' ).
*    COLUMN->SET_LONG_TEXT( 'Data Pedido' ).

  ENDMETHOD.


  METHOD SET_TEXT.

    DATA: COLUMN  TYPE REF TO CL_SALV_COLUMN.

    COLUMN = COLUMNS->GET_COLUMN( NAME ).
    COLUMN->SET_SHORT_TEXT( SHORT ).
    COLUMN->SET_LONG_TEXT( LONG ).

  ENDMETHOD.

ENDCLASS.
