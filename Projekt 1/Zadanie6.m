%inicjalizacja zmiennych
r = 0.01;
theta = pi/8;
phi = pi/4;
l = 0:0.5:60;

%funkcja zwracajaca wartosc y
function out = y(r, theta, phi)
    out = r .* sin(theta) .* phi;
end

%funkcja zwracajaca y zaburzone bledem wzglednym 2^{-l}
function out = y_err(y, l)
    out = y .* (1 + 2 .^ (-l));
end

% Wywolanie funkcji dla obliczenia dokladnej wartości y
y_exact = y(r, theta, phi);

% Obliczanie y z bledem wzglednym
y_dist = y_err(y_exact, l);

%funkcaj zwracajaca blad wzgledny
function out = error(y_acc, y_err)
    out = (y_err - y_acc) ./ y_acc; 
end

% Obliczenie bledu wzglednego
error_y = error(y_exact, y_dist);

% Tworzenie wykresu
figure;
semilogy(l, error_y, 'LineWidth', 2);
xlabel('Liczba cyfr mantysy');
ylabel('Blad wzgledny');
title('Blad wzgledny wartości y w funkcji liczby cyfr znaczacych mantysy (L)');
grid on;
