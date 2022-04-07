different(red, green).
different(red, blue).
different(green, red).
different(green, blue).
different(blue, green).
different(blue, red).

coloring(Alabama, Florida, Georgia, Mississippi, Tennessee) :- 
    different(Mississippi, Tennessee),
    different(Alabama, Tennessee),
    different(Georgia, Tennessee),
    different(Mississippi, Alabama),
    different(Alabama, Georgia),
    different(Alabama, Florida),
    different(Georgia, Florida).
