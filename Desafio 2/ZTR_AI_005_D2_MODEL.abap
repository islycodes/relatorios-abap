*&---------------------------------------------------------------------*
*&  Include           ZTR_AI_TESTES_MODEL
*&---------------------------------------------------------------------*


"Types - tela do relatório:
TYPES: BEGIN OF TYP_VBAK,
         MATNR TYPE VBAP-MATNR, "Produto
         MAKTX TYPE MAKT-MAKTX, "Descr. produto
         BRGEW TYPE VBAP-BRGEW, "Quantidade
         NETWR TYPE VBAP-NETWR, "Valor total
         ERDAT TYPE VBAK-ERDAT, "Data
         COLOR TYPE LVC_T_SCOL,
       END OF TYP_VBAK.


CLASS REPORT_MODEL DEFINITION.

  PUBLIC SECTION.

    "Tabela interna
    DATA: LT_VBAK TYPE TABLE OF TYP_VBAK,
          LS_VBAK TYPE TYP_VBAK.


    METHODS: START_OF_SELECTION,
      GET_TABLE,
      SET_COLOR,
      DOUBLE_CLICK FOR EVENT DOUBLE_CLICK OF CL_SALV_EVENTS_TABLE
        IMPORTING ROW
                    COLUMN.

ENDCLASS.

CLASS REPORT_MODEL IMPLEMENTATION.

  METHOD START_OF_SELECTION.
    ME->GET_TABLE( ).
  ENDMETHOD.


  METHOD GET_TABLE.

    SELECT VP~MATNR "Produto
          MT~MAKTX "Descr. produto
          VP~BRGEW "Quantidade
          VP~NETWR "Valor total
          VK~ERDAT "Data
     FROM VBAK AS VK
     INNER JOIN VBAP AS VP
     ON VP~VBELN = VK~VBELN
     INNER JOIN MAKT AS MT
     ON VP~MATNR = MT~MATNR
     INTO CORRESPONDING FIELDS OF TABLE LT_VBAK
   WHERE VK~ERDAT IN S_ERDAT AND
         VP~MATNR IN S_MATNR.

  ENDMETHOD.


  METHOD DOUBLE_CLICK.
    READ TABLE LT_VBAK INTO LS_VBAK INDEX ROW.
    SET PARAMETER ID 'DFD' FIELD LS_VBAK-MATNR.
    CALL TRANSACTION 'MM03' AND SKIP FIRST SCREEN.
  ENDMETHOD.


*    "----Relacionamento de dados (tabela de cores)-----------------------------Início"
*    "  Categoria de tabela |  Estrutura   |   Campos  |  Tipo Componente
*    "       LVC_T_SCOL -----> LVC_S_SCOL ---> FNAME -----> LVC_FNAME
*    "                                        NOKEYCOL ---> LVC_NOKEYC      Campos estruc
*    "                                         COLOR ----->(LVC_S_COLO)------>  COL
*    "                                                            |---------->  INT
*    "                                                            |---------->  INV
*    "----Relacionamento de dados (tabela de cores)--------------------------------Fim"

**      * 1 - Azul
**      * 2 - Lay-out padrão
**      * 3 - Amarelo
**      * 4 - Verde escuro
**      * 5 - Verde claro
**      * 6 - Vermelho
**      * 7 - Lilás

  METHOD SET_COLOR.
*    "  Aqui eu estarei dando o loop na tabela principal para tratar registro
*    " por registro com as condições pra que não sejam pintadas todas as celulas.
    FIELD-SYMBOLS: <COL_TABLE> TYPE TYP_VBAK.
    DATA: LS_COLOR               TYPE LVC_S_SCOL.


    LOOP AT LT_VBAK ASSIGNING <COL_TABLE>.
      " Se a quantidade (kg) for menor que 1000.
      IF <COL_TABLE>-BRGEW < 1000.
        " informa o campo que tem que ser colorido
        LS_COLOR-FNAME     = 'BRGEW'.          "<<Specify the column name
        " informa a cor para a estrutura.
        LS_COLOR-COLOR-COL = 6.
        LS_COLOR-COLOR-INT = 0.
        LS_COLOR-COLOR-INV = 0.
        APPEND LS_COLOR TO <COL_TABLE>-COLOR.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
