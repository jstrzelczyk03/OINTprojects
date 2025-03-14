% Zdefiniowanie parametrów
sigmam = 5.8e7; % Przewodność miedzi w S/m
sigmas = 1.1e6; % Przewodność stali nierdzewnej w S/m
mi = 4 * pi * 1e-7; % Przenikalność magnetyczna w H/m

% Zakres częstotliwości
f = logspace(0, 10, 500); % Od 1 Hz do 10 GHz

% Obliczenie głębokości wnikania
deltam = 1 ./ sqrt(pi * f * mi * sigmam);
deltas = 1 ./ sqrt(pi * f * mi * sigmas);

% Wykres
figure
loglog(f, deltam, 'r', 'LineWidth', 2)
hold on
loglog(f, deltas, 'b', 'LineWidth', 2)
xlabel('Częstotliwość (Hz)')
ylabel('Głębokość wnikania (\delta) [m]')
title('Głębokość wnikania')
grid on
legend('Miedź (\sigma = 5.8 \times 10^7 S/m)', 'Stal nierdzewna (\sigma = 1.1 \times 10^6 S/m)')