function [A] = row_op_3(A, alpha, row1_index, row2_index)
%Perform Elementary Row Operation type 3 on A
% E3: row1 ← row1 + alpha*row2
%   return E3*A
row1 = A(row1_index, :);
row2 = A(row2_index, :);
A(row1_index, :) = row1 + alpha*row2;
end