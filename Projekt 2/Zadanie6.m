% Definicja funkcji i pochodnej
f = @(x) 2 * (exp(-(x/8 - 1)^6))^12 + 0.001 * x^3 - 2.5;
f_der = @(x) 9 * (exp(-(x / 8 - 1) ^ 6)) ^ 12 * x ^ 2 * (x / 8 - 1) ^ 5 ...
+ 0.003 * x ^ 2;

% Zakres wartosci delty
deltas = logspace(-15, -1, 15);

% Zakres wartosci dla f(x)
range_limits = [1, 10];

% Inicjalizacja tablic do przechowywania wynikow
iterations_newton = zeros(1, length(deltas));
iterations_newton2 = zeros(1, length(deltas));

for i = 1 : length(deltas)
    delta_val = deltas(i);
    
    % odejmuje 1 gdyz pierwszy element to przyblizenie poczatkowe
    % ktorego nie licze jako iteracje

    iter_newton = length(Newton(f, f_der, range_limits, delta_val)) - 1;
    iterations_newton(i) = iter_newton;
    
    iter_newton2 = length(Newton2(f, f_der, range_limits, delta_val)) - 1;
    iterations_newton2(i) = iter_newton2;
    
end

figure;
semilogy(iterations_newton, deltas, '.-', 'Color', 'b');
hold on;
semilogy(iterations_newton2, deltas, '.-', 'Color', 'm');
grid on;
xlabel('Liczba iteracji');
ylabel('Blad bezwgledny');
title('Liczba iteracji potrzebna do uzyskania dopuszczalnej dokladnosci');
legend('Newton dla x0 = xmax', 'Newton dla x0 = xmin');
legend show;
grid on;
ylim([1e-15 1e-1]);
hold off;