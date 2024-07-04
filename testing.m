

x = linspace(-2*pi,3);
y1 = sin(x);
y2 = exp(x);

y3 = 1 + x + x.^2/2 + x.^3/6 + x.^4/24 + x.^5/120;

figure(1)

plot(x,y1)

hold on
grid on

plot(x,y2)
plot(x,y3)


xlim([-2*pi 3])
ylim([-20 20])

