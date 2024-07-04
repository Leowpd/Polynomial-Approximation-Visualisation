

syms f(x)
f(x) = sin(x); %could be any (simple?) function we want to approximate.

x0 = linspace(-20,20); %change to make more flexible in future iterations


figure(1)

line1 = plot(x0,f(x0));
hold on
grid on

xlim([-20 20])
ylim([-10 10])

syms g(x)
g(x) = cos(x);

pause(1)

line2 = plot(x0,g(x0));

pause(1)

delete(line1)