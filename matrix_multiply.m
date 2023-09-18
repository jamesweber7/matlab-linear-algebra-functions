function [C] = matrix_multiply(A,B)
%Multiply two matrices, A and B
% return C = A*B

% A - m x n
[m, ~] = size(A);
% B - n x r
[~, r] = size(B);
% C - m x r
C = zeros(m, r);

for i = 1:m
    % row i
    row = A(i,:);
    for j = 1:r
        % column j
        column = B(:,j);
        % C(i,j) = A(i,:)*B(:,j)
        % multiply ith row of A with jth column of B
        C(i,j) = row_column_multiply(row,column);
    end
end

end % end of matrix_multiply