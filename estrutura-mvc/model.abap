*&---------------------------------------------------------------------*
*&  Include           ZTR_AI_TESTES_MODEL
*&---------------------------------------------------------------------*

CLASS REPORT_MODEL DEFINITION.

  PUBLIC SECTION.

  METHODS: START_OF_SELECTION.

ENDCLASS.

CLASS REPORT_MODEL IMPLEMENTATION.

  "Inicia a Seleção, quando tiver filtros.
  METHOD START_OF_SELECTION.
    MESSAGE 'Start of Selection Executado!' TYPE 'I'.
  ENDMETHOD.

ENDCLASS.
