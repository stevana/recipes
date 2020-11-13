:- initialization main.
:- consult(library).

main :-
    create_directory('html'),
    generate_html(),
    halt.
