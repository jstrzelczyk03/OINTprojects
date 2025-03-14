function out = RegulaFalsi(f, range_limits, delta)
    x0 = range_limits(1);

    % Inicjalizacja wektora przyblizen
    out = [x0];

    %Petla iteracyjna
    while(abs(out(end) - out(end-1)) > delta)
        xi = xi - (xi - x0) * f(xi) / (f(xi) - f(x0));
        out = [out, xi];
    end
end