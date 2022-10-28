REPORT ZTR_AI_005.

*-----------------------------------------------------------------------------------------------------------------------------------------------*
*Desafio1: Quando der um duplo clique no campo de “Cliente”, deverá abrir a transação XD03 com as informações do cliente selecionado.
*-----------------------------------------------------------------------------------------------------------------------------------------------*


"A ordem dos includes interfere nas chamadas
INCLUDE ZTR_AI_005_D1_SCREEN. "Select-options, parameters
INCLUDE ZTR_AI_005_D1_MODEL. "Selects
INCLUDE ZTR_AI_005_D1_VIEW. "Telas
INCLUDE ZTR_AI_005_D1_CONTROLLER. "Gerenciamento de eventos

DATA: GC_CONTROLLER TYPE REF TO REPORT_CONTROLLER. "Variável Global Controller

*--------------------------------------------------------------------*
**Implementação dos Eventos
*--------------------------------------------------------------------*

INITIALIZATION.
  CREATE OBJECT GC_CONTROLLER.
  GC_CONTROLLER->INITIALIZATION( ).

AT SELECTION-SCREEN OUTPUT.
  GC_CONTROLLER->SELECTION_SCREEN_0( ).

AT SELECTION-SCREEN.
  GC_CONTROLLER->SELECTION_SCREEN( ).

  "Eventos fora da tela

START-OF-SELECTION.
  GC_CONTROLLER->START_OF_SELECTION( ).

END-OF-SELECTION. "Exibição do ALV
  GC_CONTROLLER->END_OF_SELECTION( ).
