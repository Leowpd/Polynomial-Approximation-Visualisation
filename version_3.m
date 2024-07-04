%version 3 is hopefully gonna combine versions 1 and 2 so you can see both
%animations simultaneously.



syms f(x)
f(x) = sin(x); %could be any (simple?) function we want to approximate.

minX = -20;
maxX = 20;
minY = -7;
maxY = 7;
max_degree = 13;



x0 = linspace(minX,maxX); %change to make more flexible in future iterations

figure(1)

% Tile 1
nexttile(1);
hold on
grid on
plot(x0,f(x0), 'LineWidth',1.5, 'DisplayName','f(x)')

xlim([minX maxX])
ylim([minY maxY])


% Tile 2
nexttile(2);
hold on
grid on
plot(x0,f(x0), 'LineWidth',1.5, 'DisplayName','f(x)')

xlim([minX maxX])
ylim([minY maxY])


%series calculation starts here
syms p_k(x)
a = 0;
line1 = plot(0,0,'visible','off');

p_k(x) = f(a);
Df = f;

for k = 1:max_degree

    p_prev = p_k;

    Df = diff(Df,x); %get the next derivitive of f
    p_k = p_k + Df(a)/factorial(k) * (x-a)^k; %update the kth taylor polynomial

    if p_k ~= p_prev
        pause(1)

        nexttile(1)
        delete(line1);
        line1 = plot(x0, p_k(x0), 'LineWidth',1.5, 'DisplayName',strcat('deg.', num2str(k)));
        legend %update legend

        nexttile(2)
        plot(x0, p_k(x0), 'DisplayName',strcat('deg.', num2str(k)))
        legend %update legend

        
    end

end


