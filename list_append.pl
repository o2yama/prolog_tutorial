list_append([], List, List).
list_append([Head|Tail1], List2, [Head|Tail3]):-
    list_append(Tail1, List2, Tail3).
