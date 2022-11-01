*&---------------------------------------------------------------------*
*&  VIEW
*&---------------------------------------------------------------------*

CLASS YAI_VIEW DEFINITION.

  PUBLIC SECTION.

    DATA:SALV_ALV TYPE REF TO CL_SALV_TABLE,
         COLUMNS  TYPE REF TO CL_SALV_COLUMNS_TABLE,
         COLUMN   TYPE REF TO CL_SALV_COLUMN_TABLE.


    METHODS: INITIALIZATION,
      SELECTION_SCREEN_0,
      SELECTION_SCREEN,
      END_OF_SELECTION,
      MONTA_RELATORIO,
      MONTA_FIELDCAT,
      PREENCHE_FIELDCAT IMPORTING
                          P_FIELDNAME    TYPE LVC_FNAME
                          P_REPTEXT_DDIC TYPE REPTEXT
                          P_NO_ZERO      TYPE LVC_NOZERO
                          P_NO_OUT       TYPE LVC_NOOUT
                          P_EDIT         TYPE LVC_EDIT
                          P_CHECKBOX     TYPE LVC_CHECKB
                          P_HOTSPOT      TYPE LVC_HOTSPT
                          P_DATATYPE     TYPE DATATYPE_D
                          P_INTTYPE      TYPE INTTYPE
                          P_INTLEN       TYPE INTLEN
                          P_DO_SUM       TYPE LVC_DOSUM
                          COLUMNS        TYPE REF TO CL_SALV_COLUMNS_TABLE,
      CARREGA_LAYOUT,
      CARREGA_PRINT,
      EXIBE_ALV,
      SET_TOOLBAR.

ENDCLASS.


