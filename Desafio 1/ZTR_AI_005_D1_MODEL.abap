*&---------------------------------------------------------------------*
*&  Include           ZTR_AI_TESTES_MODEL
*&---------------------------------------------------------------------*

  "Types - tela do relatório:
  TYPES: BEGIN OF TYP_VBAK,
           KUNNR TYPE KNA1-KUNNR,
           NAME1 TYPE KNA1-NAME1,
           BRGEW TYPE VBAP-BRGEW,
           NETWR TYPE VBAP-NETWR,
           ERDAT TYPE VBAK-ERDAT,
         END OF TYP_VBAK.

  CLASS REPORT_MODEL DEFINITION.

    PUBLIC SECTION.

      "Tabela interna
      DATA: LT_VBAK TYPE TABLE OF TYP_VBAK,
            LS_VBAK TYPE TYP_VBAK.


      METHODS: START_OF_SELECTION,
        GET_TABLE,
        DOUBLE_CLICK FOR EVENT DOUBLE_CLICK OF CL_SALV_EVENTS_TABLE
          IMPORTING ROW
                     COLUMN.

  ENDCLASS.

  CLASS REPORT_MODEL IMPLEMENTATION.

    METHOD START_OF_SELECTION.
      ME->GET_TABLE( ).
    ENDMETHOD.

    METHOD GET_TABLE.

*Tela de Seleção
      SELECT K1~KUNNR "Cliente
             K1~NAME1
             VP~BRGEW
             VP~NETWR
             VK~ERDAT "Data do registro
        FROM VBAK AS VK
        INNER JOIN KNA1 AS K1
        ON VK~KUNNR = K1~KUNNR
        INNER JOIN VBAP AS VP
        ON VK~VBELN = VP~VBELN
        INTO TABLE LT_VBAK
      WHERE VK~ERDAT IN S_ERDAT AND
            K1~KUNNR IN S_KUNNR.

    ENDMETHOD.

       METHOD DOUBLE_CLICK.
     READ TABLE LT_VBAK INTO LS_VBAK INDEX ROW.
     SET PARAMETER ID 'KUN' FIELD LS_VBAK-KUNNR.
     CALL TRANSACTION 'XD03' WITHOUT AUTHORITY-CHECK AND SKIP FIRST SCREEN.
   ENDMETHOD.


  ENDCLASS.
