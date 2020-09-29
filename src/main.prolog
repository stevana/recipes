:- initialization main.
:- consult(library).

create_directory(Dir) :-
    exists_directory(Dir), !.
create_directory(Dir) :-
    make_directory(Dir).

main :-
    create_directory('html'),
    findall(Q, query_name(_, Q), Qs),
    write_html_queries(Qs),
    findall(R, recipe(R), Rs),
    write_html_dish(Rs),
    halt.
