*&---------------------------------------------------------------------*
*&  Telas do programa
*&---------------------------------------------------------------------*

CLASS REPORT_VIEW DEFINITION.

  PUBLIC SECTION.

    DATA:SALV_ALV      TYPE REF TO CL_SALV_TABLE.

    METHODS: INITIALIZATION,
      SELECTION_SCREEN_0,
      SELECTION_SCREEN,
      END_OF_SELECTION,
      EXIBE_ALV,
      EXIBE_ALV_POP,
      SET_TOOLBAR,
      SET_EVENTS,
      ON_DOUBLE_CLICK FOR EVENT DOUBLE_CLICK OF CL_SALV_EVENTS_TABLE IMPORTING ROW COLUMN.


ENDCLASS.


CLASS REPORT_VIEW IMPLEMENTATION.

  METHOD INITIALIZATION.

  ENDMETHOD.

  METHOD SELECTION_SCREEN_0.

  ENDMETHOD.

  METHOD SELECTION_SCREEN.

  ENDMETHOD.

  METHOD END_OF_SELECTION.
    ME->EXIBE_ALV( ).
  ENDMETHOD.

  METHOD SET_TOOLBAR.
    DATA: FUNCTIONS     TYPE REF TO CL_SALV_FUNCTIONS_LIST.

    FUNCTIONS = SALV_ALV->GET_FUNCTIONS( ).
    FUNCTIONS->SET_ALL( ).
  ENDMETHOD.

  METHOD SET_EVENTS.

    DATA(EVENTS) = SALV_ALV->GET_EVENT( ).
    SET HANDLER ME->ON_DOUBLE_CLICK FOR EVENTS.

  ENDMETHOD.

*--------------------------------------------------------------------*
**Método que exibe a tabela do relatório.
*--------------------------------------------------------------------*

  METHOD EXIBE_ALV.
    CL_SALV_TABLE=>FACTORY(
      IMPORTING R_SALV_TABLE = SALV_ALV
      CHANGING  T_TABLE      = TABLE
    ).

    ME->SET_TOOLBAR( ).
    ME->SET_EVENTS( ).

    SALV_ALV->DISPLAY( ).
  ENDMETHOD.

  METHOD EXIBE_ALV_POP.
    CL_SALV_TABLE=>FACTORY(
      IMPORTING R_SALV_TABLE = SALV_ALV
      CHANGING  T_TABLE      = TABLE_POP
    ).

    ME->SET_TOOLBAR( ).

  ENDMETHOD.

*--------------------------------------------------------------------*
**Método que exibe a tabela em pop-up a partir de um double click.
*--------------------------------------------------------------------*

  METHOD ON_DOUBLE_CLICK.

  ME->EXIBE_ALV_POP( ).
  ME->SET_EVENTS( ).

    IF COLUMN = 'MATNR'.
    IF SALV_ALV IS BOUND.
      SALV_ALV->SET_SCREEN_POPUP(
      START_COLUMN = 20
      END_COLUMN   = 100
      START_LINE   = 6
      END_LINE     = 70
      ).
    ENDIF.

    SALV_ALV->DISPLAY( ).
   ENDIF.

  ENDMETHOD.

ENDCLASS.
