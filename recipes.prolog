:- use_module(library(http/html_write)).
:- initialization main.
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
contains(mushroom, gulash).
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
contains(cellery, bolognese).
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

% ----------------------------------------------------------------------
% Pretty printing

list_dishes() :-
    findall(D, dish(D), Ds),
    maplist(writeln, Ds).

list_ingredients(D) :-
    findall(I, contains(I, D), Is),
    writeln(D),
    maplist(print_ingredient, Is),
    findall(C, carb(C, D), Cs),
    maplist(print_carbs, Cs).

print_carbs(C) :-
    writeln(C),
    findall(I, contains(I, C), Is),
    maplist(print_ingredient, Is).

print_ingredient(I) :-
    format('  * ~w~n', [I]).

% ----------------------------------------------------------------------
% Queries

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

% ----------------------------------------------------------------------
% HTML

write_html_page(File, Head, Body) :-
    write_html_page(File, default, Head, Body).
write_html_page(File, Style, Head, Body) :-
    phrase(page(Style, Head, Body), HTML),
    open(File, write, Handle),
    print_html(Handle, HTML),
    close(Handle).

write_html_dishes(File, Dishes) :-
    findall(N, query_name(N, _), Ns),
    write_html_page(File,
        [title('Food database'),
         style('#navigation ul {list-style-type: none; margin: 0; padding: 0;}')],
        [h1('Food database'),
         div(id(navigation),
             ul(\items(Ns))),
         ul(\items(Dishes))]).

items([])     --> [].
items([I|Is]) -->
    html(li(a(href(I + '.html'), I))),
    items(Is).

query_name("index", dish).
query_name("fast_dinner", fast_dinner(_)).
query_name("pasta_dishes", pasta_dishes).
query_name("egg_breakfast", egg_breakfast).
query_name("slow_dinner", slow_dinner(_)).

write_html_queries([]).
write_html_queries([Q|Qs]) :-
    findall(D, call(Q, D), Ds),
    query_name(Name, Q),
    atomics_to_string(['html/', Name, '.html'], F),
    write_html_dishes(F, Ds),
    write_html_queries(Qs).

write_html_dish([]).
write_html_dish([R|Rs]) :-
    atomic_list_concat(Words, ' ', R),
    atomic_list_concat(Words, '_', Name),
    atomics_to_string(['html/', Name, '.html'], F),
    write_html_recipe(F, R),
    write_html_dish(Rs).

write_html_recipe(File, R) :-
    findall(I, contains(I, R), Is),
    findall(N, query_name(N, _), Ns),
    findall(C, carb(C, R), Cs),
    partition(recipe, Cs, Cs1, Cs2),
    write_html_page(File,
                    [title('Food database'),
                     style('#navigation ul {list-style-type: none; margin: 0; padding: 0;}')],
                    [h1('Food database'),
                     div(id(navigation),
                         ul(\items(Ns))),
                     h2(R),
                     ul(\ingredients(Is)),
                     ul([\items(Cs1),
                        \ingredients(Cs2)])]).

ingredients([])     --> [].
ingredients([I|Is]) -->
    html(li(I)),
    ingredients(Is).

main :-
    findall(Q, query_name(_, Q), Qs),
    write_html_queries(Qs),
    findall(R, recipe(R), Rs),
    write_html_dish(Rs),
    halt.
