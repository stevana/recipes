:- discontiguous
       season/3,
       tastes/2,
       has_function/2,
       has_weight/2,
       has_volume/2,
       goes_well_with/2,
       goes_very_well_with/2,
       techniques/2,
       affinities/2,
       type/2.

% ----------------------------------------------------------------------
% Vegetables in season

season2(I, S) :-
    ( season(I, 10, T) -> S = T
    ; S = 0
    ).

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

season(gherkins, 9, 200).
season(gherkins, 10, 150).

season('green pea', 9, 50).
season('green pea', 10, 25).

season(fennel, 9, 200).
season(fennel, 10, 200).

season(collard, 9, 0).
season(collard, 10, 50).
season(kale, 9, 0).
season(kale, 10, 50).

season(potato, 9, 200).
season(potato, 10, 200).

season(kohlrabi, 9, 200).
season(kohlrabi, 10, 200).

season(pumpkin, 9, 200).
season(pumpkin, 10, 200).

season(squash, 9, 200).
season(squash, 10, 200).

season('swiss chard', 9, 200).
season('swiss chard', 10, 50).

season(horseradish, 9, 200).
season(horseradish, 10, 200).

season(carrot, 9, 200).
season(carrot, 10, 200).

season(paprika, 9, 200).
season(paprika, 10, 200).

%%% XXX

season('brussels sprouts', 9, 50).
season('brussels sprouts', 10, 150).

season(beetroot, 9, 200).
season(beetroot, 10, 200).

season('red cabbage', 9, 200).
season('red cabbage', 10, 200).

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

% ----------------------------------------------------------------------

tastes(cauliflower, astringent).

has_botanical_relatives(cauliflower, broccoli).
has_botanical_relatives(cauliflower, 'brussels sprouts').
has_botanical_relatives(cauliflower, cabbage).
has_botanical_relatives(cauliflower, 'collard greens').
has_botanical_relatives(cauliflower, kale).
has_botanical_relatives(cauliflower, kohlrabi).

has_function(cauliflower, cooling).
has_weight(cauliflower, medium).
has_volume(cauliflower, moderate).

techniques(cauliflower, boil).
techniques(cauliflower, braise).
techniques(cauliflower, deep-fry).
techniques(cauliflower, gratin).
techniques(cauliflower, puree).
techniques(cauliflower, raw).
techniques(cauliflower, roast).
techniques(cauliflower, sauté).
techniques(cauliflower, simmer).
techniques(cauliflower, steam).

goes_well_with(anchovies, cauliflower).
goes_well_with(apples, cauliflower).
goes_well_with('bay leaf', cauliflower).
goes_well_with('bell peppers', cauliflower). % esp. green (e.g., Indian cuisine)
goes_well_with('bread crumbs', cauliflower).
goes_well_with(broccoli, cauliflower).
goes_well_with('brown butter', cauliflower).
goes_well_with(butter, unsalted, cauliflower).
goes_well_with(capers, cauliflower).
goes_well_with(cardamom, cauliflower).
goes_well_with(caviar, cauliflower).
goes_well_with('celery seeds', cauliflower).
goes_very_well_with(cheese, cauliflower). % blue, cheddar, Comté, Emmental,
                                          % goat, Gruyère, Parmesan, pecorino
goes_well_with(chervil, cauliflower).
goes_well_with('chile peppers', cauliflower). % red dried
goes_well_with('chili sauce', cauliflower).
goes_well_with(chives, cauliflower).
goes_well_with(chocolate, cauliflower). % when cauliflower is caramelized,
goes_well_with(cocoa, cauliflower). % when cauliflower is caramelized,
goes_well_with(cilantro, cauliflower).
goes_well_with(coriander, cauliflower).
goes_very_well_with(cream, cauliflower).
goes_very_well_with(milk, cauliflower).
goes_well_with(cumin, cauliflower).
goes_well_with(currants, cauliflower). % dried
goes_well_with('curry powder', cauliflower).
goes_well_with(dill, cauliflower).
% goes_well_with('Eastern Mediterranean cuisine', cauliflower).
goes_well_with(egg, cauliflower). % hard-boiled, esp. yolk.
% goes_well_with(French cuisine, cauliflower).
goes_well_with('garam masala', cauliflower).
goes_very_well_with(garlic, cauliflower).
goes_well_with(ginger, cauliflower).
goes_well_with(greens, cauliflower).
goes_well_with('hollandaise sauce', cauliflower).
% goes_well_with('Indian cuisine', cauliflower).
goes_well_with(leeks, cauliflower).
goes_well_with(lemon, cauliflower). % juice, zest
goes_well_with(lime, cauliflower).
% goes_well_with('Mediterranean cuisine', cauliflower).
goes_well_with(mint, cauliflower).
goes_well_with(mussels, cauliflower).
goes_well_with(mustard, cauliflower). % esp. Dijon, but also mustard oil and seeds.
goes_well_with(nutmeg, cauliflower).
goes_very_well_with('canola oil', cauliflower).
goes_very_well_with('grapeseed oil', cauliflower).
goes_very_well_with('vegetable oil', cauliflower).
goes_well_with('olive oil', cauliflower).
goes_well_with('black olives', cauliflower).
goes_well_with('green olives', cauliflower).
goes_very_well_with('green onion', cauliflower).
goes_very_well_with('red onion', cauliflower).
goes_well_with(orange, cauliflower). % juice, zest
goes_well_with(paprika, cauliflower).
goes_well_with(parsley, cauliflower).
goes_well_with(pasta, cauliflower).
goes_very_well_with(pepper, cauliflower). % black and white
goes_well_with('pine nuts', cauliflower).
goes_well_with('poppy seeds', cauliflower).
goes_well_with(potatoes, cauliflower). % red (e.g., Indian cuisine)
goes_well_with(raisins, cauliflower).
goes_well_with('red pepper flakes', cauliflower).
goes_well_with(saffron, cauliflower).
goes_very_well_with(salt, cauliflower).
%% XXX: goes_well_with(sauces: béchamel, brown butter, cheese, cream, hollandaise, Mornay, cauliflower).
goes_well_with(scallions, cauliflower).
goes_well_with(scallops, cauliflower).
goes_well_with(shallots, cauliflower).
goes_well_with(soups, cauliflower).
goes_well_with(stock, cauliflower).
goes_well_with(tarragon, cauliflower).
goes_well_with(thyme, cauliflower).
goes_well_with(tomatoes, cauliflower).
goes_well_with('white truffles', cauliflower).
goes_well_with(turmeric, cauliflower).
goes_well_with(vinegar, cauliflower). % red, white wine
goes_well_with(watercress, cauliflower).
goes_well_with(yogurt, cauliflower).

affinities(cauliflower, [anchovies, 'red pepper flakes', garlic, 'olive oil']).
affinities(cauliflower, ['bread crumbs', 'brown butter', parsley]).
affinities(cauliflower, [cilantro, cloves, cumin, turmeric]).
affinities(cauliflower, [cream, sorrel]).
affinities(cauliflower, [curry, apple]).
affinities(cauliflower, [curry, vinegar]).
affinities(cauliflower, [garlic, mint, pasta]).
affinities(cauliflower, ['pine nuts', lime]).

type(cauliflower, vegetable).
