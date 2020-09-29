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