CLASS YAI_VIEW IMPLEMENTATION.

  METHOD INITIALIZATION.

  ENDMETHOD.

  METHOD SELECTION_SCREEN_0.

  ENDMETHOD.

  METHOD SELECTION_SCREEN.

  ENDMETHOD.

  METHOD END_OF_SELECTION.
    ME->MONTA_RELATORIO( ).
  ENDMETHOD.

  METHOD MONTA_RELATORIO.

    CL_SALV_TABLE=>FACTORY(
      IMPORTING R_SALV_TABLE = SALV_ALV
      CHANGING  T_TABLE      = TI_SAIDA
    ).

    ME->MONTA_FIELDCAT( ).
    ME->CARREGA_LAYOUT( ).
    ME->CARREGA_PRINT( ).
    ME->EXIBE_ALV( ).

  ENDMETHOD.

  METHOD MONTA_FIELDCAT.

    COLUMNS = SALV_ALV->GET_COLUMNS( ).

    COLUMNS->SET_OPTIMIZE( ABAP_TRUE ).

    ME->PREENCHE_FIELDCAT(
    EXPORTING
    P_FIELDNAME    = 'CAJO_NUMBER'
    P_REPTEXT_DDIC = TEXT-019
    P_NO_ZERO      = ' '
    P_NO_OUT       = ' '
    P_EDIT         = ' '
    P_CHECKBOX     = ' '
    P_HOTSPOT      = ' '
    P_DATATYPE     = 'CHAR'
    P_INTTYPE      = 'C'
    P_INTLEN       = '04'
    P_DO_SUM       = ' '
    COLUMNS        = COLUMNS ).

    ME->PREENCHE_FIELDCAT(
    EXPORTING
    P_FIELDNAME    = 'CAJO_NAME'
    P_REPTEXT_DDIC = TEXT-016
    P_NO_ZERO      = ' '
    P_NO_OUT       = ' '
    P_EDIT         = ' '
    P_CHECKBOX     = ' '
    P_HOTSPOT      = ' '
    P_DATATYPE     = 'CHAR'
    P_INTTYPE      = 'C'
    P_INTLEN       = '10'
    P_DO_SUM       = ' '
    COLUMNS        = COLUMNS ).

    ME->PREENCHE_FIELDCAT(
    EXPORTING
    P_FIELDNAME    = 'KUNNR'
    P_REPTEXT_DDIC = TEXT-014
    P_NO_ZERO      = ' '
    P_NO_OUT       = ' '
    P_EDIT         = ' '
    P_CHECKBOX     = ' '
    P_HOTSPOT      = ' '
    P_DATATYPE     = 'CHAR'
    P_INTTYPE      = 'C'
    P_INTLEN       = '10'
    P_DO_SUM       = ' '
    COLUMNS        = COLUMNS ).

    ME->PREENCHE_FIELDCAT(
    EXPORTING
    P_FIELDNAME    = 'NAME1'
    P_REPTEXT_DDIC = TEXT-013
    P_NO_ZERO      = ' '
    P_NO_OUT       = ' '
    P_EDIT         = ' '
    P_CHECKBOX     = ' '
    P_HOTSPOT      = ' '
    P_DATATYPE     = 'CHAR'
    P_INTTYPE      = 'C'
    P_INTLEN       = '35'
    P_DO_SUM       = ' '
    COLUMNS        = COLUMNS ).

    ME->PREENCHE_FIELDCAT(
    EXPORTING
    P_FIELDNAME    = 'CHECK_NUMBER'
    P_REPTEXT_DDIC = TEXT-015
    P_NO_ZERO      = ' '
    P_NO_OUT       = ' '
    P_EDIT         = ' '
    P_CHECKBOX     = ' '
    P_HOTSPOT      = ' '
    P_DATATYPE     = 'NUMC'
    P_INTTYPE      = 'N'
    P_INTLEN       = '13'
    P_DO_SUM       = ' '
    COLUMNS        = COLUMNS ).

    ME->PREENCHE_FIELDCAT(
    EXPORTING
    P_FIELDNAME    = 'CHECK_ISSUER'
    P_REPTEXT_DDIC = TEXT-004
    P_NO_ZERO      = ' '
    P_NO_OUT       = ' '
    P_EDIT         = ' '
    P_CHECKBOX     = ' '
    P_HOTSPOT      = ' '
    P_DATATYPE     = 'CHAR'
    P_INTTYPE      = 'C'
    P_INTLEN       = '14'
    P_DO_SUM       = ' '
    COLUMNS        = COLUMNS ).

    ME->PREENCHE_FIELDCAT(
    EXPORTING
    P_FIELDNAME    = 'BANK_KEY'
    P_REPTEXT_DDIC = TEXT-005
    P_NO_ZERO      = ' '
    P_NO_OUT       = ' '
    P_EDIT         = ' '
    P_CHECKBOX     = ' '
    P_HOTSPOT      = ' '
    P_DATATYPE     = 'CHAR'
    P_INTTYPE      = 'C'
    P_INTLEN       = '15'
    P_DO_SUM       = ' '
    COLUMNS        = COLUMNS ).

    ME->PREENCHE_FIELDCAT(
    EXPORTING
    P_FIELDNAME    = 'BANK_ACCT'
    P_REPTEXT_DDIC = TEXT-012
    P_NO_ZERO      = ' '
    P_NO_OUT       = ' '
    P_EDIT         = ' '
    P_CHECKBOX     = ' '
    P_HOTSPOT      = ' '
    P_DATATYPE     = 'CHAR'
    P_INTTYPE      = 'C'
    P_INTLEN       = '18'
    P_DO_SUM       = ' '
    COLUMNS        = COLUMNS ).


    ME->PREENCHE_FIELDCAT(
    EXPORTING
    P_FIELDNAME    = 'POSITION_TEXT'
    P_REPTEXT_DDIC = 'TEXT-018'
    P_NO_ZERO      = ' '
    P_NO_OUT       = ' '
    P_EDIT         = ' '
    P_CHECKBOX     = ' '
    P_HOTSPOT      = ' '
    P_DATATYPE     = 'CHAR'
    P_INTTYPE      = 'C'
    P_INTLEN       = '50'
    P_DO_SUM       = ' '
    COLUMNS        = COLUMNS ).

    ME->PREENCHE_FIELDCAT(
    EXPORTING
    P_FIELDNAME    = 'DOCUMENT_DATE'
    P_REPTEXT_DDIC = TEXT-004
    P_NO_ZERO      = ' '
    P_NO_OUT       = ' '
    P_EDIT         = ' '
    P_CHECKBOX     = ' '
    P_HOTSPOT      = ' '
    P_DATATYPE     = 'DATS'
    P_INTTYPE      = 'D'
    P_INTLEN       = '08'
    P_DO_SUM       = ' '
    COLUMNS        = COLUMNS ).

    ME->PREENCHE_FIELDCAT(
    EXPORTING
    P_FIELDNAME    = 'POSTING_DATE'
    P_REPTEXT_DDIC = TEXT-007
    P_NO_ZERO      = ' '
    P_NO_OUT       = ' '
    P_EDIT         = 'X'
    P_CHECKBOX     = ' '
    P_HOTSPOT      = ' '
    P_DATATYPE     = 'DATS'
    P_INTTYPE      = 'D'
    P_INTLEN       = '08'
    P_DO_SUM       = ' '
    COLUMNS        = COLUMNS ).

    ME->PREENCHE_FIELDCAT(
    EXPORTING
    P_FIELDNAME    = 'BZDAT'
    P_REPTEXT_DDIC = TEXT-017
    P_NO_ZERO      = ' '
    P_NO_OUT       = ' '
    P_EDIT         = 'X'
    P_CHECKBOX     = ' '
    P_HOTSPOT      = ' '
    P_DATATYPE     = 'DATS'
    P_INTTYPE      = 'D'
    P_INTLEN       = '08'
    P_DO_SUM       = ' '
    COLUMNS        = COLUMNS ).

    ME->PREENCHE_FIELDCAT(
    EXPORTING
    P_FIELDNAME    = 'CJAMOUNT'
    P_REPTEXT_DDIC = TEXT-008
    P_NO_ZERO      = ' '
    P_NO_OUT       = ' '
    P_EDIT         = ' '
    P_CHECKBOX     = ' '
    P_HOTSPOT      = ' '
    P_DATATYPE     = 'CURR'
    P_INTTYPE      = 'I'
    P_INTLEN       = '13'
    P_DO_SUM       = 'X'
    COLUMNS        = COLUMNS ).

    ME->PREENCHE_FIELDCAT(
    EXPORTING
    P_FIELDNAME    = 'DOCUMENT_NUMBER'
    P_REPTEXT_DDIC = TEXT-009
    P_NO_ZERO      = ' '
    P_NO_OUT       = ' '
    P_EDIT         = ' '
    P_CHECKBOX     = ' '
    P_HOTSPOT      = ' '
    P_DATATYPE     = 'CHAR'
    P_INTTYPE      = 'C'
    P_INTLEN       = '16'
    P_DO_SUM       = ' '
    COLUMNS        = COLUMNS ).

    ME->PREENCHE_FIELDCAT(
    EXPORTING
    P_FIELDNAME    = 'ALLOC_NMBR'
    P_REPTEXT_DDIC = TEXT-010
    P_NO_ZERO      = ' '
    P_NO_OUT       = ' '
    P_EDIT         = ' '
    P_CHECKBOX     = ' '
    P_HOTSPOT      = ' '
    P_DATATYPE     = 'CHAR'
    P_INTTYPE      = 'C'
    P_INTLEN       = '18'
    P_DO_SUM       = ' '
    COLUMNS        = COLUMNS ).

    ME->PREENCHE_FIELDCAT(
    EXPORTING
    P_FIELDNAME    = 'CONTA_DEB'
    P_REPTEXT_DDIC = TEXT-021
    P_NO_ZERO      = ' '
    P_NO_OUT       = ' '
    P_EDIT         = 'X'
    P_CHECKBOX     = ' '
    P_HOTSPOT      = ' '
    P_DATATYPE     = 'NUMC'
    P_INTTYPE      = 'N'
    P_INTLEN       = '13'
    P_DO_SUM       = ' '
    COLUMNS        = COLUMNS ).

    ME->PREENCHE_FIELDCAT(
    EXPORTING
    P_FIELDNAME    = 'CONTA_CRE'
    P_REPTEXT_DDIC = TEXT-020
    P_NO_ZERO      = ' '
    P_NO_OUT       = ' '
    P_EDIT         = 'X'
    P_CHECKBOX     = ' '
    P_HOTSPOT      = ' '
    P_DATATYPE     = 'NUMC'
    P_INTTYPE      = 'N'
    P_INTLEN       = '13'
    P_DO_SUM       = ' '
    COLUMNS        = COLUMNS ).

    ME->PREENCHE_FIELDCAT(
    EXPORTING
    P_FIELDNAME    = 'STATUS_FB50'
    P_REPTEXT_DDIC = TEXT-022
    P_NO_ZERO      = ' '
    P_NO_OUT       = ' '
    P_EDIT         = ' '
    P_CHECKBOX     = ' '
    P_HOTSPOT      = ' '
    P_DATATYPE     = 'CHAR'
    P_INTTYPE      = 'C'
    P_INTLEN       = '05'
    P_DO_SUM       = ' '
    COLUMNS        = COLUMNS ).


    ME->PREENCHE_FIELDCAT(
    EXPORTING
    P_FIELDNAME    = 'N_DOC_CRIADO'
    P_REPTEXT_DDIC = TEXT-023
    P_NO_ZERO      = ' '
    P_NO_OUT       = ' '
    P_EDIT         = ' '
    P_CHECKBOX     = ' '
    P_HOTSPOT      = ' '
    P_DATATYPE     = 'CHAR'
    P_INTTYPE      = 'C'
    P_INTLEN       = '10'
    P_DO_SUM       = ' '
    COLUMNS        = COLUMNS ).

  ENDMETHOD.

  METHOD PREENCHE_FIELDCAT.

