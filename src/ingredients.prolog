:- multifile([general_season/2,
              botanical_relatives/2,
              taste/2,
              has_function/2,
              has_weight/2,
              has_volume/2,
              techniques/2,
              pairing/3,
              affinities/2]).

:- consult('ingredients/aubergine').
:- consult('ingredients/beetroot').
:- consult('ingredients/cabbage').
:- consult('ingredients/cauliflower').
:- consult('ingredients/celery').
:- consult('ingredients/celery_root').
:- consult('ingredients/garlic').
:- consult('ingredients/grapefruit').
:- consult('ingredients/kale').
:- consult('ingredients/kohlrabi').
:- consult('ingredients/mushrooms').
:- consult('ingredients/potatoes').
:- consult('ingredients/pumpkin').
:- consult('ingredients/red_cabbage').

% Vegetables in season

season2(I, S) :-
    ( season(I, 10, T) -> S = T
    ; S = 0
    ).

season3(I, S) :- season(I, 10, S).

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
season(celery, 11, 100).
season(celery, 12, 100).

season(cauliflower, 9, 200).
season(cauliflower, 10, 200).
season(cauliflower, 11, 100).
season(cauliflower, 12, 50).

season('bush bean', 9, 200).
season('bush bean', 10, 200).
season('bush bean', 11, 50).
season('bush bean', 12, 50).
season('runner bean', 9, 200).
season('runner bean', 10, 200).
season('runner bean', 11, 50).
season('runner bean', 12, 50).

season(broccoli, 9, 200).
season(broccoli, 10, 150).
season(broccoli, 11, 50).
season(broccoli, 12, 25).

% champignon mushrooms
season(mushrooms, 9, 200).
season(mushrooms, 10, 200).
season(mushrooms, 11, 200).
season(mushrooms, 12, 200).

season(chicory, 9, 50).
season(chicory, 10, 200).
season(chicory, 11, 200).
season(chicory, 12, 200).

season('pak choi', 9, 200).
season('pak choi', 10, 200).
season('pak choi', 11, 200).
season('pak choi', 12, 100).

season('broad bean', 9, 50).
season('broad bean', 10, 25).
season('broad bean', 11, 0).
season('broad bean', 12, 0).

season(gherkins, 9, 200).
season(gherkins, 10, 150).
season(gherkins, 11, 25).
season(gherkins, 12, 0).

season('green pea', 9, 50).
season('green pea', 10, 25).
season('green pea', 11, 0).
season('green pea', 12, 0).

season(fennel, 9, 200).
season(fennel, 10, 200).
season(fennel, 11, 100).
season(fennel, 12, 50).

season(collard, 9, 0).
season(collard, 10, 50).
season(collard, 11, 200).
season(collard, 12, 200).
season(kale, 9, 0).
season(kale, 10, 50).
season(kale, 11, 200).
season(kale, 12, 200).

season(potatoes, 9, 200).
season(potatoes, 10, 200).
season(potatoes, 11, 100).
season(potatoes, 12, 100).

season(kohlrabi, 9, 200).
season(kohlrabi, 10, 200).
season(kohlrabi, 11, 50).
season(kohlrabi, 12, 25).

season(pumpkin, 9, 200).
season(pumpkin, 10, 200).
season(pumpkin, 11, 200).
season(pumpkin, 12, 100).
season(squash, 9, 200).
season(squash, 10, 200).
season(squash, 11, 200).
season(squash, 12, 100).

season('swiss chard', 9, 200).
season('swiss chard', 10, 50).
season('swiss chard', 11, 25).
season('swiss chard', 12, 0).

season(horseradish, 9, 200).
season(horseradish, 10, 200).
season(horseradish, 11, 200).
season(horseradish, 12, 50).

season(carrots, 9, 200).
season(carrots, 10, 200).
season(carrots, 11, 100).
season(carrots, 12, 100).

season('bell peppers', 9, 200).
season('bell peppers', 10, 200).
season('bell peppers', 11, 100).
season('bell peppers', 12, 50).

season(parsnip, 9, 200).
season(parsnip, 10, 200).
season(parsnip, 11, 125).
season(parsnip, 12, 50).

season(leeks, 9, 200).
season(leeks, 10, 200).
season(leeks, 11, 200).
season(leeks, 12, 100).

