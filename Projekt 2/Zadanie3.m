% Zmiana formatu na long
format long;

% Definicja funkcji f oraz wartosci poczatkowych i dokladnosci delta
f = @(x) 2 * (exp(-(x / 8 - 1) ^ 6)) ^ 12 + 0.001 * x ^ 3 - 2.5;
range_limits = [1, 10];
delta = 1e-10;

% Obliczenie przyblizen w poszczegolnych iteracjach dla metody regula falsi
approximations_rf = RegulaFalsi(f, range_limits, delta);
disp('Przyblizenia w poszczegolnych iteracjach dla metody Regula Falsi:');
disp(approximations_rf);

% Obliczenie bledu bezwzglednego uzyskanego w ostatniej iteracji dla
% metody regula falsi
solution_fzero = fzero(f, 8);
final_approximation_rf = approximations_rf(end);
format shortG;
absolute_error_rf = abs(final_approximation_rf - solution_fzero);
disp('Blad bezwzgledny uzyskany w ostatniej iteracji dla metody Regula Falsi:');
disp(absolute_error_rf);