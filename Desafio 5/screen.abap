*--------------------------------------------------------------------*
**Select-options, parameters e tabelas transparentes que serão usadas.
*--------------------------------------------------------------------*

TABLES: ADRC, VBAK.

*--------------------------------------------------------------------*
**Tela de seleção
*--------------------------------------------------------------------*

SELECTION-SCREEN BEGIN OF BLOCK BLOCO1 WITH FRAME TITLE TEXT-001.
SELECT-OPTIONS: S_REGION FOR ADRC-REGION, "Estado
                S_CITY1  FOR ADRC-CITY1,  "Regiao
                S_ERDAT  FOR VBAK-ERDAT.  "Data

SELECTION-SCREEN END OF BLOCK BLOCO1.

*--------------------------------------------------------------------*
**Conteúdo do relatório:
*--------------------------------------------------------------------*
TYPES: BEGIN OF TYP_RLTR,
         REGION TYPE ADRC-REGION, "Estado
         BEZEI TYPE T005U-BEZEI, "Desc. do Estado
         CITY1 TYPE ADRC-CITY1, "Cidade
         BRGEW TYPE VBAP-BRGEW, "Quantidade entregue
         NETWR TYPE VBAP-NETWR, "Valor Total
         ERDAT TYPE VBAK-ERDAT,
         ICONE TYPE CHAR4,
         COLOR  TYPE LVC_T_SCOL,
       END OF TYP_RLTR,

*--------------------------------------------------------------------*
**Conteúdo do popup:
*--------------------------------------------------------------------*
       BEGIN OF TYP_POP,
         TKNUM TYPE VTTK-TKNUM, "Transporte
         BRGEW TYPE VBAP-BRGEW, "Quantidade entregue
       END OF TYP_POP.


*--------------------------------------------------------------------*
**Definição das variáveis
*--------------------------------------------------------------------*
    DATA: TABLE         TYPE TABLE OF TYP_RLTR,
          STRUCT        TYPE TYP_RLTR,
          TABLE_POP     TYPE TABLE OF TYP_POP,
          STRUCT_POP    TYPE TYP_POP.
