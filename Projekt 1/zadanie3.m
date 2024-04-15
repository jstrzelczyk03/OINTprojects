%Inicjalizacja zmiennych x, y
x = -10:0.1:10;
y = 1;
eps_value = eps('single')/2;

%Funkcja φ dla x podwojnej precyzji
function out = phi_double(x, y)
    out = sign(y) .* acos(x ./ (sqrt(x .^ 2 + y .^ 2)));
end

%Funkcja φ dla x pojedynczej precyzji
function out = phi_single(x, y)
    xs = single(x);
    xd = double(xs);
    out = sign(y) .* acos(xd ./ (sqrt(xd .^ 2 + y .^ 2)));
end

%Funkcja obliczajaca blad wzgledny δ[φ(˜x, y, z)]
function out = relative_err(phi_double, phi_single)
    out = (phi_single - phi_double) ./ phi_double;
end

%Funkcja obliczajaca wspolczynnik przenoszenia bledu wzglednego
function out = T(x, y)
    out = -x.*y^2./(abs(y).*acos(x./(sqrt(x.^2+y.^2))).*(x.^2+y.^2));
end

%Porownanie wartosci bledow, wyznaczone w ramach Zadania 2, z oszacowaniem
error_abs = abs(relative_err(phi_double(x, y), phi_single(x, y)));
plot(x, error_abs, 'b')
xlabel('x')
ylabel('|δ[φ]|')
title('Porownanie wartosci bledu z oszacowaniem')
grid on
hold on
plot(x, abs(T(x,y))*eps_value, 'r')
legend('Wartosc bledu', 'Oszacowanie')