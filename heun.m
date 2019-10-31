function y_next = heun(f, ti, yi, h)
% INPUT
% f:= funzione
% ti:= punto di rete precedente utilizzato
% yi:= punto della funzione approssimato precedentemente
% h:= passo
    y_next = yi + (h/2)*(f(ti,yi)+f(ti+h, yi+h*f(ti,yi)));
    return;
end