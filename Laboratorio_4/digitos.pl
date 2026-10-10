% Dado un entero, almacena sus digitos en una lista.
% El primer elemento de la lista es el digito menos significativo.

% Los numeros negativos se procesan usando su valor absoluto. El signo no es
% un digito, por lo que no se agrega a la lista.
almacenar(N, L) :-
    integer(N),
    N < 0,
    !,
    Positivo is -N,
    almacenar(Positivo, L).

% Caso base: un numero de un solo digito produce una lista de un elemento.
almacenar(N, [N]) :-
    integer(N),
    N >= 0,
    N < 10,
    !.

% Caso recursivo: se agrega el ultimo digito a la cabeza de la lista y se
% continua con el cociente entero del numero entre 10.
almacenar(N, [Digito|Resto]) :-
    integer(N),
    N >= 10,
    Digito is N mod 10,
    Siguiente is N div 10,
    almacenar(Siguiente, Resto).

% Permite probar el programa usando read/1 y write/1.
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

% Ejemplos:
% ?- almacenar(82671, L).
% L = [1, 7, 6, 2, 8].
%
% ?- almacenar(-82671, L).
% L = [1, 7, 6, 2, 8].
%
% ?- ejecutar.
% Ingrese un numero entero: 82671.
% La lista de digitos es: [1,7,6,2,8]
