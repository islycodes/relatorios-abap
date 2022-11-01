REPORT ZTR_AI_005_D3.

*-----------------------------------------------------------------------------------------------------------------------------------------------*
*Desafio3: Quando der um duplo clique no campo de “Vendedor”, deverá abrir a transação XK03 com as informações do vendedor selecionado. 
*Coluna de “Quantidade(KG)” deverá estar com o fundo amarelo.
*-----------------------------------------------------------------------------------------------------------------------------------------------*


"A ordem dos includes interfere nas chamadas
INCLUDE ZTR_AI_005_D3_SCREEN. "Select-options, parameters
INCLUDE ZTR_AI_005_D3_MODEL. "Selects
INCLUDE ZTR_AI_005_D3_VIEW. "Telas
INCLUDE ZTR_AI_005_D3_CONTROLLER. "Gerenciamento de eventos

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
