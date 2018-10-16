%Pendulum system v(Observer based)
load sroots.mat

%Constants
Amat = 41.5;
Cmat = 26.66;
D = 133.33*20;
n = 495;
g = 9.81;
T = 0.01;

x0 = [0.17; 0; 0; 0];

%CSFR Constants
A = [0 1 0 0; Amat 0 0 -((Amat*Cmat)/(n*g)); 0 0 0 1; 0 0 0 -Cmat];
B = [0; ((Amat*D)/(n*g)); 0; D];
C = [1 0 0 0; 0 0 1 0];
Ts = 0.85;

%Derive gains
spoles = [-26.66 s3/Ts];
sopoles = [s4/Ts];

zpoles = exp(T*spoles);
zopoles = exp(T*sopoles);

[phi, gamma] = c2d(A,B,T);

K = place(phi, gamma, zpoles);
L = place(phi', C', zopoles)';

dsm_regob(phi, gamma, C, K, L)

%Observer Constants
A_obs = (phi - L*C - gamma*K);
B_obs = L;
C_obs = -K;
D_obs = [0 0];

x0_obs = C\(C*x0);

q = 10^(0.21/20)

sim("lab4_sim_perturbed.slx")