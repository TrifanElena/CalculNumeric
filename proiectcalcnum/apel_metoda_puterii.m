clc, clear

A = [2 1 0; 1 2 0; 0 0 10];
x = [1; 1; 1];

max_iter = 100;
eigenvectors = zeros(length(x), max_iter); %vector pentru stocarea vectorilor dominanti

for i = 1:max_iter
    % Aplicam matricea A asupra vectorului de start
    x = A * x;
    x = x / norm(x);
    eigenvectors(:, i) = x;
end


rayleigh_coef = x' * A * x / (x' * x);
fprintf('Coeficientul Rayleigh: %.3f\n', rayleigh_coef);


% valoarea proprie dominanta aproximata
dominant_eigenvalue = rayleigh_coef;
dominant_eigenvector = x;

fprintf('Valoarea proprie dominanta aproximata: %.3f\n', dominant_eigenvalue);

fprintf('Vectorul propriu corespunzator valorii proprii dominante:\n');
disp(dominant_eigenvector);

figure;
hold on;
for i = 1:max_iter
    quiver3(0, 0, 0, eigenvectors(1, i), eigenvectors(2, i), eigenvectors(3, i), 'LineWidth', 2, 'MaxHeadSize', 1);
end
hold off;
