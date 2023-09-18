function [x] = least_squares(A,b)
%Solve Least Squares using QR factorization
    [~, n] = size(A);
    if rank(A) ~= n    % error: matrix does not have full column rank
        x = "Matrix Does Not Have Full Column Rank";
        return; % return error message
    end

    % QR Factorization
    [Q, R] = QR(A);

    % Rx = Qᵀb
    Rx = Q'*b;

    % initialize x as Rx
    x = Rx;

    %x(n) = x(n) / R(n,n);

    % Back Substitution
    % for each row from bottom to top
    for i = n:-1:1
        % for each value in row from left to right of diagonal
        for j = n:-1:(i+1)
            x(i) = x(i) - x(j) * R(i,j);
        end % end for
        x(i) = x(i) / R(i,i);
    end % end for

    % return x
end % end least_squares