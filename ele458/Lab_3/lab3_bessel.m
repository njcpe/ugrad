%Pendulum system

%Constants
Amat = 41.5;
C = 26.66;
D = 133.33*20;
n = 495;
g = 9.81;
T = 0.01;

%CSFR Constants
A = [0 1 0 0; Amat 0 0 -((Amat*C)/(n*g)); 0 0 0 1; 0 0 0 -C];
B = [0; ((Amat*D)/(n*g)); 0; D];
Ts = 0.635;
x1 = [0.17; 0; 0; 0];
x2 = [0; 0.17; 0; 0];
%Derive gains
spoles = s4/Ts;
zpoles = exp(T*spoles);
[phi, gamma] = c2d(A,B,T);
K = place(phi, gamma, zpoles);
dsm(phi, gamma, K)

%Derive Regulator
den = poly(s2/(Ts/5));
num = [den(end) 0];
vfilter_a = tf(num,den);
vfilter_d = c2d(vfilter_a, T, 'tustin');
[Af, Bf, Cf, Df] = ssdata(vfilter_d);

sim("lab3_sim.slx");