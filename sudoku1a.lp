% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...

value(1..4).
row(1..4).
column(1..4).

% the cell [R,C] contains number N, each cell has one number
1{sudoku(R,C,N):value(N)}1 :- row(R), column(C).

% for initial values
sudoku(R,C,N) :- initial(R,C,N).

% constraints
:- sudoku(R,C,N), sudoku(A,C,N), R!=A. % each number in a row is unique
:- sudoku(R,C,N), sudoku(R,B,N), C!=B. % each number in a column is unique

#show sudoku/3.