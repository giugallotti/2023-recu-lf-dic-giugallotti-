%ubicacion de las piezas en el tablero
pieza(torre, negra, 2, 1).
pieza(torre, negra, 3, 4).
pieza(reina, negra, 5, 5).

%punto 1 - casilleros libres
casilleroLibre(Fil, Col) :-
    not(pieza(_, _, Fil, Col)).

%punto 2
%casillero ocupado por 2 piezas a la vez
dosPiezasEnElMismoLugar(Fil, Col) :-
    pieza(Pieza1, _, Fil, Col),
    pieza(Pieza2, _, Fil, Col),
    Pieza1 \= Pieza2.
