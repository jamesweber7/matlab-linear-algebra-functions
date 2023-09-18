function [Q, P] = gram_schmidt(X)
% Take gram schmidt of augmented matrix X
    [m, n] = size(X);
    if rank(X) ~= n    % error: matrix does not have full column rank
        Q = "Matrix Does Not Have Full Column Rank";
        return; % return error message
    end
    Q = zeros(m,n);
    P = zeros(m,n-1);

    % first column
    Q(:,1) = X(:,1)/norm(X(:,1));
    if n < 2
        return;
    end
    P(:,1) = X(:,2)'*Q(:,1)*Q(:,1);
    % n-2 middle columns
    for i=2:(n-1)
        Q(:,i) = (X(:,i) - P(:,i-1)) / norm(X(:,i) - P(:,i-1));
        for j=1:i
            P(:,i) = P(:,i) + X(:,i+1)'*Q(:,j)*Q(:,j);
        end
    end
    % last column
    Q(:,n) = (X(:,n) - P(:,n-1)) / norm(X(:,n) - P(:,n-1));
end