season(purslane, 9, 200).
season(purslane, 10, 50).
season(purslane, 11, 0).
season(purslane, 12, 0).

season('small radishes', 9, 200).
season('small radishes', 10, 200).

season(radishes, 9, 200).
season(radishes, 10, 200).
season(radishes, 11, 100).
season(radishes, 12, 50).

season('brussels sprouts', 9, 50).
season('brussels sprouts', 10, 150).
season('brussels sprouts', 11, 200).
season('brussels sprouts', 12, 200).

season(beetroot, 9, 200).
season(beetroot, 10, 200).
season(beetroot, 11, 200).
season(beetroot, 12, 100).

season(cucumbers, 9, 200).
season(cucumbers, 10, 100).
season(cucumbers, 11, 50).
season(cucumbers, 12, 50).

season('black salsify', 9, 50).
season('black salsify', 10, 200).
season('black salsify', 11, 200).
season('black salsify', 12, 200).

season(celeriac, 9, 200).
season(celeriac, 10, 200).
season(celeriac, 11, 200).
season(celeriac, 12, 100).

season(asparagus, 9, 0).
season(asparagus, 10, 0).
season(asparagus, 11, 0).
season(asparagus, 12, 0).

season(spinach, 9, 200).
season(spinach, 10, 200).
season(spinach, 11, 50).
season(spinach, 12, 50).

season(swedes, 9, 50).
season(swedes, 10, 200).
season(swedes, 11, 200).
season(swedes, 12, 200).

season(turnips, 9, 50).
season(turnips, 10, 200).
season(turnips, 11, 150).
season(turnips, 12, 50).

season(tomatoes, 9, 200).
season(tomatoes, 10, 200).
season(tomatoes, 11, 100).
season(tomatoes, 12, 50).

season('jerusalem artichoke', 9, 200).
season('jerusalem artichoke', 10, 200).
season('jerusalem artichoke', 11, 200).
season('jerusalem artichoke', 12, 50).

season('red cabbage', 9, 200).
season('red cabbage', 10, 200).
season('red cabbage', 11, 200).
season('red cabbage', 12, 100).

season('white cabbage', 9, 200).
season('white cabbage', 10, 200).
season('white cabbage', 11, 200).
season('white cabbage', 12, 100).
season('pointed cabbage', 9, 200).
season('pointed cabbage', 10, 200).
season('pointed cabbage', 11, 200).
season('pointed cabbage', 12, 100).

season('savoy cabbage', 9, 200).
season('savoy cabbage', 10, 200).
season('savoy cabbage', 11, 200).
season('savoy cabbage', 12, 100).

season('sweet corn', 9, 200).
season('sweet corn', 10, 200).
season('sweet corn', 11, 50).
season('sweet corn', 12, 50).

season(courgette, 9, 200).
season(courgette, 10, 200).
season(courgette, 11, 100).
season(courgette, 12, 50).

season(onions, 9, 200).
season(onions, 10, 200).
season(onions, 11, 100).
season(onions, 12, 100).

% ----------------------------------------------------------------------

aromatic(garlic).
aromatic('red onion').
aromatic('green onion').
aromatic(ginger).
aromatic(shallots).
aromatic(scallions).
aromatic('bay leaf').

herb(tarragon).
herb(thyme).
herb(parsley).
herb('flat-leaf parsley').
herb(mint).
herb(dill).
herb(coriander).
herb(chervil).
herb(chives).
herb(marjoram).
herb(rosemary).

spice(nutmeg).
spice('curry powder').
spice(cumin).
spice(turmeric).
spice(saffron).
spice('garlic powder').
spice('mustard seeds').
spice('garam masala').
spice('coriander seeds').
spice('poppy seeds').
spice(cardamom).
spice('celery seeds').
spice(salt). % Not a spice.
spice('black pepper').
spice('white pepper').
spice('red pepper flakes').

fat('olive oil').
fat('peanut oil').
fat('canola oil'). % Rapsöl
fat('grapeseed oil').
fat('vegetable oil').
fat(butter).
fat('brown butter').

acid('red wine vinegar').
acid('white wine vinegar').
acid('balsamic vinegar').
acid('sherry vinegar').
acid(lemon).
acid(lime).
acid(orange).

cheese(Ingredient) :-
    sub_atom(Ingredient, _, _, 0, cheese).

vegetable(cauliflower).
vegetable(pumpkin).
vegetable(celery).
