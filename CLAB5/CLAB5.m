%Time should be in seconds (not ms)
%I0 = 2.3*10^13
%I = 2.3*10^9 -> 4 Log units lower

%Gain = R1/I1 (find for each freq)

%%
clear all
close all

I0 = 2.3E13
I = I0

I1 = 2.3E9

A0 = 4E-10

B0 = 900/I0

t1 = 46/1000

t2 = 5.4/1000

t1b = 12.7/1000

t2b = 6.8/1000

t3 = .4/1000

t4 = 76.3/1000

f = 10

%%

% sim('CLAB5.slx')
% 
% figure
% plot(ans.time, ans.rout)
% xlim([50 70])
% ylim([10.21 10.22])

%%

out = zeros(5,25);

fs = logspace(-1,2,25);

for  i = 0:1:4
    k = i+1;
    j = 1;
    for f = fs
    
        I0 = I/(10^i);
        sim('CLAB5.slx');
        rout = ans.rout;
        sz = size(rout);
        L = sz(1,1);
        bit = .8*L;
        rend = rout';
        last = rend(bit:end);
    
        a = (max(last)-min(last))/2;
        
        out(k,j) = a;
        j = j+1;
    end
    
end


%%

figure;
for  i = 1:1:5
    p = loglog(fs,out(i,:),'-o');
    p.LineWidth = 1.6
    hold on  
end
xlabel('Frequency (Hz)')
ylabel('Relative Magnitude')
legend('I_0 = 2.3E13','I_0 = 2.3E12','I_0 = 2.3E11','I_0 = 2.3E10','I_0 = 2.3E9')
title('Input Frequency vs. Output Magnitude (Relative), Varying I_0')



%%


out = zeros(5,25);

fs = logspace(-1,2,25);

for  i = 0:1:4
    k = i+1;
    j = 1;
    for f = fs
    
        I0 = I/(10^i);
        sim('CLAB5_2.slx');
        rout = ans.rout;
        sz = size(rout);
        L = sz(1,1);
        bit = .8*L;
        rend = rout';
        last = rend(bit:end);
    
        a = (max(last)-min(last))/2;
        
        out(k,j) = a;
        j = j+1;
    end
    
end


%%

figure;
for  i = 1:1:5
    p = loglog(fs,out(i,:),'-o');
    p.LineWidth = 1.6
    hold on  
end
xlabel('Frequency (Hz)')
ylabel('Relative Magnitude')
legend('I_0 = 2.3E13','I_0 = 2.3E12','I_0 = 2.3E11','I_0 = 2.3E10','I_0 = 2.3E9')
title('Input Frequency vs. Output Magnitude (Relative), Decoupled I0 ')
