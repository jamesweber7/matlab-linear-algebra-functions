% James Weber
% Honors Contract for MAT 343
% MATLAB functions that perform Linear Algebra Operations
% Functions:
%   Matrix Multiplication - matrix_multiply.m
%   RREF - RREF.m
%   Solving systems using RREF
%   LU factorization (section 1.5) - LU.m
%   Solving systems using the LU (section 1.5) - LU_solve.m
%   QR factorization  (section 5.6) - QR.m
%   Solving least squares problems using the QR factorization (Section 5.6)
%       - least_squares.m

% Matrix Multiplication - matrix_multiply.m
m = 12;
n = 12;
A = rand(m,n);
disp("A : ");
disp(A);
B = rand(m,n);
disp("B : ");
disp(B);
b = rand(m,1);
disp("b : ");
disp(B);

C = matrix_multiply(A, B);
disp("matrix_multiply(A,B) result : ");
disp(C);
C2 = A*B;
disp("A*B result : ");
disp(C2);
Error = abs(C-C2);
disp("Error : ");
disp(Error);

% RREF - RREF.m
C = RREF(A);
disp("RREF(A) result : ");
disp(C);
C2 = rref(A);
disp("rref(A) result : ");
disp(C2);
Error = abs(C-C2);
disp("Error : ");
disp(Error);

%   Solving systems using RREF
% Ax=b
x = RREF_solve(A,b);
disp("RREF_solve(A,b) result : ");
disp(x);
[result_m, result_n] = size(x);

if result_m == n && result_n == 1
    % one solution
    b2 = matrix_multiply(A,x);
    disp("A*x : ");
    disp(b2);
    Error = abs(b-b2);
    disp("Error : ");
    disp(Error);
elseif result_m == 0 && result_n == 0
    % no solution
    disp("No Solution");
else
    % infinitely many solutions
end

% LU factorization (section 1.5) - LU.m
[L, U] = LU(A);
disp("LU(A) result : ");
disp(L);
disp(U);
disp("L*U result : ");
A2 = matrix_multiply(L,U);
disp(A2);
Error = abs(A-A2);
disp("Error : ");
disp(Error);

% Solving systems using the LU (section 1.5)
% Ax=b
x = LU_solve(A,b);
disp("LU_solve(A,b) result : ");
disp(x);
b2 = matrix_multiply(A,x);
disp("A*x : ");
disp(b2);
Error = abs(b-b2);
disp("Error : ");
disp(Error);

% QR factorization  (section 5.6)
[Q, R] = QR(A);
disp("QR(A) result : ");
disp(Q);
disp(R);
disp("Q*R result : ");
A2 = matrix_multiply(Q,R);
disp(A2);
Error = abs(A-A2);
disp("Error : ");
disp(Error);

% Solving least squares problems using the QR factorization (Section 5.6)
x = least_squares(A,b);
disp("least_squares(A,b) result : ");
disp(x);
b2 = matrix_multiply(A,x);
disp("A*x : ");
disp(b2);
Error = abs(b-b2);
disp("Error : ");
disp(Error);

