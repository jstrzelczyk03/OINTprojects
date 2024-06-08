function out = Newton2(f, f_der, range_limits, delta)
    x0 = range_limits(1);
    xi = x0 - f(x0)/ f_der(x0);

    % Inicjalizacja wektora przyblizen
    out = [x0, xi];
    
    % Petla iteracyjna
    while(abs(out(end) - out(end-1)) > delta)
        xi = xi - f(xi)/ f_der(xi);
        % Zapis nowego przybliżenia
        out = [out, xi];
    end
end