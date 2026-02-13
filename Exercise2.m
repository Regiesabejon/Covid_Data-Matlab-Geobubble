function result = Exercise2(A, w)
    % A: 12x10 matrix
    % w: 10x1 weight vector
    % result: 12x1 weighted sum vector

    % (a) Euclidean norm of each row
    row_norms = vecnorm(A, 2, 2);   % 12x1

    % (b) Normalize each row by its norm (avoid division by zero)
    row_norms(row_norms == 0) = eps;   % replace zeros with small number
    B = A ./ row_norms;                % broadcasting, 12x10

    % (c) Maximum absolute value of each column of B
    col_max_abs = max(abs(B), [], 1);   % 1x10

    % (d) Conditionally scale each column
    C = B;
    for j = 1:10
        if col_max_abs(j) > 0.8
            C(:,j) = B(:,j) / col_max_abs(j);
        end
        % else leave unchanged
    end

    % (e) Weighted sum: multiply each column by weight and sum rows
    result = C * w;   % 12x1
end