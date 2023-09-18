function [x] = LU_solve(A, b)
%Use LU to solve the system Ax=b
%   return x

% A - m x n
[m, n] = size(A);

[L, U] = LU(A);

% y : Ly = b
% y - m x 1
y = zeros(m,1);
for i = 1:m
    y(i) = b(i);
    for j = 1:(i-1)
        y(i) = y(i) - L(i,j)*y(j);
    end
    y(i) = (1 / L(i,i)) * y(i);
end

% Ux = b
% x - n x 1
x = zeros(n, 1);
for i = n:-1:1
    x(i) = y(i);
    for j = n:-1:(i+1)
        x(i) = x(i) - U(i,j)*x(j);
    end
    x(i) = (1 / U(i,i)) * x(i);
end

% return x
end % end LU_solve