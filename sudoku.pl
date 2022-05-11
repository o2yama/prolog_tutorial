% 数独を解くときも、アルゴリズムではなく、ルールだけ与えてやれば解いてくれる。

sudoku(Puzzle, Solution) :-
    % ルール１：パズルが解けた場合、パズルを埋める数字と解の数字は同じでなければならない。
    Solution = Puzzle, 
    % ルール2：ボードは16マス、すべてのマス(数字)は1~4で構成されなければいけない.
    Puzzle = [S11, S12, S13, S14,
                S21, S22, S23, S24,
                S31, S32, S33, S34,
                S41, S42, S43, S44],
    fd_domain(Puzzle, 1, 4), 
    % ルール3：ボードは行、列、4マス正方ブロックで構成される。
    Row1 = [S11, S12, S13, S14],
    Row2 = [S21, S22, S23, S24],
    Row3 = [S31, S32, S33, S34],
    Row4 = [S41, S42, S43, S44],
    Col1 = [S11, S21, S31, S41],
    Col2 = [S12, S22, S32, S42],
    Col3 = [S13, S23, S33, S43],
    Col4 = [S14, S24, S34, S44],
    Square1 = [S11, S12, S21, S22],
    Square2 = [S13, S14, S23, S24],
    Square3 = [S11, S12, S21, S22],
    Square4 = [S11, S12, S21, S22],
    % ルール4：全ての行、列、正方ブロックは異なる1~4の数字で埋られている必要がある
    valid([Row1, Row2, Row3, Row4, Col1, Col2, Col3, Col4, Square1, Square2, Square3, Square4]).

valid([]).
valid([Head|Tail]) :-
    fd_all_different(Head), % リストの中身が全て異なる時、Trueを返す関数
    valid(Tail).
