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
:- consult('ingredients/garlic').
:- consult('ingredients/grapefruit').
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

season(cauliflower, 9, 200).
season(cauliflower, 10, 200).

season('bush bean', 9, 200).
season('bush bean', 10, 200).
season('runner bean', 9, 200).
season('runner bean', 10, 200).

season(broccoli, 9, 200).
season(broccoli, 10, 150).

% champignon mushrooms
season(mushrooms, 9, 200).
season(mushrooms, 10, 200).

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

season('bell peppers', 9, 200).
season('bell peppers', 10, 200).

season(parsnip, 9, 200).
season(parsnip, 10, 200).

season(leek, 9, 200).
season(leek, 10, 200).

season(purslane, 9, 200).
season(purslane, 10, 50).

season('small radishes', 9, 200).
season('small radishes', 10, 200).

season(radishes, 9, 200).
season(radishes, 10, 200).

season('brussels sprouts', 9, 50).
season('brussels sprouts', 10, 150).

season(beetroot, 9, 200).
season(beetroot, 10, 200).

season('red cabbage', 9, 200).
season('red cabbage', 10, 200).

season(cucumbers, 9, 200).
season(cucumbers, 10, 100).

season('black salsify', 9, 50).
season('black salsify', 10, 200).

season(celeriac, 9, 200).
season(celeriac, 10, 200).

season(asparagus, 9, 0).
season(asparagus, 10, 0).

season(spinach, 9, 200).
season(spinach, 10, 200).

season(swedes, 9, 50).
season(swedes, 10, 200).

season(turnips, 9, 50).
season(turnips, 10, 200).

season(tomatoes, 9, 200).
season(tomatoes, 10, 200).

season('jerusalem artichoke', 9, 200).
season('jerusalem artichoke', 10, 200).

season('white cabbage', 9, 200).
season('white cabbage', 10, 200).
season('pointed cabbage', 9, 200).
season('pointed cabbage', 10, 200).

season('savoy cabbage', 9, 200).
season('savoy cabbage', 10, 200).

season('sweet corn', 9, 200).
season('sweet corn', 10, 200).

season(courgette, 9, 200).
season(courgette, 10, 200).

season(onion, 9, 200).
season(onion, 10, 200).

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
