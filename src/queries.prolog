:- consult(recipes).
:- consult(ingredients).

fast_dinner(T, D) :-
    dish(D),
    meal(dinner, D),
    time(T, D),
    T =< 30.

%?- fast_dinner(T, D).
%@ T = 30 ,
%@ D = 'courgette pasta';
%@ T = 15 ,
%@ D = menemen

pasta_dishes(D) :-
    dish(D),
    carb(pasta, D).

%?- pasta_dishes(D).
%@ D = gulash ;
%@ D = bolognese ;
%@ D = 'courgette pasta' ;

egg_breakfast(D) :-
    dish(D),
    meal(breakfast, D),
    contains_ingredients(D, [egg]).

%?- egg_breakfast(D).
%@ D = menemen ;

slow_dinner(T, D) :-
    dish(D),
    meal(dinner, D),
    time(T, D),
    T >= 60.

%?- slow_dinner(T, D).
%@ T = 180 ,
%@ D = gulash;
%@ T = 120 ,
%@ D = chili;
%@ T = 120 ,
%@ D = bolognese

in_season(M, V) :-

    season(V, M, 200).

%?- in_season(sep, V).
%@ V = aubergine ;
%@ V = celery ;
%@ V = cauliflower ;

any(_, [], _) :- false.
any(P, [H|T], X) :-
    ( call(P, H) -> X = H
    ; any(P, T, X)
    ).

dish_in_season(M, I, D) :-
    dish(D),
    findall(J, contains(J, D), Js),
    any(in_season(M), Js, I).

%?- dish_in_season(sep, I, D).
%@ I = celery ,
%@ D = bolognese ;

month(Month) :-
    get_time(Stamp),
    stamp_date_time(Stamp, DateTime, local),
    date_time_value(month, DateTime, Month).

%?- month(Month).
%@ Month = 9.

dish_in_season_this_month(I, S, D) :-
    month(M),
    dish_in_season(M, I, D),
    season(I, M, S).

pair(S, J, I) :-
    pairing(S, J, I),
    \+ aromatic(J),
    \+ herb(J),
    \+ spice(J),
    \+ fat(J),
    \+ acid(J).

%?- pair(excellent, I, cauliflower).
%@ I = cheese ;
%@ I = cream ;
%@ I = milk ;

two_ingredient_pairings(I, J, Ps) :-
    setof(K, pairing(_, I, K), Ks),
    setof(L, pairing(_, J, L), Ls),
    intersection(Ks, Ls, Ps).
