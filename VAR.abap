*&---------------------------------------------------------------------*
*& Report  ZAI_EXEMPLOVENDAS
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT ZAI_EXEMPLOVENDAS.

*Declaração de variável (tipos):
" I - INTEGER
" C - CARACTER
" P - FLOAT
" STRING - TEXTO

*DECLARAÇÃO EM CONJUNTO
DATA: VAR1 TYPE I,
      VAR2 TYPE P,
      VAR3 TYPE C,
      VAR4 TYPE STRING.


VAR1 = 3.
VAR2 = '1.2'.
VAR3 = 'A'.
VAR4 = 'TEXTO'.

WRITE: 'CONTEUDO DAS VARIÁVEIS:', /.

*Write com texto + variável:
WRITE: 'Armazenado na VAR1 ', VAR1, /.
WRITE: 'Armazenado na VAR2 ', VAR2, /.
WRITE: 'Armazenado na VAR3 ', VAR3, /.
WRITE: 'Armazenado na VAR4 ', VAR4, /.
