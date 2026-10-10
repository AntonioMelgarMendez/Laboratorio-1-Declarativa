:- consult('digitos.pl').

:- begin_tests(almacenar_digitos).

test(ejemplo_del_ejercicio, true(L == [1, 7, 6, 2, 8])) :-
    almacenar(82671, L).

test(numero_negativo, true(L == [1, 7, 6, 2, 8])) :-
    almacenar(-82671, L).

test(numero_de_un_digito, true(L == [7])) :-
    almacenar(7, L).

test(numero_cero, true(L == [0])) :-
    almacenar(0, L).

test(numero_con_ceros_intermedios, true(L == [3, 0, 2, 0, 1])) :-
    almacenar(10203, L).

test(rechaza_termino_que_no_es_entero, [fail]) :-
    almacenar(hola, _).

:- end_tests(almacenar_digitos).
