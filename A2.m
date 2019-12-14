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
Em = 2*1.6*1e-19;

%drived value
E =linspace(0,Em,1e3);
ph = sqrt(2*m0*E)./h_cut;
f = (P/a)*sin(a*ph)./ph +cos(a*ph);
k = acos(f)./a;                          % K function in left hand side
d = diff(k);                             % dK/dE
D = 1./d;                                % dE/dK 
DD= diff(D);                             % d2E/dK2
M=(h_cut^2)./DD;                         % Mass Effective
min = min(length(k),length(M));          %save the less vector length in (min) variable
k = k(1:min);                            % change the length of k to 0 : min 
plot(k,M,-k,M);                          % make a Plot between K and Mass effective
ylabel('M* Mass Effective (Kg)');        % name the the X Axies 
xlabel('The Wave Num Of Electron (K)');  % name the the Y Axies 
grid on



