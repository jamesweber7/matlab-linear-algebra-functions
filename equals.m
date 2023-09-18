function [is_equal] = equals(a,b)
    %return true if a = b ± ε
    epsilon = 10^-12;
    is_equal = (abs(a - b) < epsilon);
end