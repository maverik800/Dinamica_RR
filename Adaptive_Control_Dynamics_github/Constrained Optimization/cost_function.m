function [f,g] = cost_function(x)
% COST FUNCTION transforming minimum lambda optimization as in paper
% EIGENVALUE AND SINGULAR VALUE OPTIMIZATION A. M. Blanco and J. A. Bandoni

% Cost to be maximized is z (the last element of x)
f = double(-x(8));

disp('f = -z = '); disp(f);

% Specifying gradient
if nargout > 1 % gradient required
    g = [0; 0; 0; 0; 0; 0; 0; -1];
end

end