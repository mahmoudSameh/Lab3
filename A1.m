clc
clear all
set(0,'defaultlinelinewidth',1.5)
%Constants
h = 6.626e-34;
c = 2.998e8;
h_cut = 1.055e-34;
m0 = 9.109e-31;
e_const = 1.602e-19;

%User Inputs
a = 5.51*1e-10;
P = 1+9+3+2;
Em = 100*1.6*1e-19;

%drived value
E =linspace(0,Em,1e5);                   % range from 0 to 100eV with 10^5 Steps
ph = sqrt(2*m0*E)./h_cut;                % ph : ? is the width of the original potential well of depth Vo 
f = (P/a)*sin(a*ph)./ph +cos(a*ph);      % f : The Left Hand Side of the Function in E 
plot(ph,f,-ph,f);                        % Make A plot between Alpha and The Left Hand Side 
hold on
plot([-ph(end) ph(end)], [1, 1], 'r--')  % Draw a Horizontal Line at y = 1
plot([-ph(end) ph(end)], [-1, -1], 'g--')% Draw a Horizontal Line at y = 1
xlim([-ph(end) ph(end)])                 % limit the plot between the last
xlabel('\alpha (Alpha)');                % name the the X Axies 
ylabel('LHS');                           % name the the Y Axies
grid on;
figure 
k = acos(f)./a;
plot(k,E,-k,E);                          % Make a Plot between K and E
xticks([-pi -pi/2 0 pi/2 pi]/a)          % 
xticklabels({'-\pi/a','-\pi/(2a)','0','\pi/(2a)','\pi/a'})
grid on

figure
d = diff(k); % dK/dE
D = 1./d;    % dE/dK
DD= diff(D); % d2E/dK2
M=(h_cut^2)./DD; % Mass Effective
min = min(length(k),length(M)); %save the less vector length in (min) variable
k = k(1:min); % change the length of k to 0 : min 
plot(k,M,-k,M); % make a Plot between K and Mass effective
ylabel('M* Mass Effective (Kg)'); % name the the X Axies 
xlabel('The Wave Num Of Electron (K)'); % name the the Y Axies 
grid on