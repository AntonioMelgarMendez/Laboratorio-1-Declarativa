% Suma los enteros desde N hasta 1.
% Caso base: al llegar a 1, la suma acumulada es 1.
suma(1, 1).

% Caso recursivo: suma N al resultado de sumar sus antecesores.
suma(N, R) :-
    N > 1,
    N1 is N - 1,
    suma(N1, R1),
    R is N + R1.

% Ejemplo: ?- suma(4, R).
% Resultado: R = 10.
%
% Depuración interactiva en SWI-Prolog:
%   $ swipl -s suma.pl
%   ?- trace.
%   true.
%   [trace] ?- suma(4, R).
