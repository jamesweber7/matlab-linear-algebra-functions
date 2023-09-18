function [A] = row_op_1(A, row1_index, row2_index)
%Perform Elementary Row Operation type 1 on A
% E1: row1 ⟷ row2
%   return E1*A
row1 = A(row1_index, :);
row2 = A(row2_index, :);
A(row1_index, :) = row2;
A(row2_index, :) = row1;
end