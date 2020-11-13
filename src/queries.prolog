:- set_prolog_flag(answer_write_options, [max_depth(100)]).

:- consult(recipes).
:- consult(ingredients).
:- consult(utils).

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

% ----------------------------------------------------------------------

seasonal_(Is) :-
    month(Month),
    findall(a(J, Score), (season(J, Month, Score), Score >= 100), Js),
    sort(1, @=<, Js, SortedBySeason),
    sort(2, @>=, SortedBySeason, SortedByName),
    Is = SortedByName.

score1(exceptional, 4).
score1(excellent,   3).
score1(great,       2).
score1(good,        1).

combined_score(Xs, S) :-
    maplist(score1, Xs, Scores),
    sum_list(Scores, Sum),
    length(Scores, Len),
    S is round(Sum / Len).

all_(Is, F) :-
    findall(Jss, findall(S-Js, (member(I, Is),
                                setof(J, pairing(S, J, I), Js)), Jss), [Jsss]),
    findall(S-Vs, (member(K1-Vs1, Jsss),
                   member(K2-Vs2, Jsss),
                   ( Is = [_] -> true
                   ; Vs1 \= Vs2
                   ),
                   combined_score([K1, K2], S),
                   intersection(Vs1, Vs2, Vs)), A),
    sort(1, @>=, A, B),
    group_pairs_by_key(B, C),
    map_values(flatten, C, D),
    map_values(sort(0, @<), D, E),
    month(Month),
    map_values(maplist(add_season(Month)), E, F).

add_season(M, I, I-S) :- default_season(I, M, S).

default_season(I, M, S) :-
    ( season(I, M, T) -> S = T
    ; S = -1).
