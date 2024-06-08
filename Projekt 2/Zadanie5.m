% Definicja funkcji i pochodnej
f = @(x) 2 * (exp(-(x/8 - 1)^6))^12 + 0.001 * x^3 - 2.5;
f_der = @(x) 9 * (exp(-(x / 8 - 1) ^ 6)) ^ 12 * x ^ 2 * (x / 8 - 1) ^ 5 ... 
+ 0.003 * x ^ 2;

% Zakres wartosci delty
deltas = logspace(-15, -1, 15);

% Zakres wartosci dla f(x)
range_limits = [1, 10];

% Inicjalizacja tablic do przechowywania wynikow
iterations_bisection = zeros(1, length(deltas));
iterations_regulafalsi = zeros(1, length(deltas));
iterations_newton = zeros(1, length(deltas));
iterations_muller = zeros(1, length(deltas));

for i = 1 : length(deltas)
    delta_val = deltas(i);
    
    % odejmuje 1 gdyz pierwszy element to przyblizenie poczatkowe
    % ktorego nie licze jako iteracje

    iter_bisection = length(Bisection(f, range_limits, delta_val)) - 1;
    iterations_bisection(i) = iter_bisection;
   
    iter_regulafalsi = length(RegulaFalsi(f, range_limits, delta_val)) - 1;
    iterations_regulafalsi(i) = iter_regulafalsi;
    
    iter_newton = length(Newton(f, f_der, range_limits, delta_val)) - 1;
    iterations_newton(i) = iter_newton;
    
    iter_muller = length(Muller(f, range_limits, delta_val)) - 1;
    iterations_muller(i) = iter_muller;
end

figure;
semilogy(iterations_bisection, deltas, '.-', 'Color', 'b');
hold on;
semilogy(iterations_regulafalsi, deltas, '.-', 'Color', 'm');
semilogy(iterations_newton, deltas, '.-', 'Color', 'g');
semilogy(iterations_muller, deltas, '.-', 'Color', 'b');
grid on;
xlabel('Liczba iteracji');
ylabel('Blad bezwgledny');
title('Liczba iteracji potrzebna do uzyskania dopuszczalnej dokladnosci');
legend('Bisection', 'Regula Falsi', 'Newton', 'Muller');
legend show;
grid on;
ylim([1e-15 1e-1]);
hold off;