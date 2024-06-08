function appr = Muller(f, range_limits, delta)
    xmin = range_limits(1);
    xmax = range_limits(2);
    
    % Poczatkowe przyblizenia
    x0 = xmin;
    x1 = (xmin + xmax) / 2;
    x2 = xmax;

    % Wartosci funkcji w punktach poczatkowych
    f0 = f(x0);
    f1 = f(x1);
    f2 = f(x2);
    
    % Inicjalizacja wektora przyblizen
    appr = [x0, x1, x2];
  
    % Petla iteracyjna
    while abs(appr(end) - appr(end-1)) > delta
        % Obliczanie współczynników ai i bi
        A = [-(x2 - x1)^2, (x2 - x1);
             -(x2 - x0)^2, (x2 - x0)];
          
        B = [f2 - f1; f2 - f0];

        % Pomnozenie macierzy odwrotnej A przez B
        result = A\B;
        
        % Przypisanie elementów wynikowej macierzy do zmiennych ai i bi
        ai = result(1);
        bi = result(2);
        
        % Obliczenie nowego przybliżenia x3
        x3 = x2 - (2 * f2 / (bi + sign(bi)*sqrt(bi^2 - 4 * ai * f2)));
        
        % Dodanie nowego przybliżenia do wektora
        appr = [appr, x3];
        
        % Aktualizacja poprzednich punktow
        x0 = x1;
        x1 = x2;
        x2 = x3;
        
        % Aktualizacja wartosci funkcji w nowych punktach
        f0 = f1;
        f1 = f2;
        f2 = f(x3);
    end
end
