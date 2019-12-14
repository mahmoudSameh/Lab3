clear 
clc
%Constants
h_cut = 1.055e-34;

disp(' k = 0 : Rang : LP')
Rng = input('Rng: ');
LP = input('LP: ');
k = linspace(0,LP,Rng);

funcString = input('enter ur function : ','s'); %input Your Function 
F = inline(funcString,'k'); 
E = F(k);

D1= diff(E);
D1=[min(D1),D1];
D2=diff(D1);
D2=[max(D2),D2];

M=(h_cut^2)./D2;
plot(k,M,-k,M);
xlabel('K : The Wave Num Of Electron')
ylabel('M*: The Mass Effective')
grid on;