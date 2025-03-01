% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...

value(1..9).
row(1..9).
column(1..9).

% define subgrids
subgrids(R,C,S) :- row(R), column(C), S = 1+(((R-1)/3)*3+((C-1)/3)).

% subgrid 1
subgrid(1,1,1). subgrid(1,2,1). subgrid(2,1,1). subgrid(2,2,1).
% subgrid 2
subgrid(1,3,2). subgrid(1,4,2). subgrid(2,3,2). subgrid(2,4,2).
% subgrid 3
subgrid(3,1,3). subgrid(3,2,3). subgrid(4,1,3). subgrid(4,2,3).
% subgrid 4
subgrid(3,3,4). subgrid(3,4,4). subgrid(4,3,4). subgrid(4,4,4).

% the cell [R,C] contains number N, each cell has one number
1{sudoku(R,C,N):value(N)}1 :- row(R), column(C).

% for initial values
sudoku(R,C,N) :- initial(R,C,N).

% constraints
:- sudoku(R,C,N), sudoku(A,C,N), R!=A. % each number in a row is unique
:- sudoku(R,C,N), sudoku(R,B,N), C!=B. % each number in a column is unique
:- sudoku(R,C,N), sudoku(A,B,N), subgrids(R,C,S), subgrids(A,B,S), (R,C)!=(A,B). % each number in a subgrid is unique

#show sudoku/3.