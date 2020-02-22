x0 = .1
v0 = .1

[t,v] = ode45(@deriv1,[0 100],[x0 v0]);
X = v(:,1);
V = v(:,2);
plot_dir(X,V)




function dvdt = deriv1(t,v)
c = 1;
k1 = 0;
k2 = -1;

dvdt = [v(2); -(k1.*v(1)) - (c.*(k2.*(v(2).^3)-v(2)))];
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