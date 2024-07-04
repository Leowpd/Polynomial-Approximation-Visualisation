

syms f(x)
f(x) = (x^3)/6;
Df = diff(f,x)
Dff = diff(f,x,2)


x = linspace(-5,5);


figure(1)

plot(x,f(x))

hold on
grid on


plot(x,Df(x))
plot(x,Dff(x))

xlim([-5 5])
ylim([-5 5])


