% Zdefiniowanie funkcji i jej pochodnej
f = @(x) 2 * (exp(-(x / 8 - 1) ^ 6)) ^ 12 + 0.001 * x ^ 3 - 2.5;
f_der = @(x) 9 * (exp(-(x / 8 - 1) ^ 6)) ^ 12 * x ^ 2 * (x / 8 - 1) ^ 5 ... 
+ 0.003 * x ^ 2;

% Rozwiazanie korzystajac z fzero
sol_fzero = fzero(f, 8);
delta = 1e-14;
range_limits = [1, 10];

% Wyznaczenie przyblizen
appr_bis = Bisection(f, range_limits, delta);
appr_rf = RegulaFalsi(f, range_limits, delta);
appr_newton = Newton(f, f_der, range_limits, delta);
appr_muller = Muller(f, range_limits, delta);

% Obliczenie bledow bezwzglednych
err_bis = abs(appr_bis - sol_fzero);
err_rf = abs(appr_rf - sol_fzero);
err_newton = abs(appr_newton - sol_fzero);
err_muller = abs(appr_muller - sol_fzero);

x_bis = 0:(length(err_bis)-1);
x_rf = 0:(length(err_rf)-1);
x_newton = 0:(length(err_newton)-1);
x_muller = 0:(length(err_muller)-1);

% Wykres
figure;
semilogy(x_bis, err_bis, '.-', 'Color', 'b');
hold on;
semilogy(x_rf, err_rf, '.-', 'Color', 'm');
semilogy(x_newton, err_newton, '.-', 'Color', 'g');
semilogy(x_muller, err_muller, '.-', 'Color', 'b');
grid on;
xlabel('Liczba iteracji');
ylabel('Blad bezwzgledny');
title('Bledy bezwzgledne przyblizen w kolejnych iteracjach');
legend('Bisection', 'Regula Falsi', 'Newton', 'Muller');
legend show;
grid on;
hold off;
