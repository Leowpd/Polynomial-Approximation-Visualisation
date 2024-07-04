%version 3 is hopefully gonna combine versions 1 and 2 so you can see both
%animations simultaneously.

syms function_to_approximate(x)

%%%%%%%%%%%%%%%% USER INPUT %%%%%%%%%%%%%%%% sin(x)*log(exp(x))/3

function_to_approximate(x) = sin(x);
max_polynomial_degree = 13;

%input "0" for the Maclaurin polynomial 
taylor_approximate_around_point = 0;

%speed in seconds of animation
speed = 0.5;

%viewing window
minX = -30;
maxX = 30;
minY = -10;
maxY = 10;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



syms f(x)
f(x) = function_to_approximate; %our function to approximate

x0 = linspace(minX,maxX,1000);

primary_line_weight = 4;
secondary_line_weight = 2;


figure(1)
t = tiledlayout(2,1);
title(t, strcat({'Degree '}, num2str(max_polynomial_degree), ' Taylor Polynomial of f(x) = ', string(function_to_approximate(x))))

% Tile 1
nexttile(1);
hold on
grid on
plot(x0,f(x0), 'black', 'LineWidth',primary_line_weight, 'DisplayName','f(x)')
title('nth Taylor Polynomial')
line1 = plot(0,0,'visible','off', 'HandleVisibility','off'); %initialises "line1" so that "delete(line1);" later on has no issues.

xlim([minX maxX])
ylim([minY maxY])

legend


% Tile 2
nexttile(2);
hold on
grid on
plot(x0,f(x0), 'black', 'LineWidth',primary_line_weight, 'DisplayName','f(x)')
title('First n Taylor Polynomials')
line2 = plot(0,0,'visible','off', 'HandleVisibility','off'); %ensures the colours of both graphs are consistent.

xlim([minX maxX])
ylim([minY maxY])

legend


%series calculation starts here
syms p_k(x)
a = taylor_approximate_around_point;

p_k(x) = f(a);
Df = f; %initialise derivative to 0th derivative

for k = 1:max_polynomial_degree

    p_prev = p_k;

    Df = diff(Df,x); %get the next derivitive of f
    p_k = p_k + Df(a)/factorial(k) * (x-a)^k; %update the kth taylor polynomial

    if p_k ~= p_prev
        pause(speed) %animation speed

        nexttile(1)
        delete(line1); %delete previous line
        line1 = plot(x0, p_k(x0), 'LineWidth',primary_line_weight, 'DisplayName',strcat('deg.', num2str(k)));
        legend %update legend

        nexttile(2)
        plot(x0, p_k(x0), 'LineWidth',secondary_line_weight, 'DisplayName',strcat('deg.', num2str(k)))
        legend %update legend

        
    end

end

