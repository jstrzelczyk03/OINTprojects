%inicjalizacja zmiennych
r = 0.1; 
theta = pi/3;
phi = -1.5*pi:0.1:1.5*pi;

%funkcja do obliczenia y korzystajac z podwojnej precyzji
function out = calculate_y_double(r, theta, phi)
    out = r .* sin(theta) .* sin(phi); 
end

%funkcja do obliczenia y korzystajac z pojedynczej precyzji
function out = calculate_y_single(r, theta, phi)
    r_s = single(r);
    theta_s = single(theta);
    phi_s = single(phi);
    out = r_s .* sin(theta_s) .* sin(phi_s); 
end

%wykres - φ dla podwojnej i pojedynczej precyzji x
y_2 = calculate_y_double(r, theta, phi);
y_1 = calculate_y_single(r, theta, phi);

figure;
plot(phi, y_1, 'r')
hold on
plot(phi, y_2, 'b')
xlabel('φ[rad]')
ylabel('y(r, θ, φ)')
title('Porownanie funkcji y dla podwojnej i pojedynczej precyzji')
grid on
legend('y dla pojdwojnej precyzji', 'y dla pojedynczej precyzji')


%funkcja wyznaczajaca blad wzgledny δ[˜y(˜r, ˜θ, ˜φ)]
function out = relative_err(y_2, y_1)
    out = abs((y_1 - y_2) ./ y_2);
end

%wykres przedstawiajacy blad wzgledny δ[˜y(˜r, ˜θ, ˜φ)]
error = relative_err(y_2, y_1);
figure;
plot(phi, error, 'r')
xlabel('φ[rad]')
grid on
ylabel('Blad wzgledny')
title('Blad wzgledny')

%wykres prezentujacy blad wzgledny po zastosowaniu skali log na osi y
% Wykres ilustrujacy blad wzgledny oraz jego oszacowanie na skali logarytmicznej
figure
semilogy(phi, error, 'r')
xlabel('φ[rad]')
ylabel('Blad wzgledny')
title('Blad wzgledny')
legend('Blad wzgledny','Location', 'best')
grid on




estimated_delta = estimate_delta(theta, phi);

%funkcja zwracajaca oszacowanie bledu
function out = estimate_delta(theta, phi)
    eps_s = eps('single')/2;
    out = abs(theta .* cot(theta)).*eps_s + abs(phi .* cot(phi)).* eps_s + 5.*eps_s;
end

% Wykres ilustrujacy blad wzgledny oraz jego oszacowanie na skali logarytmicznej
figure
semilogy(phi, error, 'r', phi, estimated_delta, 'b')
xlabel('φ[rad]')
ylabel('Blad')
title('Blad wzgledny i oszacowanie')
legend('Blad wzgledny', 'Oszacowanie bledu', 'Location', 'best')
grid on