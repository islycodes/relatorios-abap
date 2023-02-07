REPORT ZTR_AI_TESTES.

**********************************************************************
**Aula de relatórios MVC
**********************************************************************

"A ordem dos includes interfere nas chamadas
INCLUDE: ZTR_AI_TESTES_SCREEN, "Select-options, parameters
         ZTR_AI_TESTES_MODEL, "Selects
         ZTR_AI_TESTES_VIEW, "Telas
         ZTR_AI_TESTES_CONTROLLER. "Gerenciamento de eventos

DATA: GC_CONTROLLER TYPE REF TO REPORT_CONTROLLER. "Variável Global Controller
                         "Referencia a classe do Include Controller

*--------------------------------------------------------------------*
**Implementação dos Eventos
*--------------------------------------------------------------------*

INITIALIZATION.
  CREATE OBJECT GC_CONTROLLER.
  GC_CONTROLLER->INITIALIZATION( ).

AT SELECTION-SCREEN OUTPUT.
  GC_CONTROLLER->SELECTION_SCREEN_O( ).

AT SELECTION-SCREEN.
  GC_CONTROLLER->SELECTION_SCREEN( ).

"Eventos fora da tela
START-OF-SELECTION.
  GC_CONTROLLER->START_OF_SELECTION( ).

END-OF-SELECTION. "Exibição do ALV
 GC_CONTROLLER->END_OF_SELECTION( ).
