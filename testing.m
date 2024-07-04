

syms f(x)
f(x) = sin(x);

Df = diff(f,x)
DDf = diff(f,x,2)


x0 = linspace(-5*pi/2,5*pi/2);









figure(1)

plot(x0,f(x0))

hold on
grid on

plot(x0,Df(x0))
plot(x0,DDf(x0))


xlim([-5*pi/2 5*pi/2])
ylim([-2 2])

