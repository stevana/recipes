:- discontiguous
       recipe/1,
       meal/2,
       time/2,
       contains/2,
       diet/2,
       carb/2.

% ----------------------------------------------------------------------
% Recipes

% Gulash
recipe(gulash).
meal(dinner, gulash).
time(180, gulash).
contains(oil, gulash).
contains(onion, gulash).
contains('paprika powder', gulash).
contains(mushrooms, gulash).
contains(meat, gulash).
contains('potato starch', gulash).
diet(vegan, gulash).
carb(knödel, gulash).
carb(pasta, gulash).

% Knödel
recipe(knödel).
contains(yeast, knödel).
contains(milk, knödel).
contains('stale bread', knödel).
contains(egg, knödel).

% Chili
recipe(chili).
meal(dinner, chili).
time(120, chili).
contains(oil, chili).
contains('tomato paste', chili).
contains(onion, chili).
contains(carrot, chili).
contains(paprika, chili).
contains(chili, chili).
contains('dark chocolate', chili).
contains(coffee, chili).
contains(vodka, chili).
contains(bean, chili).
contains('cheddar cheese', chili). % topping?
diet(vegan, chili).
carb(rice, chili).
carb(nachos, chili).

% Bolognese
recipe(bolognese).
meal(dinner, bolognese).
time(120, bolognese).
contains(oil, bolognese).
contains('tomato paste', bolognese).
contains(onion, bolognese).
contains(carrot, bolognese).
contains(celery, bolognese).
contains('minced meat', bolognese).
contains('white wine', bolognese).
contains('chicken stock', bolognese).
contains(milk, bolognese).
contains('parmesan chesse', bolognese).
diet(vegetarian, bolognese).
carb(pasta, bolognese).

% Courgette pasta
recipe('courgette pasta').
meal(lunch, 'courgette pasta').
meal(dinner, 'courgette pasta').
time(30, 'courgette pasta').
contains(oil, 'courgette pasta').
contains('red onion', 'courgette pasta').
contains(ricotta, 'courgette pasta').
contains('parmesan cheese', 'courgette pasta').
diet(vegetarian, 'courgette pasta').
carb(pasta, 'courgette pasta').

% Menemen
recipe(menemen).
meal(breakfast, menemen).
meal(dinner, menemen).
time(15, menemen).
contains(oil, menemen).
contains('green pepper', menemen).
contains(tomato, menemen).
contains(egg, menemen).
contains('white cheese', menemen).
diet(vegetarian, menemen).
carb(bread, menemen).

% Moussaka
recipe(moussaka).
meal(dinner, moussaka).
time(120, moussaka).
contains('olive oil', moussaka).
contains(onion, moussaka).
contains(potatoes, moussaka).
contains(aubergine, moussaka).
contains('lamb mince', moussaka).
contains(garlic, moussaka).
contains(cinnamon, moussaka).
contains(allspice, moussaka).
contains('bay leaf', moussaka).
contains('red wine', moussaka).
contains(tomatoes, moussaka).
contains(butter, moussaka).
contains(flour, moussaka).
contains(milk, moussaka).
contains('parmesan cheese', moussaka).
contains('greek yogurt', moussaka).
contains(egg, moussaka).
diet(vegetarian, moussaka).
carb(potatoes, moussaka). % XXX: Printed twice...

% Paprikash
recipe(paprikash).
meal(dinner, paprikash).
time(60, paprikash).
contains(chicken, paprikash).
contains(mushrooms, paprikash).
contains(onions, paprikash).
contains(butter, paprikash).
contains('sweet paprika', paprikash).
contains('green peppers', paprikash).
contains(tomatoes, paprikash).
contains(garlic, paprikash).
contains(flour, paprikash).
contains('sour cream', paprikash).
diet(vegetarian, paprikash).
carb(spätzle, paprikash).
carb(pasta, paprikash).

recipe(spätzle).
contains(eggs, spätzle).
contains(flour, spätzle).
contains(salt, spätzle).

% Mushroom soup
recipe('mushroom soup').
meal(dinner, 'mushroom soup').
time(30, 'mushroom soup').
contains(mushrooms, 'mushroom soup').
contains(butter, 'mushroom soup').
contains(shallots, 'mushroom soup').
contains(salt, 'mushroom soup').
contains('black pepper', 'mushroom soup').
contains(butter, 'mushroom soup').
contains(flour, 'mushroom soup').
contains(milk, 'mushroom soup').
contains('bay leaf', 'mushroom soup').
contains(onions, 'mushroom soup').
contains(cloves, 'mushroom soup').
contains(nutmeg, 'mushroom soup').
contains(cream, 'mushroom soup').
contains(milk, 'mushroom soup').
contains(croutons, 'mushroom soup').
contains(butter, 'mushroom soup').
contains(parsley, 'mushroom soup').
contains('dry sherry', 'mushroom soup').
diet(vegetarian, 'mushroom soup').
carb(bread, 'mushroom soup').

% ----------------------------------------------------------------------
% Dietary facts

% People who eat meat also eat what vegetarians eat.
diet(meat, D) :- diet(vegetarian, D).

% People who eat vegetarian also eat what vegans eat.
diet(vegetarian, D) :- diet(vegan, D).

% Lactose intolerant people eat everything that doesn't contain lactose
% ingredients.
diet(lactose, D) :-
    diet(vegan, D),
    findall(I, contains(I, D), Is),
    maplist(not_lactose_ingredient, Is).

not_lactose_ingredient(I) :- not(lactose_ingredient(I)).

lactose_ingredient(milk).
lactose_ingredient(ricotta).
lactose_ingredient('white cheese').
lactose_ingredient('cheddar cheese').

% ----------------------------------------------------------------------
% Derived facts

dish(D) :- recipe(D), not(carb(D, _)).

contains_ingredients(D, []) :-
    recipe(D).
contains_ingredients(D, [I|Is]) :-
	  contains(I, D), contains_ingredients(D, Is).
