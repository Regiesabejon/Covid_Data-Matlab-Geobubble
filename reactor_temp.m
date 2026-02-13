function T = reactor_temp(t)
    % Computes temperature T(t) according to the piecewise definition.
    % t can be a scalar or an array.

    T = zeros(size(t));

    for i = 1:numel(t)
        ti = t(i);
        if ti >= 0 && ti <= 8
            T(i) = 5*ti^2 + 20;
        elseif ti > 8 && ti <= 16
            T(i) = 100 - 2*ti;
        elseif ti > 16 && ti <= 24
            T(i) = 50 + 3*(ti - 16)^2;
        elseif ti > 24
            T(i) = 800 * exp(-0.1*(ti - 24));
        else
            T(i) = NaN;   % undefined for t < 0
        end
    end
end