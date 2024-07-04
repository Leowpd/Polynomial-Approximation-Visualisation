

syms f(x)
f(x) = sin(x);

x0 = linspace(-10,10);

figure(1)

plot(x0,f(x0))
hold on
grid on

xlim([-10 10])
ylim([-10 10])


syms p(x)
a = 0;
p(x) = 0;
Df = f;
for k = 1:30

    p_prev = p;

    Df = diff(Df,x);
    p = p + Df(a)/factorial(k) * (x-a)^k;

    if p ~= p_prev
        pause(1)
        plot(x0, p(x0))
    end

end













% figure(1)
% 
% plot(x0,f(x0))
% 
% hold on
% grid on
% 
% plot(x0,Df(x0))
% plot(x0,DDf(x0))
% 
% 
% xlim([-5*pi/2 5*pi/2])
% ylim([-2 2])




