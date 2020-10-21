:- set_prolog_flag(answer_write_options, [max_depth(100)]).

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

score1(exceptional, 4).
score1(excellent,   3).
score1(great,       2).
score1(good,        1).

combined_score(X, Y, S) :-
    score1(X, S1),
    score1(Y, S2),
    plus(S1, S2, Sum),
    S is round(Sum / 2).

two_ingredient_pairings(I, J, CombinedScore-Ps) :-
    setof(K, pairing(S, K, I), Ks),
    setof(L, pairing(T, L, J), Ls),
    combined_score(S, T, CombinedScore),
    intersection(Ks, Ls, Ps).

seasonal_(Is) :-
    month(Month),
    findall(a(J, Score), (season(J, Month, Score), Score >= 100), Js),
    sort(1, @=<, Js, SortedBySeason),
    sort(2, @>=, SortedBySeason, SortedByName),
    Is = SortedByName.

goes_with_(I, SortedByName) :-
    findall(b(J, SS), (pairing(S, J, I), score(S, SS)), Is),
    sort(1, @=<, Is, SortedByScore),
    sort(2, @>=, SortedByScore, SortedByName).

both_(I, J, Qss) :-
    findall(Ps, two_ingredient_pairings(I, J, Ps), Pss),
    sort(1, @>=, Pss, Qss).
