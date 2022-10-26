REPORT ZTR_AI_005_D2.

*-----------------------------------------------------------------------------------------------------------------------------------------------*
*Quando der um duplo clique no campo de “Produto”, deverá abrir a transação MM03 com as informações do produto selecionado.
*Se a “Quantidade(KG)” for menos que 1000, a célula do ALV deverá ficar vermelha.
*-----------------------------------------------------------------------------------------------------------------------------------------------*


"A ordem dos includes interfere nas chamadas
INCLUDE ZTR_AI_005_D2_SCREEN. "Select-options, parameters
INCLUDE ZTR_AI_005_D2_MODEL. "Selects
INCLUDE ZTR_AI_005_D2_VIEW. "Telas
INCLUDE ZTR_AI_005_D2_CONTROLLER. "Gerenciamento de eventos

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
