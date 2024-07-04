
syms f(x)
f(x) = sin(x); %could be any (simple?) function we want to approximate.

x0 = linspace(-20,20); %change to make more flexible in future iterations


figure(1)

plot(x0,f(x0), 'LineWidth',1.5, 'DisplayName','f(x)')
hold on
grid on

xlim([-20 20])
ylim([-10 10])


%series calculation starts here
syms p_k(x)
a = 0;

p_k(x) = f(a);
Df = f;
line1 = plot(0,0,'visible','off');
for k = 1:13

    p_prev = p_k;

    Df = diff(Df,x); %get the next derivitive of f
    p_k = p_prev + Df(a)/factorial(k) * (x-a)^k; %update the kth taylor polynomial

    if p_k ~= p_prev
        pause(1)
        delete(line1);
        line1 = plot(x0, p_k(x0), 'DisplayName',strcat('deg.', num2str(k)));
        legend %update legend
    end

end



