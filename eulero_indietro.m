function y_next = eulero_indietro(f, ti, yi, h)
% INPUT
% f:= funzione
% ti:= punto di rete precedente utilizzato
% yi:= punto della funzione approssimato precedentemente
% h:= passo
    options = optimset('Display','off');
    ff = @(z) yi + h*f(ti+h, z) - z;
    z0 = eulero_avanti(f,ti,yi,h); 
    
    % fsolve risolve un sistema non lineare a partire da un punto
    % specificato, in questo caso dato da z0
    y_next = fsolve(ff, z0, options);
    y_next = yi + h*f(ti, y_next);
    return;
end
