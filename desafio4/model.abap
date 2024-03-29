
*--------------------------------------------------------------------*
** Sele��o do conte�do das tabelas
*--------------------------------------------------------------------*

CLASS REPORT_MODEL DEFINITION.

  PUBLIC SECTION.

    METHODS: START_OF_SELECTION,
      GET_TABLE.

ENDCLASS.

CLASS REPORT_MODEL IMPLEMENTATION.

  METHOD START_OF_SELECTION.
    ME->GET_TABLE( ).
  ENDMETHOD.


  METHOD GET_TABLE.

    SELECT TKNUM,"Transporte
           ERDAT "Data
      FROM VTTK
      INTO TABLE @DATA(TABLE_VTTK)
      WHERE ERDAT IN @S_ERDAT.

    CHECK TABLE_VTTK IS NOT INITIAL.

    SELECT TKNUM,"Transporte
           VBELN "N� Documento
      FROM VTTP
      INTO TABLE @DATA(TABLE_VTTP)
      FOR ALL ENTRIES IN @TABLE_VTTK
      WHERE TKNUM EQ @TABLE_VTTK-TKNUM.

    SELECT VBELN,"N� Documento
           PSTYV,
           MATNR "Produto
      FROM LIPS
      INTO TABLE @DATA(TABLE_LIPS)
      FOR ALL ENTRIES IN @TABLE_VTTP
      WHERE VBELN EQ @TABLE_VTTP-VBELN
        AND MATNR IN @S_MATNR
        AND PSTYV EQ 'Z001'.

    CHECK TABLE_LIPS IS NOT INITIAL.

    SELECT VBELV,
           VBELN "N� Documento
      FROM VBFA
      INTO TABLE @DATA(TABLE_VBFA)
      FOR ALL ENTRIES IN @TABLE_LIPS
      WHERE VBELN EQ @TABLE_LIPS-VBELN.

    SELECT VBELN, "N� Documento
         BRGEW, "Quantidade entregue
         NETWR "Valor total
    FROM VBAP
    INTO TABLE @DATA(TABLE_VBAP)
    FOR ALL ENTRIES IN @TABLE_VBFA
    WHERE VBELN EQ @TABLE_VBFA-VBELV.

    SELECT MATNR, "Produto
           MAKTX "Descri��o do produto
      FROM MAKT
      INTO TABLE @DATA(TABLE_MAKT)
      FOR ALL ENTRIES IN @TABLE_LIPS
      WHERE MATNR EQ @TABLE_LIPS-MATNR.

**--------------------------------------------------------------------*
***Loop para unir as tabelas
**--------------------------------------------------------------------*

    LOOP AT TABLE_VBAP INTO DATA(STRUCT_VBAP).

      READ TABLE TABLE_VBFA INTO DATA(STRUCT_VBFA) WITH KEY VBELV = STRUCT_VBAP-VBELN.

      READ TABLE TABLE_LIPS INTO DATA(STRUCT_LIPS) WITH KEY VBELN = STRUCT_VBFA-VBELN.

      READ TABLE TABLE_MAKT INTO DATA(STRUCT_MAKT) WITH KEY MATNR = STRUCT_LIPS-MATNR.

      READ TABLE TABLE_VTTP INTO DATA(STRUCT_VTTP) WITH KEY VBELN = STRUCT_LIPS-VBELN.

      READ TABLE TABLE_VTTK INTO DATA(STRUCT_VTTK) WITH KEY TKNUM = STRUCT_VTTP-TKNUM.

      "Relat�rio da execu��o
      STRUCT-MATNR        = STRUCT_LIPS-MATNR.
      STRUCT-MAKTX        = STRUCT_MAKT-MAKTX.
      STRUCT-BRGEW        = STRUCT_VBAP-BRGEW.
      STRUCT-NETWR        = STRUCT_VBAP-NETWR.
      STRUCT-ERDAT        = STRUCT_VTTK-ERDAT.

      "Pop up
      STRUCT_POP-TKNUM            = STRUCT_VTTK-TKNUM.
      STRUCT_POP-BRGEW            = STRUCT_VBAP-BRGEW.

      APPEND STRUCT TO TABLE.

      APPEND STRUCT_POP TO TABLE_POP.

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
