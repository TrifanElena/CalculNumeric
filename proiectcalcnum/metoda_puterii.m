function [dominant_eigenvector, dominant_eigenvalue, eigenvectors] = metoda_puterii(A, x0, max_iter)
    x = x0;
    eigenvectors = zeros(length(x), max_iter);

    for i = 1:max_iter
        x = A * x;
        x = x / norm(x);
        eigenvectors(:, i) = x;
    end

    rayleigh_coef = x' * A * x / (x' * x);
    dominant_eigenvalue = rayleigh_coef;
    dominant_eigenvector = x;
end
