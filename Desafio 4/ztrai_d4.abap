
*-------------------------------------------------------------------------------------------------*
**Desafio 4: Quando  der  um  duplo  clique  no  campo  de  “Produto”,  deverá exibir  uma  popup
* com  os  campos  VTTK-TKNUM(Transporte) e VBAP-BRGEW(Quantidade) por transporte que compõem o
* cálculo total dos valores.
*-------------------------------------------------------------------------------------------------*

REPORT ZTR_AI_005_D4.

*--------------------------------------------------------------------*
**A ordem dos includes interfere nas chamadas
*--------------------------------------------------------------------*
INCLUDE ZTR_AI_005_D4_SCREEN.
INCLUDE ZTR_AI_005_D4_MODEL.
INCLUDE ZTR_AI_005_D4_VIEW.
INCLUDE ZTR_AI_005_D4_CONTROLLER.

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

*--------------------------------------------------------------------*
**Eventos fora da tela
*--------------------------------------------------------------------*

START-OF-SELECTION.
  GC_CONTROLLER->START_OF_SELECTION( ).

END-OF-SELECTION. "Exibição do ALV
  GC_CONTROLLER->END_OF_SELECTION( ).
