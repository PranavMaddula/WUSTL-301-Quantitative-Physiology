function [fitresult, gof] = createFit(x, y)
%CREATEFIT(X,Y)
%  Create a fit.
%
%  Data for 'MaxVel' fit:
%      X Input : x
%      Y Output: y
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 08-Oct-2019 12:14:18


%% Fit: 'MaxVel'.
[xData, yData] = prepareCurveData( x, y );

% Set up fittype and options.
ft = fittype( 'power1' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [52.4155604678403 0.467648727877883];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'MaxVel' );
h = plot( fitresult, xData, yData );
h(1).MarkerSize = 15;
h(2).LineWidth = 2;
h(3).LineWidth = 2;
h(0).LineWidth = 2;
legend( h, 'Measured Data', 'MaxVel', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
ylabel('Maximal Velocity (�/s)')
xlabel('Angular Displacement(�)')
grid on


