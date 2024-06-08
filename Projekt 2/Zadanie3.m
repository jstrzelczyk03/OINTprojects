% Zmiana formatu na long
format long;

% Definicja funkcji f oraz wartosci poczatkowych i dokladnosci delta
f = @(x) 2 * (exp(-(x / 8 - 1) ^ 6)) ^ 12 + 0.001 * x ^ 3 - 2.5;
range_limits = [1, 10];
delta = 1e-14;

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

% Definicja pochodnej f_der dla metody Newtona
f_der = @(x) 9 * (exp(-(x / 8 - 1) ^ 6)) ^ 12 * x ^ 2 * (x / 8 - 1) ^ 5 ...
+ 0.003 * x ^ 2;

% Zmiana formatu na long
format long;

% Obliczenie przyblizen w poszczegolnych iteracjach dla metody Newtona
approximations_newton = Newton(f, f_der, range_limits, delta);
disp('Przyblizenia w poszczegolnych iteracjach dla metody Newtona:');
disp(approximations_newton);

% Obliczenie bledu bezwzglednego uzyskanego w ostatniej iteracji dla metody Newtona
final_approximation_newton = approximations_newton(end);
format shortG;
absolute_error_newton = abs(final_approximation_newton - solution_fzero);
disp('Blad bezwzgledny uzyskany w ostatniej iteracji dla metody Newtona:');
disp(absolute_error_newton);

% Zmiana formatu na long
format long;

% Obliczenie przyblizen w poszczegolnych iteracjach dla metody Mullera
approximations_muller = Muller(f, range_limits, delta);
disp('Przyblizenia w poszczegolnych iteracjach dla metody Mullera:');
disp(approximations_muller);

% Obliczenie bledu bezwzglednego uzyskanego w ostatniej iteracji dla metody Mullera
final_approximation_muller = approximations_muller(end);
format shortG;
absolute_error_muller = abs(final_approximation_muller - solution_fzero);
disp('Blad bezwzgledny uzyskany w ostatniej iteracji dla metody Mullera:');
disp(absolute_error_muller);
