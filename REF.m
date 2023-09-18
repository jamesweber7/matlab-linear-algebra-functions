function [A] = REF(A)
%Compute REF of A
% return A = REF(A)

% A - m x n
[m,n] = size(A);

% pivot
p = 1;
% for each column
for j = 1:n
    % find non-zero element in column j
    % do nothing if column j is zero vector
    % make A(i,j) pivot, and zero out elements 
    %   below A(i,j) if column j has non-zero
    %   element A(i,j)

    % find i s.t. A(i,j) ≠ 0
    i = p;
    while i <= m && equals(A(i,j), 0)
        i = i + 1;
    end
    % if non-zero element found
    if i <= m
        % A(i,j) = non-zero element in column j

        % move row i to pivot at row p
        if i ~= p
            % swap row i with row p
            A = row_op_1(A,i,p);
            % update row index i
            i = p;
        end
        % increment pivot p
        p = p + 1;
        % make A(i,j) = 1
        % row i ← (1 / A(i,j)) * row i
        A = row_op_2(A, 1 / A(i,j), i);

        % make all values below A(i,j) = 0
        if i < m
            for r = (i+1):m
                if ~equals(A(r,j), 0)
                    % row r ← row r + (-1*A(r,j)) * row i
                    A = row_op_3(A,-1*A(r,j), r, i);
                end % end if
            end % end for
        end % end if

    end % end if
end % end for

end % end of REF