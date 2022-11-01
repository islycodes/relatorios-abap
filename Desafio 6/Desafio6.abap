*-----------------------------------------------------------------------
* Empresa..: Caçola
* Programa.: ZFIR0003
* Tipo.....: Programa Report
* Módulo...: FI
* Transação: ZFIR008
* Descrição: Relatório de Cheques por Cliente
* Autor....: Douglas Gomes   (Consultoria Avannt)
* Data.....: 17/09/2012
*
*                          [HISTÓRICO]
* ========== ============  ==========  =================================
*    Data        Autor      Request                Descrição
* ========== ============  ==========  =================================
*-----------------------------------------------------------------------

REPORT YDESAFIO6_AI.

*--------------------------------------------------------------------*
**Includes
*--------------------------------------------------------------------*
INCLUDE YAI_SCREEN.
INCLUDE YAI_MODEL.
INCLUDE YAI_VIEW.
INCLUDE YAI_CONTROLLER.

DATA: GC_CONTROLLER TYPE REF TO YAI_CONTROLLER. "Variável Global Controller

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
