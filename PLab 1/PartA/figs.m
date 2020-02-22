%%
x1 = x(:,1)
y1 = x(:,2)

createFit(x1, y1)
legend('Recorded Data Point','Gain Function Best Fit: y = 1 + (a/x)')
xlabel('Resistance (kOhm)')
ylabel('Gain')
title('INA118 Gain Function Best Fit')
%%
figure
p = semilogx(freq,amax,freq,amin,freq,nmax,freq,nmin)
p(1).Marker =  'o'
p(2).Marker =  'o'
p(3).Marker =  'o'
p(4).Marker =  'o'
p(1).LineWidth = 1.5;
p(2).LineWidth = 1.5;
p(3).LineWidth = 1.5;
p(4).LineWidth = 1.5;
legend('-20 dB/Max Power', '-20 dB/Min Power', '-0 dB/Max Power', '-0 dB/min Power')
xlabel('Frequency (Hz)')
ylabel('Output Level (V)')
title('Frequency and Power vs Output Level')
