function [Q,R] = QR(A)
%Take QR factorization of A
    [~,n] = size(A);
    if rank(A) ~= n    % error: matrix does not have full column rank
        Q = "Matrix Does Not Have Full Column Rank";
        return; % return error message
    end
    [Q,P] = gram_schmidt(A);
    R = zeros(n,n);

    R(1,1) = norm(A(:,1));
    for j=2:n
        R(j,j) = norm(A(:,j) - P(:,j-1));
        for i=(j-1):-1:1
            R(i,j) = A(:,j)'*Q(:,i);
        end
    end
end