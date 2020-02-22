x0 = .5
v0 = .5

[t,v] = ode45(@dir1,[0 100],[x0 v0]);
X = v(:,1);
V = v(:,2);
figure;
plot_dir(X,V)
xlabel('X')
ylabel('V')

[t,v] = ode45(@dir2,[0 100],[x0 v0]);
X = v(:,1);
V = v(:,2);
figure;
plot_dir(X,V)
xlabel('X')
ylabel('V')

[t,v] = ode45(@dir3,[0 100],[x0 v0]);
X = v(:,1);
V = v(:,2);
figure;
plot_dir(X,V)
xlabel('X')
ylabel('V')

%%
x0 = 0
v0 = 0

c = .5
[t,v] = ode45(@(t,v) dir4(t,v,c),[0 50],[x0 v0]);
X = v(:,1);
V = v(:,2);
figure
plot_dir(X,V)
xlabel('X')
ylabel('V')


c = 0
[t,v] = ode45(@(t,v) dir4(t,v,c),[0 50],[x0 v0]);
X = v(:,1);
V = v(:,2);
figure
plot_dir(X,V)
xlabel('X')
ylabel('V')


c = -.5
[t,v] = ode45(@(t,v) dir4(t,v,c),[0 50],[x0 v0]);
X = v(:,1);
V = v(:,2);
figure
plot_dir(X,V)
xlabel('X')
ylabel('V')


%%
x0 = .5
v0 = .5

subplot(3,3,1)
[t,v] = ode45(@deriv1,[0 100],[x0 v0]);
X = v(:,1);
V = v(:,2);
plot_dir(X,V)
xlabel('X')
ylabel('V')
title('K1 = 1, K2 = 1, C = 1')

subplot(3,3,2)
[t,v] = ode45(@deriv2,[0 100],[x0 v0]);
X = v(:,1);
V = v(:,2);
plot_dir(X,V)
xlabel('X')
ylabel('V')
title('K1 = 1, K2 = 0, C = 1')

subplot(3,3,3)
[t,v] = ode45(@deriv3,[0 100],[x0 v0]);
X = v(:,1);
V = v(:,2);
plot_dir(X,V)
title('K1 = 1, K2 = -1, C = 1')

subplot(3,3,4)
[t,v] = ode45(@deriv4,[0 100],[x0 v0]);
X = v(:,1);
V = v(:,2);
plot_dir(X,V)
xlabel('X')
ylabel('V')
title('K1 = 0, K2 = 1, C = 1')

subplot(3,3,5)
[t,v] = ode45(@deriv5,[0 100],[x0 v0]);
X = v(:,1);
V = v(:,2);
plot_dir(X,V)
xlabel('X')
ylabel('V')
title('K1 = 0, K2 = 0, C = 1')

subplot(3,3,6)
[t,v] = ode45(@deriv6,[0 100],[x0 v0]);
X = v(:,1);
V = v(:,2);
plot_dir(X,V)
xlabel('X')
ylabel('V')
title('K1 = 0, K2 = -1, C = 1')

subplot(3,3,7)
[t,v] = ode45(@deriv7,[0 100],[x0 v0]);
X = v(:,1);
V = v(:,2);
plot_dir(X,V)
xlabel('X')
ylabel('V')
title('K1 = -1, K2 = 1, C = 1')

subplot(3,3,8)
[t,v] = ode45(@deriv8,[0 100],[x0 v0]);
X = v(:,1);
V = v(:,2);
plot_dir(X,V)
xlabel('X')
ylabel('V')
title('K1 = -1, K2 = 0, C = 1')

subplot(3,3,9)
[t,v] = ode45(@deriv9,[0 100],[x0 v0]);
X = v(:,1);
V = v(:,2);
plot_dir(X,V)
xlabel('X')
ylabel('V')
title('K1 = -1, K2 = -1, C = 1')

%%

function dvdt = deriv1(t,v)
c = 1;
k1 = 1;
k2 = 1;

dvdt = [v(2); -(k1.*v(1)) - (c.*(k2.*(v(2).^3)-v(2)))];
end

function dvdt = deriv2(t,v)
c = 1;
k1 = 1;
k2 = 0;

dvdt = [v(2); -(k1.*v(1)) - (c.*(k2.*(v(2).^3)-v(2)))];
end

function dvdt = deriv3(t,v)
c = 1;
k1 = 1;
k2 = -1;

dvdt = [v(2); -(k1.*v(1)) - (c.*(k2.*(v(2).^3)-v(2)))];
end

function dvdt = deriv4(t,v)
c = 1;
k1 = 0;
k2 = 1;

dvdt = [v(2); -(k1.*v(1)) - (c.*(k2.*(v(2).^3)-v(2)))];
end

function dvdt = deriv5(t,v)
c = 3;
k1 = 0;
k2 = 0;

dvdt = [v(2); -(k1.*v(1)) - (c.*(k2.*(v(2).^3)-v(2)))];
end

function dvdt = deriv6(t,v)
c = 1;
k1 = 0;
k2 = -1;

dvdt = [v(2); -(k1.*v(1)) - (c.*(k2.*(v(2).^3)-v(2)))];
end

function dvdt = deriv7(t,v)
c = 1;
k1 = -1;
k2 = 1;

dvdt = [v(2); -(k1.*v(1)) - (c.*(k2.*(v(2).^3)-v(2)))];
end

function dvdt = deriv8(t,v)
c = 1;
k1 = -1;
k2 = 0;

dvdt = [v(2); -(k1.*v(1)) - (c.*(k2.*(v(2).^3)-v(2)))];
end

function dvdt = deriv9(t,v)
c = 1;
k1 = -1;
k2 = -1;

dvdt = [v(2); -(k1.*v(1)) - (c.*(k2.*(v(2).^3)-v(2)))];
end


function dvdt = dir1(t,v)
dvdt = [v(2); v(1) - v(2)];
end

function dvdt = dir2(t,v)
dvdt = [v(2); -v(1) + v(2)];
end


function dvdt = dir3(t,v)
dvdt = [v(2); -v(1) - (v(2).^3) - v(2)];
end

function dvdt = dir4(t,v,c)
dvdt = [v(2); -v(1) - c*((v(2).^3) - v(2))];
end





function [h1, h2] = plot_dir (vX, vY)
%function [h1, h2] = plot_dir (vX, vY)
%Plotting x-y variables with direction indicating vector to the next element.
%Example
%   vX = linspace(0,2*pi, 10)';
%   vY = sin (vX);
%   plot_dir(vX, vY);
rMag = 0.5;
% Length of vector
lenTime = length(vX);
% Indices of tails of arrows
vSelect0 = 1:(lenTime-1);
% Indices of tails of arrows
vSelect1 = vSelect0 + 1;
% X coordinates of tails of arrows
vXQ0 = vX(vSelect0, 1);
% Y coordinates of tails of arrows
vYQ0 = vY(vSelect0, 1);
% X coordinates of heads of arrows
vXQ1 = vX(vSelect1, 1);
% Y coordinates of heads of arrows
vYQ1 = vY(vSelect1, 1);
% vector difference between heads & tails
vPx = (vXQ1 - vXQ0) * rMag;
vPy = (vYQ1 - vYQ0) * rMag;
% make plot 
h1 = plot (vX, vY, '.-'); hold on;
% add arrows 
h2 = quiver (vXQ0,vYQ0, vPx, vPy, 0, 'r'); grid on; hold off
axis equal
end
