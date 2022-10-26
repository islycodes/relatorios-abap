*&---------------------------------------------------------------------*
*&  Include           ZTR_AI_TESTES_MODEL
*&---------------------------------------------------------------------*


"Types - tela do relatório:
TYPES: BEGIN OF TYP_VBAK,
         LIFNR  TYPE LFA1-LIFNR, "Vendedor
         BRGEW  TYPE VBAP-BRGEW, "Quantidade
         NETWR  TYPE VBAP-NETWR, "Valor total
         ERDAT  TYPE VBAK-ERDAT, "Data
         MES    TYPE C LENGTH 2,
         ANO    TYPE C LENGTH 4,
         COLOR  TYPE LVC_T_SCOL,
       END OF TYP_VBAK.


CLASS REPORT_MODEL DEFINITION.

  PUBLIC SECTION.

    "Tabela interna
    DATA: LT_VBAK TYPE TABLE OF TYP_VBAK,
          LS_VBAK TYPE TYP_VBAK.


    METHODS: START_OF_SELECTION,
      GET_TABLE,
      SET_COLOR,
      SET_DATE,
      DOUBLE_CLICK FOR EVENT DOUBLE_CLICK OF CL_SALV_EVENTS_TABLE
        IMPORTING ROW
                    COLUMN.

ENDCLASS.

CLASS REPORT_MODEL IMPLEMENTATION.

  METHOD START_OF_SELECTION.
    ME->GET_TABLE( ).
    ME->SET_DATE( ).
  ENDMETHOD.


  METHOD GET_TABLE.

    SELECT L1~LIFNR "Vendedor
           VP~BRGEW "Quantidade
           VP~NETWR "Valor total
           VK~ERDAT "Data
     FROM VBAK AS VK
     INNER JOIN VBAP AS VP ON VP~VBELN = VK~VBELN
     INNER JOIN VBPA AS VA ON VP~VBELN = VA~VBELN
     INNER JOIN LFA1 AS L1 ON VA~LIFNR = L1~LIFNR
     INTO CORRESPONDING FIELDS OF TABLE LT_VBAK
   WHERE L1~LIFNR IN S_LIFNR AND
         VK~ERDAT IN S_ERDAT.
  ENDMETHOD.


  METHOD DOUBLE_CLICK.
    READ TABLE LT_VBAK INTO LS_VBAK INDEX ROW.
    SET PARAMETER ID 'DTB' FIELD LS_VBAK-LIFNR.
    CALL TRANSACTION 'XK03' AND SKIP FIRST SCREEN.
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
    DATA: LS_COLOR             TYPE LVC_S_SCOL.


    LOOP AT LT_VBAK ASSIGNING <COL_TABLE>.
      " Se a quantidade (kg) for menor que 1000.
      " informa o campo que tem que ser colorido
      LS_COLOR-FNAME     = 'BRGEW'.          "<<Specify the column name
      " informa a cor para a estrutura.
      LS_COLOR-COLOR-COL = 3.
      LS_COLOR-COLOR-INT = 0.
      LS_COLOR-COLOR-INV = 0.
      APPEND LS_COLOR TO <COL_TABLE>-COLOR.
    ENDLOOP.
  ENDMETHOD.

  METHOD SET_DATE.
    FIELD-SYMBOLS: <DATE_TABLE> TYPE TYP_VBAK.
    LOOP AT LT_VBAK ASSIGNING <DATE_TABLE>.
      <DATE_TABLE>-MES = <DATE_TABLE>-ERDAT+4(2).
      <DATE_TABLE>-ANO = <DATE_TABLE>-ERDAT(4).
    ENDLOOP.
  ENDMETHOD.


ENDCLASS.
