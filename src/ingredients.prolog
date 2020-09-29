% ----------------------------------------------------------------------
% Vegetables in season

season(aubergine, 1, 50).
season(aubergine, 2, 50).
season(aubergine, 3, 50).
season(aubergine, 4, 50).
season(aubergine, 5, 100).
season(aubergine, 6, 100).
season(aubergine, 7, 100).
season(aubergine, 8, 200).
season(aubergine, 9, 200).
season(aubergine, 10, 50).
season(aubergine, 11, 50).
season(aubergine, 12, 50).

season(celery, 9, 200).
season(celery, 10, 200).

season(cauliflower, 9, 200).
season(cauliflower, 10, 200).

season('bush bean', 9, 200).
season('bush bean', 10, 200).
season('runner bean', 9, 200).
season('runner bean', 10, 200).

season(broccoli, 9, 200).
season(broccoli, 10, 150).

season(mushroom, 9, 200).
season(mushroom, 10, 200).

season(chicory, 9, 50).
season(chicory, 10, 200).

season('pak choi', 9, 200).
season('pak choi', 10, 200).

season('broad bean', 9, 50).
season('broad bean', 10, 25).

season('gherkins', 9, 200).
season('gherkins', 10, 150).

season('green pea', 9, 50).
season('green pea', 10, 25).

season(fennel, 9, 200).
season(fennel, 10, 200).

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

% ----------------------------------------------------------------------

tastes(celery, astringent).

has_function(celery, cooling).
has_weight(celery, light).
has_volume(celery, moderate-loud).

techniques(celery, boil).
techniques(celery, braise).
techniques(celery, cream).
techniques(celery, ratiné).
techniques(celery, raw).
techniques(celery, sauté).
techniques(celery, steam).
techniques(celery, stir-fry).

goes_well_with(celery, basil).
goes_well_with(celery, 'bay leaf').
goes_well_with(celery, beets).
goes_well_with(celery, butter).
goes_well_with(celery, capers).
goes_well_with(celery, carrots).
goes_well_with(celery, cheese). % esp. blue, feta, goat, Gruyère, Parmesan, Roquefort
goes_well_with(celery, chervil).
goes_well_with(celery, chicken). % and other poultry
goes_well_with(celery, chickpeas). %  and hummus"
goes_well_with(celery, chives).
goes_well_with(celery, cream).
goes_well_with(celery, 'cream cheese').
goes_well_with(celery, curry).
goes_well_with(celery, dill).
goes_well_with(celery, eggs). % hard-boiled)
goes_well_with(celery, fish).
goes_well_with(celery, garlic).
goes_well_with(celery, legumes).
goes_well_with(celery, lemon). % lemon juice.
goes_well_with(celery, lovage).
goes_well_with(celery, mushrooms). % wild
goes_well_with(celery, mustard). % esp. Dijon"
goes_well_with(celery, 'olive oil').
goes_well_with(celery, onion). % esp. red
goes_well_with(celery, paprika).
goes_well_with(celery, parsley).
goes_well_with(celery, peanuts).
goes_well_with(celery, 'peanut butter').
goes_well_with(celery, 'white pepper').
goes_well_with(celery, potatoes).
goes_well_with(celery, rice).
goes_well_with(celery, 'potato salad').
goes_well_with(celery, 'chicken salad').
goes_well_with(celery, 'shrimp salad').
goes_well_with(celery, 'tuna salad').
goes_well_with(celery, salt).
goes_well_with(celery, scallions).
goes_well_with(celery, shallots).
goes_well_with(celery, shellfish).
goes_well_with(celery, 'stir-fried dishes').
goes_well_with(celery, 'chicken stock').
goes_well_with(celery, 'vegetable stock').
goes_well_with(celery, stuffings).
goes_well_with(celery, tarragon).
goes_well_with(celery, thyme).
goes_well_with(celery, tomatoes).
goes_well_with(celery, 'tomato juice').
goes_well_with(celery, 'black truffles').
goes_well_with(celery, turnips).

affinities(celery, [carrot, onion]). % mirepoix
affinities(celery, [tarragon, vinegar]).

type(celery, vegetable).
