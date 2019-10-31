function y_next = eulero_avanti(f, ti, yi, h)
% INPUT
% f:= funzione
% ti:= punto di rete precedente utilizzato
% yi:= punto della funzione approssimato precedentemente
% h:= passo
    y_next = yi + h*f(ti,yi);
    return;
end


