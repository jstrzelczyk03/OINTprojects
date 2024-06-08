function out = Bisection(f, range_limits, delta)
    xmin = range_limits(1);
    xmax = range_limits(2);

    % sprawdzenie warunku poczatkowego
    if f(xmin) * f(xmax) > 0
        error('f(xmin) * f(xmax) > 0');
    end
    
    % Inicjalizacja
    delta_i = (xmax - xmin);
    x_i = (xmin + xmax) / 2;

    % Poczatkowe przyblizenie
    out = x_i;
    
    % Petla iteracyjna
    while (abs(delta_i/2) > delta)
        if(f(xmin) * f(x_i) < 0)
            xmax = x_i;
        else
            xmin = x_i;
        end
        x_i = (xmin + xmax) / 2;
        delta_i = delta_i / 2;
        out = [out, x_i];
    end
end