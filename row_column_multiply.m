function [c] = row_column_multiply(row,column)
%Multiply row matrix by column matrix
% return c = row*column
% row - 1xm
% column - mx1
[m, ~] = size(column);

% c = sum( A(1,i)*B(i,1) ) i ∈ [1,m]
% initialize c
c = 0;
for i = 1:m
    c = c + row(1,i) * column(i, 1);
end
% return c = row*column
end % end of row_column_multiply