% ----------------------------------------------------------------------
% Vegetables in season

season(aubergine, jan, 50).
season(aubergine, feb, 50).
season(aubergine, mar, 50).
season(aubergine, apr, 50).
season(aubergine, may, 100).
season(aubergine, jun, 100).
season(aubergine, jul, 100).
season(aubergine, aug, 200).
season(aubergine, sep, 200).
season(aubergine, oct, 50).
season(aubergine, nov, 50).
season(aubergine, dec, 50).

season(celery, sep, 200).

season(cauliflower, sep, 200).

season('green pea', sep, 50).

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
