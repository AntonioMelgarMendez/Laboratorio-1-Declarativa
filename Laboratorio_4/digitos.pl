almacenar(N, L) :-
    integer(N),
    N < 0,
    !,
    Positivo is -N,
    almacenar(Positivo, L).

almacenar(N, [N]) :-
    integer(N),
    N >= 0,
    N < 10,
    !.

almacenar(N, [Digito|Resto]) :-
    integer(N),
    N >= 10,
    Digito is N mod 10,
    Siguiente is N div 10,
    almacenar(Siguiente, Resto).

ejecutar :-
    write('Ingrese un numero entero: '),
    read(N),
    ( almacenar(N, L) ->
        write('La lista de digitos es: '),
        write(L),
        nl
    ;
        write('Entrada invalida. Debe ingresar un numero entero.'),
        nl
    ).
