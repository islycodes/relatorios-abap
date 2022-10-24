*&---------------------------------------------------------------------*
*&  Include           ZTR_AI_TESTES_MODEL
*&---------------------------------------------------------------------*

CLASS REPORT_MODEL DEFINITION.

  PUBLIC SECTION.

  "Criando uma tabela interna do tipo da tabela transparente
  DATA: T_CAB_PEDIDO TYPE TABLE OF ZTRT_AI_001,
        S_CAB_PEDIDO TYPE ZTRT_AI_001.

  METHODS: START_OF_SELECTION,
           GET_CAB_PEDIDO,
           INIT_MODIFY_PED,
           VALIDATE_SCREEN_MODIFY,
           MODIFY_PEDIDO.

ENDCLASS.

CLASS REPORT_MODEL IMPLEMENTATION.

  "Inicia a Seleção, quando tiver filtros.
  "Apenas irá chamar os métodos.
  METHOD START_OF_SELECTION.

   ME->GET_CAB_PEDIDO( ).

  ENDMETHOD.

  METHOD GET_CAB_PEDIDO.

*    DO 5 TIMES.
*    S_CAB_PEDIDO-NUMERO_PEDIDO = SY-INDEX. "Pega o index e atribui ao número do pedido.
*    S_CAB_PEDIDO-DATA_PEDIDO = SY-DATUM.
*    S_CAB_PEDIDO-CANCELADO = 'X'.
*    "Modifica a tabela transparente através da linha
*    MODIFY ZTRT_AI_001 FROM S_CAB_PEDIDO.
*    ENDDO.

    "Obtendo o cabeçalho do pedido
    SELECT *
    FROM ZTRT_AI_001
    INTO CORRESPONDING FIELDS OF TABLE T_CAB_PEDIDO "Correponding fields of table é usado quando vamos pular colunas da tabela.
    WHERE NUMERO_PEDIDO IN FIL_NUM "Para os filtros funcionarem.
    AND DATA_PEDIDO IN FIL_DATA.

  ENDMETHOD.

  METHOD INIT_MODIFY_PED.

  ME->VALIDATE_SCREEN_MODIFY( ).

  ME->MODIFY_PEDIDO( ).

  ENDMETHOD.

  METHOD VALIDATE_SCREEN_MODIFY.

    "Valida se os campos estão preenchidos antes de inserir:
    IF MOD_NUM IS INITIAL.
      MESSAGE 'Numero do Pedido é obrigatório' TYPE 'E'.
      "types: I = information, E = erro e S = sucess.
    ENDIF.

    IF MOD_DATA IS INITIAL.
      MESSAGE 'Data do pedido é obrigatória' TYPE 'E'.
    ENDIF.


  ENDMETHOD.

  METHOD MODIFY_PEDIDO.

    DATA: PEDIDO TYPE ZTRT_AI_001,
          MSG TYPE STRING.

    PEDIDO-NUMERO_PEDIDO = MOD_NUM.
    PEDIDO-DATA_PEDIDO = MOD_DATA.
    PEDIDO-CANCELADO = MOD_CANC.

    MODIFY ZTRT_AI_001 FROM PEDIDO.

    "Messagem informando o usuário que a modificação/criação foi salva
    MSG = MOD_NUM.
    CONCATENATE 'Pedido' MSG 'salvo com sucesso' INTO MSG SEPARATED BY SPACE.

    MESSAGE MSG TYPE 'S'.

  ENDMETHOD.

ENDCLASS.
