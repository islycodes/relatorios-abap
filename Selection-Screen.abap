*&---------------------------------------------------------------------*
*& Report  ZTR_AI_TESTES
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT ztr_ai_testes.

DATA: id TYPE i.

SELECTION-SCREEN: BEGIN OF BLOCK bloco WITH FRAME TITLE text-001. "Só podemos usar textos previamente prontos no título.
"Parameter: deixa apenas um valor disponível para filtro
PARAMETERS: p_data TYPE sy-datum,
            p_id   TYPE i.


SELECTION-SCREEN SKIP. "Quebra de linha

"Capaz de armazenar um range (de n à m dados)
SELECT-OPTIONS: s_id FOR id.

SELECTION-SCREEN SKIP. "Quebra de linha

PARAMETERS p_chkbox AS CHECKBOX DEFAULT ''.

SELECTION-SCREEN SKIP. "Quebra de linha

"RadioButton: semelhante ao checkbox, porém dá mais opções ao usuário.
PARAMETERS: p_radio1 RADIOBUTTON GROUP rb,
            p_radio2 RADIOBUTTON GROUP rb.

SELECTION-SCREEN SKIP. "Quebra de linha

"ListBox: Dropdown Menu.
PARAMETERS: p_list AS LISTBOX VISIBLE LENGTH 10.

SELECTION-SCREEN: END OF BLOCK bloco.

INITIALIZATION. "Inicialização do Programa, Antes de criar a tela.

  PERFORM feed_list. "chama o bloco de código na inicialização

**Colocando valores no checkbox:

*AT SELECTION-SCREEN OUTPUT. "Na saída do output
*
*START OF SELECTION. "Será usado após o click sobre o botão executar (F8)
*
*END OF SELECTION. "É executado ao final do START-OF-SELECTION

FORM feed_list. "Bloco de código - FeedList

  DATA: name_list TYPE vrm_id,
        "Lista de conteúdo sendo recebida
        values    TYPE vrm_values, "Tabela
        value     TYPE vrm_value. "Linha

  name_list = 'P_LIST'.

  "Adicionando linhas na tabela de dropdown:

  value-key = '1'.

  value-text = 'OPTION 1'.

  APPEND value TO values.

  value-key = '2'.

  value-text = 'OPTION 1'.

  APPEND value TO values.

  CALL FUNCTION 'VRM_SET_VALUES'
    EXPORTING
      id     = name_list
      values = values.

ENDFORM.
