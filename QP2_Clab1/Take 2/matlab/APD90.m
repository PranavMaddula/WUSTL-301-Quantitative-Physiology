function  APD = APD90(currents,time)
%V Rest
 %currents = y
 %time = x
    V_rest = min(currents);
    %V Max
    V_max = max(currents);
    %dvdt Max
       offset = 0
    [dvdt_max,I] = max(diff(currents));
    
    %V90
    V90 = V_max - (0.9*(V_max - V_rest));
    %tV90
 

    tV90 = find(currents>=V90,1,'last')
    %index = index+offset;
    tV90=tV90+offset
    
    %APD90
    APD = time(tV90)- time(I);
end