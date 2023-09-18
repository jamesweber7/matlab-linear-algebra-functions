function [A] = row_op_2(A, alpha, row_index)
%Perform Elementary Row Operation type 2 on A
% E2: row ← alpha*row
%   return E2*A
row = A(row_index, :);
A(row_index, :) = alpha*row;
end