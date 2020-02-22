%CLab2
Wn = [48]
Z = [.63]
k = 43


sim('CLab2_EyeMovement');

figure(1)
p = plot(ans.Time,ans.Theta);
p(1).LineWidth = 1.5;
xlim([.9 1.2])
hold on

%%
tmp2 = EOGdata1(:,1);
tmp2 = tmp2 - 178.974000000000 + (1-.086);
tmp = EOGdata1(:,2);
norm_data = 45*((tmp - min(tmp)) / ( max(tmp) - min(tmp) ));
%figure
p1 = plot(tmp2,norm_data,'--');
p1(1).LineWidth = 2;
hold off
legend(['Modeled Eye Movement:' newline  'Wn = 48, Z = .63, k = 43 '], 'Empirical Eye Movement')
xlabel('Time (Sec)')
ylabel('Angular Position (Degrees)')
title('Modeled vs Empirical Eye Movement Across 45° Saccade')

%%
Wn = [50,100,150]
Z = [.70]
k = 5


sim('CLab2_EyeMovement');

figure(3)
p = plot(ans.Time,ans.Theta);
p(1).LineWidth = 1.5;
p(2).LineWidth = 1.5;
p(3).LineWidth = 1.5;
xlim([.9 1.2])
xlabel('Time (Sec)')
ylabel('Angular Position (Degrees)')
title('Varying Wn ')
title('Modeled Eye Movement, Varying Wn: k=5, Z=.70')
legend('Wn = 50Hz', 'Wn = 100Hz', 'Wn = 150Hz')


%%
Wn = [100]
Z = [.5,.70,.9]
k = 5


sim('CLab2_EyeMovement');

figure(4)
p = plot(ans.Time,ans.Theta);
p(1).LineWidth = 1.5;
p(2).LineWidth = 1.5;
p(3).LineWidth = 1.5;
xlim([.9 1.2])
xlabel('Time (Sec)')
ylabel('Angular Position (Degrees)')
title('Modeled Eye Movement, Varying Z: Wn=100, k=5')
legend('Z = .5', 'Z = .7', 'Z = .9')



%%
Wn = [100]
Z = [.70]
k = [3,5,7]

sim('CLab2_EyeMovement');

figure(5)
p = plot(ans.Time,ans.Theta);
p(1).LineWidth = 1.5;
p(2).LineWidth = 1.5;
p(3).LineWidth = 1.5;
xlim([.9 1.2])
xlabel('Time (Sec)')
ylabel('Angular Position (Degrees)')
title('Modeled Eye Movement, Varying k: Wn=100, Z=.70')
legend('k = 3', 'k = 5', 'k = 5')
