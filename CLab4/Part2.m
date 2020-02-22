sim('FitzHugh_Nagumo');

figure;
plot(ans.V,ans.W)

%%
c = -65
d = 8
a= .02
b = .2
g = 10