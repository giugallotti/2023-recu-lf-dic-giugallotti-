%base de conocimiento
pieza(torre, negra, 2, 1).
pieza(torre, negra, 3, 4).
pieza(reina, negra, 5, 5).

nro(1).
nro(2).
nro(3).
nro(4).
nro(5).
nro(6).
nro(7).
nro(8).

%punto 1 - casilleros libres
casilleroLibre(Fil, Col) :-
    nro(Fil),
    nro(Col),
    not(pieza(_, _, Fil, Col)).

%punto 2
%casillero ocupado por 2 piezas a la vez
dosPiezasEnElMismoLugar(Fil, Col) :-
    pieza(Pieza1, Color, Fil, Col),
    pieza(Pieza2, Color, Fil, Col),
    Pieza1 \= Pieza2.

dosPiezasEnElMismoLugar(Fil, Col) :-
    pieza(Pieza1, Color1, Fil, Col),
    pieza(Pieza2, Color2, Fil, Col),
    Pieza1 \= Pieza2,
    Color1 \= Color2.

%pieza en casillero invalido
%es invalido cuando esta en uno ocupado o se va del rango de fila o columna
casilleroInvalido(Fil, Col) :-
    not(nro(Fil)),
    not(nro(Col)),
    pieza(_,_,Fil,Col).

