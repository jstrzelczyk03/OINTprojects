% wektor liczb od 1 do 10
x = 1:0.1:10;

% funkcja f(x)
function out = f(x)
    out = 2 .* (exp(-(x ./ 8 - 1) .^ 6)) .^ 12 + 0.001 .* x .^ 3 - 2.5;
end

% wykres f(x)
y = f(x);
figure;
plot(x, y, 'b')
xlabel('x')
ylabel('y = f(x)')
title('Wykres funkcji f(x)')
grid on

% wyznaczenie rozwiazania i wypisanie go na okno polecen
X = fzero(@f, 8);
disp(['Rozwiazanie rownania f(x) = 0 w przedziale [1, 10] to ', num2str(X)]);
