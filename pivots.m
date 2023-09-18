function [k] = pivots(A)
%return number of pivots in REF matrix

% A - m x n
[m, n] = size(A);

% number of pivots
k = 0;

%pivot
p = [1,1];

% exception: zero matrix
if equals(A(p(1), p(2)), 0)
    return;
end

% iterate through pivots
while p(1) <= m && p(2) <= n
    if ~equals(A(p(1), p(2)), 0)
        % pivot found
        k = k + 1;
        % iterate pivot down
        p(1) = p(1) + 1;
    end
    % iterate pivot right
    p(2) = p(2) + 1;
end % end while

end % end pivots