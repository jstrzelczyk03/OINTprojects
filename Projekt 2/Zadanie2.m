format long;

% Definicja funkcji f(x)
f = @(x) 4 * (exp(-(x / 8 - 1) ^ 6)) ^ 12 + 0.001 * x ^ 3 - 2.5;

% Zakres przedzialu i dokladnosc
range_limits = [1, 10];
delta = 1e-10;

% Obliczenie przyblizen w poszczegolnych iteracjach
approximations = Bisection(f, range_limits, delta);
disp('Przyblizenia w poszczegolnych iteracjach dla metody bisekcji:');
disp(approximations);

% Obliczenie bledu bezwzglednego uzyskanego w ostatniej iteracji
solution_fzero = fzero(f, 8);
final_approximation = approximations(end);

% Wyswietlenie bledu bezwglednego
format shortG;
absolute_error = abs(final_approximation - solution_fzero);
disp('Blad bezwzgledny uzyskany w ostatniej iteracji:');
disp(absolute_error);
