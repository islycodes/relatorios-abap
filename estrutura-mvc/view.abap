*&---------------------------------------------------------------------*
*&  Include           ZTR_AI_TESTES_VIEW
*&---------------------------------------------------------------------*

CLASS REPORT_VIEW DEFINITION.

  PUBLIC SECTION.

  METHODS: INITIALIZATION,
           SELECTION_SCREEN_O,
           SELECTION_SCREEN,
           END_OF_SELECTION.

ENDCLASS.

CLASS REPORT_VIEW IMPLEMENTATION.
  "Qualquer validação a ser feita na inicialização do programa deve ser feita aqui.
  "Validações de usuários, permissões..
  METHOD INITIALIZATION.
    MESSAGE 'Initialization Executada!' TYPE 'I'.
  ENDMETHOD.

  METHOD SELECTION_SCREEN_O.
    MESSAGE 'Selection Screen Output Executado!' TYPE 'I'.
  ENDMETHOD.

  METHOD SELECTION_SCREEN.
    MESSAGE 'Selection Screen Executado!' TYPE 'I'.
  ENDMETHOD.

  METHOD END_OF_SELECTION.
    MESSAGE 'End of Selection Executado!' TYPE 'I'.
  ENDMETHOD.

ENDCLASS.
