any(_, [], _) :- false.
any(P, [H|T], X) :-
    ( call(P, H) -> X = H
    ; any(P, T, X)
    ).

map_keys(_F, [], []).
map_keys(F, [K-V|KVs], [J-V|JVs]) :-
    call(F, K, J),
    map_keys(F, KVs, JVs).

map_values(_F, [], []).
map_values(F, [K-V|KVs], [K-W|KWs]) :-
    call(F, V, W),
    map_values(F, KVs, KWs).

intersections([], []).
intersections([X|Xs], Ys) :- intersections_(Xs, X, Ys).

intersections_([], Acc, Acc).
intersections_([X|Xs], Acc, Ys) :-
    intersection(X, Acc, Acc1),
    intersections_(Xs, Acc1, Ys).

create_directory(Dir) :-
    exists_directory(Dir), !.
create_directory(Dir) :-
    make_directory(Dir).
