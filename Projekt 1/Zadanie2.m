% Inicjalizacja zmiennych x, y
x = -10:0.1:10;
y = 1;

% Funkcja φ dla podwojnej precyzji x
function out = phi_double(x, y)
    out = sign(y) .* acos(x ./ (sqrt(x .^ 2 + y .^ 2)));
end

% Funkcja φ dla pojedynczej precyzji x
function out = phi_single(x, y)
    xs = single(x);
    xd = double(xs);
    out = sign(y) .* acos(xd ./ (sqrt(xd .^ 2 + y .^ 2)));
end

%wykres - φ dla podwojnej i pojedynczej precyzji x
phi_1 = phi_double(x, y);
phi_2 = phi_single(x, y);

plot(x, phi_1, 'r')
hold on
plot(x, phi_2, 'b')
xlabel('x')
ylabel('φ(x, y, z)')
title('Porownanie funkcji φ dla podwójnej i pojedynczej precyzji x')
grid on
legend('phi\_double', 'phi\_single')


% Funkcja obliczajaca blad wzgledny δ[φ(˜x, y, z)]
function out = relative_err(phi_double, phi_single)
    out = (phi_single - phi_double) ./ phi_double;
end

% Obliczenie i wykres bledu wzglednego δ[φ(˜x, y, z)]
error = relative_err(phi_double(x, y), phi_single(x, y));
figure;
plot(x, error, 'b')
xlabel('x')
ylabel('δ[φ]')
title('Blad wzgledny δ[φ]')
grid on

% funkcja obliczająca δ[˜x]
function out = x_err(x)
    xs = single(x);
    xd = double(xs);
    out = (xd - x) ./ x;
end

% funkcja obliczajaca wspolczynnik przenoszenia bledu wzglednego
function out = T(x, y)
    out = - x.*y^2./ (abs(y).*acos(x./(sqrt(x.^2 + y.^2))).*(x.^2+y.^2));
end

% wykres porownujacy uzyskany wynik bledu wzglednego 𝛿[φ(˜x, y, z)]
% z przyblizeniem:
delta_2 = T(x, y) .* x_err(x);
figure;
plot(x, error, 'b')
xlabel('x')
ylabel('δ[φ]')
title('Porownanie δ[φ] z przyblizeniem')
grid on
hold on
plot(x, delta_2, 'r')
legend('Blad wzgledny', 'Przyblizenie')