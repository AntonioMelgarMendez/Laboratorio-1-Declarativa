
:- consult('hechos.pl').

% Una zona es peligrosa cuando su nivel es alto (3 o más).
zona_peligrosa(Zona, Momento) :-
    nivel_peligro(Zona, Momento, Nivel),
    Nivel >= 3.

% Devuelve las amenazas que aparecen en cada zona.
amenaza_en(Zona, Enemigo) :-
    zona(Zona),
    enemigo(Enemigo),
    aparece_en(Enemigo, Zona).

% Kelvin puede ayudar a construir porque reúne ambas habilidades necesarias.
puede_ayudar_a_construir(Personaje) :-
    habilidad(Personaje, cargar_troncos),
    habilidad(Personaje, construir).

% Una zona es relativamente segura si no tiene enemigos o si su nivel de
% peligro no supera el nivel medio.
zona_relativamente_segura(Zona, Momento) :-
    zona(Zona),
    ( sin_enemigos(Zona)
    ; nivel_peligro(Zona, Momento, Nivel), Nivel =< 2
    ).

% Se puede obtener material de construcción en una zona cuando allí hay
% troncos o piedras.
material_de_construccion_en(Material, Zona) :-
    material(Material),
    se_encuentra_en(Material, Zona),
    (Material = troncos ; Material = piedras).

% Hay condiciones para construir un refugio si existe quien pueda construir
% y en la zona hay materiales apropiados.
puede_construirse_refugio(Zona) :-
    puede_ayudar_a_construir(_),
    material_de_construccion_en(_, Zona).