*    COLUMN = COLUMNS->GET_COLUMN( P_FIELDNAME ).

    CLEAR W_FIELDCAT.

    W_FIELDCAT-FIELDNAME     = P_FIELDNAME.
    W_FIELDCAT-TABNAME       = 'TI_SAIDA'.
    W_FIELDCAT-REPTEXT_DDIC  = P_REPTEXT_DDIC.

    CASE W_FIELDCAT-FIELDNAME.
      WHEN 'CAJO_NUMBER' OR 'CAJO_NAME' OR 'KUNNR'.
        W_FIELDCAT-FIX_COLUMN    = C_X.
    ENDCASE.

    W_FIELDCAT-NO_ZERO       = P_NO_ZERO.
    W_FIELDCAT-NO_OUT        = P_NO_OUT.
    W_FIELDCAT-EDIT          = P_EDIT.
    W_FIELDCAT-CHECKBOX      = P_CHECKBOX.
    W_FIELDCAT-HOTSPOT       = P_HOTSPOT.
    W_FIELDCAT-DATATYPE      = P_DATATYPE.
    W_FIELDCAT-INTTYPE       = P_INTTYPE.
    W_FIELDCAT-INTLEN        = P_INTLEN.
    W_FIELDCAT-DO_SUM        = P_DO_SUM.

    APPEND W_FIELDCAT TO T_FIELDCAT.
  ENDMETHOD.

  METHOD CARREGA_LAYOUT.
    CLEAR: W_LAYOUT.
    W_LAYOUT-BOX_FIELDNAME = 'CHECKBOX'.
    W_LAYOUT-GROUP_CHANGE_EDIT = C_X.
    W_LAYOUT-ZEBRA             = C_X.
    W_LAYOUT-COLWIDTH_OPTIMIZE = C_X.

  ENDMETHOD.

  METHOD CARREGA_PRINT.
    CLEAR: W_PRINT.
    W_PRINT-NO_PRINT_SELINFOS  = C_X.   " Não listar info. sobre seleção
    W_PRINT-NO_COVERPAGE       = C_X.   " Não listar página de rosto
    W_PRINT-NO_PRINT_LISTINFOS = C_X.   " Não listar info. sobre a lista
  ENDMETHOD.

  METHOD SET_TOOLBAR.
    DATA: FUNCTIONS     TYPE REF TO CL_SALV_FUNCTIONS_LIST.
    DATA: SELECTIONS    TYPE REF TO CL_SALV_SELECTIONS.

    FUNCTIONS = SALV_ALV->GET_FUNCTIONS( ).
    FUNCTIONS->SET_ALL( ).

    "Adiciona opção para selecionar todas as linhas
    SELECTIONS = SALV_ALV->GET_SELECTIONS( ).
    SELECTIONS->SET_SELECTION_MODE( IF_SALV_C_SELECTION_MODE=>ROW_COLUMN ).
  ENDMETHOD.

  METHOD EXIBE_ALV.


    IF SY-SUBRC <> 0.
      MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
      WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.

    ME->SET_TOOLBAR( ).
    SALV_ALV->DISPLAY( ).

  ENDMETHOD.

ENDCLASS.
