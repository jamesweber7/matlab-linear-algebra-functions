function [A] = RREF(A)
%Compute RREF of A
% return A = RREF(A)

% A - m x n
[m,n] = size(A);

% first compute REF of A
A = REF(A);

%pivot
p = [1,1];
% exception: zero matrix
if equals(A(p(1), p(2)), 0)
    return;
end

while p(1) <= m && p(2) <= n
    if ~equals(A(p(1), p(2)), 0)
        % zero out elements above pivot
        for i = (p(1)-1):-1:1
            % A(i,p(2)) above pivot
            % zero out element
            % row i ← row i + (-A(i,j) * row p(1)
            A = row_op_3(A, -1*A(i,p(2)), i, p(1));
        end
        % iterate pivot down
        p(1) = p(1) + 1;
    end
    % iterate pivot right
    p(2) = p(2) + 1;
end % end while

% return A = RREF(A)
end % end of RREF