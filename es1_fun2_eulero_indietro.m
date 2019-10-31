clc
e = exp(1);
%-----------function-----------
f = @(t, y) 2*y+(e^-t);
f_y0 = 2/3;
%------------------------------
true_function = @(x) e^(2*x)-((e^-x)/3);

% intervallo
a=0; b=2;
% metodo PVI scelto da enum
metodoPVI = metodoPVI_enum.Eulero_indietro;

figure('Name','Risoluzione metodo PVI: Eulero indietro');
% passo 0.1
h = 10^-1;
[x,y] = es(metodoPVI, h, f, a, b, f_y0);
plot(x,y);
hold on

% passo 0.001
h = 10^-3;
[x,y] = es(metodoPVI, h, f, a, b, f_y0);
plot(x,y);
hold on

% passo 0.00001
h = 10^-5;
[x,y] = es(metodoPVI, h, f, a, b, f_y0);
plot(x,y);
hold on

% stampa i valori esatti, ovvero della true function
fplot(true_function, [a b]);
legend('h = 10^-1','h = 10^-3','h = 10^-5','valori esatti')

function [x,y] = es(metodoPVI, h, f, a, b, y0)
    x = a+h:h:b; % punti di rete equispaziati
    num_iter = size(x,2);
    y = zeros(1,num_iter);
    y(1) = y0;
    for i=2:num_iter
        if(metodoPVI == metodoPVI_enum.Eulero_avanti)
            y(i) = eulero_avanti(f,(i-1)*h,y(i-1),h);
        elseif(metodoPVI == metodoPVI_enum.Eulero_indietro)
            y(i) = eulero_indietro(f,(i-1)*h,y(i-1),h);
        elseif(metodoPVI == metodoPVI_enum.Heun)
            y(i) = heun(f,(i-1)*h,y(i-1),h);
        end
    end
end