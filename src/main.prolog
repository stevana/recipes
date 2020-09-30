:- initialization main.
:- consult(library).

create_directory(Dir) :-
    exists_directory(Dir), !.
create_directory(Dir) :-
    make_directory(Dir).

main :-
    create_directory('html'),
    generate_html(),
    halt.
