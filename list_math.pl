count(0, []).
count(Count, [Head|Tail]) :- count(TailCount, Tail), Count is TailCount + 1.

sum(0, []).
sum(Total, [Head|Tail]) :- sum(Sum, Tail), Total is Head + Sum.

average(Average, List) :- sum(Sum, List), count(Count, List), Average is Sum / Count.

% count(What, [1,2,3,4,5,6,7,45,57,25,3]).
% sum(What, [12,34,5,21,1,3,5,7,7,5,8,2]).
% average(What, [3,5,7,8,8,9,6,3,5413,67,254,324,1,435,6,2]).
