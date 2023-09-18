function [x] = RREF_solve(A,b)
%Use RREF to solve the system Ax=b
%   return x
%       one solution : []
%       one solution : x
%       infinitely many solutions: [parametric vectors]
%           e.g. return [[v₀],[v₁],...[vₜ]] s.t. x = [v₀]+x₁[v₁]+...xₜ[vₜ]

% A - m x n
[m, n] = size(A);
% augment matrix [A|b]
augmented = [A b];

rref = RREF(augmented);

% rref = lhs | rhs
lhs = rref(:, 1:(end-1));
rhs = rref(:, end);

% number of pivots
number_of_pivots = pivots(lhs);

% check for no solution
% check for zero row with non-zero rhs
no_solution = false;
% for each zero row
for i = (number_of_pivots+1):m
    % if rhs ≠ 0 no_solution = true
    no_solution = no_solution || ~equals(rhs(i,1),0);
end % end for

if no_solution
    % no solution
    % return empty []
    x = [];
elseif number_of_pivots == n
    % one solution
    % return x = rhs
    x = rhs;
else
    % p < n
    % infinitely many solutions
    
    % instantiate vectors: n nx1 vectors representing x1-n 
    vectors = eye(n);
    % instantiate rows: columns that are dependent on other columns = 1
    rows = zeros(n, 1);

    % pivot
    p = [1, 1];
    
    % iterate through pivots
    while p(1) <= m && p(2) <= n
        if ~equals(A(p(1), p(2)), 0)
            % iterate through elements right of pivot
            for j = (p(2)+1):n
                % A(p(1), j) right of pivot
                
                if ~equals(lhs(p(1), j), 0)
                    vectors(p(2),j) = -1*lhs(p(1),j);
                    rows(j) = true;
                end
            end            
            % iterate pivot down
            p(1) = p(1) + 1;
        end
        % iterate pivot right
        p(2) = p(2) + 1;
    end % end while

    v = 1;
    for j = 1:n
        if rows(j)
            v = v+1;
        end
    end
    x = zeros(n,v);
    x(1:m,1) = rhs;
    v = 2;
    for j = 1:n
        if rows(j)
            x(:,v) = vectors(:,j);
            v = v + 1;
        end
    end
end % end if-else
end % end RREF_solve