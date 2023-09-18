function [L,U] = LU(A)
%Find the LU factorization of the matrix A
% return    L = lower matrix E₃⁻¹E₂⁻¹E₁⁻¹
%           U = upper matrix E₃E₂E₁A

% A - m x n
[m,n] = size(A);

% r = number of pivots = number of elements on diagonal
r = min(m,n);

% instantiate L as I : m x m Identity Matrix
L = eye(m);
% instantiate U as A
U = A;

% iterate through elements below diagonal
% perform type 3 row operations on U and L
% for each column with a pivot
for j = 1:r
    % for each row below diagonal
    for i = (j+1):m
        % perform type 3 row op E on U to zero U(i,j)
        % perform inverse E⁻¹ on L
        if ~equals(U(i,j), 0)
            % type 3 row op
            % E = row i ← row i + alpha*row j
            alpha = -1*U(i,j)/U(j,j);
            U = row_op_3(U, alpha, i, j);
            % E⁻¹ = row i ← row i + (-1*alpha)*row j
            E_inv = row_op_3(eye(m), -1*alpha, i, j);
            % L = L*E⁻¹
            L = matrix_multiply(L, E_inv);
        end % end if

    end % end row for
end % end column for

end % end LU