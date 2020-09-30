:- use_module(library(http/html_write)).

% ----------------------------------------------------------------------
% Pretty printing to stdout

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

print_table1(P) :-
    findall(X, call(P, X), Xs),
    term_to_atom(P, Name),
    writeln(Name),
    writeln("========"),
    maplist(writeln, Xs).

map_list_to_pairs2(_, _, [], []).
map_list_to_pairs2(P, Q, [X|Xs], [K-V|KVs]) :-
    call(P, X, K),
    call(Q, X, V),
    map_list_to_pairs2(P, Q, Xs, KVs).

print_table2(R) :-
    term_to_atom(R, Name),
    writeln(Name),
    writeln("========"),
    findall([X, Y], call(R, X, Y), XYs),
    map_list_to_pairs2(nth1(1), nth1(2), XYs, Ps),
    group_pairs_by_key(Ps, Qs),
    print(Qs).

flip(R, X, Y) :- call(R, Y, X).

portray([]).
portray([K-Vs|KVs]) :-
    writeln(K),
    writeln("----"),
    maplist(writeln, Vs),
    nl,
    portray(KVs).

% ----------------------------------------------------------------------
% Pretty printing HTML

write_html_page(File, Head, Body) :-
    write_html_page(File, default, Head, Body).
write_html_page(File, Style, Head, Body) :-
    phrase(page(Style, Head, Body), HTML),
    open(File, write, Handle),
    print_html(Handle, HTML),
    close(Handle).

replace_space([], []).
replace_space([S|Ss], [T|Ts]) :-
    atomic_list_concat(Words, ' ', S),
    atomic_list_concat(Words, '_', T),
    replace_space(Ss, Ts).

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

write_html_dishes(File, Dishes) :-
    findall(N, query_name(N, _), Ns),
    replace_space(Dishes, Dishes2),
    write_html_page(File,
                    [title('Food database'),
                     style('#navigation ul {list-style-type: none; margin: 0; padding: 0;}')],
                    [h1('Food database'),
                     div(id(navigation),
                         ul(\items(Ns))),
                     ul(\items(Dishes2))]). % Maybe we want to send both the spaced and
                                            % underscored version of the dish here.

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

items([])     --> [].
items([I|Is]) -->
    html(li(a(href(I + '.html'), I))),
    items(Is).

ingredients([])     --> [].
ingredients([I|Is]) -->
    html(li(I)),
    ingredients(Is).

generate_html :-
    findall(Q, query_name(_, Q), Qs),
    write_html_queries(Qs),
    findall(R, recipe(R), Rs),
    write_html_dish(Rs).
