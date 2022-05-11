% 8クイーン問題のルール
% 盤面に8つのクイーンがある
% 各クイーンの位置は、1~8行目、1~8列目である
% どのクイーンも同じ行、同じ列には存在しない
% どのクイーンも同じ対角線との平行線上には存在しない

eight_queen(Board):-
    % 盤面に8つのクイーンがある
    length(Board, 8),
    valid_board(Board),
    
    rows(Board, Rows),
    cols(Board, Columns),
    diags1(Board, Diagonal1),
    diags2(Board, Diagonal2),

    fd_all_different(Rows),
    fd_all_different(Columns),
    fd_all_different(Diagonal1),
    fd_all_different(Diagonal2).


% クイーンが妥当かどうか
valid_queen((Row, Column)):-
    Range = [1,2,3,4,5,6,7,8],
    member(Row, Range), member(Column, Range).
% ボードのクイーンが全て妥当かどうか
valid_board([]).
valid_board([Head|Tail]):-
    valid_queen(Head),
    valid_board(Tail).

% クイーンがいる行とリストの要素が一致する時、真になる
rows([], []).
rows([(Row, _)|QueensTail], [Row|RowTail]):-
    rows(QueensTail, RowTail).

% クイーンがいる列とリストの要素が一致する時、真になる
cols([], []).
cols([(_, Col)|QueensTail], [Col|ColTail]):-
    cols(QueensTail, ColTail).

% 北西から南東方向への対角線
diags1([], []).
diags1([(Row, Col)|QueensTail], [Diagonal|DiagonalTail]):-
    Diagonal is Col - Row,
    diags1(QueensTail, DiagonalTail).
% 北東から南西方向への対角線
diags2([], []).
diags2([(Row, Col)|QueensTail], [Diagonal|DiagonalTail]):-
    Diagonal is Col + Row,
    diags2(QueensTail, DiagonalTail).



% =========
% OPTIMIZED
% =========

valid_queen_by_column((Row, Col)) :- member(Col, [1,2,3,4,5,6,7,8]).
valid_board_by_queen_column([]).
valid_board_by_queen_column([Head|Tail]) :- valid_queen_by_column(Head), valid_board_by_queen_column(Tail).

optimized_eight_queen(Board) :-
    Board = [(1,_), (2,_), (3,_), (4,_), (5,_), (6,_), (7,_), (8,_)],
    valid_board_by_queen_column(Board),

    cols(Board, Cols),
    diags1(Board, Diagonal1),
    diags2(Board, Diagonal2),

    fd_all_different(Cols),
    fd_all_different(Diagonal1),
    fd_all_different(Diagonal2).
